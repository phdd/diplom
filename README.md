# Virtual Machine Representation (VMR)

## Prerequisites

Software you need is

* Node.js (>= 7.1)
* NPM (>= 3.10)
* GrovePi [github.com/DexterInd/GrovePi](https://github.com/DexterInd/GrovePi)
    - ```git clone https://github.com/DexterInd/GrovePi.git``` 
    - ```bash GrovePi/Script/install.sh```

## Installation

1. install a local Grunt with ```npm install -g grunt grunt-cli``` (as root)
2. checkout this repository by ```git clone https://github.com/phdd/diplom.git vmr```
3. move into the folder with ```cd vmr```
4. and switch to the prototype branch ```git checkout surrogate```

## Build and run

1. install all dependencies and build the VMR ```npm install```
2. run the VMR with ```node dist/app.js --objectModel=objects.xml```

_Objects.xml_ contains the OPC UA information model you may replace with your own. Prefix the run command for debug output with ```DEBUG=cps:*```

<!--
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
-->