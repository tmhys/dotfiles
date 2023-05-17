-- vim.cmd([[
-- nmap <M-q> <Plug>window:quickfix:toggle
-- nmap <M-l> <Plug>window:location:toggle
-- ]])
--
vim.api.nvim_set_keymap("n", "<M-q>", "<Plug>window:quickfix:toggle", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-l>", "<Plug>window:location:toggle", { noremap = true, silent = true })
