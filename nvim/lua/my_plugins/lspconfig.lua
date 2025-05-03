-- アイコン定義を外部ファイルから読み込み
local icons = require("icons")

-- LSP クライアントがバッファにアタッチされたときの処理
local on_attach = function(client, bufnr)
    -- バッファ専用のキーマップを設定するヘルパー関数
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- バッファ専用のオプションを設定するヘルパー関数
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- 補完を <C-x><C-o> で有効化（omnifuncを設定）
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- キーマッピング設定（例：gdで定義ジャンプ、Kでホバー表示）
    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

    -- ドキュメントシンボルがサポートされていれば navic をアタッチ
    local symbols_supported = client.supports_method("textDocument/documentSymbol")
    if not symbols_supported then
        Log:debug("skipping setup for document_symbols, method not supported by " .. client.name)
        return
    end
    local status_ok, navic = pcall(require, "nvim-navic")
    if status_ok then
        navic.attach(client, bufnr)
    end
end

-- cmp_nvim_lsp（補完連携プラグイン）の capabilities を取得
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities
if ok then
    local orig = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(orig)
end

-- Lua用にグローバル変数として許容するシンボルのリスト
local lua_globals = {
    "vim",
    "use",
    "packer_plugins",
    "api",
    "fn",
    "loop",
    -- テスト用
    "after_each",
    "before_each",
    "describe",
    "it",
    -- Hammerspoon 用
    "hs",
    -- wrk 用
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

-- 各 LSP サーバごとの設定
local server_configs = {
    html = {},
    jsonls = {},
    jsonnet_ls = {},
    tsserver = {},
    vimls = {},
    pyright = {
        settings = {
            python = {
                analysis = {
                    extraPaths = {
                        -- 必要に応じて Python の追加パスを指定
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

-- Neovim Lua用補助プラグイン
require("neodev").setup()
-- LSP サーバ管理ツール mason をセットアップ
require("mason").setup()
-- mason-lspconfig を使って LSP サーバを自動セットアップ
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

-- 診断表示の設定
local d_config = {
    virtual_text = false, -- インラインの診断メッセージを無効化（仮想テキスト非表示）
    signs = {
        active = true,
        values = {
            { name = "DiagnosticSignError", text = icons.diagnostics.Error },
            { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
            { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
            { name = "DiagnosticSignInfo",  text = icons.diagnostics.Info },
        },
    },
    underline = true,
    update_in_insert = false, -- 挿入モード中は診断を更新しない
    severity_sort = true,  -- 重症度順にソート
    float = {              -- フロートウィンドウの見た目設定
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

-- ホバーとシグネチャヘルプの見た目設定
local f_config = {
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

-- 診断とハンドラーを設定
vim.diagnostic.config(d_config)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, f_config)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, f_config)

-- サイン欄（行番号横）に表示するシンボルを定義
local signs = {
    Error = icons.diagnostics.BoldError .. " ",
    Warn = icons.diagnostics.BoldWarning .. " ",
    Info = icons.diagnostics.BoldInformation .. " ",
    Hint = icons.diagnostics.BoldHint .. " ",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- カーソルホールド時にフロートで診断をポップアップ表示
vim.api.nvim_create_autocmd({ "CursorHold" }, {
    group = groupname, -- 注意: `groupname` はこのスクリプト内では定義されていないので要確認
    pattern = "*",
    callback = function()
        vim.cmd([[lua vim.diagnostic.open_float(nil,{focus=false})]])
    end,
    once = false,
})
