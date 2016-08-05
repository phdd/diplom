Q = require 'q'
async = require 'async'
opcua = require 'node-opcua'

#noinspection JSUnresolvedVariable
module.exports =

  findObjectsTyped: (objectType, engine, namespace) ->
    type = engine.addressSpace.findObjectType objectType, namespace

    browseDescription = engine.browse [
      nodeId: type.nodeId
      referenceTypeId: opcua.resolveNodeId 'HasTypeDefinition'
      browseDirection: opcua.browse_service.BrowseDirection.Inverse
      includeSubtypes: true
      nodeClassMask: 0x1
      resultMask: 63 ]

    references = browseDescription[0].references or []
    deferred = Q.defer()

    referenceHandler = (reference, register) ->
      object = engine.addressSpace.findNode reference.nodeId
      register null, object

    async.map references, referenceHandler, (error, result) ->
      if not error? then deferred.resolve result
      else deferred.reject new Error error

    deferred.promise

