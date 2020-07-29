if empty(globpath(&rtp, 'autoload/deoplete.vim'))
  finish
endif

let g:deoplete#enable_at_startup = 1
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "<CR>"

"autocmd FileType * call deoplete#disable()
"autocmd FileType seq call deoplete#enable()
