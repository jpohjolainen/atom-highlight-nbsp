
chars = [
  # https://github.com/possan/sublime_unicode_nbsp/blob/master/sublime_unicode_nbsp.py
  '\x82', # Break Permitted Here [high code comma]
  '\x84', # Control 0084 [high code double comma]
  '\x85', # Next Line (Nel) [tripple dot]
  '\x88', # Character Tabulation Set [high caret]
  '\x91', # Private Use One [forward single quote]
  '\x92', # Private Use Two [reverse single quote]
  '\x93', # Set Transmit State [forward double quote]
  '\x94', # Cancel Character [reverse double quote]
  '\x95', # Message Waiting [middle dot]
  '\x96', # Start Of Guarded Area [high hyphen]
  '\x97', # End Of Guarded Area [double hyphen]
  '\x99', # Control 0099 [TM]
  '\xA0', # No-break space
  '\xBC', # Vulgar Fraction One Quarter
  '\xBD', # Vulgar Fraction One Half
  '\xBE', # Vulgar Fraction Three Quarters
  # '\xA6', # Broken Bar [split vertical bar]
  # '\xAB', # Left-Pointing Double Angle Quotation Mark
  # '\xBB', # Right-Pointing Double Angle Quotation Mark
  # '\xBF', # Inverted Question Mark
  # '\xA8', # Diaeresis [high double dot]
  # '\xB1', # Plus-minus Sign

  # https://www.cs.tut.fi/~jkorpela/chars/spaces.html
  #'\u00A0', # no-break space
  '\u1680', # ogham space mark
  '\u180E', # mongolian vowel separator
  '\u2000', # en quad
  '\u2001', # em quad
  '\u2002', # en space
  '\u2003', # em space
  '\u2004', # three-per-em space
  '\u2005', # four-per-em space
  '\u2006', # six-per-em space
  '\u2007', # figure space
  '\u2008', # punctuation space
  '\u2009', # thin space
  '\u200A', # hair space
  '\u200B', # zero width space
  '\u200D', # zero width joiner
  '\u2013',  # en dash
  '\u2014',  # em dash
  '\u2028',  # line separator space
  '\u202F', # narrow no-break space
  '\u205F', # medium mathematical space
  '\u3000', # ideographic space
  '\uFEFF', # zero width no-break space

  # others
  '\u037E',  # greek question mark
  '\u0000',  # <control>
  '\u0011',  # <control>
  '\u0012',  # <control>
  '\u0013',  # <control>
  '\u0014',  # <control>
  '\u001B',  # <control>
  '\u0080',  # <control>
  '\u0090',  # <control>
  '\u009B',  # <control>
  '\u009F',  # <control>
  '\u00B8',  # cadilla
  '\u01C0',  # latin letter dental click
  '\u2223',  # divides
  '\u0003',  # Start of text
  '\u201A',  # Low quotation mark - looks like comma
  '\u02C2',  # modifier letter left arrowhead (< doppelganger)
  '\u02C3',  # modifier letter right arrowhead (> doppelganger)
]

charRegExp = '[' + chars.join('') + ']'

module.exports = HighlightBadChars =

  activate: (state) ->
    @decorations = []
    badchars = new RegExp(charRegExp, 'g')

    console.log 'highlight-bad-chars activate.'
    atom.workspace.observeTextEditors (editor) =>
      editor.onDidChange =>
        d.getMarker().destroy() for d in @decorations
        @decorations = []

        editor.scan badchars, (obj) =>
          mark = editor.markBufferRange(obj.range)
          @decorations.push editor.decorateMarker mark, {type: 'highlight', class: 'highlight-bad-chars'}
