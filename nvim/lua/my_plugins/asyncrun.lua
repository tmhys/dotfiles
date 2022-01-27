vim.cmd([[
noremap <Space>r :AsyncRun python  -u %<CR>
let g:asyncrun_encs='cp932'
",'cp932'
augroup MyGroup
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END
]])
