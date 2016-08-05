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

lowerFirstLetterOf = (s) -> s[0].toLowerCase() + s[1..-1]

bindVariablesTo = (object) ->
  for variableName, variable of object.instance.variables
    do (variable, variableName) ->
      addressSpaceVariable = object[lowerFirstLetterOf variableName]
      bindDescription = get: ->
        new opcua.Variant
          value: variable.value
          dataType: addressSpaceVariable.dataType.value

      addressSpaceVariable.bindVariable bindDescription, true

bindMethodsTo = (object) ->
  for methodName, method of object.instance.methods
    do (methodName) ->
      addressSpaceMethod = object[lowerFirstLetterOf methodName]
      addressSpaceMethod.bindMethod (args, context, callback) ->

        try
          result = object.instance[methodName].apply(this, args.map (a) -> a.value) ? {}
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

    if object.instance.variables? then bindVariablesTo object
    if object.instance.methods?   then   bindMethodsTo object

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
