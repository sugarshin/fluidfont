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

    # klughammer/node-randomstring
    _getRandomString: do ->
      chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghiklmnopqrstuvwxyz'
      return (length = 32) ->
        string = ''
        for i in [0...length]
          randomNumber = Math.floor Math.random() * chars.length
          string += chars.substring randomNumber, randomNumber + 1
        return string

    _defaults:
      target: 'body'
      baseWidth: 640
      baseSize: '1em'
      delay: 400
      delayType: 'debounce'# or 'throttle'

    _configure: (opts) ->
      @opts = opts or {}
      @opts.target = @opts.target or @_defaults.target
      @opts.baseWidth = @opts.baseWidth or @_defaults.baseWidth
      @opts.baseSize = @opts.baseSize or @_defaults.baseSize
      @opts.delay = @opts.delay or @_defaults.delay
      @opts.delayType = @opts.delayType or @_defaults.delayType
      @$el = $(@opts.target)
      @_namespace = @_getRandomString(16) + +new Date
      $('html').css 'font-size', @opts.baseSize

    constructor: (opts) ->
      @_configure opts
      @resize _$window.outerWidth()
      @events()

    resize: (width) ->
      @$el.css 'font-size', "#{width / @opts.baseWidth * 100}%"
      return this

    events: ->
      _$window.on "resize.fluidfont:#{@_namespace}", td[@opts.delayType] @opts.delay, =>
        @resize _$window.outerWidth()
      return this

    addEvent: @::events

    unbind: ->
      _$window.off "resize.fluidfont:#{@_namespace}"
      return this

    rmEvent: @::unbind

) ->
  if typeof module is 'object' and typeof module.exports is 'object'
    module.exports = factory require('jquery'), require('throttle-debounce')
  else
    root.FluidFont or= factory root.jQuery
  return
