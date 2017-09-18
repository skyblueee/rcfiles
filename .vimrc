set nocompatible              " be iMproved, vundle_required

"==|Vundle|=============================================================================="
filetype off                  " vundle_required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"---------------------------------------
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, vundle_required
"---------------------------------------
Plugin 'scrooloose/nerdtree' " :NERDTree and press ? for help
Plugin 'majutsushi/tagbar'	 " :Tagbar and press ? for help
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'skyblueee/visualmarks' " press mm to mark and F2 to circle them
Plugin 'Valloric/YouCompleteMe' " extra compile needed
"---------------------------------------
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
"---------------------------------------
Plugin 'nvie/vim-flake8'     " flake8 installed required
Plugin 'rkulla/pydiction' " just press Tab to complete python files
Plugin 'vim-syntastic/syntastic'
"---------------------------------------
Plugin 'vim-scripts/TaskList.vim' " todo: not that good
Plugin 'tpope/vim-fugitive'
Plugin 'skyblueee/Conque-Shell'
"---------------------------------------
call vundle#end()            " vundle_required
filetype plugin indent on    " vundle_required
syntax enable
syntax on

"==|ALL|================================================================================="
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
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 " set file encoding check and support
"---------------------------------------
set completeopt=menuone,longest,preview
set diffopt=filler,vertical
"---------------------------------------
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
"---------------------------------------
" to have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"---------------------------------------
" to highlight the tailing spaces, <leader><space> to remove them.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <leader><space> :%s/\s\+$//<cr>

"==|GUI|================================================================================="
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

"==|Tagbar|================================================================================="
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 2
let g:tagbar_autoshowtag = 1
" let g:tagbar_autopreview = 1

"==|MiniBufExpl|============================================================================="
let g:miniBufExplMaxSize = 1
let g:miniBufExplHideWhenDiff = 1
let g:miniBufExplShowBufNumbers = 1

"==|YouCompleteMe|==========================================================================="
let g:ycm_complete_in_comments = 1
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_key_list_stop_completion = ['<C-y>']
"let g:ycm_key_invoke_completion = '<C-Space>'
"let g:ycm_semantic_triggers =  {
"			\   'c' : ['->', '.'],
"			\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
"			\             're!\[.*\]\s'],
"			\   'ocaml' : ['.', '#'],
"			\   'cpp,objcpp' : ['->', '.', '::'],
"			\   'perl' : ['->'],
"			\   'php' : ['->', '::'],
"			\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"			\   'ruby' : ['.', '::'],
"			\   'lua' : ['.', ':'],
"			\   'erlang' : [':'],
"			\ }

"==|CtrlP|================================================================================="
" Usage: press <c-p> and type something, use <c-j> and <c-k> to navigate and select one.
let g:loaded_ctrlp = 0 "set to 1 to disable the plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 0  "Set this to 1 to set regexp search as the default

"==|Ack|================================================================================="
nnoremap <leader>a <ESC>:Ack!<Space>
let g:ack_autoclose = 1

"==|Pydiction|================================================================================="
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

"==|flake8|================================================================================="
" files that contain this line are skipped:: # flake8: noqa
" lines that contain a ``# noqa`` comment at the end will not issue warnings.
" you can ignore specific errors on a line with ``# noqa: <error>``, e.g., ``# noqa: E234``
" extendable through ``flake8.extension`` and ``flake8.formatting`` entry points
autocmd FileType python map <buffer> <F7> :call Flake8()<CR>

"==|Syntastic|================================================================================="
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"---------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"==|TaskList|============================================================================="
"Usage: <leader>t to get tasklist and q to close it.
let g:tlWindowPosition = 1
let g:tlTokenList = ["todo", "TODO", "fixme", "FIXME"]

"==|ConqueTerm|=========================================================================="
nnoremap <leader>b :ConqueTermVSplit bash<CR>

"==|dict|================================================================================="
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

"==|Ranger|==============================================================================="
function! Ranger()
	silent !ranger --choosefile=/tmp/chosen
	if filereadable('/tmp/chosen')
		exec 'edit ' . system('cat /tmp/chosen')
		call system('rm /tmp/chosen')
	endif
	redraw!
endfun
nnoremap <leader>r :call Ranger()<cr>

"==|Self|================================================================================="
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

