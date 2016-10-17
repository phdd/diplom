AccelerationSensor = require '../cps/AccelerationSensor'

class PhysicalToolVibrationType

  $Vibration: null

  constructor: (options) ->
    @Sensor = new AccelerationSensor @_onChange
    @threshold = options.threshold or 0
    @lastVibration = 0
    @$Vibration = 0

  _onChange: (acceleration) =>
    vibration =
      Math.abs(acceleration[0]) +
      Math.abs(acceleration[1]) +
      Math.abs(acceleration[2])

    if vibration > @threshold
      @lastVibration = vibration
      @$Vibration = vibration


#noinspection JSUnresolvedVariable
module.exports = PhysicalToolVibrationType
