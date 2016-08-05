ButtonSensor = require '../cps/ButtonSensor'

class PhysicalKillSwitchType

  $Kill_Switch_Triggered: null
  $Kill_Switch_Pressed: null

  constructor: (options) ->
    @Button = new ButtonSensor options.Button.pin
    @Button.onRelease = @_onRelease
    @Button.onPress = @_onPress

    @$Reset()

  $Reset: =>
    @$Kill_Switch_Triggered = false
    @$Kill_Switch_Pressed = false

  _onPress: =>
    @$Kill_Switch_Triggered = true
    @$Kill_Switch_Pressed = true

  _onRelease: =>
    @$Kill_Switch_Pressed = false

#noinspection JSUnresolvedVariable
module.exports = PhysicalKillSwitchType
