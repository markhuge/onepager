require! {
  \remarkable
  'highlight.js': hl
  './template'
}

module.exports = (opts, data) ->
  unless data then throw 'No markdown data to parse'

  md = null

  { syntax, pkg-file } = opts

  if syntax
    md = new remarkable(\full,{
      html: true
      linkify: true

      highlight: (str, lang) ->
        if lang && hl.get-language lang
          try
            return hl.highlight(lang,str).value
          catch then throw e

        try
          return hl.highlight-auto(str).value
        catch then throw e
    })

  else
    md = new remarkable({
      html: true
      linkify: true
    })

  info = require pkg-file
  info.docs = md.render data
  template opts, info
