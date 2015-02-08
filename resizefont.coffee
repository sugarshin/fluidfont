do (factory = ($, td) ->
  "use strict"

  if td is undefined then td = $

  class ResizeFont
    "use strict"

    _defaults:
      baseWidth: 640
      delay: 300
      type: 'debounce'# or throttle

    resize: ->
      width = window.innerWidth
      size = "#{width / @opts.baseWidth * 100}%"
      @$body.css 'font-size', size
      return this

    constructor: (opts) ->
      @opts = $.extend {}, @_defaults, opts
      @$body = $('body')
      @resize()
      @addEvent()

    addEvent: ->
      $(window).on 'resize.resizefont', td[@opts.type] @opts.delay, => @resize()
      return this

    rmEvent: ->
      $(window).off 'resize.resizefont'
      return this

) (if typeof window isnt undefined then window else this), ->
  if typeof define is 'function' and define.amd
    define factory require('jquery'), require('throttle-debounce')
  else if typeof module isnt 'undefined' and module.exports
    module.exports = factory require('jquery'), require('throttle-debounce')
  else
    window.ResizeFont or= factory window.jQuery
  return
