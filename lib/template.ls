require! {
  \jade
  \fs
}

module.exports = (opts, data) ->
  { template, out-file } = opts

  data = data || opts.data
  unless data then throw 'Empty template data'

  compile = jade.compile-file template

  html = compile data

  fs.write-file out-file, html, (err) ->
    if err then throw err
    console.log 'Wrote',html.length,'bytes to', out-file
