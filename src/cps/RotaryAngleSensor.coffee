opcua = require 'node-opcua'
GrovePi = require('node-grovepi').GrovePi
AnalogSensor = GrovePi.sensors.base.Analog
debug = require('debug')('cps:RotaryAngleSensor')

debug 'DEPRECATED!'

class RotaryAngleSensor extends AnalogSensor
  constructor: (@pin) ->
  
  read: ->
    angle = Math.round super() * 300 / 1023
    debug "#{angle}° @#{@pin}"
    return angle

  variables:
    RotaryAngle: dataType: opcua.DataType.Int16

  getRotaryAngle: => @read()

#noinspection JSUnresolvedVariable
module.exports = RotaryAngleSensor
