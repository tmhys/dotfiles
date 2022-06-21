vim.cmd([[
autocmd FileType seq,javascript,css nmap <silent><Space>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType seq,javascript,css imap <silent><Space>; <c-o><Plug>(cosco-commaOrSemiColon)
let g:cosco_ignore_comment_lines = 0     " Default : 0
]])
