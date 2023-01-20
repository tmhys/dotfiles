local icons = require("icons")

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

    local symbols_supported = client.supports_method "textDocument/documentSymbol"
    if not symbols_supported then
      Log:debug("skipping setup for document_symbols, method not supported by " .. client.name)
      return
    end
    local status_ok, navic = pcall(require, "nvim-navic")
    if status_ok then
      navic.attach(client, bufnr)
    end
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities
if ok then
  local orig = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.default_capabilities(orig)
end


local lua_globals = {
    "vim",
    "use",
    "packer_plugins",
    "api",
    "fn",
    "loop",

    -- for testing
    "after_each",
    "before_each",
    "describe",
    "it",

    -- hammerspoon
    "hs",

    -- wrk
    "wrk",
    "setup",
    "id",
    "init",
    "request",
    "response",
    "done",

    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "--filename",
    "$FILENAME",
    "-",
}

local server_configs = {
    -- clangd = {},
    -- cssls = {},
    -- dockerls = {},
    -- golangci_lint_ls = {},
    html = {},
    -- intelephense = {},
    jsonls = {},
    jsonnet_ls = {},
    -- marksman = {},
    -- metals = {},
    -- solargraph = {},
    -- sourcekit = {},
    -- teal_ls = {},
    -- terraformls = {},
    tsserver = {},
    vimls = {},
    -- vuels = {},
    -- yamlls = {},

    pyright = {
      settings = {
        python = {
          analysis = {
            extraPaths = {
              -- home_dir(),
              -- iterm2_dir "python38.zip",
              -- iterm2_dir "python3.8",
              -- iterm2_dir "python3.8/lib-dynload",
              -- iterm2_dir "python3.8/site-packages",
            },
          },
        },
      },
    },


    sumneko_lua = {
        settings = {
            Lua = {
                completion = { callSnippet = "Replace" },
                diagnosticls = { globals = lua_globals },
                format = { enable = false },
                hint = { enable = true },
                telemetry = { enable = false },
                workspace = { checkThirdParty = false },
            },
        },
    },
}


require("neodev").setup()
require("mason").setup()
require("mason-lspconfig").setup_handlers({
    function(name)
        local config = server_configs[name] or {}
        if capabilities then
            config.capabilities = capabilities
        end
        config.on_attach = on_attach
        require("lspconfig")[name].setup(config)
    end,
})

local d_config = { -- your config
    -- virtual_text = true,
    virtual_text = false,
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text =  icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text =  icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text =  icons.diagnostics.Info },
      },
    },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
      format = function(d)
        local code = d.code or (d.user_data and d.user_data.lsp.code)
        if code then
          return string.format("%s [%s]", d.message, code):gsub("1. ", "")
        end
        return d.message
      end,
    },
}

local f_config = { -- your config
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
      format = function(d)
        local code = d.code or (d.user_data and d.user_data.lsp.code)
        if code then
          return string.format("%s [%s]", d.message, code):gsub("1. ", "")
        end
        return d.message
      end,


}

vim.diagnostic.config(d_config)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, f_config)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, f_config)

local signs = {
                Error = icons.diagnostics.BoldError .. " ",
                Warn= icons.diagnostics.BoldWarning .. " ",
                Info= icons.diagnostics.BoldInformation .. " ",
                Hint = icons.diagnostics.BoldHint .. " ",
            }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_autocmd({ "CursorHold" }, {
    group = groupname,
    pattern = "*",
    callback = function()
        vim.cmd([[lua vim.diagnostic.open_float(nil,{focus=false})]])
    end,
    once = false,
})
