debug = require('debug')('vmr:interface:WioLinkSensors')
WebSocket = require 'ws'
v = require 'validator'

class WioLinkSensors

  constructor: (@address, @token) ->
    isValidToken = typeof @token is 'string' and v.isLength @token, min: 1
    isValidAddress = typeof @address is 'string' and v.isURL @address,
      protocols: ['wss','ws']
      require_protocol: true

    if not isValidToken then throw new Error "'#{@token}' is not a valid Wio Link token"
    if not isValidAddress then throw new Error "'#{@address}' is not a valid Wio Link WebSocket address"

    @_init()

  _init: =>
    @_ws = new WebSocket @address
    @_ws.on 'open', @_onOpen
    @_ws.on 'message', @_onEvent
    @_ws.on 'close', @_onClose

  onChange: (name, data) =>
    debug "got event '#{name}' with '#{data}' typed '#{typeof data}'"

  onClose: =>

  _onClose: =>
    debug "#{@token} is down. Retry in 2s."
    setTimeout @._init, 2000
    @onClose()

  _onOpen: =>
    @_ws.send @token

  _onEvent: (data) =>
    event = {}
    names = []
    error = null

    try
      event = JSON.parse data

      if event.error?
        error = event.error
      else if event.msg?
        event = event.msg
        names = Object.keys event
      else
        debug "don't know what to do with '#{data}'"
    catch error
      debug "cannot parse '#{data}' due to #{error}"

    if error is not null
      debug error
    else
      for name in names
        floatValue  = parseFloat event[name]
        intValue    = parseInt event[name]
        stringValue = event[name]

        if typeof floatValue is 'number'
          @onChange name, floatValue
        else if typeof intValue is 'number'
          @onChange name, intValue
        else
          @onChange name, stringValue

#noinspection JSUnresolvedVariable
module.exports = WioLinkSensors
