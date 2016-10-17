```
ElectionSensor = require '../cps/PresidentSensor'

class PhysicalPresidentType

  # 1) Declare OPC UA Variables (with '$' prefix)
  $Elected_President: null

  constructor: (options) ->
    # 2) Initialize sensor with connectionIdentifier value
    #    eg., for OPC UA Model-Object President:
    #      { "candidates": [ 'Clinton', 'Trump' ] }
    @ElectionSensor = new ElectionSensor options.President.candidates
    
    # 3) Setup sensor listener
    @ElectionSensor.onDemocraticDecision = @_onDemocraticDecision
    
    # 4) Initialize variables 
    @$Elected_President = 'Obama'

  # 5) Declare OPC UA Methods (with '$' prefix)
  $Start_Elections: =>
    @ElectionSensor.askPeople()

  # 6) Implement component logic with variable assignment
  _onDemocraticDecision: (electedPresident) =>
    switch electedPresident
      when   'Trump' then @$Elected_President = 'Giant Douche'
      when 'Clinton' then @$Elected_President = 'Turd Sandwich'
                     else @$Elected_President = 'Jesus'

#noinspection JSUnresolvedVariable
module.exports = PhysicalWorldDominationType
```