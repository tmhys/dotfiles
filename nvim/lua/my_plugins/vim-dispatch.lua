vim.cmd([[
let g:test#strategy = 'dispatch'
autocmd FileType seq let b:dispatch = 'SeqCnv_V340  -l 00_Main'
]])
