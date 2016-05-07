module.exports = function(bot) {
  var dialog = bot.getDialog('/')
  dialog.matches('hello', function(session) {
    session.send('hello')
  })
}
