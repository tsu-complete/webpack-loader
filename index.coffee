

fs = require "fs"
utils = require "loader-utils"

module.exports = ( name, defaults, loader ) ->

  cache = null

  ( input ) ->
    @cacheable?()
    callback = do @async

    unless cache?
      cache = defaults
      for k, v of utils.parseQuery @query
        cache[k] = v
      for k, v of @options[name]
        cache[k] = v
      if cache.config and fs.existSync cache.config
        for k, v of JSON.parse fs.readFileSync cache.config
          cache[k] = v

    Promise.resolve loader.call this, input, options
      .then ( data ) -> callback null, data
      .catch callback

    undefined

