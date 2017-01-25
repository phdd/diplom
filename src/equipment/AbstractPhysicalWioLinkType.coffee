WioLinkSensors = require '../interface/WioLinkSensors'
debug = require('debug')('vmr:equipment:AbstractPhysicalWioLinkType')

class AbstractPhysicalWioLinkType

  constructor: (options) ->
    @WioLink = new WioLinkSensors options.WioLink.address, options.WioLink.token
    @WioLink.onChange = @_onChange
    @WioLink.onClose = @onClose

  onClose: =>

  _onChange: (name, data) =>
    method = "onChange_#{name}"
    variable = "$#{name}"

    if @[method]? then @[method](data)
    else if @[variable]? then @[variable] = data
    else debug "#{typeof this} has neither #{method}(data) nor variable $#{name}"

#noinspection JSUnresolvedVariable
module.exports = AbstractPhysicalWioLinkType
