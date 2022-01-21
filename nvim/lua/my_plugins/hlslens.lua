-- lua
require('hlslens').setup({
    calm_down = true,
    nearest_only = true,
    --nearest_float_when = 'always'
})
--vim.cmd("nmap j <Plug>(accelerated_jk_gj)")
vim.cmd("noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR> <Cmd>lua require('hlslens').start()<CR>")
vim.cmd("noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR> <Cmd>lua require('hlslens').start()<CR>")
vim.cmd("noremap * *<Cmd>lua require('hlslens').start()<CR>")
vim.cmd("noremap # #<Cmd>lua require('hlslens').start()<CR>")
vim.cmd("noremap g* g*<Cmd>lua require('hlslens').start()<CR>")
vim.cmd("noremap g# g#<Cmd>lua require('hlslens').start()<CR>")
