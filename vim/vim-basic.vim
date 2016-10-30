" ==============================================
" Basic
" ==============================================

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax')
  syntax enable
endif

" Neovim True color
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

set nocompatible

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set numberwidth=5
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

set laststatus=2

set ruler
set showcmd
set wildmenu
set display+=lastline

set autowrite " Automatically :write before running commands
set autoread
set history=1000
set tabpagemax=50

set t_Co=256
set autoindent
set backspace=indent,eol,start
set complete-=i

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

set smarttab

set nrformats-=octal
set ttimeout
set ttimeoutlen=100

set incsearch
" Make searching better
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
set incsearch
set showmatch

set tabstop=2
set shiftwidth=2
set expandtab

nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
