
webpack-loader
===

About
---

Handles loader option packing (order of import)

- Takes from query
- Takes from object passed to options
- Takes from file (if specified in previous two ways)

Usage
---

```coffee
loader = require "webpack-loader"

defaults =
  config: ".configrc"
  option1: true
  option2: false

module.exports = loader defaults, ( input, options ) ->
  # code here...
  # --or--
  new Promise ( accept, reject ) ->
    # code here...
```

