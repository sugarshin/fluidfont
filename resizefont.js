// Generated by CoffeeScript 1.8.0
(function() {
  var $, ResizeFont, TD;

  $ = require('jquery');

  TD = require('throttle-debounce');

  ResizeFont = (function() {
    "use strict";
    var _resize;

    _resize = function() {
      var size, width;
      width = window.innerWidth;
      size = "" + (width / this.opts.baseWidth * 100) + "%";
      return this.$body.css('font-size', size);
    };

    ResizeFont.prototype._defaults = {
      baseWidth: 640
    };

    ResizeFont.prototype.resize = _resize;

    function ResizeFont(opts) {
      this.opts = $.extend({}, this._defaults, opts);
      this.$body = $('body');
      _resize.call(this);
      this.addEvent();
    }

    ResizeFont.prototype.debounceResize = TD.debounce(300, _resize);

    ResizeFont.prototype.addEvent = function() {
      $(window).on('resize.resizefont', (function(_this) {
        return function() {
          return _this.debounceResize();
        };
      })(this));
      return this;
    };

    ResizeFont.prototype.rmEvent = function() {
      $(window).off('resize.resizefont');
      return this;
    };

    return ResizeFont;

  })();

  if (typeof define === 'function' && define.amd) {
    define(function() {
      return ResizeFont;
    });
  } else if (typeof module !== 'undefined' && module.exports) {
    module.exports = ResizeFont;
  } else {
    window.ResizeFont || (window.ResizeFont = ResizeFont);
  }

}).call(this);