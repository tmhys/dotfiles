local g = vim.g -- a table to access global variables

g.tagbar_visibility_symbols = {
	public = "+",
	protected = "#",
	private = "-",
}

g.tagbar_type_seq = {
	ctagstype = "seq",
	kinds = {
		"m:method",
		"s:svport",
	},
	sort = 0,
}
-- " ctags‚Ìİ’èƒtƒ@ƒCƒ‹‚Æ®‡‚ªæ‚ê‚Ä‚¢‚é‚±‚Æ
g.tagbar_type_toml = {
	ctagstype = "toml",
	kinds = {
		"p:plugin",
	},
	sort = 0,
}

-- nmap <F8> :TagbarToggle<CR>
-- vim.keymap.set("n", "<F8>", "<cmd>TagbarToggle<CR>", { noremap = true, silent = true })
