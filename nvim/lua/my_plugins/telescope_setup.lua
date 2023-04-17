local function builtin(name)
    return function(opt)
        return function()
            return require("telescope.builtin")[name](opt or {})
        end
    end
end

local function extensions(name, prop)
    return function(opt)
        return function()
            local telescope = require("telescope")
            telescope.load_extension(name)
            return telescope.extensions[name][prop](opt or {})
        end
    end
end

vim.keymap.set("n", "<Leader>ff", builtin("find_files")())
vim.keymap.set("n", "<Leader>fb", builtin("buffers")())
vim.keymap.set("n", "<Leader>fg", builtin("live_grep")())
vim.keymap.set("n", "<Leader>ft", builtin("tags")())
vim.keymap.set("n", "<Leader>fm", builtin("oldfiles")())
vim.keymap.set("n", "<Leader>fh", builtin("help_tags")())
vim.keymap.set("n", "<Leader>fq", builtin("quickfix")())
-- vim.keymap.set("n", "<Leader>fc", builtin("colorscheme")({enable_preview = true}))
vim.keymap.set("n", "<Leader>fc", builtin("colorscheme"))
vim.keymap.set("n", "<Leader>fn", extensions("file_browser", "file_browser")())
vim.keymap.set("n", "<C-n>", extensions("file_browser", "file_browser")())
-- vim.keymap.set("n", "<Leader>fs", extensions("session-lens", "find_files")())
-- vim.keymap.set("n", "<Leader>fn", builtin("file_browser")())
vim.keymap.set("n", "<Leader>fv", builtin("find_files")({ search_dirs = { "~/AppData/Local/nvim" } }))
vim.keymap.set("n", "<Leader>fd", builtin("find_files")({ search_dirs = { "~/dotfiles" } }))
-- vim.api.nvim_set_keymap("n", "<Leader>fn", "<cmd>Telescope file_browser<CR>", { noremap = true, silent = true })
--[[ vim.api.nvim_set_keymap(
    "n",
    "<Leader>fs",
    "<cmd>Telescope session-lens search_session<CR>",
    { noremap = true, silent = true }
) ]]
vim.keymap.set("n", "<Leader>f<Leader>", "<cmd>Telescope<CR>", { noremap = true, silent = true })
