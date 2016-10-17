AccelerationSensor = require '../cps/AccelerationSensor'

class PhysicalToolVibrationType

  $Vibration: null

  constructor: (options) ->
    @Sensor = new AccelerationSensor @_onChange
    @threshold = options.threshold or 0
    @lastVibration = 0

  _onChange: (acceleration) =>
    vibration =
      Math.abs(acceleration[0]) +
      Math.abs(acceleration[1]) +
      Math.abs(acceleration[2])

    if vibration > @threshold
      @$Vibration = @lastVibration = vibration


#noinspection JSUnresolvedVariable
module.exports = PhysicalToolVibrationType
