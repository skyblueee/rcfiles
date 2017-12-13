set nocompatible              " be iMproved, vundle_required

"==|Vundle|=====================================================================
filetype off                  " vundle_required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"---------------------------------------
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, vundle_required
"---------------------------------------
Plugin 'skyblueee/nerdtree' " :NERDTreeToggle :NERDTreeFind and ? for help
Plugin 'majutsushi/tagbar'	 " :Tagbar and ? for help
Plugin 'bling/vim-bufferline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'skyblueee/visualmarks' " press mm to mark and F2 to circle them
Plugin 'Valloric/YouCompleteMe' " extra compile needed
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"---------------------------------------
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
"---------------------------------------
Plugin 'nvie/vim-flake8'     " flake8 installed required
Plugin 'fs111/pydoc.vim'  " just press K(or <leader>pw) in python files
Plugin 'vim-syntastic/syntastic'
"---------------------------------------
Plugin 'tpope/vim-fugitive'
Plugin 'skyblueee/Conque-Shell'
Plugin 'yianwillis/vimcdoc'
"---------------------------------------
call vundle#end()            " vundle_required
filetype plugin indent on    " vundle_required
syntax enable
syntax on

"==|ALL|========================================================================
set mouse=a " enable mouse
set linebreak " can not break word when line break
set ruler " show row and column in the bottom
set showcmd " show cmd when typing
set number " show row number at left
set statusline=[%F]%y%r%m%*%=[%l/%L,%c][%p%%] " status line
set laststatus=2 " always show the status line
set wildmenu " complete in cmd
set showmatch " show the matching part of the pair for [] {} and ()
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
autocmd BufWinLeave * call clearmatches()

"==|GUI|========================================================================
set guioptions-=T
if has('gui_running')
	"colorscheme desert
	colorscheme elflord
endif
"---------------------------------------
if has('win32')
	au GUIEnter * simalt ~x
else
	au GUIEnter * call MaximizeWindow()
endif
"---------------------------------------
" apt-get install wmctrl
function! MaximizeWindow()
	silent !sleep 0.1
	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"==|NERDTree|===================================================================
nnoremap <leader>f :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1
let NERDTreeCascadeSingleChildDir = 1
let NERDTreeNaturalSort = 1
let NERDTreeChDirMode = 2

"==|Tagbar|=====================================================================
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 2
let g:tagbar_autoshowtag = 1
"let g:tagbar_autopreview = 1

"==|bufferline|=================================================================
set updatetime=5000

"==|rainbow_parentheses|========================================================
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

"==|YouCompleteMe|==============================================================
"let g:ycm_min_num_of_chars_for_completion = 1 " default: 2
"let g:ycm_min_num_identifier_candidate_chars = 0
"let g:ycm_max_num_candidates = 50 " 0 or >100 not recommended
"let g:ycm_max_num_identifier_candidates = 10
"let g:ycm_auto_trigger = 1
"let g:ycm_filetype_whitelist = { '*': 1 }
"let g:ycm_filetype_blacklist = { [see help file] }
"let g:ycm_filetype_specific_completion_to_disable = { [see help file] }
"let g:ycm_show_diagnostics_ui = 1 " default 1
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>>'
"let g:ycm_enable_diagnostic_signs = 1 " default 1
"let g:ycm_enable_diagnostic_highlighting = 1 " default 1
"let g:ycm_echo_current_diagnostic = 1 " default 1
"let g:ycm_filter_diagnostics = {} " default {}
"let g:ycm_always_populate_location_list = 0 " default 0
"let g:ycm_open_loclist_on_ycm_diags = 1 " default 1
let g:ycm_complete_in_comments = 1 " default 0
"let g:ycm_complete_in_strings = 1 " default 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0 " default 0
"let g:ycm_collect_identifiers_from_tags_files = 0 " default 0
"let g:ycm_seed_identifiers_with_syntax = 0 " default 0
"let g:ycm_extra_conf_vim_data = [] " default []
"let g:ycm_server_python_interpreter = '' " default ''
"let g:ycm_keep_logfiles = 0 " default 0
"let g:ycm_log_level = 'debug' " debug/info(default)/warning/error/critical
"let g:ycm_auto_start_csharp_server = 1 " default 1
"let g:ycm_auto_stop_csharp_server = 1 " default 1
"let g:ycm_csharp_server_port = 0 " default 0
"let g:ycm_csharp_insert_namespace_expr = '' " default ''
"let g:ycm_add_preview_to_completeopt = 1 " default 0
let g:ycm_autoclose_preview_window_after_completion = 1 " default 0
"let g:ycm_autoclose_preview_window_after_insertion = 0 " default 0
"let g:ycm_max_diagnostics_to_display = 10 " default 30
"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
"let g:ycm_key_list_stop_completion = ['<C-y>'] " default ['<C-y>']
"let g:ycm_key_invoke_completion = '<C-Space>' " default <C-Space>
"let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_global_ycm_extra_conf = '~/rcfiles/.ycm_extra_conf.py' " default ''
"let g:ycm_confirm_extra_conf = 1 " default 1
"let g:ycm_extra_conf_globlist = [] " default []
"let g:ycm_filepath_completion_use_working_dir = 0 " default 0
"let g:ycm_semantic_triggers =  {
"  \  'c' : ['->', '.'],
"  \  'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
"  \            're!\[.*\]\s'],
"  \  'ocaml' : ['.', '#'],
"  \  'cpp,objcpp' : ['->', '.', '::'],
"  \  'perl' : ['->'],
"  \  'php' : ['->', '::'],
"  \  'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"  \  'ruby' : ['.', '::'],
"  \  'lua' : ['.', ':'],
"  \  'erlang' : [':'],
"  \ }
"let g:ycm_cache_omnifunc = 1 " default 0
"let g:ycm_use_ultisnips_completer = 1 " default 1
"let g:ycm_goto_buffer_command = 'same-buffer' " default 'same-buffer'
"let g:ycm_disable_for_files_larger_than_kb = 1000 " default 1000
"let g:ycm_python_binary_path = '' " default 0

"==|UltiSnips|==================================================================
let g:UltiSnipsExpandTrigger = '<C-o>' " Open it! default '<TAB>'
"let g:UltiSnipsListSnippets = '<C-TAB>' " default '<C-TAB>'
"let g:UltiSnipsJumpForwardTrigger = '<C-j>' " default '<C-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<C-k>' " default '<C-k>'

"==|CtrlP|======================================================================
" Usage: press <c-p> and type sth, <c-j> and <c-k> to navigate and select one.
let g:loaded_ctrlp = 0 "set to 1 to disable the plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 0  "Set this to 1 to set regexp search as the default

"==|Ack|========================================================================
nnoremap <leader>a <ESC>:Ack!<Space>
let g:ack_autoclose = 1

"==|Pydoc|======================================================================
let g:pydoc_window_lines=0.7

"==|flake8|=====================================================================
" files that contain this line are skipped:: # flake8: noqa
" lines that contain a ``# noqa`` comment at the end will not issue warnings.
" ignore specific errors on a line with ``# noqa: <error>``(``# noqa: E234``)
" extendable through ``flake8.extension`` and ``flake8.formatting`` entry points
autocmd FileType python map <buffer> <F7> :call Flake8()<CR>

"==|Syntastic|==================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"---------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"==|ConqueTerm|=================================================================
nnoremap <leader>s :ConqueTermVSplit bash<CR>

"==|dict|=======================================================================
function! Mydict()
    let expl=system('sdcv --utf8-output -n ' .
		\ expand("<cword>"))
    windo if
		\ expand("%"=="dict-tmp") |
		\ q! | endif
    15sp dict-tmp
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=expl/
    1
endfunction
nnoremap <C-K> :call Mydict()<CR>

"==|Ranger|=====================================================================
function! Ranger()
	silent !ranger --choosefile=/tmp/chosen
	if filereadable('/tmp/chosen')
		exec 'edit ' . system('cat /tmp/chosen')
		call system('rm /tmp/chosen')
	endif
	redraw!
endfun
nnoremap <leader>r :call Ranger()<cr>

"==|Self|=======================================================================
nnoremap <C-H>     <C-W>h
nnoremap <C-L>     <C-W>l

nnoremap <C-Down>  <C-W>j
nnoremap <C-Up>    <C-W>k
nnoremap <C-Left>  <C-W>h
nnoremap <C-Right> <C-W>l

nnoremap <UP> gk
nnoremap <Down> gj
" yank all
nnoremap <F3> <Esc>ggVG"+y
" copy from sys stack
nnoremap <F4> "+p
inoremap <F4> <Esc>"+pa

nnoremap <leader><SPACE>  <ESC>o<ESC>

set cursorline cursorcolumn
set colorcolumn=80
