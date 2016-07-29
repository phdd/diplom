debug = require('debug')('cps:RelayActuator')
DigitalSensor = require('node-grovepi').GrovePi.sensors.base.Digital

class RelayActuator extends DigitalSensor

  constructor: (@pin) ->
    @board.pinMode @pin, @board.OUTPUT

  on: =>
    @write 1
    debug "on @#{@pin}"

  off: =>
    @write 0
    debug "off @#{@pin}"

#noinspection JSUnresolvedVariable
module.exports = RelayActuator
