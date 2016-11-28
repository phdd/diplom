# Virtual Machine Representation (VMR)

[![Build status](https://travis-ci.org/phdd/diplom.svg?branch=vmr)](https://travis-ci.org/phdd/diplom?branch=vmr) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

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
4. and switch to the prototype branch ```git checkout vmr```

## Build and run

1. install all dependencies and build the VMR ```npm install```
2. run the VMR with ```node dist/vmr.js --machineDefinition=objects.xml```

_objects.xml_ contains the OPC UA information model for the machine definition you may replace with your own (Namespace is _urn:objects_). Prefix the run command for debug output with ```DEBUG=vmr*```

<!--
grunt && scp objects.xml pi@192.168.2.12:/home/pi/vmr/ && scp -r dist/ pi@192.168.2.12:/home/pi/vmr/ && scp package.json pi@192.168.2.12:/home/pi/vmr/ && ssh -t pi@192.168.2.12 "NODE_ENV=production DEBUG=vmr* node vmr/dist/vmr.js --machineDefinition=objects.xml"
-->

# License

Copyright 2016 Peter Heisig 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

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