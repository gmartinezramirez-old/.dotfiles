" Vim configuration file
" Location (Vim case): ~/.vimrc
" Location (Neovim case): ~/.config/nvim/init.vim

" Source config files
"for file in split(glob('~/dotfiles/vim/*.vim'), '\n')
"  exe 'source' f
"endfor

" =============================================================================
" 2.0 Basic settings (Neovim defaults: 
" =============================================================================
" {{{

set encoding=utf8
set number
set relativenumber
set nocompatible
filetype plugin indent on
syntax on

filetype off
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let g:loaded_python_provider = 1
  let g:python_host_skip_check=1
  let g:python3_host_skip_check=1
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

" -----------------------------------------------------------------------------
"  2.1 Split settings (more natural) {{{
" -----------------------------------------------------------------------------
set splitbelow
set splitright
"}}}

" -----------------------------------------------------------------------------
"  2.2 Timeout settings {{{
" -----------------------------------------------------------------------------
" Time out on key codes but no mappings.
set notimeout
set ttimeout
set ttimeoutlen=10
"}}}

" -----------------------------------------------------------------------------
"  2.3 Spelling settings {{{
" -----------------------------------------------------------------------------
"TODO: ADD spellfile, set spelllang
"set spellfile =
"set spelllang=en_us
set nospell
"}}}

" -----------------------------------------------------------------------------
" 2.4 Search settings {{{
" -----------------------------------------------------------------------------
set ignorecase					" Ignore case by default
set smartcase					" Make search case sensitive
set wrapscan					" Search again from top
set nohlsearch
"}}}

" -----------------------------------------------------------------------------
"  2.5 Persistent undo settings {{{
" -----------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  "set undodir=~/.config/nvim/tmp/undo//
endif
"}}}

" -----------------------------------------------------------------------------
"  2.6 White characters settings {{{
" -----------------------------------------------------------------------------
set list                                    " Show listchars by default
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
"set showbreak=↪

" -----------------------------------------------------------------------------
"  2.7 Filetype settings {{{
" -----------------------------------------------------------------------------
filetype plugin on
filetype indent on
"}}}

" -----------------------------------------------------------------------------
"  2.8 Folding settings {{{
" -----------------------------------------------------------------------------
set foldmethod=marker                       " Markers are used to specify folds.
set foldlevel=2                             " Start folding automatically from level 2
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators
"}}}

" -----------------------------------------------------------------------------
"  2.9 Omni completion settings {{{
" -----------------------------------------------------------------------------
set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**
"}}}

" =============================================================================
" 3.0 Mapping settings
" =============================================================================
" {{{

" -----------------------------------------------------------------------------
"  3.1 Setting leader {{{
" -----------------------------------------------------------------------------
let g:mapleader="\<space>"
"}}}

" -----------------------------------------------------------------------------
"  3.2 Setting leader {{{
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
"  3.3 Vim defaults overriding {{{
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

" =============================================================================
" 6.0 Color and highlighting settings
" =============================================================================
" {{{


" Highlight VCS conflict markers {{{
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}

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

" Search
set gdefault
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" Mapping
let mapleader = "\<Space>"

nnoremap <Leader>q :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wq<CR>
nmap <Leader><Leader> V


" Filetype
autocmd Filetype gitcommit setlocal spell textwidth=72 

"
"
" =============================================================================
" 1.0 Plugin (Plug) manager settings
" =============================================================================
"{{{
"
call plug#begin('~/.vim/plugged')

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.1 Plugin list
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'tpope/vim-fugitive'

" Git log viewer (Gitv! for file mode)
Plug 'gregsexton/gitv', { 'on': 'Gitv' }

" Safely editing in isolation
Plug 'ferranpm/vim-isolate', { 'on':  ['Isolate', 'UnIsolate'] }

Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'othree/yajs.vim'
Plug 'zenorocha/dracula-theme', { 'rtp':'vim' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tmux-plugins/vim-tmux'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'justinmk/vim-dirvish'
Plug 'ekalinin/Dockerfile.vim'
Plug 'lambdalisue/vim-gita'

Plug 'janko-m/vim-test'
Plug 'easymotion/vim-easymotion'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"}}}

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.2 End of plugin declaration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#end()
"}}}

set background=dark
colorscheme gruvbox
"color dracula

" Plugin Configuration
let g:tmuxline_preset = 'tmux'
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark= 'hard'
