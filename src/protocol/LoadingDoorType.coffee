opcua = require 'node-opcua'
RelayActuator = require '../cps/RelayActuator'

class LoadingDoorType extends RelayActuator

  variables:

    Door_Status: dataType: opcua.DataType.String

  methods:

    Close_Door:
      inputArguments: []
      outputArguments: []

    Open_Door:
      inputArguments: []
      outputArguments: []

  constructor: (@pin) ->
    super

    @offState = 'open'
    @onState  = 'closed'

    @Open_Door()

  Close_Door: =>
    @on()
    @variables.Door_Status.value = @onState

  Open_Door: =>
    @off()
    @variables.Door_Status.value = @offState


#noinspection JSUnresolvedVariable
module.exports = LoadingDoorType