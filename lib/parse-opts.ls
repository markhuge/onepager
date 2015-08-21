cwd = (str) ->
  process.cwd! + str

module.exports = (opts) ->
  opts     = opts || {}
  opts.css-file  = opts.css || __dirname + '/../assets/default.css'
  opts.doc-file  = opts.doc || cwd '/README.md'
  opts.pkg-file  = opts.pkg || cwd '/package.json'
  opts.out-file  = opts.o   || opts.output || cwd '/index.html'
  opts.syntax    = opts.s   || opts.highlight || false
  opts.parse-doc = opts.d   || opts.'parse-readme' || false
  opts.template  = opts.t   || opts.template || __dirname + '/../assets/default.jade'
  opts.google    = opts.ga

  opts

