equipment = require './equipment'
opcua = require 'node-opcua'
debug = require('debug')('vmr:ModelControl')
u = require './utils'

# Components
OPCUAServer = require './opcua-server'
FeedbackControl = require './feedback-control'
RawCPA = require './raw-cpa'

class ModelControl

  physicalConnections: []

  constructor: (machineDefinition) ->
    @OPCUAServer = new OPCUAServer machineDefinition
    @FeedbackControl = new FeedbackControl
    @RawCPA = new RawCPA

  bindEquipment: =>
    addressSpace = @OPCUAServer.addressSpace
    @FeedbackControl.workWith addressSpace

    nsCpps = addressSpace.getNamespaceIndex 'urn:cpps'
    nsObjects = addressSpace.getNamespaceIndex 'urn:objects'
    connections = u.findObjectsTyped 'PhysicalConnectionType', nsCpps, @OPCUAServer

    for connection in connections
      if connection.nodeId.namespace is nsObjects 
        @physicalConnections.push connection

    for objectType of equipment
      objects = u.findObjectsTyped objectType, nsCpps, @OPCUAServer

      for object in objects
        if object.nodeId.namespace is nsObjects then @bind object

  bind: (object) =>
    addressSpace = @OPCUAServer.addressSpace
    connections = {}

    for connection in @physicalConnections
      do (connections) -> if object.nodeId == connection.parent.nodeId
        connectionName = connection.browseName.name
        connectionIdentifier = connection.connectionIdentifier.readValue().value.value

        try 
          connections[connectionName] = JSON.parse connectionIdentifier
        catch error
          console.warn "Binding #{object.browseName.name}
            failed due to invalid connectionIdentifier 
            '#{connectionIdentifier}'".red
          return

    typeNode = addressSpace.findNode object.typeDefinition.toString()
    typeName = typeNode.browseName.name

    if Object.keys(connections).length is 0
      debug "Skipping #{object.browseName.name} due to missing connections".gray
      return

    try
      object.instance = new equipment[typeName](connections)

      if not u.variablesOf(object.instance).isEmpty() then @bindVariablesTo object
      if not u.methodsOf(object.instance).isEmpty()   then @bindMethodsTo object

      debug "Bound #{object.browseName.name} with #{JSON.stringify(connections)}".yellow

    catch error
      console.warn "Binding #{object.browseName.name} with #{JSON.stringify(connections)}
        failed due to #{error.toString()}".red

  bindVariablesTo: (object) =>
    for variable in u.variablesOf object.instance
      do (variable, object) =>
        addressSpaceVariable = object[u.addressSpaceNameOf variable]
        bindDescription = get: =>
          if object.instance[variable] is null
            return opcua.StatusCodes.BadDataUnavailable
          else
            new opcua.Variant
              value: object.instance[variable]
              dataType: addressSpaceVariable.dataType.value

        addressSpaceVariable.bindVariable bindDescription, true
        @FeedbackControl.listenTo addressSpaceVariable, variable, object.instance

  bindMethodsTo: (object) =>
    for method in u.methodsOf object.instance
      do (method, object) ->
        addressSpaceMethod = object[u.addressSpaceNameOf method]
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

  start: =>
    debug "Starting"
    @OPCUAServer.start @bindEquipment
    @RawCPA.start()

  stop: =>
    debug "Shutting down"
    @OPCUAServer.stop()

module.exports = ModelControl
