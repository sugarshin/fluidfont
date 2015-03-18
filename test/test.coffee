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
