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