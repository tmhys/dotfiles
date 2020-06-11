if empty(globpath(&rtp, 'autoload/undotree.vim'))
  finish
endif

nnoremap <M-u> :UndotreeToggle<cr>
