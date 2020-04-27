if empty(globpath(&rtp, 'autoload/vim-easy-align.vim'))
  finish
endif

"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {                                              " -- 1
\ '.': { 'pattern': '\.\{2,}' },                                             " -- 2
\ '"': { 'pattern': '"', 'filter': 'v/^\s*"/', 'ignore_groups': ['String']}, " -- 3
\ '%': { 'pattern': '%', 'filter': 'v/^\s*"/', 'ignore_groups': ['String']}, " -- 3
\ "'": { 'pattern': "'", 'filter': "v/^\s*'/", 'ignore_groups': ['String']}, " -- 4
\ "-": { 'pattern': '-\{2,}'},                                               " -- 5
\ }
