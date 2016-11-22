RelayActuator = require '../interface/RelayActuator'

class PhysicalLoadingDoorType

  $Door_Status: null

  constructor: (options) ->
    if options.DoorLock?
      @DoorLock = new RelayActuator options.DoorLock.pin
      @onState  = 'closed'
      @offState = 'open'

    if options.OpeningGear?
      throw new Error 'OpeningGear actuator has not been implemented'

    @$Open_Door()

  $Close_Door: =>
    @DoorLock.on() if @DoorLock?
    @$Door_Status = @onState

  $Open_Door: =>
    @DoorLock.off() if @DoorLock?
    @$Door_Status = @offState

#noinspection JSUnresolvedVariable
module.exports = PhysicalLoadingDoorType
