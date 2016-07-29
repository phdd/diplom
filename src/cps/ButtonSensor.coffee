debug = require('debug')('cps:ButtonSensor')
DigitalSensor = require('node-grovepi').GrovePi.sensors.base.Digital

class ButtonSensor extends DigitalSensor

  constructor: (@pin) ->
    @board.pinMode @pin, @board.INPUT
    @wasPressed = true

    setInterval @_readState, 10

  _readState: =>
    pressed = @read() is 1

    if pressed and not @wasPressed
      @_onPress()
      debug "pressed @#{@pin}"

    if not pressed and @wasPressed
      @_onRelease()
      debug "released @#{@pin}"

    @wasPressed = pressed

#noinspection JSUnresolvedVariable
module.exports = ButtonSensor
