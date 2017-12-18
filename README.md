# Introduction
This is the rcfiles of my `bash` and `vim`. It contains some comfortable settings for them. See the Usage section for detail.

*NOTE*: It only supply settings, not including the softwares (e.g. ranger/pycharm) or plugins (e.g. NERDTree/YCM). You should be able to install them by yourself.

# Install
```bash
$cd
$git clone http://github.com/skyblueee/rcfiles.git
$./install.sh
```
Open vim and `:PluginInstall` or `:PluginUpdate` (Vundle should has been ready in your vim).

# Usage
## Bash
### Easy Chinese Completion
Just use the first letter of a Chinese character to represent it. For example, if you want to change the working directory to `桌面` in current directory, input `cd zm` and press `<TAB>` then you will get it. To edit a file named `日记.txt`, type `vim rj` and press `<TAB>`. Tab completion is supported.
### Ranger CD (*ranger* installed required)
Press `<Ctrl-o>` to open ranger, and press `q` to leave you in the proper directory.

## Vim
### Window navigation
* `<C-h>`/`<C-l>` to navigate left/right among windows.
* `<C-*arrow*>` to navigate up/down/left/right among windows.
### Buffer navigation
*vim-bufferline* is used to show buffer numbers in the status bar. Use `:b<num>` to navigate among buffers.
### Easy motion
*vim-easymotion* is used to move very quikly and pricisely.
* `<leader><leader>f/F/s` for characters.
* `<leader><leader>w/W/b/B/e/E` for words.
* `<leader><leader>j/k` for lines.
`mm` to mark the current line, and `<F2>` to toggle among the hilighted marks (supplied by *visualmarks*).
### Quick filesystem navigation
*NERDTree* is used to navigate in filesystem.
* `<leader>f` to open/close NERDTree.
* `o` to open a directory/file.
* `A` to zoom in/out.
* `:Bookmark` to add a bookmark.
* `?` for more help.
* `q` to quit.
*CtrlP* is used to search and open files.
* `<C-p>` and type sth, `<C-j>` and `<C-k>` to navigate and `<Enter>` to open.
* `<C-z>` to mark/unmark a file and `<C-o>` to open marked ones.
* `<C-n>` and `<C-p>` to browse input history.
* `<C-d>` to toggle between full-path/filename-only mode.
* `<C-r>` to toggle between string/regexp mode.
* `<C-f>` and `<C-b>` to find MRU mode.
* `<ESC>` to quit.
`<leader>r` to use ranger.
### Completion
#### Identifer Completion
*YCM*, *UltiSnips* and *vim-snippets* are used for auto-completion in C-family and python files.
* just type to get hints and use `<TAB>`, `<C-y>`, `<C-n>` to circle among them.
* use `<C-o>` to open a snip, and `<C-j>`, `<C-k>` to navigate in it.
#### Pairs Completion
*auto-pairs* is used for complete about paires (paretheses and quotations).  When you inside `()`/`[]`/`{}`/`''`/`""`, press the latter part to go out, and when you delete the former part you also delete the latter one.
### Dictionary/Pydoc
* `K` to get python docstrings (supplied by *pydoc.vim*) in python files.
* `<C-K>` to get translation (*sdcv* required).
### Shell buffer
*Conque-Shell* is used to get a shell buffer. `<leader>s` to get it.
### Go through a project
#### YCM
*YCM* can do many of them (differ according to filetypes). `:YcmCompleter` gives a list of the commands you can call for the current completer.
* GoTo
    * `:YcmCompleter GoTo` or `<C-]` performs the most sensible GoTo operation. GoToDefinition -> GoToDeclaration -> GoToInclude.
    * `:YcmCompleter GoToReferences` finds all the references and populates a quickfix list.
* Get
    * `:YcmCompleter GetType` echos the type of the variable or method, and where it differs, the derived type.
    * `:YcmCompleter GetParent` echos the semantic parent.
    * `:YcmCompleter GetDoc` displays type or declaration / Doxygen or javadoc / Python docstrings / etc.
* FixIt
    * `:YcmCompleter FixIt` makes changes to correct diagnostics on the buffer line.
* RefactorRename (now JavaScript only)
    * `:YcmCompleter RefactorRename <new_name>` performs a semantic rename in involved file*s*.
#### Ack
*ack.vim* is to search certain patterns in a file or directory.
* `:Ack[!] [options] [{pattern}] [{directory}]` to get a list.
* `:AckHelp[!] [options] {pattern}` to search the vim doc files.
* `-i` to ignore case, and `-w` to search whole word.
* `o` to go to the match.
* `q` to quit.
#### Tagbar
*Tagbar* is to preview and jump to tags. (Maybe you will like to mark current line for coming back)
* `:Tagbar` to open it, `q` to quit(also the preview window), `?` for detail help.
* `o` to toggle fold, `x` to zoom in/out.
* `/` to search, `<Space>` to show prototype, `P` to preview, `p`/`<Enter>` to jump to definition.
### Syntax check
*YCM* (C-family) and *Syntastic* (python) can check the syntax, then give signs and location-list automaticly.
* `:lopen [height]` opens the location-list.
### Debug
#### Vdebug
*Vdebug* is used to debug python files. Get a better debugging time while using it with *terminator*. I also remap the keys to be similar with Pycharm.
* `<C-F5>` to start a debugging server, `<S-F5>` to end.
* `<F2>` to toggle a line breakpoint.
* `<F8>` to step over, `<F7>` to step into, and `<C-F7>` to step out.
* `<C-F9>` to eval under cursor, `<leader>e` to eval visual.
* `<F4>` to run to cursor.
* `:VdebugTrace <expr>` to trace an expression.
* `:Breakpoint condition <expr>` to add a conditional breakpoint.
* `:BreakpointWindow` to toggle the BreakpointWindow.
* `:BreakpointRemove <id>` to delete a breakpoint.
* `pydbgp -d localhost:9000 file.py` to connect the server and begin debugging.
### Tabularize
*tabular* is used to tabularize something. Select lines and `:Tabularize /=/` ('=' can be replaced by [-|%] and stuff).
### Markdown
*Previm* is used to preview markdown files in your browser. `:PrevimOpen` to open it. It will auto update while you are typing.
