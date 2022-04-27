
--Ç±ÇÍÇÕì«Ç›çûÇ‹ÇÍÇƒÇ¢ÇÈ
vim.api.nvim_set_keymap("i", "oo", "<Esc>" ,{noremap = true, silent =true})

vim.cmd([[
let g:asyncrun_encs='cp932'
"let g:asyncrun_program = get(g:, 'asyncrun_program', {})
"let g:asyncrun_program.nice = { opts -> 'nice -5' . opts.cmd }
augroup MyGroup
    autocmd!
    "autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
    "Ç»Ç∫Ç©à»â∫Ç™ì«Ç›çûÇ‹ÇÍÇ»Ç¢
    autocmd BufNewFile,BufRead *.py noremap <buffer> <Space>r <Cmd>AsyncRun python  -u %<CR>
    autocmd BufNewFile,BufRead *.seq,*.s noremap <buffer> <Space>r :AsyncRun -silent -strip SeqCnv_V340 -l 00_Main<CR>
    autocmd BufWritePost *.seq,*.s AsyncRun -silent -strip SeqCnv_V340 -l 00_Main
augroup END
]])

--local groupname = "vimrc_vimrc"
--vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--	group = groupname,
--	pattern = "*.py",
--	callback = function()
--        vim.api.nvim_set_keymap("n", "rr", "<Cmd>AsyncRun python -u %<CR>" ,{noremap = true, silent =true})
--	end,
--	once = false,
--})
