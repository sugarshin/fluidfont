assert = require 'power-assert'

$ = require 'jquery'
FluidFont = require '../fluidfont'

# .reszie()
describe '.reszie()', ->
  it 'フォントがリサイズされること', ->
    ff = new FluidFont
    oldSize = $('body').css 'font-size'
    ff.resize 1024
    newSize = $('body').css 'font-size'
    assert oldSize isnt newSize

# .unbind()
describe '.unbind()', ->
  it 'windowのresizeイベントからイベントハンドラが削除されること', ->
    ff = new FluidFont
    ev = undefined
    $(window).on 'resize.test', -> console.log 'resize.test'
    ff.unbind()
    resizeEvents = $._data($(window)[0], 'events').resize
    assert do ->
      for val, i in resizeEvents
        if val.namespace is "fluidfont:#{ff._namespace}"
          return false
      return true

# .events()
describe '.events()', ->
  it 'windowのresizeイベントにバインドされること', ->
    ff = new FluidFont
    ff.unbind()
    ff.events()
    resizeEvents = $._data($(window)[0], 'events').resize
    ev = undefined
    for val, i in resizeEvents
      if val.namespace is "fluidfont:#{ff._namespace}"
        ev = val
    assert typeof ev.handler is 'function'

# Alias
describe '.rmEvent()', ->
  it '.unbind() のエイリアス', ->
    ff = new FluidFont
    ev = undefined
    $(window).on 'resize.test', -> console.log 'resize.test'
    ff.rmEvent()
    resizeEvents = $._data($(window)[0], 'events').resize
    assert do ->
      for val, i in resizeEvents
        if val.namespace is "fluidfont:#{ff._namespace}"
          return false
      return true

describe '.addEvent()', ->
  it '.events() のエイリアス', ->
    ff = new FluidFont
    ff.rmEvent()
    ff.addEvent()
    resizeEvents = $._data($(window)[0], 'events').resize
    ev = undefined
    for val, i in resizeEvents
      if val.namespace is "fluidfont:#{ff._namespace}"
        ev = val
    assert typeof ev.handler is 'function'
