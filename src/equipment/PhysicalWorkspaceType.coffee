AbstractPhysicalWioLinkType = require './AbstractPhysicalWioLinkType'

class PhysicalWorkspaceType extends AbstractPhysicalWioLinkType

  $airQuality: null
  $temperature: null
  $humidity: null

  constructor: (options) ->
    super options
    @onClose()

  onChange_temperature: (value) =>
    if -100 < value and value < 1000
      @$temperature = value

  onChange_humidity: (value) =>
    if 0 <= value and value <= 100
      @$humidity = value

  onChange_airQuality: (value) =>
    if 0 < value and value <= 1000
      @$airQuality = Math.round(1 / value * 10000)

  onClose: =>
    @$airQuality = null
    @$temperature = null
    @$humidity = null

#noinspection JSUnresolvedVariable
module.exports = PhysicalWorkspaceType
