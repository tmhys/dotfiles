if empty(globpath(&rtp, 'autoload/incsearch.vim'))
  finish
endif

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
