debug = require('debug')('cps:InfraredProximitySensor')
DigitalSensor = require('node-grovepi').GrovePi.sensors.base.Digital

class InfraredProximitySensor extends DigitalSensor

  constructor: (@pin) ->
    @board.pinMode @pin, @board.INPUT
    @wasPresent = true

    setInterval @_readState, 10

  _readState: =>
    isPresent = @read() is 0

    if isPresent and not @wasPresent
      @_onPresent()
      debug "present @#{@pin}"

    if not isPresent and @wasPresent
      @_onAbsent()
      debug "absent @#{@pin}"

    @wasPresent = isPresent

#noinspection JSUnresolvedVariable
module.exports = InfraredProximitySensor
