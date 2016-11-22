TemperatureHumiditySensor = require '../interface/TemperatureHumiditySensor'

class PhysicalToolTemperatureType

  $Temperature: null

  constructor: (options) ->
    @Sensor = new TemperatureHumiditySensor options.TemperatureSensor.pin, @_onChange
    @delta = options.delta or 0
    @lastTemperature = 0
    @$Temperature = 0.0

  _onChange: (values) =>
    temperature = values[0]

    if temperature > 1e4 or temperature < 1e-4
      return # jitter filter

    if Math.abs(temperature - @lastTemperature) > @delta or @$Temperature is null
      @lastTemperature = temperature
      @$Temperature = temperature

#noinspection JSUnresolvedVariable
module.exports = PhysicalToolTemperatureType
