if module?.exports
	Backbone = require 'backbone'
else if @Backbone
	Backbone = @Backbone
else
	throw new Error 'Backbone not found'



class Tick
	constructor: (options = null) ->
		interval = 1000 / (options?.fps or 20)

		r = window.requestAnimationFrame ||
			window.webkitRequestAnimationFrame ||
			window.mozRequestAnimationFrame ||
			window.oRequestAnimationFrame ||
			window.msRequestAnimationFrame ||
			(callback, element) -> window.setTimeout(callback, interval)

		r f = =>
			@trigger 'tick', @
			r f

Tick.prototype = _.defaults(Tick.prototype, Backbone.Events)



if module?.exports
	module.exports = Tick: Tick
else if @Backbone?
	@Backbone.Tick = Tick