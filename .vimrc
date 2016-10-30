

if &shell =~# 'fish$'
  set shell=/bin/bash
  endif

set nocompatible

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set complete-=i

set smarttab

set nrformats-=octal
set ttimeout
set ttimeoutlen=100

set incsearch

set tabstop=2
set shiftwidth=2
set expandtab

nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

set laststatus=2

set ruler
set showcmd
set wildmenu
set display+=lastline

set autoread
set history=1000
set tabpagemax=50


" Select your Leader key
let mapleader = "\<Space>"


set number
set relativenumber 



" Plugins
call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'
" Load other plugins


Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plug 'junegunn/rainbow_parentheses.vim'

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


" Lightning fast :Ag searcher
Plug 'rking/ag.vim'

" Ruby extensions
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user', { 'for': 'ruby' }

" Navitate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'
" {{{

"Run checker when a file is openned or saved
"autocmd! BufRead,BufWritePost * Neomake

"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_java_enabled_makers = ['javac']
"let g:neomake_ruby_enabled_makers = ['rubocop']
"let g:neomake_haskell_enabled_makers = ['ghcmod']
"let g:neomake_coffeescript_enabled_makers = ['coffeelint']
"let g:neomake_jsx_enabled_makers = ['jsxhint']
"let g:neomake_scss_enabled_makers = ['scsslint']
"let g:neomake_css_enabled_makers = ['csslint']
"let g:neomake_php_enabled_makers = ['phpcs']

"}}}


" Run ruby tests with vimux
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-dispatch'
let g:vroom_use_vimux = 1
let g:vroom_write_all = 1
let g:vroom_use_binstubs = 1
let g:vroom_use_colors = 0
let g:vroom_rspec_version = "3.x"
let g:VimuxHeight = "40"



" Diary, notes, whatever
Plug 'vimwiki/vimwiki'
" Set Vim Wiki to my Dropbox directory
let g:vimwiki_list = [{'path':'$HOME/Dropbox/vimwiki'}]

" Allow to :Rename files
Plug 'danro/rename.vim'

" Automatically find root project directory
Plug 'airblade/vim-rooter'
let g:rooter_disable_map = 1
let g:rooter_silent_chdir = 1

Plug 'dag/vim-fish'


" Appearance
" ====================================================================
Plug 'nathanaelkane/vim-indent-guides'
" {{{
  let g:indent_guides_default_mapping = 0
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']
" }}}

Plug 'tpope/vim-sleuth'
Plug 't9md/vim-choosewin'
" {{{
  nmap <leader>' <Plug>(choosewin)
  let g:choosewin_blink_on_land = 0
  let g:choosewin_tabline_replace = 0
" }}}

" Completion
" ====================================================================
Plug 'SirVer/ultisnips'
" {{{
" }}}
Plug 'honza/vim-snippets'

" File Navigation
" ====================================================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>. :Lines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction



"Text Navigation
" ====================================================================
Plug 'Lokaltog/vim-easymotion'
" {{{
  let g:EasyMotion_do_mapping = 0
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_off_screen_search = 0
  nmap ; <Plug>(easymotion-s2)
" }}}
Plug 'rhysd/clever-f.vim'
" {{{
  let g:clever_f_across_no_line = 1
" }}}

" Text Manipulation
" ====================================================================
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
" {{{
  let g:easy_align_ignore_comment = 0 " align comments
  vnoremap <silent> <Enter> :EasyAlign<cr>
" }}}


"vmap <Enter> <Plug>(EasyAlign)
"nmap <Leader>a <Plug>(EasyAlign)

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'

" Text Objects
" ====================================================================
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'nelstrom/vim-textobj-rubyblock'


" Languages
" ====================================================================
Plug 'Shougo/deoplete.nvim'
" Use deoplete.
let g:deoplete#enable_at_startup = 1
Plug 'mattn/emmet-vim'
" {{{
  let g:user_emmet_expandabbr_key = '<c-e>'
" }}}
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-ragtag'
" {{{
  let g:ragtag_global_maps = 1
" }}}

" Git
" ====================================================================
Plug 'tpope/vim-fugitive'
" {{{
  " Fix broken syntax highlight in gitcommit files
  " (https://github.com/tpope/vim-git/issues/12)
  let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'

  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
  nnoremap <silent> <leader>gE :Gedit<space>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gR :Gread<space>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gW :Gwrite!<CR>
  nnoremap <silent> <leader>gq :Gwq<CR>
  nnoremap <silent> <leader>gQ :Gwq!<CR>

  function! ReviewLastCommit()
    if exists('b:git_dir')
      Gtabedit HEAD^{}
      nnoremap <buffer> <silent> q :<C-U>bdelete<CR>
    else
      echo 'No git a git repository:' expand('%:p')
    endif
  endfunction
  nnoremap <silent> <leader>g` :call ReviewLastCommit()<CR>

  augroup fugitiveSettings
    autocmd!
    autocmd FileType gitcommit setlocal nolist
    autocmd BufReadPost fugitive://* setlocal bufhidden=delete
  augroup END
" }}}
Plug 'idanarye/vim-merginal'
" {{{
  nnoremap <leader>gm :MerginalToggle<CR>
" }}}
Plug 'airblade/vim-gitgutter'
" {{{
  let g:gitgutter_map_keys = 0
  let g:gitgutter_max_signs = 200
  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0
  let g:gitgutter_diff_args = '--ignore-space-at-eol'
  nmap <silent> ]h :GitGutterNextHunk<CR>
  nmap <silent> [h :GitGutterPrevHunk<CR>
  nnoremap <silent> <Leader>gu :GitGutterRevertHunk<CR>
  nnoremap <silent> <Leader>gp :GitGutterPreviewHunk<CR><c-w>j
  nnoremap cog :GitGutterToggle<CR>
" }}}


" Utility
" ====================================================================
Plug 'ludovicchabant/vim-gutentags'
" {{{
  let g:gutentags_exclude = [
      \ '*.min.js',
      \ '*html*',
      \ 'jquery*.js',
      \ '*/vendor/*',
      \ '*/node_modules/*',
      \ '*/python2.7/*',
      \ '*/migrate/*.rb'
      \ ]
  let g:gutentags_generate_on_missing = 0
  let g:gutentags_generate_on_write = 0
  let g:gutentags_generate_on_new = 0
  nnoremap <leader>t! :GutentagsUpdate!<CR>
" }}}
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
" {{{
  let g:projectionist_heuristics = {}
" }}}


" Misc
" ====================================================================
Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }
" {{{
  let g:calendar_date_month_name = 1
" }}}

call plug#end()



function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber



" Specific config for FileTypes

" Python config
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

