local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.isort,
	null_ls.builtins.formatting.black,
	--null_ls.builtins.formatting.autopep8,
	null_ls.builtins.formatting.stylua,
}

null_ls.setup({ sources = sources })

require("null-ls").setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,

	--on_attach = function(client)
	--	if client.resolved_capabilities.document_formatting then
	--		vim.cmd([[
	--        augroup LspFormatting
	--            autocmd!
	--            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
	--        augroup END
	--        ]])
	--	end
	--end,
})
