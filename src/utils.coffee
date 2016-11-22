opcua = require 'node-opcua'

Array::filter = (callback) -> element for element in @ when callback(element)
Array::isEmpty = -> @.length is 0

module.exports = 

	findObjectsTyped: (objectType, namespace, server) ->
    type = server.addressSpace.findObjectType objectType, namespace

    browseDescription = server.browse [
      nodeId: type.nodeId
      referenceTypeId: opcua.resolveNodeId 'HasTypeDefinition'
      browseDirection: opcua.browse_service.BrowseDirection.Inverse
      includeSubtypes: true
      nodeClassMask: 0x1
      resultMask: 63 ]

    references = browseDescription[0].references or []
    objects = []

    for reference in references
      do (reference) ->
        objects.push server.addressSpace.findNode(reference.nodeId)

    return objects

  variablesOf: (o) ->
    Object.keys(o).filter (k) ->
      typeof o[k] isnt 'function' and k[0] is '$'

  methodsOf: (o) ->
    Object.keys(o).filter (k) ->
      typeof o[k] is 'function' and k[0] is '$'

  addressSpaceNameOf: (o) ->
    name = o[1..-1]
    name[0].toLowerCase() + name[1..-1]
