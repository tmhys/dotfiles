local vim=vim
vim.api.nvim_set_keymap('n', '<Space>ga', '<cmd>Gwrite<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gc', '<cmd>Git commit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gp', '<cmd>Git push origin master<CR>', { noremap = true, silent = true })
