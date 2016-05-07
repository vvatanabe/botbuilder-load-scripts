module.exports = function(bot) {
  var dialog = bot.getDialog('/')
  dialog.matches('bye', function(session) {
    session.send('bye')
  })
}
