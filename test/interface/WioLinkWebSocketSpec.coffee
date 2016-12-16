WioLinkSensors = require '../../src/interface/WioLinkSensors'
chai = require 'chai'
spies = require 'chai-spies'

expect = chai.expect
chai.should()
chai.use(spies)

describe 'Interface', ->

  describe 'WioLinkSensors', ->

    it 'should tell if address or token is invalid', ->
      expect(-> new WioLinkSensors null, null).to.throw /(token|address)/
      expect(-> new WioLinkSensors null, '').to.throw /(token|address)/
      expect(-> new WioLinkSensors '', null).to.throw /(token|address)/
      expect(-> new WioLinkSensors '', '').to.throw /(token|address)/

      expect(-> new WioLinkSensors 'http://test.de', 'token').to.throw /address/
      expect(-> new WioLinkSensors 'wss://test.de', '').to.throw /token/
      expect(-> new WioLinkSensors 'wss://test.de', 'token').not.to.throw Error
