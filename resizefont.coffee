$ = require 'jquery'
TD = require 'throttle-debounce'

class ResizeFont
  "use strict"

  _resize = ->
    width = window.innerWidth
    size = "#{width / @opts.baseWidth * 100}%"
    @$body.css 'font-size', size

  _defaults:
    baseWidth: 640

  resize: _resize

  constructor: (opts) ->
    @opts = $.extend {}, @_defaults, opts
    @$body = $('body')
    _resize.call @
    @addEvent()

  debounceResize: TD.debounce 300, _resize

  addEvent: ->
    $(window).on 'resize.resizefont', => @debounceResize()
    return this

  rmEvent: ->
    $(window).off 'resize.resizefont'
    return this

if typeof define is 'function' and define.amd
  define -> ResizeFont
else if typeof module isnt 'undefined' and module.exports
  module.exports = ResizeFont
else
  window.ResizeFont or= ResizeFont
