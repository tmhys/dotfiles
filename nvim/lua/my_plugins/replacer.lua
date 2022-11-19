vim.api.nvim_set_keymap('n', '<space>qf', ':lua require("replacer").run()<cr>', { nowait = true, noremap = true, silent = true })
vim.api.nvim_create_user_command("qfreplace", "require("replacer").run()", { force = true })
