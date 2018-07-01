set nocompatible

"==|vim-plug|====================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('win32') || has('win64')
    call plug#begin('~/vimfiles/bundle')
else
    call plug#begin('~/.vim/bundle')
endif
"---------------------------------------
Plug 'junegunn/vim-plug'
"---------------------------------------fast move/select
Plug 'Shougo/denite.nvim', {'for': ''}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'  " <leader>fla for file/line/ag
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'easymotion/vim-easymotion' " <leader><leader>swafFjk
Plug 'justinmk/vim-sneak'  " fxx
Plug 'terryma/vim-expand-region' " v vv vvv
Plug 'tpope/vim-surround'  "ds/cs
Plug 'junegunn/vim-peekaboo'
Plug 'skyblueee/visualmarks' " press mm to mark and F2 to circle them
"---------------------------------------补全
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets', {'for': ['python', 'c', 'cpp', 'sh']}
Plug 'SirVer/ultisnips', {'for': ['python', 'c', 'cpp', 'sh']}  " must before CompleteParameter.vim
Plug 'Valloric/YouCompleteMe', {'for': ['python', 'c', 'cpp'], 'do': './install.py --clang-completer'}
Plug 'tenfyzhong/CompleteParameter.vim'
"---------------------------------------文本对象
Plug 'wellle/targets.vim'  " i) a, i', i*, a_, a$
Plug 'kana/vim-textobj-user'  " Create your own text objects, required by the followings.
Plug 'kana/vim-textobj-function', {'for': ['c', 'cpp', 'vim', 'java']}  " aF if
Plug 'kana/vim-textobj-indent', {'for': ['python']}  " ai ii
Plug 'jeetsukumaran/vim-pythonsense', {'for': ['python']}  " af, if, ac, ic, ad, id, [[, ]], ]m, [m
"---------------------------------------语法
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags', {'for': ['python', 'c', 'cpp']}
Plug 'skywind3000/asyncrun.vim', {'for': ['python', 'c', 'cpp']}
Plug 'fs111/pydoc.vim', {'for': 'python'}  " just press K(or <leader>pw) in python files
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'metakirby5/codi.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"---------------------------------------
Plug 'vimwiki/vimwiki', {'for': 'wiki'}
Plug 'iamcco/mathjax-support-for-mkdp', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}  " MarkdownPreview
"Plug 'vim-latex/vim-latex', {'for': 'tex'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
"---------------------------------------UI
Plug 'liuchengxu/space-vim-dark'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Yggdroot/indentLine'
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
Plug 'Shougo/echodoc.vim', {'for': ['c', 'cpp', 'python']}
Plug 'yianwillis/vimcdoc'
Plug 'vim-airline/vim-airline' " show infos
Plug 'skyblueee/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'skywind3000/quickmenu.vim'  "<F12>
Plug 'lilydjwg/colorizer'
"---------------------------------------
call plug#end()

"==|Self|======================================================================
let mapleader = "\<SPACE>"

" Windows navigating
nnoremap <C-H>     <C-W>h
nnoremap <C-L>     <C-W>l

nnoremap <C-Down>  <C-W>j
nnoremap <C-Up>    <C-W>k
nnoremap <C-Left>  <C-W>h
nnoremap <C-Right> <C-W>l

" Buffer navigating
nnoremap <leader><tab>  :bn<CR>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>

set switchbuf=useopen

" Quick move
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

nnoremap <UP> gk
nnoremap <Down> gj

" Appearance
set cursorline
set colorcolumn=120

nnoremap <C-\> :noh<CR>

" some other
nnoremap <leader>p "+p
vnoremap <leader>y "+y

"==|ALL|=======================================================================
set mouse=a " enable mouse
set linebreak " can not break word when line break
set ruler " show row and column in the bottom
set showcmd " show cmd when typing
set number " show row number at left
set laststatus=2 " always show the status line
set wildmenu " complete in cmd
set showmatch " show the matching part of the pair for [] {} and ()
set scrolloff=3
"---------------------------------------
set incsearch
set hlsearch
set ignorecase smartcase
"---------------------------------------
set backspace=indent,eol,start
"---------------------------------------
set whichwrap=b,s,<,>,[,],~
"---------------------------------------
" set file encoding check and support
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8
"---------------------------------------
set completeopt=menuone,longest,preview
set diffopt=filler,vertical
"---------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
"---------------------------------------
" to have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
            \ | exe "normal! g'\""
            \ | endif
"---------------------------------------
" to highlight the tailing spaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWritePre * %s/\s\+$//e

"==|GUI|=======================================================================
set guioptions-=T
if has('gui_running')
    "colorscheme desert
    colorscheme elflord
endif
"---------------------------------------
if has('win32') || has('win64')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
"---------------------------------------
if exists('$TMUX')
  set term=screen-256color
endif
"---------------------------------------
" apt-get install wmctrl
function! MaximizeWindow()
    silent !sleep 0.1
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"==|NERDTree|==================================================================
nnoremap <leader>F :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1
let NERDTreeCascadeSingleChildDir = 1
let NERDTreeNaturalSort = 1
let NERDTreeChDirMode = 2

"==|fzf|=======================================================================
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                 <bang>0 ? fzf#vim#with_preview('up:60%')
            \                         : fzf#vim#with_preview('right:50%:hidden','?'),
            \                 <bang>0)
nnoremap <leader>f :Files!<CR>
nnoremap <leader>/ :Ag<CR>
nnoremap <leader>l :BLines<CR>

"==|nerdtree-git-plugin|=======================================================
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"==|vim-airline|===============================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_section_c       (bufferline or filename)
let g:airline_section_c = '%<%F%m%r%h%w'
" let g:airline_section_z       (percentage, line number, column number)
let g:airline_section_z = '(%b/0x%B)[%l/%L,%c][%p%%] %(%{strftime("%H:%M")}%)'
let g:airline_symbols_ascii = 1

"==|rainbow_parentheses|=======================================================
" delete black from default
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"==|indentLine|================================================================
let g:indentLine_char='¦'  " ¦, ┆, │
let g:indentLine_enabled = 1

"==|vim-easymotion|============================================================
" single character move
nmap <leader><leader>s <Plug>(easymotion-s)
" word move
nmap <leader><leader>w <Plug>(easymotion-bd-w)
" over window move
nmap <leader><leader>a <Plug>(easymotion-overwin-w)

"==|vim-sneak|=================================================================
let g:sneak#prompt = 'sneak..>'
let g:sneak#target_labels = ";abcdefghigklmnopqrstuvwxyz/"
let g:sneak#label = 1
map f <Plug>Sneak_s

"==|vim-expand-region|=========================================================
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"==|YouCompleteMe|=============================================================
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_filetype_whitelist = {
            \ 'c': 1,
            \ 'cpp': 1,
            \ 'python': 1,
            \ 'perl': 1,
            \ 'sh': 1,
            \ }
"let g:ycm_filetype_blacklist = { [see help file] }
"let g:ycm_filetype_specific_completion_to_disable = { [see help file] }
let g:ycm_show_diagnostics_ui = 0 " default 1
let g:ycm_complete_in_comments = 1 " default 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " default 0
"let g:ycm_collect_identifiers_from_tags_files = 0 " default 0
"let g:ycm_seed_identifiers_with_syntax = 0 " default 0
"let g:ycm_extra_conf_vim_data = [] " default []
"let g:ycm_server_python_interpreter = '' " default ''
"let g:ycm_keep_logfiles = 0 " default 0
"let g:ycm_log_level = 'debug' " debug/info(default)/warning/error/critical
"let g:ycm_add_preview_to_completeopt = 1 " default 0
let g:ycm_autoclose_preview_window_after_completion = 1 " default 0
"let g:ycm_autoclose_preview_window_after_insertion = 1 " default 0
"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
"let g:ycm_key_list_stop_completion = ['<C-y>'] " default ['<C-y>']
"let g:ycm_key_invoke_completion = '<C-z>' " default <C-Space>
let g:ycm_global_ycm_extra_conf = '~/rcfiles/_ycm_extra_conf.py' " default ''
"let g:ycm_confirm_extra_conf = 1 " default 1
"let g:ycm_extra_conf_globlist = [] " default []
"let g:ycm_filepath_completion_use_working_dir = 0 " default 0
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
"let g:ycm_cache_omnifunc = 1 " default 0
"let g:ycm_use_ultisnips_completer = 1 " default 1
"let g:ycm_goto_buffer_command = 'same-buffer' " default 'same-buffer'
"let g:ycm_disable_for_files_larger_than_kb = 1000 " default 1000
au BufEnter *.h,*.c,*.cpp,*.py nmap <C-]> :YcmCompleter GoTo<CR>
au BufLeave *.h,*.c,*.cpp,*.py unmap <C-]>

"==|CompleteParameter|=========================================================
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

"==|echodoc.vim|===============================================================
set noshowmode
let g:echodoc#enable_at_startup = 1

"==|UltiSnips|=================================================================
let g:UltiSnipsExpandTrigger = '<C-o>' " Open it! default '<TAB>'
"let g:UltiSnipsListSnippets = '<C-TAB>' " default '<C-TAB>'
"let g:UltiSnipsJumpForwardTrigger = '<C-j>' " default '<C-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<C-k>' " default '<C-k>'

"==|auto-pairs|================================================================
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>

"==|Pydoc|=====================================================================
let g:pydoc_window_lines=0.7
let g:pydoc_cmd = 'python3 -m pydoc'

"==|Gutentags|=================================================================
" 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"==|AsyncRun|==================================================================
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '.gitignore', 'build.xml']
let g:asyncrun_bell = 1
let g:asyncrun_trim = 1
let g:asyncrun_open = 9

"==|quickmenu|==================================================================
let g:quickmenu_options = "HL"
let g:quickmenu_padding_left = 1
let g:quickmenu_padding_right = 1
call g:quickmenu#reset()
call g:quickmenu#header('')
"----------------------------------------
call g:quickmenu#append('# Window', '')
call g:quickmenu#append('NERDTreeToggle', 'NERDTreeToggle', '<leader>f')
function! Ranger()
    silent !ranger --choosefile=/tmp/chosen
    if filereadable('/tmp/chosen')
        exe 'edit ' . system('cat /tmp/chosen')
        call system('rm /tmp/chosen')
    endif
    redraw!
endfun
nnoremap <leader>r :call Ranger()<cr>
call g:quickmenu#append('Ranger', 'call Ranger()', '<leader>r')
"----------------------------------------
call g:quickmenu#append("# FZF", '')
call g:quickmenu#append("Files", 'Files', "<leader>f: use fzf's *Files* on current project")
call g:quickmenu#append("Ag", 'Lines', "<leader>/: use fzf's *Ag* on current project")
call g:quickmenu#append("BLines", 'BLines', "<leader>l: use fzf's *BLines* on current buffer")
call g:quickmenu#append("Lines", 'Lines', "use fzf's *Lines* on opened buffers")
call g:quickmenu#append("Tags", 'LeaderfBufTagAll', "use *LeaderfBufTagAll* on opened buffers")
call g:quickmenu#append("Functions", 'LeaderfFunctionAll', "use *LeaderfFunction* on opened buffers")
"----------------------------------------
call g:quickmenu#append("# AsyncRun/FMT", '', '', 'c,cpp,python,sh')
call g:quickmenu#append("NeoFormat", "Neoformat", "Neoformat")
call g:quickmenu#append("Run file", 'AsyncRun -raw ' . expand("%:p"),
            \ "run current script. | Use `AsyncRun python` to run selected lines.", 'python,sh')
call g:quickmenu#append("make", 'AsyncRun -cwd=<root> make', "*make* on current project", 'c,cpp')
call g:quickmenu#append("make run", 'AsyncRun -cwd=<root> make run', "*make run* on current project", 'c,cpp')
call g:quickmenu#append("make test", 'AsyncRun -cwd=<root> make test', "*make test* on current project", 'c,cpp')
"----------------------------------------
call g:quickmenu#append("# Git", '')
call g:quickmenu#append("Diff", 'Gvdiff', "use fugitive's *Gvdiff* on current document")
call g:quickmenu#append("Status", 'Gstatus', "use fugitive's *Gstatus* on current document")
call g:quickmenu#append("Preview Hunk", 'GitGutterPreviewHunk',
            \ '<Leader>hp: Preview the hunk under the cursor. :pc[lose] to close the preview window')
call g:quickmenu#append("Undo Hunk", 'GitGutterUndoHunk',
            \ '<Leader>hp: Undo the hunk under the cursor.')
"----------------------------------------
call g:quickmenu#append("# YCM", '', '', 'c,cpp,python,java,js')
call g:quickmenu#append("GoTo", 'YcmCompleter GoTo', "GoToDefinition>>GoToDeclaration>>GoToInclude", 'c,cpp,python')
call g:quickmenu#append("References", 'YcmCompleter GoToReferences', "finds all the references", 'c,cpp,python')
call g:quickmenu#append("GetType", 'YcmCompleter GetType',
            \ "the type of the variable or method, and where it differs, the derived type", 'c,cpp,python')
call g:quickmenu#append("GetParent", 'YcmCompleter GetParent', "the semantic parent", 'c,cpp,python')
call g:quickmenu#append("GetDoc", 'YcmCompleter GetDoc',
            \ "displays type or declaration/Doxygen or javadoc/Python docstrings / etc.", 'c,cpp,python')

noremap <silent><F12> :call quickmenu#toggle(0)<cr>

"==|space-vim-dark|============================================================
let g:space_vim_dark_background = 233 " 233(darkest)-238(lightest)
colorscheme space-vim-dark
hi Comment cterm=italic

"==|ale|=======================================================================
"let g:ale_enabled = 0 " default 1
"let b:ale_enabled = 0 " default 1
"let g:ale_pattern_options_enabled " default !empty(g:ale_pattern_options)
"let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}
"let g:airline#extensions#ale#enabled = 0 " default 1
"let g:ale_command_wrapper = '' " default ''
"let g:ale_completion_enabled = 1 " default 0
"let  g:ale_echo_cursor = 0  " tmp setting for cursor invisible
let  g:ale_echo_msg_format = '%code%: %s [%linter%][%severity%]'
"let b:ale_echo_msg_format = '%code%: %s [%linter%][%severity%]'
"normal模式下文字改变时运行linter，相对保守的做法，没有会导致YouCompleteMe的补全对话框频繁刷新。
let g:ale_lint_on_text_changed = 'normal'
"离开insert模式时运行linter，相对保守的做法，没有会导致YouCompleteMe的补全对话框频繁刷新。
let g:ale_lint_on_insert_leave = 1
"let g:ale_fix_on_save = 1 " default 0
"let b:ale_fix_on_save = 1 " default 0
"let g:ale_keep_list_window_open = 0 " default 0
let g:ale_sign_error = '✗' " '•✹●' default '>>'
let g:ale_sign_warning = '✭' " '▶' default '--'
"let g:ale_sign_info = " default g:ale_sign_warning
"let g:ale_sign_style_error = " default g:ale_sign_error
"let g:ale_sign_style_warning = " default g:ale_sign_warning
"let g:ale_sign_offset = 1000000 " default 1000000
"let g:ale_type_map = {} " default {}
"let b:ale_type_map = {} " default {}
let g:ale_python_pylint_executable = 'python3'
let g:ale_python_pylint_options = '--rcfile ~/rcfiles/pylint.rc'
let g:ale_python_pylint_use_global = 1
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_flake8_use_global = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

"==|nerdcommenter|=============================================================
let g:codi#interpreters = {
            \ 'python': {
            \   'bin': 'python3',
            \   'prompt': '^\(>>>\|\.\.\.\) ',
            \   },
            \ }

"==|nerdcommenter|=============================================================
let g:NERDDefaultAlign = 'left'

"==|dict|======================================================================
function! Mydict()
    let expl=system('sdcv --utf8-output -n ' .
                \ expand("<cword>"))
    windo if
                \ expand("%"=="dict-tmp") |
                \ q! | endif
    15sp dict-tmp
    setlocal buftype=nofile bufhidden=delete noswapfile modifiable
    nnoremap <buffer> q :q<CR>
    1s/^/\=expl/
    1
endfunction
nnoremap <C-K> :call Mydict()<CR>

"==|FileType|==================================================================
"--Python--
autocmd BufNewFile *.py 0r ~/rcfiles/vim_template/py_header
autocmd BufNewFile *.py exe "1," . line("$") . "g/_date_/s/_date_/" .strftime("%Y-%m-%d")
autocmd BufNewFile *.py exe "normal! G"
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>
function! QuickfixToggle()
    let has_quickfix = 0
    for winnr in range(1, winnr('$'))
        if getwinvar(winnr, '&syntax') == 'qf'
            let has_quickfix = 1
        endif
    endfor
    if has_quickfix == 1
        exe 'cclose'
    else
        exe 'copen'
    endif
endfun
autocmd FileType python nnoremap <F10> :call QuickfixToggle()<CR>
