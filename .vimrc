set nocompatible              " be iMproved, vundle_required
filetype off                  " vundle_required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, vundle_required
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'skyblueee/novel.vim'

call vundle#end()            " vundle_required
filetype plugin indent on    " vundle_required
filetype plugin on    " 
syntax enable
syntax on  " 


"==|ALL|================================================================================="
set mouse=a
" can not break word when line break
set linebreak
" show row and column in the bottom
set ruler
" show cmd when typing
set showcmd
" show row number at left
set number
" status line
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" always show the status line
set laststatus=2
" complete in cmd
set wildmenu
"---------------------------------------
set incsearch
set hlsearch
set ignorecase smartcase
"---------------------------------------
set backspace=indent,eol,start
"---------------------------------------
set whichwrap=b,s,<,>,[,],~
nnoremap <UP> gk
nnoremap <Down> gj
"---------------------------------------
" set file encoding check and support
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
nnoremap <space> o<ESC>
" yank all
nnoremap <F3> <Esc>ggVG"+y
" copy from sys stack
nnoremap <F4> "+p
inoremap <F4> <Esc>"+pa

"let g:gccsenseUseOmniFunc = 1
"colorscheme desert
set completeopt=longest,menu

set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent

"==|dict|================================================================================="
function! Mydict()
    let expl=system('sdcv -n ' .
		\ expand("<cword>"))
    windo if
		\ expand("%"=="dict-tmp") | 
		\ q! | endif
    25vsp dict-tmp
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=expl/
    1
endfunction
nmap <C-K> :call Mydict()<CR>

"==|Ranger|================================================================================="
fun! Ranger()
  silent !ranger --choosefile=/tmp/chosen
  if filereadable('/tmp/chosen')
    exec 'edit ' . system('cat /tmp/chosen')
    call system('rm /tmp/chosen')
  endif
  redraw!
endfun
map <leader>r :call Ranger()<cr>

nnoremap <space> o<ESC>
