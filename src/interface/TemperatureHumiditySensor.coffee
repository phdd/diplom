debug = require('debug')('interface:TemperatureHumiditySensor')
DHTDigital = require('node-grovepi').GrovePi.sensors.DHTDigital

class TemperatureHumiditySensor extends DHTDigital

  constructor: (@pin, onChange) ->
    super @pin, DHTDigital.VERSION.DHT22, DHTDigital.CELSIUS
    @board.pinMode @pin, @board.INPUT
    @stream 1000, onChange
    @watch()

#noinspection JSUnresolvedVariable
module.exports = TemperatureHumiditySensor
