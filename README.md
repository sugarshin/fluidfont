# fluidfont

[![Build Status](https://travis-ci.org/sugarshin/fluidfont.svg?branch=master)](https://travis-ci.org/sugarshin/fluidfont) [![Coverage Status](https://coveralls.io/repos/sugarshin/fluidfont/badge.svg)](https://coveralls.io/r/sugarshin/fluidfont) [![GitHub version](https://badge.fury.io/gh/sugarshin%2Ffluidfont.svg)](http://badge.fury.io/gh/sugarshin%2Ffluidfont) [![License](http://img.shields.io/:license-mit-blue.svg)](http://sugarshin.mit-license.org/)

FluidFont

small library for Responsive font size

```shell
npm i -S fluidfont
```

## Usage

```coffeescript
FluidFont = require 'fluidfont'

ff = new FluidFont
```

or

```html
<script src="jquery.js"></script>
<script src="throttle-debounce.js"></script>
<script src="fluidfont.js"></script>
<script>
  var ff = new FluidFont;
</script>
```

## Config

options

```coffeescript
_defaults:
  target: 'body'
  baseWidth: 640
  baseSize: '1em'
  delay: 400
  delayType: 'debounce'# or 'throttle'
```

## api

### `ff.resize(width)`

Resize font

### `ff.unbind()`

Unbind from resize event of window

## Contributing

[CoffeeScript](//coffeescript.org/)

[Browserify](//browserify.org/)

[Mocha](//mochajs.org/)

[power-assert](//github.com/twada/power-assert)

```shell
npm test
```

## License

[MIT](http://sugarshin.mit-license.org/)

© sugarshin
