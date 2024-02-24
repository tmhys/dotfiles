local null_ls = require("null-ls")

local ignored_filetypes = {
	"TelescopePrompt",
	"diff",
	"gitcommit",
	"unite",
	"qf",
	"help",
	"markdown",
	"minimap",
	"packer",
	"dashboard",
	"telescope",
	"lsp-installer",
	"lazy",
	"lspinfo",
	"NeogitCommitMessage",
	"NeogitCommitView",
	"NeogitGitCommandHistory",
	"NeogitLogView",
	"NeogitNotification",
	"NeogitPopup",
	"NeogitStatus",
	"NeogitStatusNew",
	"aerial",
	"null-ls-info",
	"mason",
	"noice",
	"notify",
}

local ignored_buftype = {
	"nofile",
}

local groupname = "vimrc_null_ls"
vim.api.nvim_create_augroup(groupname, { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = groupname,
	pattern = "*",
	callback = function()
		if vim.tbl_contains(ignored_filetypes, vim.bo.filetype) then
			return
		end
		if vim.tbl_contains(ignored_buftype, vim.bo.buftype) then
			return
		end

		vim.fn.matchadd("DiffDelete", "\\v\\s+$")
	end,
	once = false,
})

local sources = {
	-- LuaFormatter off
	-- null_ls.builtins.formatting.trim_whitespace.with({
	--  disabled_filetypes = ignored_filetypes,
	--  runtime_condition = function()
	--      local count = tonumber(vim.api.nvim_exec("execute 'silent! %s/\\v\\s+$//gn'", true):match("%w+"))
	--      if count then
	--          return vim.fn.confirm("Whitespace found, delete it?", "&No\n&Yes", 1, "Question") == 2
	--      end
	--  end,
	-- }),
	null_ls.builtins.formatting.stylua.with({
		condition = function()
			return vim.fn.executable("stylua") > 0
		end,
	}),
	null_ls.builtins.formatting.black.with({
		condition = function()
			return vim.fn.executable("black") > 0
		end,
	}),
	-- rust-analyzer
	-- null_ls.builtins.formatting.rustfmt,
	null_ls.builtins.formatting.prettier.with({
		condition = function()
			return vim.fn.executable("prettier") > 0 or vim.fn.executable("./node_modules/.bin/prettier") > 0
		end,
	}),
	-- null_ls.builtins.diagnostics.eslint.with({
	--  condition = function()
	--      vim.o.fixendofline = true -- Error: [prettier/prettier] Insert `⏎`
	--      return vim.fn.executable("eslint") > 0 or vim.fn.executable("./node_modules/.bin/eslint") > 0
	--  end,
	-- }),
	-- null_ls.builtins.formatting.shfmt.with({
	--  condition = function()
	--      return vim.fn.executable("shfmt") > 0
	--  end,
	-- }),
	-- null_ls.builtins.diagnostics.zsh,
	-- null_ls.builtins.formatting.beautysh.with({
	--  extra_args = { "-t" },
	--  condition = function()
	--      return vim.fn.executable("beautysh") > 0
	--  end,
	-- }),
	-- null_ls.builtins.diagnostics.shellcheck.with({
	--  condition = function()
	--      return vim.fn.executable("shellcheck") > 0
	--  end,
	-- }),
	-- null_ls.builtins.diagnostics.editorconfig_checker.with({
	--  condition = function()
	--      return vim.fn.executable("ec") > 0
	--  end,
	-- }),
	-- null_ls.builtins.diagnostics.cspell.with({
	--  diagnostics_postprocess = function(diagnostic)
	--      diagnostic.severity = vim.diagnostic.severity["WARN"]
	--      local formatted = "[#{c}] #{m} (#{s})"
	--      formatted = formatted:gsub("#{m}", diagnostic.message)
	--      formatted = formatted:gsub("#{s}", diagnostic.source)
	--      formatted = formatted:gsub("#{c}", diagnostic.code or "")
	--      diagnostic.message = formatted
	--  end,
	--  condition = function()
	--      return vim.fn.executable("cspell") > 0
	--  end,
	-- }),
	-- null_ls.builtins.diagnostics.vale.with({
	--  diagnostics_postprocess = function(diagnostic)
	--      diagnostic.severity = vim.diagnostic.severity["WARN"]
	--      local formatted = "[#{c}] #{m} (#{s})"
	--      formatted = formatted:gsub("#{m}", diagnostic.message)
	--      formatted = formatted:gsub("#{s}", diagnostic.source)
	--      formatted = formatted:gsub("#{c}", diagnostic.code or "")
	--      diagnostic.message = formatted
	--  end,
	--  condition = function()
	--      return vim.fn.executable("vale") > 0 and vim.fn.filereadable(".vale.ini") > 0
	--  end,
	-- }),
	-- null_ls.builtins.diagnostics.codespell.with({
	--  args = spell_args,
	-- }),
	-- create
	-- occur 'Failed to load textlint's rule module' when rule does not installed
	-- null_ls.builtins.diagnostics.textlint.with({
	--  extra_args = { "--quiet" },
	--  condition = function()
	--      return vim.fn.executable("textlint") > 0
	--  end,
	-- }),
	-- null_ls.builtins.formatting.markdownlint.with({
	--  condition = function()
	--      return vim.fn.executable("markdownlint") > 0
	--  end,
	-- }),
	null_ls.builtins.code_actions.gitsigns,
	-- LuaFormatter on
}

-- ./.nvim/local-null-ls.lua
-- local null_ls = require("null-ls")
-- return {
--   null_ls.builtins.diagnostics.cspell.with({
--      diagnostics_postprocess = function(diagnostic)
--          diagnostic.severity = vim.diagnostic.severity["WARN"]
--      end,
--  }),
-- }
-- if file_exists("./.nvim/local-null-ls.lua") then
--  local local_null = dofile("./.nvim/local-null-ls.lua")
--  sources = require("rc/utils").merge_lists(sources, local_null)
-- end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		-- async = true,
		filter = function(client)
			return client.name ~= "tsserver" and client.name ~= "sumneko_lua"
		end,
		bufnr = bufnr,
	})
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

null_ls.setup({
	-- debug = true,
	diagnostics_format = "[#{c}] #{m} (#{s})",
	sources = sources,
	on_attach = on_attach,
})
