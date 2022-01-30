vim.cmd([[
let g:asyncrun_encs='cp932'
augroup MyGroup
    autocmd!
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
    autocmd BufNewFile,BufRead *.py noremap <buffer> <Space>r :AsyncRun python  -u %<CR>
    "autocmd BufNewFile,BufRead *.seq,*.s,*.h,*.tbl noremap <buffer><Space>r :AsyncRun SeqCnv_V340 -l 00_Main<CR>
    autocmd FileType seq noremap <buffer> <Space>r :AsyncRun SeqCnv_V340 -l 00_Main<CR>
augroup END
]])
