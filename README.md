# Introduction
This is the rcfiles of my `bash` and `vim`. It contains some comfortable settings for them. See the Usage section for detail.

*NOTE*: It only supply settings, not including the softwares (e.g. ranger/pycharm) or plugins (e.g. NERDTree/YCM). You should be able to install them by yourself.

# Usage
## Bash
### Easy Chinese Completion
Just use the first letter of a Chinese character to represent it. For example, if you want to change the working directory to `桌面` in current directory, input `cd zm` and press `<TAB>` then you will get it. To edit a file named `日记.txt`, type `vim rj` and press `<TAB>`. Tab completion is supported.
### Ranger CD (*ranger* installed required)
Press `<Ctrl-o>` to open ranger, and press `q` to leave you in the proper directory.

## Vim
### System
* `<leader>y/p` to yank and paste to/from system in normal mode.
* `<C-;>` to paste from system. (Linux Only, not provided by vim.)

### Window navigation
* `<C-h>`/`<C-l>` to navigate left/right among windows.
* `<C-w>j/k/h/l` or `<C-*arrow*>` to navigate among windows.
* `<leader><leader>a` in *vim-easymotion*.

### Buffer navigation
*vim-airline* shows buffer numbers in a tabline.

1. `<TAB>` to navigate among buffers.
1. `<leader><num>` or `:b<num><CR>` to go to buffer<num>.

### Easy motion
*vim-easymotion* is used to move very quikly and pricisely.
* `<leader><leader>f/F/s` for characters.
* `<leader><leader>w/W/b/B/e/E` for words.
* `<leader><leader>j/k` for lines.
* `<leader><leader>a` for over window motion.

`mm` to mark the current line, and `<F2>` to toggle among the hilighted marks (supplied by *visualmarks*).
Todo: conflict with cursorline and gitgutter.

### Insert motion
* `<C-j/k/l>` to move quickly in insert mode.

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

Use `<C-l>` in insert mode to move quickly right out of paires.

### Dictionary/Pydoc
* `K` to get python docstrings (supplied by *pydoc.vim*) in python files.
* `<C-K>` to get translation (*sdcv* required). `q` to quit.

### Shell buffer
*Conque-Shell* is used to get a shell buffer.

`<leader>sh` to get it.

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
*YCM* (C-family) and *ale* (python) can check the syntax, then give signs and location-list automaticly.
* `<leader>j/k` to navigate among the list.
* `:lopen [height]` opens the location-list.

### Debug
####
Use *q* to debug python files. (For an IDE, use Pycharm)

Install q with `pip install -U q`.

All output goes to /tmp/q, which you can watch with `tail -f /tmp/q`.

If _$TMPDIR_ is set, the output goes to _$TMPDIR/q_.
Note: Some alternatives to the TMPDIR variable are TEMP, TEMPDIR and TMP

1. To print the value of foo, insert this into your program:
    ```python
    import q; q(foo)
    ```
1. To print the value of something in the middle of an expression, insert
"q()", "q/", or "q|".  For example, given this statement:
    ```python
    file.write(prefix + (sep or '').join(items))
    ```
    ... you can print out various values without using any temporary variables:
    ```python
    file.write(prefix + q(sep or '').join(items))  # prints (sep or '')
    file.write(q/prefix + (sep or '').join(items))  # prints prefix
    file.write(q|prefix + (sep or '').join(items))  # prints the arg to write
    ```
1. To trace a function's arguments and return value, insert this above the def:
    ```python
    import q
    @q
    ```
1. To start an interactive console at any point in your code, call q.d():

    ```python
    import q; q.d()
    ```

The following [Lightning Talk](http://pyvideo.org/video/1858/sunday-evening-lightning-talks#t=25m15s)
shows how powerful using q can be.

### Tabularize
*tabular* is used to tabularize something.

Select lines and `:Tabularize /=/` ('=' can be replaced by [-|%] and stuff).

### Quick selection
* `v`,`vv`,`vvv` from *vim-expand-region*
* `v` and use *vim-easymotion*

### Markdown
*Previm* is used to preview markdown files in your browser. `:PrevimOpen` to open it. It will auto update while you are typing.
