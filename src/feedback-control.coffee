watch = require('watchjs').watch
debug = require('debug')('vmr:FeedbackControl')
opcua = require 'node-opcua'

DataType = opcua.DataType

class FeedbackControl

  workWith: (addressSpace) =>
    @addressSpace = addressSpace

  listenTo: (addressSpaceVariable, variable, equipment) =>
    physicalConditions = []

    references = addressSpaceVariable.findHierarchicalReferences()
    for reference in references.filter((ref) => ref.isForward)
      condition = @addressSpace.findNode reference.nodeId
      conditionType = @addressSpace.findNode(condition.typeDefinition).browseName.name
      if conditionType is 'PhysicalConditionType'
        physicalConditions.push condition

    if physicalConditions.length > 0
      watch equipment, variable, => 
        for condition in physicalConditions
          if @hasBeenMet(condition, addressSpaceVariable)
            debug "#{condition.browseName.name} for #{addressSpaceVariable.browseName.name} has been met".yellow
            @findAndExecuteActionFor condition

  hasBeenMet: (condition, variable) =>
    conditionValue = condition.readValue().value
    variableValue = variable.readValue().value
    switch conditionValue.dataType

      when DataType.Boolean 
        return conditionValue.value is variableValue.value

      when DataType.ExtensionObject
        if conditionValue.value instanceof opcua.Range
          return @hasRangeBeenMet conditionValue.value, variableValue.value

    debug "#{condition.browseName.name} for #{variable.browseName.name}
      is neither Boolean nor Range".yellow

  hasRangeBeenMet: (range, value) =>
    range.low < value and value < range.high

  findAndExecuteActionFor: (condition) =>
    references = condition.findReferencesEx 'HasEffect'
    for reference in references.filter((ref) => ref.isForward)
      @addressSpace.findNode(reference.nodeId).execute [], condition, ->

module.exports = FeedbackControl
