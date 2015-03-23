jsdom = require('jsdom').jsdom
global.document = jsdom '<html><body></body></html>'
global.window = document.defaultView
global.navigator = window.navigator

assert = require 'power-assert'
bean = require 'bean'

FluidFont = require '../src/fluidfont.coffee'

# FluidFont
describe '.reszie()', ->
  it 'フォントがリサイズされること', ->
    ff = new FluidFont
    oldSize = window.getComputedStyle(document.body)['font-size']
    ff.resize 960
    newSize = window.getComputedStyle(document.body)['font-size']
    assert oldSize isnt newSize
