vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
--vim.api.nvim_set_keymap("v", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
--vim.api.nvim_set_keymap("v", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })

-- local groupname = "vimrc_vimrc"

-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--     group = groupname,
--     pattern = "*",
--     callback = function()
--         if vim.o.laststatus == 0 then
--             vim.o.laststatus = 3
--         end
--     end,
--     once = false,
-- })
--
-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--     group = groupname,
--     pattern = "*",
--     callback = function()
--         if vim.o.laststatus == 3 then
--             vim.o.laststatus = 0
--         end
--     end,
--     once = false,
-- })

-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--  group = groupname,
--  pattern = "*",
--   callback = function()
--     vim.cmd [[
--       set laststatus=0 | autocmd CursorHold <buffer> set laststatus=3
--     ]]
--   end,
-- })
