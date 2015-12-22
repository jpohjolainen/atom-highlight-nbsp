# Ref: https://github.com/possan/sublime_unicode_nbsp/blob/master/sublime_unicode_nbsp.py

chars = [
  '\x82', # High code comma
  '\x84', # High code double comma
  '\x85', # Tripple dot
  '\x88', # High carat
  '\x91', # Forward single quote
  '\x92', # Reverse single quote
  '\x93', # Forward double quote
  '\x94', # Reverse double quote
  '\x95', # <control> Message Waiting
  '\x96', # High hyphen
  '\x97', # Double hyphen
  '\x99', # <control>
  '\xA0', # No-break space
  '\xA6', # Split vertical bar
  '\xAB', # Double less than
  '\xBB', # Double greater than
  '\xBC', # one quarter
  '\xBD', # one half
  '\xBE', # three quarters
  '\xBF', # c-single quote
  '\xA8', # modifier - under curve
  '\xB1'  # modifier - under line
]

charRegExp = '[' + chars.join('|') + ']'

module.exports = HighlightNbsp =

  activate: (state) ->
    @decorations = []
    badchars = new RegExp(charRegExp, 'g')

    console.log 'highlight-badchars activate.'
    atom.workspace.observeTextEditors (editor) =>
      editor.onDidStopChanging =>
        d.getMarker().destroy() for d in @decorations
        @decorations = []

        editor.scan badchars, (obj) =>
          mark = editor.markBufferRange(obj.range, {persistent: false})
          @decorations.push editor.decorateMarker mark, {type: 'highlight', class: 'highlight-bad-chars'}
