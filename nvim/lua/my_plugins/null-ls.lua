local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
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
    null_ls.builtins.formatting.isort.with({
        condition = function()
            return vim.fn.executable("isort") > 0
        end,
    }),
    -- null_ls.builtins.formatting.isort,
    -- null_ls.builtins.formatting.black,
    -- --null_ls.builtins.formatting.autopep8,
    -- null_ls.builtins.formatting.stylua,
}

null_ls.setup({ sources = sources })

require("null-ls").setup({
    sources = sources,
    -- on_attach = function(client, bufnr)
    -- 	if client.supports_method("textDocument/formatting") then
    -- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    -- 		vim.api.nvim_create_autocmd("BufWritePre", {
    -- 			group = augroup,
    -- 			buffer = bufnr,
    -- 			callback = function()
    -- 				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    -- 				vim.lsp.buf.formatting_sync()
    -- 			end,
    -- 		})
    -- 	end
    -- end,

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

-- local util = require 'vim.lsp.util'
--
-- local formatting_callback = function(client, bufnr)
--   vim.keymap.set('n', '<Space>F', function()
--     local params = util.make_formatting_params({})
--     client.request('textDocument/formatting', params, nil, bufnr)
--   end, { buffer = bufnr })
-- end
--
-- local lspconfig = require("lspconfig")
-- local servers = {'stylua', 'lua_format'}
-- for _, server in ipairs(servers) do
--   lspconfig[server].setup {
--     on_attach = function(client, bufnr)
--       if client.name ~= 'stylua' then
--         formatting_callback(client, bufnr)
--       end
--       common_on_attach(client, bufnr)
--     end
--   }
-- end

-- local on_attach = function(client, bufnr)
--     if client.name == "sumneko_lua" then
--         client.server_capabilities.document_formatting = false -- 0.7 and earlier
--         -- client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
--     end
--     -- rest of the initialization
-- end
