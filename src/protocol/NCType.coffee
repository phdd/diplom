_ = require 'lodash'
opcua = require 'node-opcua'
SmoothieboardActuator = require '../cps/SmoothieboardActuator'

class NCType extends SmoothieboardActuator

  methods:
    Start_NC: {}
    Stop_NC:  {}
    Reset_NC: {}

    Transmit_NC_Program: inputArguments: [
      { name: 'name', dataType: opcua.DataType.String }
      { name: 'code', dataType: opcua.DataType.String }]

    Assign_NC_Program: inputArguments: [
      { name: 'name', dataType: opcua.DataType.String }]

    Receive_NC_Program: inputArguments: [
      { name: 'name', dataType: opcua.DataType.String }]

  variables:
    NC_Program: dataType: opcua.DataType.String
    NC_Program_Status: dataType: opcua.DataType.String

  constructor: ->
    super

    @_resetVariables()

  Transmit_NC_Program: (name, code) =>
    if _(name).isEmpty() or _(code).isEmpty()
      return statusCode: opcua.StatusCodes.BadArgumentsMissing

    @upload name, code

  Assign_NC_Program: (name) =>
    if _(name).isEmpty()
      return statusCode: opcua.StatusCodes.BadArgumentsMissing

    @variables.NC_Program.value = name
    @variables.NC_Program_Status.value = 'Stop'

  Receive_NC_Program: (name) =>
    return statusCode: opcua.StatusCodes.BadNotImplemented

  Start_NC: =>
    if _(@variables.NC_Program.value).isEmpty() or 'Active' is @variables.NC_Program_Status.value
      return statusCode: opcua.StatusCodes.BadInvalidState

    @start @variables.NC_Program.value

  Stop_NC: =>
    if 'Active' != @variables.NC_Program_Status.value
      return statusCode: opcua.StatusCodes.BadInvalidState

    @stop()

  Reset_NC: =>
    @stop() if 'Active' is @variables.NC_Program_Status.value
    @_resetVariables()

  _onStart: =>
    @variables.NC_Program_Status.value = 'Active'

  _onStop: =>
    @variables.NC_Program_Status.value = 'Stop'

  _onConnected: =>
    @_resetVariables()

  _resetVariables: =>
    @variables.NC_Program.value = null
    @variables.NC_Program_Status.value = 'Reset'

#noinspection JSUnresolvedVariable
module.exports = NCType
