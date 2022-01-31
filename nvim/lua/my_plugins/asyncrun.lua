vim.cmd([[
let g:asyncrun_encs='cp932'
"let g:asyncrun_program = get(g:, 'asyncrun_program', {})
"let g:asyncrun_program.nice = { opts -> 'nice -5' . opts.cmd }
augroup MyGroup
    autocmd!
    "autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
    autocmd BufNewFile,BufRead *.py noremap <buffer> <Space>r :AsyncRun python  -u %<CR>
    autocmd FileType seq noremap <buffer> <Space>r :AsyncRun -silent SeqCnv_V340 -l 00_Main<CR>
    autocmd BufWritePost *.seq,*.s AsyncRun -silent SeqCnv_V340 -l 00_Main<CR>
augroup END
]])
