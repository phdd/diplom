debug = require('debug')('cps:ButtonSensor')
DigitalSensor = require('node-grovepi').GrovePi.sensors.base.Digital

class ButtonSensor extends DigitalSensor

  constructor: (@pin) ->
    @board.pinMode @pin, @board.INPUT
    @wasPressed = true

    setInterval @_readState, 10

  onPress: ->
    debug "pressed @#{@pin}"

  onRelease: ->
    debug "released @#{@pin}"

  _readState: =>
    pressed = @read() is 1

    if pressed and not @wasPressed then @onPress()
    if not pressed and @wasPressed then @onRelease()

    @wasPressed = pressed

#noinspection JSUnresolvedVariable
module.exports = ButtonSensor
