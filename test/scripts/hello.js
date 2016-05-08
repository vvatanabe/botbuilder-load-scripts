module.exports = function(bot) {
  var dialog = bot.getDialog('/')
  dialog.matches('hello', session => {
    session.send('hello')
  })
}
