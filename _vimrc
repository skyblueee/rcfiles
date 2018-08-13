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
Plug 'junegunn/fzf.vim'  " <leader>fl/ for file/line/ag
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'easymotion/vim-easymotion' " <leader><leader>swafFjk
Plug 'justinmk/vim-sneak'  " fxx
Plug 'terryma/vim-expand-region' " v vv vvv
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'  "ds/cs
Plug 'junegunn/vim-peekaboo'  " visual @ and registers and <c-r> for insert mode pasting.
Plug 'kshenoy/vim-signature' " m<a-zA-Z> m/ m<space> | m<0-9> m? m<bs>
Plug 't9md/vim-choosewin'  " press - to choose window
"---------------------------------------补全
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets', {'for': ['python', 'c', 'cpp', 'sh']}
Plug 'SirVer/ultisnips', {'for': ['python', 'c', 'cpp', 'sh']}  " must before CompleteParameter.vim
Plug 'Valloric/YouCompleteMe', {'for': ['python', 'c', 'cpp'], 'do': 'python3 ./install.py --clang-completer'}
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
Plug 'vim-scripts/a.vim'
Plug 'ludovicchabant/vim-gutentags', {'for': ['python', 'c', 'cpp']}
Plug 'skywind3000/asyncrun.vim', {'for': ['python', 'c', 'cpp']}
Plug 'fs111/pydoc.vim', {'for': 'python'}  " just press K(or <leader>pw) in python files
Plug 'w0rp/ale', {'for': ['python', 'c', 'cpp', 'sh']}
Plug 'sbdchd/neoformat'
Plug 'metakirby5/codi.vim'  " :Codi to play with python codes
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"---------------------------------------
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'vimwiki/vimwiki', {'for': 'wiki'}
Plug 'iamcco/mathjax-support-for-mkdp', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}  " MarkdownPreview
"Plug 'vim-latex/vim-latex', {'for': 'tex'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
"---------------------------------------UI
Plug 'mhinz/vim-startify'
Plug 'mh21/errormarker.vim', {'for': ['c', 'cpp', 'python']}
Plug 'liuchengxu/space-vim-dark'
Plug 'luochen1990/rainbow'
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
call plug#end()  " will execute 'filetype plugin indent on' and 'syntax enable'

"==|enable alt/meta map|=======================================================
"https://github.com/skywind3000/vim-init/wiki/Setup-terminals-to-support-ALT-and-Backspace-correctly
function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc

call Terminal_MetaMode(0)

"==|Self|======================================================================
let mapleader = "\<SPACE>"

" Windows navigating
nnoremap <leader><tab> <c-w>w

" Buffer navigating
nnoremap <leader>1 :b1<cr>
nnoremap <leader>2 :b2<cr>
nnoremap <leader>3 :b3<cr>
nnoremap <leader>4 :b4<cr>
nnoremap <leader>5 :b5<cr>
nnoremap <leader>6 :b6<cr>
nnoremap <leader>7 :b7<cr>
nnoremap <leader>8 :b8<cr>
nnoremap <leader>9 :b9<cr>

set switchbuf=useopen

" Quick move
noremap! <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
noremap! <c-l> <right>
noremap! <c-a> <home>
noremap! <c-e> <end>

nnoremap <up> gk
nnoremap <down> gj
inoremap <up> <c-\><c-o>gk
inoremap <down> <c-\><c-o>gj

" Appearance
set cursorline
set colorcolumn=120

nnoremap <c-\> :noh<cr>

" some other
nnoremap <leader>p "+p
vnoremap <leader>y "+y

" persistent undo
set undodir=$HOME/.vim_undodir
set undofile
autocmd VimLeave * call system('rm ~/.vim_undodir/*')

"==|ALL|=======================================================================
set mouse=a  " enable mouse
set winaltkeys=no  " let windows pass alt to vim
set linebreak  " can not break word when line break
set ruler  " show row and column in the bottom
set showcmd  " show cmd when typing
set number  " show row number at left
set laststatus=2  " always show the status line
set wildmenu  " complete in cmd
set showmatch  " show the matching part of the pair for [] {} and ()
set scrolloff=3
set formatoptions+=jmB
set ffs=unix,dos,mac
"---------------------------------------
set incsearch
set hlsearch
set ignorecase smartcase
"---------------------------------------
set foldenable
set fdm=indent
set foldlevel=99
"---------------------------------------
set backspace=indent,eol,start
"---------------------------------------
set whichwrap=b,s,<,>,[,],~
"---------------------------------------
" set file encoding check and support
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5,euc-jp,latin1
"---------------------------------------
set completeopt=menuone,longest,preview
set diffopt=filler,vertical
"---------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
"---------------------------------------
" stuff to ignore when tab completing in cmd/ex mode
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
set wildignore=*.o,*.obj,*~,*.out,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.wav,*.ogg,*.pcm,*.mp3,*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
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
nnoremap <leader>F :NERDTreeToggle<cr>
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
nnoremap <leader>f :Files!<cr>
nnoremap <leader>/ :Ag<cr>
nnoremap <leader>l :BLines<cr>

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
nmap <tab> <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_section_c       (bufferline or filename)
let g:airline_section_c = '%<%F%m%r%h%w'
" let g:airline_section_z       (percentage, line number, column number)
let g:airline_section_z = '(%b/0x%B)[%l/%L,%c][%p%%] %(%{strftime("%H:%M")}%)'
let g:airline_symbols_ascii = 1

"==|rainbow|===================================================================
" delete black from default
"let g:rbpt_colorpairs = [
"            \ ['brown',       'RoyalBlue3'],
"            \ ['Darkblue',    'SeaGreen3'],
"            \ ['darkgray',    'DarkOrchid3'],
"            \ ['darkgreen',   'firebrick3'],
"            \ ['darkcyan',    'RoyalBlue3'],
"            \ ['darkred',     'SeaGreen3'],
"            \ ['darkmagenta', 'DarkOrchid3'],
"            \ ['brown',       'firebrick3'],
"            \ ['gray',        'RoyalBlue3'],
"            \ ['darkmagenta', 'DarkOrchid3'],
"            \ ['Darkblue',    'firebrick3'],
"            \ ['darkgreen',   'RoyalBlue3'],
"            \ ['darkcyan',    'SeaGreen3'],
"            \ ['darkred',     'DarkOrchid3'],
"            \ ['red',         'firebrick3'],
"            \ ]
"let g:rbpt_max = 16
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['brown', 'red', 'lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
let g:rainbow_active = 1

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

"==|vim-choosewin|=============================================================
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

"==|vim-expand-region|=========================================================
vmap v <Plug>(expand_region_expand)
vmap <c-v> <Plug>(expand_region_shrink)

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
let g:ycm_server_python_interpreter = '/usr/bin/python3'
"let g:ycm_keep_logfiles = 0 " default 0
"let g:ycm_log_level = 'debug' " debug/info(default)/warning/error/critical
"let g:ycm_add_preview_to_completeopt = 1 " default 0
let g:ycm_autoclose_preview_window_after_completion = 1 " default 0
"let g:ycm_autoclose_preview_window_after_insertion = 1 " default 0
"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
"let g:ycm_key_list_stop_completion = ['<c-y>'] " default ['<c-y>']
"let g:ycm_key_invoke_completion = '<c-z>' " default <c-Space>
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
au BufEnter *.h,*.c,*.cpp,*.py nmap <c-]> :YcmCompleter GoTo<cr>
au BufLeave *.h,*.c,*.cpp,*.py unmap <c-]>

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
let g:UltiSnipsExpandTrigger = '<c-o>' " Open it! default '<TAB>'
"let g:UltiSnipsListSnippets = '<c-TAB>' " default '<c-TAB>'
"let g:UltiSnipsJumpForwardTrigger = '<c-j>' " default '<c-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-k>' " default '<c-k>'

"==|auto-pairs|================================================================
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
let g:AutoPairsMapCh=0
inoremap <buffer><silent> ) <c-u>=AutoPairsInsert(')')<cr>

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
"command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ CFLAGS=-O2

"==|quickmenu|==================================================================
let g:quickmenu_options = "HL"
let g:quickmenu_padding_left = 1
let g:quickmenu_padding_right = 1
call g:quickmenu#reset()
call g:quickmenu#header('')
"----------------------------------------
call g:quickmenu#append('# Window', '')
call g:quickmenu#append('Startify', 'Startify', ':Startify')
call g:quickmenu#append('NERDTreeToggle', 'NERDTreeToggle', '<leader>f')
function! Ranger()
    silent !ranger --choosefile=/tmp/chosen
    if filereadable('/tmp/chosen')
        exe 'edit ' . system('cat /tmp/chosen')
        call system('rm /tmp/chosen')
    endif
    redraw!
endfunction
nnoremap <leader>r :call Ranger()<cr>
call g:quickmenu#append('Ranger', 'call Ranger()', '<leader>r')
" check unsaved changes
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
call g:quickmenu#append('DiffOrig', 'DiffOrig', 'check unsaved changes')
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
call g:quickmenu#append("Run file", "let $PYTHONUNBUFFERED=1 | AsyncRun -raw %:p",
            \ "run current script. | Use `AsyncRun python` to run selected lines.", 'python,sh')
call g:quickmenu#append("Compile and Run",
            \ 'AsyncRun -auto=make gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"
            \ && "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"',
            \ "Compile current c/cpp file", 'c,cpp')
call g:quickmenu#append("make", 'AsyncRun -auto=make -cwd=<root> make', "*make* on current project", 'c,cpp')
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

"==|vim-startify|==============================================================
let g:startify_custom_header = ""
let g:startify_bookmarks = ['~/rcfiles/_vimrc']
let g:startify_relative_path = 1
let g:startify_change_to_dir = 1

"==|errormarker.vim|===========================================================
let errormarker_disablemappings = 1

"==|space-vim-dark|============================================================
let g:space_vim_dark_background = 233 " 233(darkest)-238(lightest)
colorscheme space-vim-dark
hi Comment cterm=italic
hi LineNr  ctermfg=gray
hi CursorLineNr	ctermfg=yellow ctermbg=235
hi CursorLine	ctermbg=235

"==|ale|=======================================================================
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
"let g:ale_linters = {
"            \ 'c': ['clang', 'gcc', 'cppcheck'],
"            \ 'cpp': ['clang++', 'gcc', 'cppcheck'],
"            \ 'python': ['flake8', 'pylint'],
"            \ }
let g:ale_python_pylint_executable = 'python3'
let g:ale_python_pylint_options = '--rcfile ~/rcfiles/pylint.conf'
let g:ale_python_pylint_use_global = 1
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8 --conf=' . expand('~/rcfiles/flake8.conf')
let g:ale_python_flake8_use_global = 1
let g:ale_c_parse_makefile = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

"==|codi.vim|==================================================================
let g:codi#interpreters = {
            \ 'python': {
            \   'bin': 'python3',
            \   'prompt': '^\(>>>\|\.\.\.\) ',
            \   },
            \ }

"==|nerdcommenter|=============================================================
let g:NERDDefaultAlign = 'left'
map <m-/> mc:call NERDComment('n', 'toggle')<cr>'cj

"==|dict|======================================================================
function! Mydict()
    let expl=system('sdcv --utf8-output -n ' .
                \ expand("<cword>"))
    windo if
                \ expand("%"=="dict-tmp") |
                \ q! | endif
    15sp dict-tmp
    setlocal buftype=nofile bufhidden=delete noswapfile modifiable
    nnoremap <buffer> q :q<cr>
    1s/^/\=expl/
    1
endfunction
nnoremap <leader>k :call Mydict()<cr>

"==|FileType|==================================================================
"--Python--
let $PYTHONUNBUFFERED=1
autocmd BufNewFile *.py 0r ~/rcfiles/vim_template/py_header
autocmd BufNewFile *.py exe "1," . line("$") . "g/_date_/s/_date_/" .strftime("%Y-%m-%d")
autocmd BufNewFile *.py exe "normal! G"
autocmd FileType python nnoremap <leader>= :0,$!yapf<cr>
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
endfunction
autocmd FileType python,c,cpp nnoremap <F10> :call QuickfixToggle()<cr>
