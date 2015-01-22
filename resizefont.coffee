$ = require 'jquery'

class ResizeFont
  "use strict"

  # https://github.com/jashkenas/underscore/blob/master/underscore.js#L823
  _debounce = (func, wait, immediate) ->
    later = ->
      last = new Date().now() - timestamp

      if last < wait and last >= 0
        timeout = setTimeout later, wait - last
      else
        timeout = null
        unless immediate
          result = func.apply context, args
          unless timeout then context = args = null
    return ->
      context = this
      args = arguments
      timestamp = new Date().now()
      callNow = immediate and !timeout
      unless timeout then timeout = setTimeout later, wait
      if callNow
        result = func.apply context, args
        context = args = null
      return result

  _defaults:
    baseWidth: 640

  _resize: ->
    width = window.innerWidth
    size = "#{width / @opts.baseWidth * 100}%"
    @$body.css 'font-size', size

  constructor: (opts) ->
    @opts = $.extend {}, @_defaults, opts
    @$body = $('body')
    @_resize()
    @addEvent()

  debounceResize: _debounce _resize, 300

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
  global.ResizeFont or= ResizeFont
