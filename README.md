# fluidfont

[![Build Status](https://travis-ci.org/sugarshin/fluidfont.svg?branch=master)](https://travis-ci.org/sugarshin/fluidfont) [![Coverage Status](https://coveralls.io/repos/sugarshin/fluidfont/badge.svg)](https://coveralls.io/r/sugarshin/fluidfont) [![GitHub version](https://badge.fury.io/gh/sugarshin%2Ffluidfont.svg)](http://badge.fury.io/gh/sugarshin%2Ffluidfont) [![License](http://img.shields.io/:license-mit-blue.svg)](http://sugarshin.mit-license.org/)

FluidFont

small library for responsive font

```shell
npm i fluidfont
```

## Usage

```coffeescript
FluidFont = require 'fluidfont'

new FluidFont opts
```

or

```html
<script src="fluidfont.js"></script>
<script>
  new FluidFont(opts);
</script>
```

[View on RequireBin](http://requirebin.com/?gist=6baa13534c3ce7bf34f2)

[![view on requirebin](http://requirebin.com/badge.png)](http://requirebin.com/?gist=6baa13534c3ce7bf34f2)

## Config

default options

```javascript
var options = {
  target: document.body, // DOM Element
  baseWidth: 640, // Integer
  baseSize: '1em', // String, CSS font-size value
  delay: 300, // Integer
  delayType: 'debounce', // String, 'debounce' or 'throttle'
  afterResize: function() {}, // Function
  beforeResize: function() {} // Function
};
```

## api

### `ff.resize(width)`

Resize font

### `ff.off()`

Unbind from resize event of window

*Alias:* `ff.unbind()`, `ff.rmEvent()`

### `ff.on()`

Re add resize event of window

*Alias:* `ff.events()`, `ff.addEvent()`

## Contributing

deps

* bean
* debounce
* throttleit

dev deps

* browserify
* coffee-script
* coffeeify
* derequire
* espower-coffee
* jsdom
* mocha
* power-assert
* uglify-js

```shell
npm test
```

**Incomplete is test**

## License

[MIT](http://sugarshin.mit-license.org/)

© sugarshin
