assert = require 'power-assert'
builder = require 'botbuilder'
loadScripts = require '../index'

describe "main", ->

  if global.mocha
    global.mocha.globals ['*']

  it "can be return bot", (done) ->
    bot = new builder.TextBot()
    assert bot is loadScripts bot
    done()

  it "can be add load method", (done) ->
    bot = loadScripts new builder.TextBot()
    assert bot.load
    done()

  it "can be load", (done) ->
    bot = loadScripts new builder.TextBot()
    bot.add('/', new builder.CommandDialog())
    bot.load('./test/scripts')
    assert bot.getDialog('/').commands[0].expressions[0].test('bye')
    assert bot.getDialog('/').commands[1].expressions[0].test('hello')
    done()
