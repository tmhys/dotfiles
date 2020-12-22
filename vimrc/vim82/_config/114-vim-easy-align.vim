UsePlugin 'easy-align'

"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\ '.': { 'pattern': '\.\{2,}' },
\ '"': { 'pattern': '"', 'filter': 'v/^\s*"/', 'ignore_groups': ['String']},
\ '%': { 'pattern': '%', 'filter': 'v/^\s*"/', 'ignore_groups': ['String']},
\ "'": { 'pattern': "'", 'filter': "v/^\s*'/", 'ignore_groups': ['String']},
\ "-": { 'pattern': '-\{2,}'},
\ }
