Path = require 'path'
Fs = require 'fs'

module.exports = (bot) ->

  load = (path) ->
    console.log "Loading scripts from #{path}"
    Fs.readdirSync path
      .sort()
      .forEach (file) -> loadFile path, file

  loadFile = (path, file) ->
    ext = Path.extname file
    if require.extensions[ext]
      full = Path.join path, Path.basename file, ext
      absfull = Path.resolve full
      script = require absfull
      loadScript script

  loadScript = (script) ->
    if typeof script is 'function'
      script bot

  bot.load = ->
    load.apply bot, arguments

  bot.loadFile = ->
    loadFile.apply bot, arguments

  bot.loadScript = ->
    loadScript.apply bot, arguments

  bot
