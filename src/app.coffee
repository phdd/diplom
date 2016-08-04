Q = require 'q'
_ = require 'lodash'
path = require 'path'
async = require 'async'
browser = require './browser'
opcua = require 'node-opcua'
GrovePi = require('node-grovepi').GrovePi
debug = require('debug')('cps:surrogate')
argv = require('minimist')(process.argv.slice 2)

if not _(argv).has 'objectModel'
  throw Error '--objectModel=<path> missing'

#noinspection JSUnresolvedVariable
distDir = __dirname

global.log = console.log
console.log = require('debug')('console:log')

addressSpace = null

serverOptions =
  certificateFile: path.join distDir, 'res/cert.pem'
  privateKeyFile:  path.join distDir, 'res/key.pem'
  port:            argv.port ? 26543

  nodeset_filename: [
    opcua.standard_nodeset_file
    path.join distDir, 'res/nodesets/opc4factory.xml'
    path.join distDir, 'res/nodesets/cpps.xml'
    argv.objectModel ]

server = new opcua.OPCUAServer serverOptions
endpoint = server.endpoints[0].endpointDescriptions()[0].endpointUrl

addVariablesFor = (instance, node) ->
  for variableName, variable of instance.variables
    do (variable, instance, node, variableName) ->
      addressSpace.addVariable
        componentOf: node,
        browseName: variable.displayName ? variableName
        dataType: variable.dataType.key
        value: get: -> new opcua.Variant
          dataType: variable.dataType
          value: if _(variable).has('value') then variable.value else instance["get#{variableName}"]()

addMethodsFor = (instance, node) ->
  for methodName, method of instance.methods
    do (methodName, method, node) ->
      methodNode = addressSpace.addMethod node, 
        browseName: method.displayName ? methodName
        inputArguments: method.inputArguments ? []
        outputArguments: method.outputArguments ? []

      methodNode.bindMethod (args, context, callback) ->
        try
          result = instance[methodName].apply(this, args.map (a) -> a.value) ? {}
        catch error
          result = statusCode: opcua.StatusCodes.BadUnexpectedError
          console.warn error

        result = {} if not _(result).isObjectLike()
        result.inputArguments = [] if not result.inputArguments?
        result.outputArguments = [] if not result.outputArguments?
        result.statusCode = opcua.StatusCodes.Good if not result.statusCode?

        callback null, result

server.on 'post_initialize', ->
  addressSpace = server.engine.addressSpace

  nsOpc4 = addressSpace.getNamespaceIndex 'urn:opc4factory'
  nsCpps = addressSpace.getNamespaceIndex 'urn:cpps'

  browser.findObjectsTyped 'PhysicalConnectionType', server.engine, nsCpps
    .then (objects) -> _(objects).each (object) ->
        log object.connectionIdentifier.readValue().toString()

  log "Available at #{endpoint}".green

grovePi = new GrovePi.board
  onError: (error) -> log error.toString()

process.title = 'OPC UA Server'
process.on 'SIGINT', ->
  log "\nShutting down".yellow
  server.shutdown 1000
  process.exit -1

log 'Starting OPC UA Server'.yellow

grovePi.init()
server.start()
