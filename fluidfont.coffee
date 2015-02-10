do (root = this, factory = ($, td) ->
  "use strict"

  if td is undefined then td = $

  class FluidFont

    _$window = $(window)

    _defaults:
      target: 'body'
      baseWidth: 640
      baseSize: '1em'
      delay: 300
      type: 'debounce'# or 'throttle'

    _configure: (opts) ->
      @opts = $.extend {}, @_defaults, opts
      @$el = $(@opts.target)

    # arguments => $el, opts
    constructor: (opts) ->
      @_configure opts

      $('html').css 'font-size', @opts.baseSize
      @resize _$window.outerWidth()
      @addEvent()

    resize: (width) ->
      size = "#{width / @opts.baseWidth * 100}%"
      @$el.css 'font-size', size
      return this

    addEvent: ->
      _$window.on 'resize.fluidfont', td[@opts.type] @opts.delay, =>
        @resize _$window.outerWidth()
      return this

    rmEvent: ->
      _$window.off 'resize.fluidfont'
      return this

) ->
  if typeof define is 'function' and define.amd
    define ['$', 'td'], factory
  else if typeof exports is 'object'
    module.exports = factory require('jquery'), require('throttle-debounce')
  else
    root.FluidFont or= factory root.jQuery
  return
