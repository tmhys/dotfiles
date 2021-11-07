UsePlugin 'dashboard.nvim'

augroup mydash
    autocmd!
    au FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs=
    au FileType set showtabline=0 | autocmd BufLeave <buffer> set showtabline=1
augroup END
