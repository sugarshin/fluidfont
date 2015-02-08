do (root = this, factory = ($, td) ->
  "use strict"

  if td is undefined then td = $

  class FluidFont

    _defaults:
      baseWidth: 640
      baseSize: '1em'
      delay: 300
      type: 'debounce'# or 'throttle'

    resize: (width) ->
      size = "#{width / @opts.baseWidth * 100}%"
      @$body.css 'font-size', size
      return this

    constructor: (opts) ->
      @opts = $.extend {}, @_defaults, opts
      @$body = $('body')

      $('html').css 'font-size', @opts.baseSize
      @resize()
      @addEvent()

    addEvent: ->
      $(window).on 'resize.fluidfont', td[@opts.type] @opts.delay, => @resize window.innerWidth
      return this

    rmEvent: ->
      $(window).off 'resize.fluidfont'
      return this

) ->
  if typeof define is 'function' and define.amd
    define factory require('jquery'), require('throttle-debounce')
  else if typeof module isnt 'undefined' and module.exports
    module.exports = factory require('jquery'), require('throttle-debounce')
  else
    root.FluidFont or= factory root.jQuery
  return
