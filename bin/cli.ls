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

if typeof argv.c == \boolean || typeof argv.css == \boolean
  console.error 'Missing css FILE: -c|--css /path/to/css/file'
  process.exit 1

if typeof argv.o == \boolean || typeof argv.output == \boolean
  console.error 'Missing output FILE: -o|--output /path/to/output/file'
  process.exit 1

if typeof argv.t == \boolean || typeof argv.template == \boolean
  console.error 'Missing template FILE: -t|--template /path/to/template/file'
  process.exit 1

if typeof argv.pkg == \boolean
  console.error 'Missing package FILE: --pkg /path/to/package/file'
  process.exit 1

if typeof argv.doc == \boolean
  console.error 'Missing doc FILE: --doc /path/to/doc/file'
  process.exit 1


require('../')(argv);
