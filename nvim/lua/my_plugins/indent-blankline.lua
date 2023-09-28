-- vim.g.indent_blankline_enabled = true

require("ibl").setup({
	-- show_current_context = true,
	-- show_current_context_start = true,
	--use_treesitter = true,
	buftype_exclude = { "terminal" },
	filetype_exclude = {
		"help",
		"dashboard",
		"dashpreview",
		"NvimTree",
		"neo-tree",
		"vista",
		"sagahover",
		"sagasignature",
		"packer",
		"log",
		"lspsagafinder",
		"lspinfo",
		"lazy",
		"mason",
		"dapui_scopes",
		"dapui_breakpoints",
		"dapui_stacks",
		"dapui_watches",
		"dap-repl",
		"toggleterm",
		"alpha",
		"coc-explorer",
	},
	-- char_highlight_list = {
	--   "IndentBlanklineIndent1", "IndentBlanklineIndent1", "IndentBlanklineIndent1",
	--   "IndentBlanklineIndent1", "IndentBlanklineIndent1", "IndentBlanklineIndent1",
	--   "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar",
	--   "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar",
	--   "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar",
	--   "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar",
	--   "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar",
	--   "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar",
	--   "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar",
	--   "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar", "IndentBlanklineChar",
	--   "IndentBlanklineChar", "IndentBlanklineChar"
	-- }
})

-- vim.api.nvim_clear_autocmds({ event = { "TextChanged", "TextChangedI" }, group = "IndentBlanklineAutogroup" })
