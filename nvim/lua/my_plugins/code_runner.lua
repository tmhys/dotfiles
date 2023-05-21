require("code_runner").setup({
    filetype = {
        -- java = {
        --   "cd $dir &&",
        --   "javac $fileName &&",
        --   "java $fileNameWithoutExt"
        -- },
        python = "python -u",
        seq = { "-silent -strip SeqCnv_V340 -l " .. g:main_seq_file },
        -- typescript = "deno run",
        -- rust = {
        --   "cd $dir &&",
        --   "rustc $fileName &&",
        --   "$dir/$fileNameWithoutExt"
        -- },
    },
})
vim.keymap.set('n', '<space>r', ':RunCode<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
