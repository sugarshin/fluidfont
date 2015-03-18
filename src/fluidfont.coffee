###!
 * @license fluidfont
 * (c) sugarshin
 * License: MIT
###

"use strict"

bean = require 'bean'
td =
  throttle: require 'throttleit'
  debounce: require 'debounce'

module.exports =
class FluidFont

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
    target: document.body
    baseWidth: 640
    baseSize: '1em'
    delay: 300
    delayType: 'debounce'# or 'throttle'

  _configure: (opts) ->
    @opts = opts or {}
    @el = @opts.target or @_defaults.target
    @opts.baseWidth = @opts.baseWidth or @_defaults.baseWidth
    @opts.baseSize = @opts.baseSize or @_defaults.baseSize
    @opts.delay = @opts.delay or @_defaults.delay
    @opts.delayType = @opts.delayType or @_defaults.delayType
    @_namespace = @_getRandomString(16) + +new Date
    document.getElementsByTagName('html')[0].style.fontSize = @opts.baseSize

  _getWindowWidth: -> window.innerWidth or document.documentElement.clientHeight

  constructor: (opts) ->
    @_configure opts
    @resize @_getWindowWidth()
    @events()

  resize: (width) ->
    @el.style.fontSize = "#{width / @opts.baseWidth * 100}%"
    return this

  events: ->
    bean.on window, "resize.fluidfont:#{@_namespace}", td[@opts.delayType] =>
      @resize @_getWindowWidth()
    , @opts.delay
    return this

  addEvent: @::events

  unbind: ->
    bean.off window, "resize.fluidfont:#{@_namespace}"
    return this

  rmEvent: @::unbind
