_ = require 'lodash'
debug = require('debug')('interface:SmoothieboardActuator')
SerialPort = require './SerialPort'

class SmoothieboardActuator extends SerialPort

  constructor: (port = '/dev/ttyACM0') ->
    super port

  upload: (name, code) =>
    @_stopUpdates()
    @_serial.write "upload #{@_pathFor name}\n"
    @_serial.write "#{code}"
    @_serial.write [ 0x1A ]
    @_startUpdates()

  start: (program) =>
    @_execute "play #{@_pathFor program}"
    @_startUpdates()

  stop: =>
    @_execute 'abort'

  _processResult: (result) =>
    debug result
    group = []; its = (regexp) ->
      expression = new RegExp(regexp, 'i')
      itMatches = expression.test result
      if itMatches then group = expression.exec result
      return itMatches

    switch
      when its /smoothie/       then @onConnect()
      when its /playing \/sd\// then @onStart()
      when its /not.*playing/   then @onStop() && @_stopUpdates()

  onConnect: -> throw new Error 'Not implemented'
  onStart:   -> throw new Error 'Not implemented'
  onStop:    -> throw new Error 'Not implemented'

  _update:       => @_execute 'progress'
  _startUpdates: => @updateTimer = setInterval @_update, 1000
  _stopUpdates:  => clearInterval @updateTimer

  _pathFor: (program) ->
    "/sd/program-#{_(program).kebabCase()}"

#noinspection JSUnresolvedVariable
module.exports = SmoothieboardActuator
