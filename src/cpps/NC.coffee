_ = require 'lodash'
opcua = require 'node-opcua'
SmoothieboardActuator = require '../cps/SmoothieboardActuator'

class NCType

  methods:
    Start_NC: {}
    Stop_NC:  {}
    Reset_NC: {}

    Transmit_NC_Program: {}
    Assign_NC_Program: {}
    Receive_NC_Program: {}

  variables:
    NC_Program: {}
    NC_Program_Status: {}

  constructor: (options) ->
    @NCInterpreter = new SmoothieboardActuator options.NCInterpreter.device

    @NCInterpreter.onConnect = @_onConnect
    @NCInterpreter.onStart   = @_onStart
    @NCInterpreter.onStop    = @_onStop

    @_resetVariables()

  Transmit_NC_Program: (name, code) =>
    if _(name).isEmpty() or _(code).isEmpty()
      return statusCode: opcua.StatusCodes.BadArgumentsMissing

    @NCInterpreter.upload name, code

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

    @NCInterpreter.start @variables.NC_Program.value

  Stop_NC: =>
    if 'Active' != @variables.NC_Program_Status.value
      return statusCode: opcua.StatusCodes.BadInvalidState

    @NCInterpreter.stop()

  Reset_NC: =>
    @NCInterpreter.stop() if 'Active' is @variables.NC_Program_Status.value
    @_resetVariables()

  _onStart: =>
    @variables.NC_Program_Status.value = 'Active'

  _onStop: =>
    @variables.NC_Program_Status.value = 'Stop'

  _onConnect: =>
    @_resetVariables()

  _resetVariables: =>
    @variables.NC_Program.value = null
    @variables.NC_Program_Status.value = 'Reset'

#noinspection JSUnresolvedVariable
module.exports = NCType
