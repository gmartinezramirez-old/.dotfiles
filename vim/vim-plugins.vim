" ==============================================
" Plugins
" ==============================================

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }

" Better search tools
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/SmartCase'
Plug 'vim-scripts/gitignore'

" Python support
Plug 'vim-scripts/indentpython.vim'

" Ruby extensions
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user', { 'for': 'ruby' }

" Navitate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner.git'
Plug 'christoomey/vim-run-interactive'

Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'

" Notes
Plug 'vimwiki/vimwiki'

" Allow to :Rename files
Plug 'danro/rename.vim'

" Automatically find root project directory
Plug 'airblade/vim-rooter'

" Appearance
" ====================================================================

Plug 'tpope/vim-sleuth'
Plug 't9md/vim-choosewin'

" Completion
" ====================================================================
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" File Navigation
" ====================================================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-grepper'

" Lightning fast :Ag searcher
" REPLACED by FZF
"Plug 'rking/ag.vim'

"Text Navigation
" ====================================================================
Plug 'Lokaltog/vim-easymotion'

" Text Manipulation
" ====================================================================
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'

" Languages
" ====================================================================
Plug 'Shougo/deoplete.nvim'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-ragtag'

" Git
" ====================================================================
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'airblade/vim-gitgutter'

" Utility
" ====================================================================
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'

" Misc
" ====================================================================
Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }
Plug 'tpope/vim-commentary'

"TODO: Untested
" ====================================================================

"Plug 'altercation/vim-colors-solarized'
"Plug 'justinmk/vim-dirvish'
"Plug 'tpope/vim-vinegar'

call plug#end()