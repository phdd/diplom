_ = require 'lodash'
path = require 'path'
opcua = require 'node-opcua'
GrovePi = require('node-grovepi').GrovePi
debug = require('debug')('cps:surrogate')

#noinspection JSUnresolvedVariable
distDir = __dirname

global.log = console.log
console.log = require('debug')('console:log')

addressSpaceDefinition = require './addressSpace'
addressSpace = null

serverOptions =
  certificateFile: path.join distDir, 'res/cert.pem'
  privateKeyFile:  path.join distDir, 'res/key.pem'

  nodeset_filename: [
    opcua.standard_nodeset_file
    path.join distDir, 'res/nodeset.xml' ]

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
  namespace = addressSpace.getNamespaceIndex 'http://tu-dresden.de/CPPS'

  for machineName, machine of addressSpaceDefinition
    machineNode = addressSpace.addObject
      organizedBy: addressSpace.rootFolder.objects
      browseName: machine.displayName ? machineName
      typeDefinition: addressSpace.findObjectType 'MachineType', namespace

    for componentName, component of machine.components
      instance = component.instance

      do (instance, machineNode) ->
        typeDefinition = addressSpace.findObjectType instance.constructor.name, namespace

        componentNode = addressSpace.addObject
          organizedBy: machineNode
          browseName: component.displayName ? componentName
          typeDefinition: typeDefinition

        if (instance.methods?)
          addMethodsFor instance, componentNode, componentName

        if (instance.variables?)
          addVariablesFor instance, componentNode, componentName

  log "Available at #{endpoint}".green

grovePi = new GrovePi.board
  onError: (error) -> log error.toString()
  onInit: ->
    for machineName, machine of addressSpaceDefinition
      for componentName, component of machine.components
        component.instance = component.create()

        if _(component).has 'properties'
          _.merge component.instance, component.properties

        if _(component).has 'init'
          component.init.apply component.instance

process.title = 'OPC UA Server'
process.on 'SIGINT', ->
  log "\nShutting down".yellow
  server.shutdown 1000
  process.exit -1

log 'Starting OPC UA Server'.yellow
grovePi.init()
server.start()
