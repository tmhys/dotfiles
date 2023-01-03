require("auto-session").setup({
	log_level = "error",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("state") .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = true,
})

-- SaveSession‚ÉŠÖ‚·‚éautocmd‚¤‚Ü‚­“®‚©‚È‚¢
-- local autogroup = "vimrc_auto_session"
-- vim.api.nvim_create_augroup(autogroup, { clear = true })
-- vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
--  group = autogroup,
--  pattern = { "*[^{.git/COMMIT_EDITMSG}]" },
--  callback = function()
--      vim.cmd([[SaveSession]])
--  end,
--  once = false,
-- })
