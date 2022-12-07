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

--[[ vim.api.nvim_set_keymap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>f<Leader>", "<cmd>Telescope<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ft", "<cmd>Telescope tags<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fm", "<cmd>Telescope oldfiles<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fq", "<cmd>Telescope quickfix<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fc", "<cmd>Telescope colorscheme<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fv",
    "<cmd>Telescope find_files search_dirs=~/AppData/Local/nvim<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fd",
    "<cmd>Telescope find_files search_dirs=~/dotfiles<CR>",
    { noremap = true, silent = true }
) ]]

vim.keymap.set("n", "<Leader>ff", builtin("find_files")({ noremap = true, silent = true }))
vim.keymap.set("n", "<Leader>fb", builtin("buffers")({ noremap = true, silent = true }))
vim.keymap.set("n", "<Leader>fg", builtin("live_grep")({ noremap = true, silent = true }))
vim.keymap.set("n", "<Leader>ft", builtin("tags")({ noremap = true, silent = true }))
vim.keymap.set("n", "<Leader>fm", builtin("oldfiles")({ noremap = true, silent = true }))
vim.keymap.set("n", "<Leader>fh", builtin("help_tags")({ noremap = true, silent = true }))
vim.keymap.set("n", "<Leader>fq", builtin("quickfix")({ noremap = true, silent = true }))
vim.keymap.set("n", "<Leader>fc", builtin("colorscheme")({ noremap = true, silent = true }))
vim.api.nvim_set_keymap("n", "<Leader>fn", "<cmd>Telescope file_browser<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>f<Leader>", "<cmd>Telescope<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>fv",
	"<cmd>Telescope find_files search_dirs=~/AppData/Local/nvim<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>fd",
	"<cmd>Telescope find_files search_dirs=~/dotfiles<CR>",
	{ noremap = true, silent = true }
)
