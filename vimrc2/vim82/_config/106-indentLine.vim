if empty(globpath(&rtp, 'plugin/indentLine.vim'))
  finish
endif

set list listchars=tab:\¦\ "spaceが必要
let g:indentLine_fileTypeExclude = ['help', 'nerdtree','denite','startify','taskpaper','unite','tagbar']
