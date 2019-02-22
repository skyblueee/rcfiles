{:toc}

# Introduction

This is the rcfiles of my `bash` and `vim`. It contains some comfortable settings for them. See the Usage section for detail.

*NOTE*: It only supply settings, not including the softwares (e.g. ranger/pycharm) or plugins (e.g. NERDTree/YCM). You should be able to install them by yourself.

# Usage
## Bash
### Easy Chinese Completion
Just use the first letter of a Chinese character to represent it. For example, if you want to change the working directory to `桌面` in current directory, input `cd zm` and press `<TAB>` then you will get it. To edit a file named `日记.txt`, type `vim rj` and press `<TAB>`. Tab completion is supported.
### Ranger CD (*ranger* installed required)
Press `<Ctrl-o>` to open ranger, and press `q` to leave you in the proper directory.
### j (autojmp installed required)

## Vim
### System
* `<leader>y/p` to yank and paste to/from system in normal/visual mode.
* `<C-;>` to paste from system. (Linux Only, not provided by vim.)

### Window navigation
1. `<leader><TAB>` to navigate among windows.
2. `-` and select.
3. `<leader><leader>a` in *vim-easymotion*.

### Buffer navigation
*vim-xtabline* shows buffer numbers in a tabline.
1. `<TAB>/<S-TAB>` to navigate among buffers.
2. `<num><BS>` to go to buffer<num>.
3. `<BS>` to switch between recent 2 buffers.

### 快速移动
*vim-easymotion*
* `<leader><leader>f/F/s` for characters.
* `<leader><leader>w/W/b/B/e/E` for words.
* `<leader><leader>j/k` for lines.
* `<leader><leader>a` 可以跨窗口移动.

*vim-sneak*
* `f` 后输入1个字符进行查找移动。
* `s` 后输入2个字符进行查找移动。
* `;/,` 用于向前向后移动。
* 开启了label-mode，移动过程中可以输入label快速移动（类似于easymotion）。

### Insert motion
* `<C-h/l/j>` to move quickly in insert mode.

### Quick filesystem navigation
*NERDTree* is used to navigate in filesystem.
* `<leader>F` to open/close NERDTree.
* `o` to open a directory/file.
* `A` to zoom in/out.
* `:Bookmark` to add a bookmark.
* `?` for more help.
* `q` to quit.

*fzf.vim* is used to search and open files/buffers.
* `<leader>f` to find files.
* `<leader>l` to find lines in current buffer.
* `<leader>/` to find contents in current project.

`<leader>r` to use ranger.

### Completion
#### Identifer Completion
*YCM*, *cmp*, *UltiSnips* and *vim-snippets* are used for auto-completion in C-family and python files.
* just type to get hints and use `<TAB>`, `<C-p>`, `<C-n>` to circle among them.
* use `<C-o>` to open a snip, and `<C-j>`, `<C-k>` to navigate in it.

#### Pairs Completion
*auto-pairs* is used for complete about paires (paretheses and quotations).  When you inside `()`/`[]`/`{}`/`''`/`""`, press the latter part to go out, and when you delete the former part you also delete the latter one.

Use `<C-l>`/`<C-j>` in insert mode to move quickly right out of paires.

### Dictionary/Pydoc
* `K` to get python docstrings (supplied by *pydoc.vim*) in python files.
* `<C-K>` to get translation (*sdcv* required). `q` to quit.

### Go through a project
#### QuickMenu
<F12> to pop a menu to search/move/YCM/make/git in the project.
* `<leader>f` to search files.
* `<leader>l` to search lines in current buffer.
* `<leader>a` to search contents.
* select certain item in the menu for others.

### Syntax check
*YCM* (C-family) and *ale* (python) can check the syntax, then give signs and location-list automaticly.
* `<leader>j/k` to navigate among the list.
* `:lopen [height]` opens the location-list.

### Tabularize
*tabular* is used to tabularize something.

Select lines and `:Tabularize /=` ('=' can be replaced by [-|%] and stuff).

### Quick selection
* `v`,`vv`,`vvv` from *vim-expand-region*
* `v` and use *vim-easymotion*/*vim-sneak*
* text object in *targets.vim*/*vim-textobj*:
    * i( i) ib i[ i] it i{ i} iB i< i>
    * a( a) ab a[ a] at a{ a} aB a< a>
    * I( I) Ib I[ I] It I{ I} IB I< I>
    * A( A) Ab A[ A] At A{ A} AB A< A>
    * [count][iaIA][ln][()b[]t{}B<>]
    * [count][iaI][ln]['"`]
    * [count][iaIA][ln][, . ; : + - = ~ _ * # / | \ & $ ~]
    * if, af, ic, ac, id, ad
    * ii, ai

### Surrounding
1. select `word` and use `S<space><space>` to get ` word `.
1. select `word` and use `S<space>'` to get `' word '`.
1. select `word` and use `S'` to get `'word'`.
1. select `word` and use `S(` to get `( word )`.
1. select `word` and use `S)` to get `(word)`.
1. use 'cs' to change and 'ds' to delete.

### Markdown
*mathjax-support-for-mkdp* and *markdown-preview.vim* is used to preview markdown files in your browser. `:MarkdownPreview` to open it. It will auto update while you are typing.
