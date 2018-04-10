" v1.0

" Plugin section {{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/config/nvim/plugged')
Plug 'rakr/vim-one'
Plug 'vimwiki/vimwiki'
Plug 'jceb/vim-orgmode'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'matze/vim-move'
Plug 'tpope/vim-fugitive'
Plug 'cj/vim-webdevicons'
Plug 'airblade/vim-gitgutter'
Plug 'PotatoesMaster/i3-vim-syntax'
"Plug 'SirVer/ultisnips'
Plug 'lilydjwg/colorizer', {'do': 'make'} " colorize rgb rgba texts

Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

 "}}}

" Colours and UI {{{

set t_Co=256
"colorscheme PaperColor
"colorscheme one
"colorscheme nord
colorscheme gruvbox
"set background=light
set background=dark
set termguicolors

" NerdTree {{{
"

" Open NERDTree when no file(s) is selectedd
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree
map <C-n> :NERDTreeToggle<CR> " Open NERDTree with Ctrl+n

" Quit nertree when a file is opened.
let NERDTreeQuitOnOpen = 1

"}}}

" Airline {{{

" Lightline config
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
\ }
" }}}

" General settings {{{
set directory^=$HOME/.vim/tmp// " Place all swap files under .vim/tmp
set clipboard=unnamedplus " Let vim use the systems clipboard
set mouse=a "Enable mouse support
syntax on "Enable syntax
set number "Set line number
set laststatus=2
filetype plugin indent on
set autowriteall ""automatically save any changes made to the buffer before it is hidden.

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4i
"" Code Folding
"" space open/closes folds
nnoremap <space> za
set foldmethod=marker

    " AutoGroup settings{{{

        augroup AutoGroup
        autocmd!
        augroup END

        command! -nargs=* Autocmd autocmd AutoGroup <args>
        command! -nargs=* AutocmdFT autocmd AutoGroup FileType <args>

        " }}}
    " }}}


" Use Alt+j/k to easily move a line
let g:move_key_modifier = 'A'

" AutorPair{{{

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

    "}}}

" Latex-live-preview {{{

let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'pdflatex'

    "}}}

"}}}
