module.exports = HighlightNbsp =

  activate: (state) ->
    @decorations = []
    nbsp = new RegExp('\u00A0', 'g')

    console.log 'highlight-nbsp activate.'
    atom.workspace.observeTextEditors (editor) =>
      editor.onDidStopChanging =>
        d.getMarker().destroy() for d in @decorations
        @decorations = []

        editor.scan nbsp, (obj) =>
          mark = editor.markBufferRange(obj.range, {persistent: false})
          @decorations.push editor.decorateMarker mark, {type: 'highlight', class: 'highlight-nbsp'}
