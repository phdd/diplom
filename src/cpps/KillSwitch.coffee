ButtonSensor = require '../cps/ButtonSensor'

class PhysicalKillSwitchType

  variables:
    Kill_Switch_Triggered: {}
    Kill_Switch_Pressed: {}

  methods:
    Reset: {}

  constructor: (options) ->
    @Button = new ButtonSensor options.Button.pin
    @Button.onRelease = @_onRelease
    @Button.onPress = @_onPress

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
module.exports = PhysicalKillSwitchType
