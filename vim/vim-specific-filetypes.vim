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

autocmd Filetype gitcommit setlocal spell textwidth=72

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass,less setlocal iskeyword+=-
