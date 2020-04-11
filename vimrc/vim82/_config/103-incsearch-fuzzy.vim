if empty(globpath(&rtp, 'autoload/incsearch/config/fuzzy.vim'))
  finish
endif

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
