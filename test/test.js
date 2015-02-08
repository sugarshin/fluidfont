// .reszie()
describe('.reszie()', function() {
  return it('フォントがリサイズされること', function() {
    var ff = new FluidFont;
    var oldSize = $('body').css('font-size');
    ff.resize(1024);
    var newSize = $('body').css('font-size');
    assert(oldSize !== newSize);
  });
});

// .addEvent()

// .rmEvent()