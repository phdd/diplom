KillSwitch = require './protocol/KillSwitchType'
LoadingDoor = require './protocol/LoadingDoorType'
NC = require './protocol/NCType'

#noinspection JSUnresolvedVariable
module.exports =

  MillingMachine:
    displayName: 'EMCO CONCEPT TURN 55'
    components:

      Kill_Switch:
        create: -> new KillSwitch(4)

      Loading_Door:
        create: -> new LoadingDoor(7)

      NC:
        create: -> new NC
