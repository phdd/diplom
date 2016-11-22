GrovePi = require('node-grovepi').GrovePi
debug = require('debug')('vmr:RawCPA')

class RawCPA 

  constructor: ->
    @grovePi = new GrovePi.board 
      onError: (error) -> debug error.toString()

  start: =>
    @grovePi.init()

module.exports = RawCPA
