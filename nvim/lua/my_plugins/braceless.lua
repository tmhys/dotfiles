vim.cmd([[
augroup bracesetting
    autocmd!
    autocmd FileType python BracelessEnable +fold
augroup END
]])
