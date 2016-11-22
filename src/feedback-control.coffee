watch = require('watchjs').watch
debug = require('debug')('vmr:FeedbackControl')

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
          if condition.readValue().value.value is addressSpaceVariable.readValue().value.value
            debug "#{condition.browseName.name} for #{addressSpaceVariable.browseName.name} has been met".yellow
            @findAndExecuteActionFor condition

  findAndExecuteActionFor: (condition) =>
    references = condition.findReferencesEx 'HasEffect'
    for reference in references.filter((ref) => ref.isForward)
      @addressSpace.findNode(reference.nodeId).execute [], condition, ->

module.exports = FeedbackControl
