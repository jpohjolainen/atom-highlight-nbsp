HighlightBadChars = require '../lib/highlight-bad-chars'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "HighlightBadChars", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('highlight-bad-chars')

  describe "when the highlight-bad-chars:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
