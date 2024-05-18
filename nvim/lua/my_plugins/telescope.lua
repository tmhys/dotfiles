-- vim.api.nvim_command([[packadd telescope-file-browser.nvim]])
require("telescope").load_extension("file_browser")

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["qq"] = actions.close,
				["<esc>"] = actions.close,
				--["jj"] = actions.close
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		preview = {
			hide_on_startup = true,
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "%.dll", "%.exe", "%.qm", "%.dat" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		--borderchars = {
		--  --style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		--  { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
		--  prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
		--  results = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
		-- review = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
		--},
		--    borderchars = {
		--    prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
		--    results = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
		-- review = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
		--  },
		--borderchars = { '═', '║', "=", "║", "╔", "╗", "╝", "╚" },
		--borderchars = { '─', '│', '─', '│', '+', '+', '+', '+' },
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		-- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		use_less = true,
		path_display = {
			filename_first = {
				reverse_directories = true,
			},
		},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		tags = {
			theme = "dropdown",
		},
		oldfiles = {
			theme = "dropdown",
		},
		help_tags = {
			theme = "dropdown",
		},
		quickfix = {
			theme = "dropdown",
		},
		colorscheme = {
			theme = "dropdown",
		},
		-- file_browser = {
		--     theme = "dropdown",
		-- },
	},
})

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
-- vim.keymap.set("n", "<C-n>", extensions("file_browser", "file_browser")())
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
