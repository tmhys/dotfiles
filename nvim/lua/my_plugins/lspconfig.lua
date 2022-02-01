local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
  virtual_text = false,
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    --source = "always",
    --header = "",
    --prefix = "",
    },
}

------ Windows: %APPDATA%\efm-langserver\config.yaml
--require "lspconfig".efm.setup {
--    init_options = {documentFormatting = true},
--    settings = {
--        rootMarkers = {".git/", ".svn/"},
--        languages = {
--            seq = {
--                {formatCommand = "SeqCnv_V340 -l 00_Main", formatStdin = true}
--            }
--            --lua = {
--            --    {formatCommand = "lua-format -i", formatStdin = true}
--            --}
--        }
--    }
--}
