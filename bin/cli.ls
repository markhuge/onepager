require! '../package.json': info

log = console.log
argv = require('minimist')(process.argv.slice(2))

if argv.h then
  log '\n\n' + info.name, \v + info.version
  log 'Usage:', Object.keys(info.bin)[0], '[OPTION...]\n\n'
  log info.description, '\nOptions:\n'
  log '  -o, --output FILE    write output to FILE'
  log '  -s, --highlight      enable syntax highlighting'
  log '  -c, --css FILE       use your own css file for styling'
  log '  -d                   parse a markdown document file (default: README.md)'
  log '      --doc FILE       use a file other than README.md for docs'
  log '  -t, --template FILE  specify your own jade template FILE'
  log '      --pkg FILE       specify an alternative package.json'
  process.exit 0



require('../')(argv);
