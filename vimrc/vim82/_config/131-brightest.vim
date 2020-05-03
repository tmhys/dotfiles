if empty(globpath(&rtp, 'autoload/brightest.vim'))
  finish
endif

let g:brightest#highlight = {
\   "group" : "BrightestUnderline"
\}

let g:brightest#enable_highlight_all_window = 1
" CursorHold 時にハイライトさせる
let g:brightest#enable_on_CursorHold = 1
