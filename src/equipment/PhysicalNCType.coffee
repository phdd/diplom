_ = require 'lodash'
opcua = require 'node-opcua'
SmoothieboardActuator = require '../interface/SmoothieboardActuator'

class PhysicalNCType

  $NC_Program: null
  $NC_Program_Status: null

  constructor: (options) ->
    @NCInterpreter = new SmoothieboardActuator options.NCInterpreter.device

    @NCInterpreter.onConnect = @_onConnect
    @NCInterpreter.onStart   = @_onStart
    @NCInterpreter.onStop    = @_onStop

    @_resetVariables()

  $Transmit_NC_Program: (name, code) =>
    if _(name).isEmpty() or _(code).isEmpty()
      return statusCode: opcua.StatusCodes.BadArgumentsMissing

    @NCInterpreter.upload name, code

  $Assign_NC_Program: (name) =>
    if _(name).isEmpty()
      return statusCode: opcua.StatusCodes.BadArgumentsMissing

    @$NC_Program = name
    @$NC_Program_Status = 'Stop'

  $Receive_NC_Program: (name) =>
    return statusCode: opcua.StatusCodes.BadNotImplemented

  $Start_NC: =>
    if _(@$NC_Program).isEmpty() or 'Active' is @$NC_Program_Status
      return statusCode: opcua.StatusCodes.BadInvalidState

    @NCInterpreter.start @$NC_Program

  $Stop_NC: =>
    if 'Active' != @$NC_Program_Status
      return statusCode: opcua.StatusCodes.BadInvalidState

    @NCInterpreter.stop()

  $Reset_NC: =>
    @NCInterpreter.stop() if 'Active' is @$NC_Program_Status
    @_resetVariables()

  _onStart: =>
    @$NC_Program_Status = 'Active'

  _onStop: =>
    @$NC_Program_Status = 'Stop'

  _onConnect: =>
    @_resetVariables()

  _resetVariables: =>
    @$NC_Program = null
    @$NC_Program_Status = 'Reset'

#noinspection JSUnresolvedVariable
module.exports = PhysicalNCType
