argv = require('minimist')(process.argv.slice 2)
path = require 'path'
fs = require 'fs'

ModelControl = require './model-control'

if not argv.machineDefinition? 
  throw Error '--machineDefinition=<path> missing'

machineDefinition = path.join __dirname, '..', argv.machineDefinition

if not fs.existsSync machineDefinition 
  throw Error "#{machineDefinition} is no valid machine definition"

modelControl = new ModelControl machineDefinition

process.title = 'VMR'
process.on 'SIGINT', ->
  modelControl.stop()
  process.exit -1

modelControl.start()
