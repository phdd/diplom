AbstractPhysicalWioLinkType = require './AbstractPhysicalWioLinkType'
debug = require('debug')('vmr:equipment:PhysicalWorkspaceType')

class PhysicalWorkspaceType extends AbstractPhysicalWioLinkType

  $temperature: null
  $humidity: null
  $vibration: null

  constructor: (options) ->
    super options
    @onClose()

  onChange_temperature: (value) =>
    if -100 < value and value < 1000
      @$temperature = value

  onChange_humidity: (value) =>
    if 0 <= value and value <= 100
      @$humidity = value

  onChange_vibration: (value) =>
    debug "got #{value} but don't know how to handle..."
    #if 0 <= value and value <= 1023
    #  @$vibration = value

  onClose: =>
    @$temperature = null
    @$humidity = null
    @$vibration = null

#noinspection JSUnresolvedVariable
module.exports = PhysicalWorkspaceType
