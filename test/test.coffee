assert = require 'power-assert'
bean = require 'bean'

FluidFont = require '../src/fluidfont.coffee'

# .reszie()
describe '.reszie()', ->
  it 'フォントがリサイズされること', ->
    ff = new FluidFont
    oldSize = getComputedStyle(document.body)['font-size']
    ff.resize 1024
    newSize = getComputedStyle(document.body)['font-size']
    assert oldSize isnt newSize

# # .unbind()
# describe '.unbind()', ->
#   it 'windowのresizeイベントからイベントハンドラが削除されること', ->
#     ff = new FluidFont
#     ff.unbind()
#     oldSize = getComputedStyle(document.body)['font-size']
#     window.resizeTo -100, -100
#     newSize = getComputedStyle(document.body)['font-size']
#     assert oldSize isnt newSize
#
# # .events()
# describe '.events()', ->
#   it 'windowのresizeイベントにバインドされること', ->
#     ff = new FluidFont
#     ff.unbind()
#     ff.events()
#     oldSize = getComputedStyle(document.body)['font-size']
#     bean.fire window, "resize.fluidfont:#{ff._namespace}"
#     newSize = getComputedStyle(document.body)['font-size']
#     assert oldSize isnt newSize
#
# # Alias
# describe '.rmEvent()', ->
#   it '.unbind() のエイリアス', ->
#     ff = new FluidFont
#     ff.unbind()
#     oldSize = getComputedStyle(document.body)['font-size']
#     ff.resize 1024
#     newSize = getComputedStyle(document.body)['font-size']
#     assert oldSize is newSize
#
# describe '.addEvent()', ->
#   it '.events() のエイリアス', ->
#     ff = new FluidFont
#     ff.rmEvent()
#     ff.addEvent()
#     resizeEvents = $._data($(window)[0], 'events').resize
#     ev = undefined
#     for val, i in resizeEvents
#       if val.namespace is "fluidfont:#{ff._namespace}"
#         ev = val
#     assert typeof ev.handler is 'function'
