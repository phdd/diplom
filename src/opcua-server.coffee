opcua = require 'node-opcua'
path = require 'path'

class OPCUAServer 

  server: null
  endpoint: null
  addressSpace: null

  constructor: (machineDefinition)->
    @server = new opcua.OPCUAServer
      certificateFile: path.join __dirname, 'res/cert.pem'
      privateKeyFile:  path.join __dirname, 'res/key.pem'
      port:            26543

      nodeset_filename: [
        opcua.standard_nodeset_file
        path.join __dirname, 'res/nodesets/opc4factory.xml'
        path.join __dirname, 'res/nodesets/cpps.xml'
        machineDefinition ]

    @endpoint = @server.endpoints[0].endpointDescriptions()[0].endpointUrl

  start: (callback) =>
    @server.on 'post_initialize', =>
      @addressSpace = @server.engine.addressSpace
      callback()

    @server.start()

  stop: =>
    @server.shutdown 1000, ->

  browse: (something) =>
    @server.engine.browse something

module.exports = OPCUAServer
