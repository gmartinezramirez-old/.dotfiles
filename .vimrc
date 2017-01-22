" -----------------------------------------------------------------------------
" Vim (Neovim) configuration file
" Location (vim): ~/.vimrc
" Location (neovim): ~/.config/nvim/init.vim
" Author: Gonzalo Martínez
" Leader: Space
" -----------------------------------------------------------------------------
" Source config files
"for file in split(glob('~/dotfiles/vim/*.vim'), '\n')
"  exe 'source' f
"endfor

" -----------------------------------------------------------------------------
"  General
" -----------------------------------------------------------------------------
set encoding=utf8
set number
set relativenumber
set nocompatible
let g:mapleader="\<space>"
filetype plugin indent on
filetype plugin on
filetype indent on
syntax on

filetype off
set notimeout
set ttimeout
set ttimeoutlen=10

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let g:loaded_python_provider = 1
  let g:python_host_skip_check=1
  let g:python3_host_skip_check=1
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

" -----------------------------------------------------------------------------
"  Split settings
" -----------------------------------------------------------------------------
set splitbelow
set splitright

" -----------------------------------------------------------------------------
"  Spell
" -----------------------------------------------------------------------------
"TODO: ADD spellfile, set spelllang
"set spellfile =
"set spelllang=en_us
set nospell

" -----------------------------------------------------------------------------
"  Search
" -----------------------------------------------------------------------------
set ignorecase " Ignore case by default
set smartcase " Make search case sensitive
set wrapscan " Search again from top
set nohlsearch
set gdefault
set ignorecase
set smartcase
set incsearch
set showmatch

" -----------------------------------------------------------------------------
"  Undo
" -----------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  "set undodir=~/.config/nvim/tmp/undo//
endif

" -----------------------------------------------------------------------------
"  White character configuration
" -----------------------------------------------------------------------------
set list  " Show listchars by default
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
"set showbreak=↪

" -----------------------------------------------------------------------------
"  Folding
" -----------------------------------------------------------------------------
set foldmethod=marker " Markers are used to specify folds.
set foldlevel=2 " Start folding automatically from level 2
set fillchars="fold: " " Characters to fill the statuslines and vertical separators

" -----------------------------------------------------------------------------
"  Completition
" -----------------------------------------------------------------------------
set completeopt-=preview " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**

" -----------------------------------------------------------------------------
"  Keybinding
" -----------------------------------------------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

nnoremap <Leader>q :q!<CR> " Quit
nnoremap <Leader>w :w<CR> " Save
nnoremap <Leader>W :wq<CR> " Save and quit
nmap <Leader><Leader> V

" -----------------------------------------------------------------------------
"  Visual
" -----------------------------------------------------------------------------
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight VCS conflict markers

set numberwidth=5
set backspace=2
set noswapfile
set laststatus=2
set ruler
set showcmd
set wildmenu
set display+=lastline
set cmdheight=2

set autowrite
set autoread

set magic
set lazyredraw
set backspace=indent,eol,start
set cursorline
set colorcolumn=80

set smarttab
set ttimeout
set ttimeoutlen=100

" -----------------------------------------------------------------------------
"  Color
" -----------------------------------------------------------------------------
"TODO: configure night and light mode
set background=light
"set background=dark

" -----------------------------------------------------------------------------
"  Filetype
" -----------------------------------------------------------------------------
autocmd Filetype gitcommit setlocal spell textwidth=72 

" -----------------------------------------------------------------------------
"  Plugins
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" .............................................................................
"  Plugin list
" .............................................................................

Plug 'tpope/vim-fugitive'

" Git log viewer (Gitv! for file mode)
Plug 'gregsexton/gitv', { 'on': 'Gitv' }

" Safely editing in isolation
Plug 'ferranpm/vim-isolate', { 'on':  ['Isolate', 'UnIsolate'] }
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tmux-plugins/vim-tmux'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'justinmk/vim-dirvish'
Plug 'ekalinin/Dockerfile.vim'
"Plug 'lambdalisue/vim-gita'
Plug 'janko-m/vim-test'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'

call plug#end()
" .............................................................................
"  Plugins Configuration
" .............................................................................
let g:tmuxline_preset = 'tmux'
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

colorscheme gruvbox
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark= 'hard'

