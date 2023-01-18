local icons = require("icons")
local navic = require("nvim-navic")
require("mason-lspconfig").setup()
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "?", "<Cmd>Lspsaga hover_doc<CR>", opts)
    buf_set_keymap("n", "<M-r>", "<Cmd>Lspsaga rename<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    --buf_set_keymap('n', '?', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', 'g?', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wl',
    --               '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "M", "<Cmd>Lspsaga code_action<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<M-p>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    buf_set_keymap("n", "<M-n>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>TroubleToggle<CR>", opts)

    --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    --buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    --buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    --buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

    -- buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    -- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- buf_set_keymap("n", "?", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- buf_set_keymap("n", "g?", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- buf_set_keymap("n", "[lsp]wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    -- buf_set_keymap("n", "[lsp]wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    -- buf_set_keymap("n", "[lsp]wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    -- buf_set_keymap("n", "[lsp]D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    -- -- buf_set_keymap("n", "[lsp]rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- buf_set_keymap("n", "[lsp]a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- buf_set_keymap("n", "[lsp]e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    -- buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    -- buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    -- buf_set_keymap("n", "[lsp]q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    -- buf_set_keymap("n", "[lsp]f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- if client.name == "sumneko_lua" then
    --     client.server_capabilities.document_formatting = false
    --     client.server_capabilities.document_range_formatting = false
    -- end

    -- require("lsp_signature").on_attach()
    require("nvim-navic").attach(client, bufnr)
end

local lspconfig = require("lspconfig")
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities
if ok then
  local orig = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.default_capabilities(orig)
end
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local opts = { capabilities = capabilities, on_attach = on_attach }

require("neodev").setup()

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
    clangd = {},
    cssls = {},
    dockerls = {},
    golangci_lint_ls = {},
    html = {},
    intelephense = {},
    jsonls = {},
    jsonnet_ls = {},
    marksman = {},
    metals = {},
    solargraph = {},
    sourcekit = {},
    teal_ls = {},
    terraformls = {},
    tsserver = {},
    vimls = {},
    vuels = {},
    yamlls = {},

    -- pyright = {
    --   settings = {
    --     python = {
    --       analysis = {
    --         extraPaths = {
    --           -- home_dir(),
    --           -- iterm2_dir "python38.zip",
    --           -- iterm2_dir "python3.8",
    --           -- iterm2_dir "python3.8/lib-dynload",
    --           -- iterm2_dir "python3.8/site-packages",
    --         },
    --       },
    --     },
    --   },
    -- },

    --[[
sumneko_lua = {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      completion = {
        keywordSnippet = "Disable",
      },
      diagnostics = {
        enable = true,
        globals = require("core.utils.lsp").lua_globals,
      },
      workspace = {
        library = {
          fn.expand "$VIMRUNTIME/lua",
          fn.expand "$VIMRUNTIME/lua/vim",
          unpack(api.list_runtime_paths()),
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_new_config = function(config, _)
    config.settings.Lua.workspace.library = api.get_runtime_file("", true)
  end,
},
]]

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

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     signs = true,
--     -- Use lsp_lines instead
--     virtual_text = false,
-- })

local d_config = { -- your config
    virtual_text = true,
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

vim.api.nvim_create_autocmd({ "CursorHold" }, {
    group = groupname,
    pattern = "*",
    callback = function()
        vim.cmd([[lua vim.diagnostic.open_float(nil,{focus=false})]])
    end,
    once = false,
})
