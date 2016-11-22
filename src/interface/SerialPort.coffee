_ = require 'lodash'
fs = require 'fs'
debug = require('debug')('interface:SerialPort')
Serial = require 'serialport'

stringFrom = (s) -> '' + s
newline = '\n'

class SerialPort

  _serial: null
  _commands: []
  _results: []

  constructor: (port) ->
    if not fs.existsSync(port)
      return debug "#{port} not available"

    @_serial = new Serial port,
      parser: Serial.parsers.readline newline

    @_commands = []
    @_results  = []

    @_serial.on 'data', (data)  => @_results.push stringFrom(data).trim()
    @_serial.on 'open', (error) -> if error? then throw Error error
    @_serial.on 'error',(error) -> throw Error error
    @_serial.on 'close', -> debug 'disconnected'

    setInterval (=> @_processCommand @_commands.shift() if @_commands.length > 0), 0
    setInterval (=> @_processResult  @_results.shift()  if @_results.length  > 0), 0

  _processCommand: (command) =>
    @_serial.write command

  _execute: (program) =>
    stringFrom program
      .split newline
      .map (c) -> c += newline if not _(c).endsWith newline
      .map (c) => @_commands.push c

#noinspection JSUnresolvedVariable
module.exports = SerialPort