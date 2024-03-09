local g = vim.g -- a table to access global variables
g.asyncrun_encs = "cp932"

vim.api.nvim_create_autocmd({ "User" }, {
	group = groupname,
	pattern = { "AsyncRunStart" },
	callback = function()
		vim.cmd([[call asyncrun#quickfix_toggle(8, 1)]])
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = groupname,
	pattern = { "*.py" },
	callback = function()
		vim.keymap.set("n", "<Space>r", ":AsyncRun python -u %<CR>", { noremap = true, silent = true })
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = groupname,
	pattern = { "*.seq", "*.s" },
	callback = function()
		vim.keymap.set(
			"n",
			"<Space>r",
			-- ":echo g:main_seq_file<CR>",
			-- ":echomsg g:main_seq_file | AsyncRun -silent -strip SeqCnv_V340 -l 00_Main<CR>",
			-- ":echomsg g:main_seq_file | AsyncRun -silent -strip SeqCnv_V340 -l g:main_seq_file<CR>",
			-- ":AsyncRun -silent -strip SeqCnv_V340 -l 00_Main<CR>",
			':execute "AsyncRun" "-silent" "-strip" "SeqCnv_V340" "-l" . " " . g:main_seq_file<CR>',
			{ noremap = true, silent = true }
		)
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = groupname,
	pattern = { "*.seq", "*.s" },
	callback = function()
		vim.cmd(
			-- [[echomsg g:main_seq_file | AsyncRun -silent -strip SeqCnv_V340 -l . g:main_seq_file)]]
			[[execute "AsyncRun" "-silent" "-strip" "SeqCnv_V340" "-l" . " " . g:main_seq_file]]
			-- [[execute "<Plug>AsyncRun" "-silent" "-strip" "SeqCnv_V340" "-l" . " " . g:main_seq_file)]]
		)
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = groupname,
	pattern = { "grammar.js" },
	callback = function()
		vim.cmd([[AsyncRun -silent -strip tree-sitter generate]])
	end,
	once = false,
})
