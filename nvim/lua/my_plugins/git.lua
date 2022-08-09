require('git').setup({
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Close blame window
    quit_blame = "q",
    -- Open blame commit
    blame_commit = "<CR>",
    -- Open file/folder in git repository
    browse = "<Leader>go",
    -- Open pull request of the current branch
    open_pull_request = "<Leader>gp",
    -- Create a pull request with the target branch is set in the `target_branch` option
    create_pull_request = "<Leader>gn",
    -- Opens a new diff that compares against the current index
    diff = "<Leader>gd",
    -- Close git diff
    diff_close = "<Leader>gD",
    -- Revert to the specific commit
    revert = "<Leader>gr",
    -- Revert the current file to the specific commit
    revert_file = "<Leader>gR",
  },
  -- Default target branch when create a pull request
  target_branch = "master",
})

vim.api.nvim_set_keymap('n', '<Space>ga', '<cmd>Git add .<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gc', '<cmd>Git commit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gp', '<cmd>Git push origin master<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gb', '<cmd>Git blame<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gd', '<cmd>Git diff<CR>', { noremap = true, silent = true })
