require! {
  \fs
  \jade
  'strip-email': strip
  './lib/parse-opts': parse-opts
  './lib/template': template
  './lib/markdown': markdown
  'parse-github-repo-url': repo
}

module.exports = (opts) ->
  opts        = parse-opts opts
  { parse-doc, pkg-file, out-file, doc-file, css-file, syntax } = opts

  info        = require pkg-file
  info.google = opts.google
  info.author = strip info.author
  parse-repo = repo info.repository.url
  info.repo   =
    user: parse-repo[0]
    repo: parse-repo[1]

  info.css = fs.read-file-sync(css-file, encoding: 'utf-8')

  # Parse README
  if parse-doc && doc-file

    fs.read-file doc-file, encoding: 'utf-8', (err, data) ->

      if err then throw err
      markdown opts, data

  else
    template opts, info
