if module?.exports
	Backbone = require 'backbone'
else if @Backbone
	Backbone = @Backbone
else
	throw new Error 'Backbone not found'



class Tick
	constructor: (options = null) ->
		interval = 1000 / (options?.fps or 20)

		r = @requestAnimationFrame ||
			@webkitRequestAnimationFrame ||
			@mozRequestAnimationFrame ||
			@oRequestAnimationFrame ||
			@msRequestAnimationFrame ||
			(callback, element) -> @setTimeout(callback, interval)

		r f = =>
			@trigger 'tick', @
			r f

Tick.prototype = _.defaults(Tick.prototype, Backbone.Events)



if module?.exports
	module.exports = Tick: Tick
else if @Backbone?
	@Backbone.Tick = Tick