UsePlugin 'deoplete.nvim'

let g:deoplete#enable_at_startup = 1
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "<CR>"

"autocmd FileType * call deoplete#disable()
"autocmd FileType seq call deoplete#enable()
call deoplete#custom#option({
    \ 'auto_complete': v:true,
    \ 'min_pattern_length': 2,
    \ 'auto_complete_delay': 0,
    \ 'auto_refresh_delay': 0,
    \ 'refresh_always': v:true,
    \ 'smart_case': v:true,
    \ 'camel_case': v:true,
    \ })
