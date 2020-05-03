if empty(globpath(&rtp, 'autoload/vimspector.vim'))
  finish
endif

let g:vimspector_enable_mappings = 'HUMAN'
