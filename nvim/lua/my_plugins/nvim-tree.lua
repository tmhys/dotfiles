local icons = require("icons")
require("nvim-tree").setup({
	disable_netrw = false,
	hijack_netrw = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	auto_reload_on_write = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	hijack_unnamed_buffer_when_opening = false,
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		icons = {
			error = icons.diagnostics.Error,
			warning = icons.diagnostics.Warning,
			hint = icons.diagnostics.Hint,
			info = icons.diagnostics.Info,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	filters = {
		dotfiles = false,
		custom = { ".git", ".svn", "*.dat", "*.dbg", "*.exe", "proc.seq" },
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = false,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
})

require("nvim-tree.view").View.winopts.signcolumn = "no"
