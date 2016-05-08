assert = require 'power-assert'
builder = require 'botbuilder'
loadScripts = require '../src/main'

describe "main", ->

  if global.mocha then global.mocha.globals ['*']

  it "can be return bot", (done) ->
    bot = new builder.TextBot()
    assert bot is loadScripts bot
    done()

  it "can be add load method", (done) ->
    bot = loadScripts new builder.TextBot()
    assert bot.load
    assert bot.loadFile
    assert bot.loadScript
    done()

  it "can be load", (done) ->
    bot = loadScripts new builder.TextBot()
    bot.add '/', new builder.CommandDialog()
    bot.load './test/scripts'
    dialog = bot.getDialog '/'
    assert dialog.commands[0].expressions[0].test 'bye'
    assert dialog.commands[1].expressions[0].test 'hello'
    done()

  it "can be load file", (done) ->
    bot = loadScripts new builder.TextBot()
    bot.add '/', new builder.CommandDialog()
    bot.loadFile './test/scripts', 'bye.coffee'
    bot.loadFile './test/scripts', 'hello.js'
    dialog = bot.getDialog '/'
    assert dialog.commands[0].expressions[0].test 'bye'
    assert dialog.commands[1].expressions[0].test 'hello'
    done()

  it "can be load script", (done) ->
    bot = loadScripts new builder.TextBot()
    bot.add '/', new builder.CommandDialog()
    bot.loadScript (bot) ->
      dialog = bot.getDialog('/')
      dialog.matches 'hello', (session) -> session.send 'hello'
    dialog = bot.getDialog '/'
    assert dialog.commands[0].expressions[0].test 'hello'
    done()
