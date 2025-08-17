---
title: Cursor Editor
description: How to deal with Cursor editor?
---

## [Multiple selections (multi-cursor)](https://code.visualstudio.com/docs/editing/codebasics#_multiple-selections-multicursor)

- It is `ctrl+shift+up` and `ctrl+shift+down` by default.
- To change it, go to the `Keyboard Shortcuts`
- Find `Add Cursor Above` and `Add Cursor Below`
- To add new `User` keybinding, open command prompt and search `Open Keyboard Shortcuts` or `Open Keyboard Shortcuts (JSON)` for manual edit
    - For the first (with UI), you should find `Add Cursor Below` and right click on it and click on `Add Keybinding...` and then type the keys you want to set for the keybinding
    - For the second (JSON), you can click on `Define Keybinding` button at the bottom left and then go ahead. Note that the command is `editor.action.insertCursorBelow`
