AbstractPhysicalWioLinkType = require './AbstractPhysicalWioLinkType'

class PhysicalWorkspaceType extends AbstractPhysicalWioLinkType

  @$ambientLight: null

  constructor: (options) ->
    super options
    @onClose()

  onChange_ambientLight: (value) =>
    if 0 < value and value < 10000
      @$ambientLight = value

  onClose: =>
    @$ambientLight = null

#noinspection JSUnresolvedVariable
module.exports = PhysicalWorkspaceType
