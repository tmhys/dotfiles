if empty(globpath(&rtp, 'autoload/neoterm.vim'))
  finish
endif

nnoremap <c-t><c-t> :Ttoggle<CR>
tnoremap <silent> <ESC> <C-\><C-n><C-w>

nnoremap <M-p> :T python %<CR><c-w>j

let g:neoterm_autoscroll=1
let g:neoterm_position='vertical'
