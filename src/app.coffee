_ = require 'lodash'
path = require 'path'
async = require 'async'
cpps = require './cpps'
browser = require './browser'
opcua = require 'node-opcua'
GrovePi = require('node-grovepi').GrovePi
debug = require('debug')('cps:surrogate')
argv = require('minimist')(process.argv.slice 2)

if not _(argv).has 'objectModel'
  throw Error '--objectModel=<path> missing'

global.log = console.log
console.log = require('debug')('console:log')

Array::filter = (callback) -> element for element in @ when callback(element)
Array::isEmpty = -> @.length is 0

String::withLoweredFirstLetter = -> @[0].toLowerCase() + @[1..-1]

variablesOf = (o) ->
  Object.keys(o).filter (k) ->
    typeof o[k] isnt 'function' and k[0] is '$'

methodsOf = (o) ->
  Object.keys(o).filter (k) ->
    typeof o[k] is 'function' and k[0] is '$'

addressSpaceNameOf = (o) ->
  o[1..-1].withLoweredFirstLetter()

#noinspection JSUnresolvedVariable,SpellCheckingInspection
server = new opcua.OPCUAServer
  certificateFile: path.join __dirname, 'res/cert.pem'
  privateKeyFile:  path.join __dirname, 'res/key.pem'
  port:            argv.port ? 26543

  nodeset_filename: [
    opcua.standard_nodeset_file
    path.join __dirname, 'res/nodesets/opc4factory.xml'
    path.join __dirname, 'res/nodesets/cpps.xml'
    argv.objectModel ]

addressSpace = null
physicalConnections = []
endpoint = server.endpoints[0].endpointDescriptions()[0].endpointUrl
grovePi = new GrovePi.board onError: (error) -> log error.toString()

bindVariablesTo = (object) ->
  for variable in variablesOf object.instance
    do (variable, object) ->
      addressSpaceVariable = object[addressSpaceNameOf variable]
      bindDescription = get: ->
        new opcua.Variant
          value: object.instance[variable]
          dataType: addressSpaceVariable.dataType.value

      addressSpaceVariable.bindVariable bindDescription, true

bindMethodsTo = (object) ->
  for method in methodsOf object.instance
    do (method, object) ->
      addressSpaceMethod = object[addressSpaceNameOf method]
      addressSpaceMethod.bindMethod (args, context, callback) ->

        try
          result = object.instance[method].apply(this, args.map (a) -> a.value) ? {}
        catch error
          result = statusCode: opcua.StatusCodes.BadUnexpectedError
          console.warn error

        result = if typeof result is 'object' then result else {}

        result.inputArguments  = result.inputArguments or []
        result.outputArguments = result.outputArguments or []
        result.statusCode      = result.statusCode or opcua.StatusCodes.Good

        callback null, result

bindTo = (object) ->
  connections = {}

  for connection in physicalConnections
    do (connections) -> if object.nodeId == connection.parent.nodeId
      connectionName = connection.browseName.name
      connectionIdentifier = connection.connectionIdentifier.readValue().value.value

      connections[connectionName] = JSON.parse connectionIdentifier

  typeNode = addressSpace.findNode object.typeDefinition.toString()
  typeName = typeNode.browseName.name

  if Object.keys(connections).length is 0
    debug "Skipping #{object.browseName.name} due to missing connections".gray
    return

  try
    object.instance = new cpps[typeName](connections)

    if not variablesOf(object.instance).isEmpty() then bindVariablesTo object
    if not methodsOf(object.instance).isEmpty()   then   bindMethodsTo object

    debug "Bound #{object.browseName.name} with #{JSON.stringify(connections)}".yellow

  catch error
    console.warn "Binding #{object.browseName.name} with #{JSON.stringify(connections)}
      failed due to #{error.toString()}".red

server.on 'post_initialize', ->
  addressSpace = server.engine.addressSpace
  nsCpps = addressSpace.getNamespaceIndex 'urn:cpps'
  nsObjects = addressSpace.getNamespaceIndex 'urn:objects'
  byObjectNamespace = (object) -> object.nodeId.namespace == nsObjects

  browser.findObjectsTyped 'PhysicalConnectionType', server.engine, nsCpps
    .then (objects) -> do (objects) ->
      _(objects).filter(byObjectNamespace).each (object) -> physicalConnections.push(object)
      for objectType, implementation of cpps
        browser.findObjectsTyped objectType, server.engine, nsCpps
          .then (objects) ->
            _(objects).filter(byObjectNamespace).each (object) -> bindTo object

  log "Available at #{endpoint}".green

process.title = 'OPC UA Server'
process.on 'SIGINT', ->
  log "\nShutting down".yellow
  server.shutdown 1000
  process.exit -1

log 'Starting OPC UA Server'.yellow

grovePi.init()
server.start()
