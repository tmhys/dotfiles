local vim=vim
vim.api.nvim_set_keymap('n', '<Space>ga', '<cmd>Git add .<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gc', '<cmd>Git commit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gp', '<cmd>Git push origin master<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gb', '<cmd>Git blame<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gd', '<cmd>Git diff<CR>', { noremap = true, silent = true })
