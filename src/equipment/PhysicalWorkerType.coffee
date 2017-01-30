AbstractPhysicalWioLinkType = require './AbstractPhysicalWioLinkType'
debug = require('debug')('vmr:equipment:PhysicalWorkerType')

class PhysicalWorkerType extends AbstractPhysicalWioLinkType

  $ambientLight: null
  $loudness: null
  $airQuality: null
  $temperature: null
  $humidity: null

  loudness:
    samplingStarted: false
    writeInterval: null
    lastValue: 0
    samples: 64
    rms: 0.0
    tmp: 0

  constructor: (options) ->
    super options
    @onClose()

  onChange_ambientLight: (value) =>
    if 0 < value and value < 10000
      @$ambientLight = value

  onChange_loudness: (value) =>
    if !@loudness.samplingStarted
      @loudness.samplingStarted = true
      @loudness.writeInterval = setInterval(=>
          @$loudness = @loudness.lastValue
        , 50);

    @loudness.rms = value
    @loudness.tmp += @loudness.rms * @loudness.rms
    @loudness.samples--

    if @loudness.samples < 1
      @loudness.tmp <<= 4
      @loudness.rms = Math.sqrt @loudness.tmp
      @loudness.rms *= 0.004875
      @loudness.rms = 0.004875 if @loudness.rms <= 0

      refSPL = 50
      sensitivity = 3.16
      db = refSPL + 20 * Math.log10(@loudness.rms / sensitivity)

      if db > 120
        @loudness.lastValue = 120
      else if db > 0
        @loudness.lastValue = db

      @loudness.samples = 64
      @loudness.rms = 0.0
      @loudness.tmp = 0

  onChange_airQuality: (value) =>
    if 0 < value and value <= 1000
      @$airQuality = Math.round(1 / value * 10000)

  onClose: =>
    clearInterval @loudness.writeInterval if @loudness.writeInterval != null

    @$ambientLight = null
    @$loudness = null
    @$airQuality = null
    @$temperature = null
    @$humidity = null

#noinspection JSUnresolvedVariable
module.exports = PhysicalWorkerType
