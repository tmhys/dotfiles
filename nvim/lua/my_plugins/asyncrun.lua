-- vim.cmd([[
-- let g:asyncrun_encs='cp932'
-- "let g:asyncrun_program = get(g:, 'asyncrun_program', {})
-- "let g:asyncrun_program.nice = { opts -> 'nice -5' . opts.cmd }
--
-- " function s:seqcomp()
-- "   for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
-- "       exec "imap <buffer><expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
-- "   endfor
-- " endfunction
--
-- function s:findmainfile() abort
--     let s:mainfile = system("rg -l -g '*.seq' -g '!proc.seq' sequence")
--     echo s:mainfile
--     " AsyncRun -silent -strip SeqCnv_V340 -l fnamemodify(s:mainfile,":t:r")
-- endfunction
--
-- augroup MyGroup
--     autocmd!
--     autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
--     " autocmd BufNewFile,BufRead *.py noremap <silent><buffer> <Space>r :AsyncRun python -u %<CR>
--     autocmd BufNewFile,BufRead *.py noremap <silent><buffer> <C-e> :AsyncRun python -u %<CR>
--     autocmd BufNewFile,BufRead *.seq,*.s noremap <silent><buffer> <Space>r :AsyncRun -silent -strip SeqCnv_V340 -l 00_Main<CR>
--     " autocmd BufWritePost *.seq,*.s AsyncRun -silent -strip SeqCnv_V340 -l 00_Main
--     autocmd BufWritePost *.seq,*.s call s:findmainfile()
--     " rg -l -g '*.seq' -g '!proc.seq' sequence
--
-- augroup END
-- ]])

local g = vim.g -- a table to access global variables
g.asyncrun_encs = "cp932"

vim.api.nvim_create_autocmd({ "User" }, {
    group = groupname,
    pattern = { "AsyncRunStart" },
    callback = function()
        vim.cmd([[call asyncrun#quickfix_toggle(8, 1)]])
    end,
    once = false,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = groupname,
    pattern = { "python" },
    callback = function()
        vim.keymap.set("n", "<Space>r", ":AsyncRun python -u %<CR>", { noremap = true, silent = true })
    end,
    once = false,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = groupname,
    pattern = { "seq" },
    callback = function()
        vim.keymap.set(
            "n",
            "<Space>r",
            ":AsyncRun -silent -strip SeqCnv_V340 -l 00_Main<CR>",
            { noremap = true, silent = true }
        )
    end,
    once = false,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = groupname,
    pattern = { "*.seq","*.s" },
    callback = function()
        vim.cmd([[AsyncRun -silent -strip SeqCnv_V340 -l 00_Main]])
    end,
    once = false,
})
