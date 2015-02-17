assert = require 'power-assert'

$ = require 'jquery'
FluidFont = require '../fluidfont'

mocha.setup 'bdd'

window.onload = ->
  if window.mochaPhantomJS
    mochaPhantomJS.run()
  else
    mocha.run()

# .reszie()
describe '.reszie()', ->
  it 'フォントがリサイズされること', ->
    ff = new FluidFont
    oldSize = $('body').css 'font-size'
    ff.resize 1024
    newSize = $('body').css 'font-size'
    assert oldSize isnt newSize

# .addEvent()
describe '.addEvent()', ->
  it 'windowのresizeイベントにバインドされること', ->
    ff = new FluidFont
    resizeEvents = $._data($(window)[0], 'events').resize
    ev = undefined
    for val, i in resizeEvents
      if val.namespace is 'fluidfont'
        ev = val
    assert typeof ev.handler is 'function'

# .rmEvent()
describe '.rmEvent()', ->
  it 'windowのresizeイベントからイベントハンドラが削除されること', ->
    ff = new FluidFont
    ev = undefined
    $(window).on 'resize.test', -> console.log 'resize.test'
    ff.rmEvent()
    resizeEvents = $._data($(window)[0], 'events').resize
    assert do ->
      for val, i in resizeEvents
        if val.namespace is 'fluidfont'
          return false
      return true

