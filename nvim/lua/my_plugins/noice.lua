require("noice").setup({
	cmdline = {
		enabled = false,
	},
	popupmenu = {
		enabled = false,
		backend = "cmp",
	},
	lsp = {
		hover = {
			enabled = false,
		},
		signature = {
			enabled = false,
		},
		progress = {
			enabled = true,
		},
	},
	format = {
		spinner = {
			name = "dots12",
			--name = "sand",
		},
	},
	messages = {
		enabled = false,
		view_warn = false,
		view_search = false,
	},
})
