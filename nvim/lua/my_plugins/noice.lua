require("noice").setup({
	popupmenu = {
		backend = "cmp", -- backend to use to show regular cmdline completions
	},
	lsp = {
		progress = {
			enabled = false,
		},
		signature = {
			-- enabled = true,
			enabled = false,
		},
	},
})
