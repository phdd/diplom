PhysicalNCType = require '../../src/equipment/PhysicalNCType'
opcua = require 'node-opcua'
chai = require 'chai'
spies = require 'chai-spies'

status = opcua.StatusCodes
expect = chai.expect
its = null

chai.should()
chai.use(spies)

describe 'equipment', -> 

	describe 'PhysicalNCType', ->

		describe 'initial state', ->

			it 'should have no program', ->
				expect(its.$NC_Program).to.be.null

			it 'should have been resetted', -> 
				its.$NC_Program_Status.should.equal 'Reset'

		describe 'program upload', ->

			it 'should fail with invalid program name', ->
				its.$Transmit_NC_Program null, 'code'
					.statusCode.should.equal status.BadArgumentsMissing

				its.$Transmit_NC_Program '', 'code'
					.statusCode.should.equal status.BadArgumentsMissing

			it 'should fail with invalid program', ->
				its.$Transmit_NC_Program 'test', null
					.statusCode.should.equal status.BadArgumentsMissing

				its.$Transmit_NC_Program 'test', ''
					.statusCode.should.equal status.BadArgumentsMissing

			it 'should succeed with valid name and program', -> 
				upload = chai.spy.on its.NCInterpreter, 'upload'
				its.$Transmit_NC_Program 'test', 'code'
				upload.should.have.been.called.with 'test', 'code'

		describe 'program download', ->

			it 'isn\'t implemented yet', ->
				its.$Receive_NC_Program()
					.statusCode.should.equal status.BadNotImplemented

		describe 'program assignment', ->

			it 'should fail with invalid program name', ->
				its.$Assign_NC_Program null
					.statusCode.should.equal status.BadArgumentsMissing

				its.$Assign_NC_Program ''
					.statusCode.should.equal status.BadArgumentsMissing

			it 'should succeed with program name', ->
				its.$Assign_NC_Program 'test'
				its.$NC_Program.should.equal 'test'

			it 'should lead to stopped state', ->
				its.$Assign_NC_Program 'test'
				its.$NC_Program_Status.should.equal 'Stop'

		describe 'operation start', -> 

			it 'should fail without a program assigned', ->
				its.$Start_NC()
					.statusCode.should.equal status.BadInvalidState

			it 'should fail when already active', ->
				its.$NC_Program_Status = 'Active'
				its.$Start_NC()
					.statusCode.should.equal status.BadInvalidState

			it 'should succeed if inactive and assigned program', ->
				start = chai.spy.on its.NCInterpreter, 'start'
				its.$NC_Program = 'test'
				its.$Start_NC()
				start.should.have.been.called.with 'test'

		describe 'operation stop', -> 

			it 'should fail if NC isn\'t running', ->
				its.$Stop_NC()
					.statusCode.should.equal status.BadInvalidState

			it 'should succeed if NC is running', ->
				stop = chai.spy.on its.NCInterpreter, 'stop'
				its.$NC_Program_Status = 'Active'
				its.$Stop_NC()
				stop.should.have.been.called()

		describe 'reset', -> 

			it 'should stop operation if NC is working', ->
				stop = chai.spy.on its.NCInterpreter, 'stop'
				its.$NC_Program_Status = 'Active'
				its.$Reset_NC()
				stop.should.have.been.called()

		beforeEach ->
			its = new PhysicalNCType NCInterpreter: device: null
			its.NCInterpreter = {}
			its.$Reset_NC()
