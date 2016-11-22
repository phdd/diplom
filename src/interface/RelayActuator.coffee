DigitalSensor = require('node-grovepi').GrovePi.sensors.base.Digital

class RelayActuator extends DigitalSensor

  constructor: (@pin) ->
    @board.pinMode @pin, @board.OUTPUT

  on:  => @write 1
  off: => @write 0

#noinspection JSUnresolvedVariable
module.exports = RelayActuator
