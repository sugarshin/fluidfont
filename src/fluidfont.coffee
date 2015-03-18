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

  fluidfont = []

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
    afterResize: ->
    beforeResize: ->

  _configure: (opts) ->
    @opts = opts or {}
    @el = @opts.target or @_defaults.target

    @opts.baseWidth = @opts.baseWidth or @_defaults.baseWidth
    @opts.baseSize = @opts.baseSize or @_defaults.baseSize
    @opts.delay = @opts.delay or @_defaults.delay
    @opts.delayType = @opts.delayType or @_defaults.delayType
    @opts.afterResize = @opts.afterResize or @_defaults.afterResize
    @opts.beforeResize = @opts.beforeResize or @_defaults.beforeResize

    @_ns = @_getRandomString(16) + +new Date

    document.getElementsByTagName('html')[0].style.fontSize = @opts.baseSize
    fluidfont.push @

  _getWindowWidth: -> window.innerWidth or document.documentElement.clientHeight

  constructor: (opts) ->
    @_configure opts
    @resize @_getWindowWidth()
    @on()

  resize: (width) ->
    @opts.afterResize?()
    @el.style.fontSize = "#{width / @opts.baseWidth * 100}%"
    @opts.beforeResize?()
    return this

  on: ->
    bean.on window, "resize.fluidfont:#{@_ns}", td[@opts.delayType] =>
      @resize @_getWindowWidth()
    , @opts.delay
    return this

  events: @::on
  addEvent: @::events

  off: ->
    bean.off window, "resize.fluidfont:#{@_ns}"
    return this

  unbind: @::off
  rmEvent: @::unbind

  destroy: ->
    @off()
    for ff, i in fluidfont when ff is @
      ff.el.style.fontSize = ''
      fluidfont.splice i, 1
      break

  @resizeAll: (width) -> for ff in fluidfont then ff.resize width
