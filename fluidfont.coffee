###!
 * @license fluidfont
 * (c) sugarshin
 * License: MIT
###

"use strict"

do (root = this, factory = ($, td) ->

  if td is undefined then td = $

  class FluidFont

    _$window = $(window)

    _defaults:
      target: 'body'
      baseWidth: 640
      baseSize: '1em'
      delay: 400
      delayType: 'debounce'# or 'throttle'

    _configure: (opts) ->
      @opts = $.extend {}, @_defaults, opts
      @$el = $(@opts.target)
      $('html').css 'font-size', @opts.baseSize

    constructor: (opts) ->
      @_configure opts
      @resize _$window.outerWidth()
      @events()

    resize: (width) ->
      size = "#{width / @opts.baseWidth * 100}%"
      @$el.css 'font-size', size
      return this

    events: ->
      _$window.on 'resize.fluidfont', td[@opts.delayType] @opts.delay, =>
        @resize _$window.outerWidth()
      return this

    addEvent: @::events

    unbind: ->
      _$window.off 'resize.fluidfont'
      return this

    rmEvent: @::unbind

) ->
  if typeof module is 'object' and typeof module.exports is 'object'
    module.exports = factory require('jquery'), require('throttle-debounce')
  else
    root.FluidFont or= factory root.jQuery
  return
