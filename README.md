# botbuilder-load-scripts

Load modularized botbuilder dialog scripts.


[![Build Status](https://travis-ci.org/vvatanabe/botbuilder-load-scripts.svg?branch=master)](https://travis-ci.org/vvatanabe/botbuilder-load-scripts)
[![Coverage Status](https://coveralls.io/repos/github/vvatanabe/botbuilder-load-scripts/badge.svg?branch=master)](https://coveralls.io/github/vvatanabe/botbuilder-load-scripts?branch=master)
[![npm version](https://badge.fury.io/js/botbuilder-load-scripts.svg)](https://badge.fury.io/js/botbuilder-load-scripts)

## Usage

##### ./scripts/hello.js:
``` javascript
'use strict'
module.exports = bot => {
  bot.getDialog('/').matches('hello', session => {
		session.send('hello')
  })
}
```

##### ./scripts/bye.js
``` javascript
'use strict'
module.exports = bot => {
  bot.getDialog('/').matches('bye', session => {
		session.send('bye')
  })
}
```

##### ./greet-bot.js:
``` javascript
'use strict'

const builder = require('botbuilder')

// Add load functions
const bot = require('botbuilder-load-scripts')(new builder.TextBot())

bot.add('/', new builder.CommandDialog())

// load directory
bot.load('./scripts')

// load file
bot.loadFile('./scripts', 'hello,js')

// load script
bot.loadScript(bot => {
  bot.getDialog('/').matches('bye', session => {
		session.send('bye')
  })
})

bot.listen()
```

## Install

With [npm](http://npmjs.org) do:

``` sh
$ npm install botbuilder-load-scripts --save
```

## License

MIT
