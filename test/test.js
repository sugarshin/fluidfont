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
describe('.addEvent()', function() {
  return it('windowのresizeイベントにバインドされること', function() {
    var ff = new FluidFont;
    var resizeEvents = $._data($(window)[0], 'events').resize;
    var ev;
    for (var i = 0, l = resizeEvents.length; i < l; i++) {
      if (resizeEvents[i].namespace === 'fluidfont') {
        ev = resizeEvents[i];
      }
    }
    assert(typeof ev.handler === 'function');
  });
});

// .rmEvent()
describe('.rmEvent()', function() {
  return it('windowのresizeイベントからイベントハンドラが削除されること', function() {
    var ff = new FluidFont;
    var ev;
    $(window).on('resize.test', function() {console.log('resize.test');});
    ff.rmEvent();
    var resizeEvents = $._data($(window)[0], 'events').resize;
    assert((function() {
      for (var i = 0, l = resizeEvents.length; i < l; i++) {
        if (resizeEvents[i].namespace === 'fluidfont') {
          return false;
        }
      }
      return true;
    })());
  });
});
