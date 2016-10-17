debug = require('debug')('cps:AccelerationSensor')
AccelerationI2C = require('node-grovepi').GrovePi.sensors.AccelerationI2C

class AccelerationSensor extends AccelerationI2C

  constructor: (onChange) ->
    @on 'change', onChange
    @watch()

#noinspection JSUnresolvedVariable
module.exports = AccelerationSensor
