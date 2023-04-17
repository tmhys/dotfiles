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
