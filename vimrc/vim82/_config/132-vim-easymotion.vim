if empty(globpath(&rtp, 'autoload/EasyMotion.vim'))
  finish
endif


" The prefix key.
nnoremap    [easymotion]   <Nop>
nmap    <M-f> [easymotion]

" <Leader>f{char} to move to {char}
map  [easymotion]f <Plug>(easymotion-bd-f)
nmap [easymotion]f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap [easymotion]s <Plug>(easymotion-overwin-f2)
vmap [easymotion]s <Plug>(easymotion-bd-f2)

" Move to line
map  [easymotion]j <Plug>(easymotion-bd-jk)
nmap [easymotion]j <Plug>(easymotion-overwin-line)

" Move to word
map  [easymotion]w <Plug>(easymotion-bd-w)
nmap [easymotion]w <Plug>(easymotion-overwin-w)

let g:EasyMotion_do_mapping = 0
