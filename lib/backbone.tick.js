(function() {
  var Backbone, Tick;

  if (typeof module !== "undefined" && module !== null ? module.exports : void 0) {
    Backbone = require('backbone');
  } else if (this.Backbone) {
    Backbone = this.Backbone;
  } else {
    throw new Error('Backbone not found');
  }

  Tick = (function() {

    function Tick(options) {
      var f, interval, r,
        _this = this;
      if (options == null) {
        options = null;
      }
      interval = 1000 / ((options != null ? options.fps : void 0) || 20);
      r = this.requestAnimationFrame || this.webkitRequestAnimationFrame || this.mozRequestAnimationFrame || this.oRequestAnimationFrame || this.msRequestAnimationFrame || function(callback, element) {
        return this.setTimeout(callback, interval);
      };
      r(f = function() {
        _this.trigger('tick', _this);
        return r(f);
      });
    }

    return Tick;

  })();

  Tick.prototype = _.defaults(Tick.prototype, Backbone.Events);

  if (typeof module !== "undefined" && module !== null ? module.exports : void 0) {
    module.exports = {
      Tick: Tick
    };
  } else if (this.Backbone != null) {
    this.Backbone.Tick = Tick;
  }

}).call(this);
