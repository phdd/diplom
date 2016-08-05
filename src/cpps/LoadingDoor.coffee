RelayActuator = require '../cps/RelayActuator'

class LoadingDoorType

  variables:
    Door_Status: {}

  methods:
    Close_Door: {}
    Open_Door: {}

  DoorLock: null
  OpeningGear: null

  constructor: (options) ->
    if options.DoorLock?
      @DoorLock = new RelayActuator options.DoorLock.pin
      @onState  = 'closed'
      @offState = 'open'

    if options.OpeningGear?
      throw new Error 'OpeningGear actuator has not been implemented'

    @Open_Door()

  Close_Door: =>
    @DoorLock.on() if @DoorLock?
    @variables.Door_Status.value = @onState

  Open_Door: =>
    @DoorLock.off() if @DoorLock?
    @variables.Door_Status.value = @offState

#noinspection JSUnresolvedVariable
module.exports = LoadingDoorType
