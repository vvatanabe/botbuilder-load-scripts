var Path = require('path')
var Fs = require('fs')

module.exports = function(bot) {
  var load = function(path) {
    Fs.readdirSync(path).sort()
      .filter(fn => fn.lastIndexOf('.js') === fn.length - 3)
      .forEach(fn => {
        var ext = Path.extname(fn)
        var full = Path.resolve(Path.join(path, Path.basename(fn, ext)))
        require(full)(this)
      })
  }
  bot.load = function() { return load.apply(bot, arguments) }
  return bot
}
