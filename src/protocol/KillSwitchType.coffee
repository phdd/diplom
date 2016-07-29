opcua = require 'node-opcua'
ButtonSensor = require '../cps/ButtonSensor'

class KillSwitchType extends ButtonSensor

  variables:

    Kill_Switch_Triggered: dataType: opcua.DataType.Boolean
    Kill_Switch_Pressed: dataType: opcua.DataType.Boolean

  methods:

    Reset: {}

  constructor: (@pin) ->
    super

    @Reset()

  Reset: =>
    @variables.Kill_Switch_Triggered.value = false
    @variables.Kill_Switch_Pressed.value = false

  _onPress: =>
    @variables.Kill_Switch_Triggered.value = true
    @variables.Kill_Switch_Pressed.value = true

  _onRelease: =>
    @variables.Kill_Switch_Pressed.value = false

#noinspection JSUnresolvedVariable
module.exports = KillSwitchType
