module.exports = (bot) ->
  bot.getDialog '/'
    .matches 'bye', (session) -> session.send 'bye'
