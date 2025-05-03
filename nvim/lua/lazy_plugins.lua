local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<F12>", "<cmd>Lazy sync<CR>")

local plugins = {
    ----------------------------------------------------------------------
    --                           dependencies                           --
    ----------------------------------------------------------------------
    --{{{
    {
        "kevinhwang91/nvim-hlslens",
        lazy = true,
        config = function()
            require("my_plugins.hlslens")
        end,
    },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "nvim-lua/popup.nvim",   lazy = true },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    { "MunifTanjim/nui.nvim", lazy = true },
    { "nvim-treesitter",      lazy = true },
    { "folke/neodev.nvim",    lazy = true },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        config = function()
            require("my_plugins.mason_tool_installer")
        end,
    },
    { "williamboman/mason-lspconfig.nvim", lazy = true },
    { "williamboman/mason.nvim",           lazy = true },
    --}}}
    ----------------------------------------------------------------------
    --                           fuzzy finder                           --
    ----------------------------------------------------------------------
    --{{{
    {
        "nvim-telescope/telescope.nvim",
        -- enabled = function()
        --     return not vim.g.vscode
        -- end,
        lazy = true,
        keys = { "<Space>" },
        config = function()
            require("my_plugins.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = true,
    },
    {
        "Bekaboo/dropbar.nvim",
        config = function()
            local dropbar_api = require("dropbar.api")
            vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
            -- vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
            -- vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        -- enabled = function()
        --     return not vim.g.vscode
        -- end,
        branch = "v3.x",
        config = function()
            require("my_plugins.neo-tree")
        end,
        cmd = "Neotree",
        keys = "<C-n>",
    },
    --}}}
    ----------------------------------------------------------------------
    --                            treesitter                            --
    ----------------------------------------------------------------------
    --{{{
    {
        "nvim-treesitter/nvim-treesitter",
        -- enabled = function()
        --     return not vim.g.vscode
        -- end,
        -- ↓正しく動いている？
        -- lazy = true,
        event = { "BufRead", "BufNewFile", "InsertEnter" },
        build = ":TSUpdate",
        config = function()
            require("my_plugins.treesitter")
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("my_plugins.rainbow-delimiters")
        end,
    },
    {
        "LudoPinelli/comment-box.nvim",
        keys = { "<Space>cb" },
        config = function()
            require("my_plugins.comment-box")
        end,
    },
    --}}}
    ----------------------------------------------------------------------
    --                               LSP                                --
    ----------------------------------------------------------------------
    --{{{
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre" },
        config = function()
            require("my_plugins.lspconfig")
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("my_plugins.mason-null-ls")
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        event = { "FocusLost", "CursorHold" },
        config = function()
            require("my_plugins.null-ls")
        end,
    },
    --}}}
    ----------------------------------------------------------------------
    --                               cmp                                --
    ----------------------------------------------------------------------
    --{{{
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lua", ft = "lua" },
            { "hrsh7th/cmp-path",     event = "CmdlineEnter" },
            { "hrsh7th/cmp-cmdline",  event = "CmdlineEnter" },
            { "hrsh7th/cmp-nvim-lsp" },
            {
                "saadparwaiz1/cmp_luasnip",
                dependencies = {
                    {
                        "L3MON4D3/LuaSnip",
                        dependencies = {
                            { "rafamadriz/friendly-snippets" },
                        },
                        config = function()
                            require("my_plugins.luasnip")
                        end,
                    },
                },
            },
            { "hrsh7th/cmp-omni" },
            { "f3fora/cmp-spell" },
            { "hrsh7th/cmp-buffer" },
            { "ray-x/cmp-treesitter" },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup()
                end,
            },
        },
        config = function()
            require("my_plugins.nvim-cmp")
        end,
    },
    --}}}
    ----------------------------------------------------------------------
    --                               util                               --
    ----------------------------------------------------------------------
    --{{{
    -- { "kazhala/close-buffers.nvim", lazy = true }, --TODO
    --}}}
    ----------------------------------------------------------------------
    --                           Color Scheme                           --
    ----------------------------------------------------------------------
    --{{{
    {
        "diegoulloao/neofusion.nvim",
        lazy = true,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        event = "VimEnter",
        config = function()
            vim.defer_fn(function()
                require("catppuccin").setup({
                    flavour = "frappe",
                })
                vim.cmd.colorscheme("catppuccin-frappe")
            end, 100) -- 100ms 後に適用
        end,
    },
    -- {
    --     "catppuccin/nvim",
    --     lazy = true,
    --     name = "catppuccin",
    --     -- priority = 1000,
    --     -- config = function()
    --     --     vim.cmd.colorscheme("catppuccin-frappe")
    --     -- end,
    -- },
    {
        "Shatur/neovim-ayu",
        lazy = true,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("ayu")
        end,
    },
    --}}}
    ----------------------------------------------------------------------
    --                                qf                                --
    ----------------------------------------------------------------------
    --{{{
    {
        "stevearc/qf_helper.nvim",
        ft = "qf",
        config = function()
            require("qf_helper").setup({
                prefer_loclist = true, -- Used for QNext/QPrev (see Commands below)
                sort_lsp_diagnostics = true, -- Sort LSP diagnostic results
                quickfix = {
                    autoclose = true, -- Autoclose qf if it's the only open window
                    default_bindings = false, -- Set up recommended bindings in qf window
                    default_options = true, -- Set recommended buffer and window options
                    max_height = 30, -- Max qf height when using open() or toggle()
                    min_height = 1, -- Min qf height when using open() or toggle()
                    track_location = true, -- Keep qf updated with your current location
                },
                loclist = {      -- The same options, but for the loclist
                    autoclose = true,
                    default_bindings = true,
                    default_options = true,
                    max_height = 10,
                    min_height = 1,
                    track_location = true,
                },
            })
            -- use <C-N> and <C-P> for next/prev.
            vim.keymap.set("n", "<M-N>", "<CMD>QNext<CR>")
            vim.keymap.set("n", "<M-P>", "<CMD>QPrev<CR>")
            -- toggle the quickfix open/closed without jumping to it
            vim.keymap.set("n", "<M-q>", "<CMD>QFToggle!<CR>")
            vim.keymap.set("n", "<M-l>", "<CMD>LLToggle!<CR>")
        end,
    },
    --}}}
    ----------------------------------------------------------------------
    --                                UI                                --
    ----------------------------------------------------------------------
    --{{{
    {
        "nvim-zh/colorful-winsep.nvim",
        event = "WinNew",
        config = function()
            require("colorful-winsep").setup()
        end,
    },
    {
        "mvllow/modes.nvim",
        event = "ModeChanged",
        config = function()
            require("modes").setup()
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufRead", "BufNewFile", "InsertEnter" },
        opts = {},
    },
    {
        "xiyaowong/nvim-cursorword",
        -- enabled = function()
        --     return not vim.g.vscode
        -- end,
        event = "CursorHold",
        config = function()
            require("my_plugins.nvim-cursorword")
        end,
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("my_plugins.hlchunk")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "FocusLost", "CursorHold" },
        config = function()
            require("my_plugins.gitsigns")
        end,
    },
    {
        "chentoast/marks.nvim",
        -- event = "CursorHold",
        keys = { "<Space>m" },
        config = function()
            require("my_plugins.marks")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        event = "BufRead",
        dependencies = {
            "kevinhwang91/promise-async",
        },
        config = function()
            require("my_plugins.nvim-ufo")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        -- enabled = function()
        --     return not vim.g.vscode
        -- end,
        event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
        init = function()
            vim.opt.laststatus = 0
            vim.opt.showtabline = 0
        end,
        config = function()
            require("my_plugins.lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        -- enabled = function()
        --  return not vim.g.vscode
        -- end,
        -- version = "v3.*",
        event = { "InsertEnter", "FocusLost", "BufRead", "BufNewFile" },
        config = function()
            require("my_plugins.bufferline")
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
        -- dependencies = {
        --  "kevinhwang91/nvim-hlslens",
        --  config = function()
        --      require("my_plugins.hlslens")
        --  end,
        -- },
        config = function()
            require("my_plugins.nvim-scrollbar")
        end,
    },
    --}}}
    ----------------------------------------------------------------------
    --                               tool                               --
    ----------------------------------------------------------------------
    --{{{
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    -- NOTE: vim
    { "kraxli/vim-renamer",       cmd = "Renamer" },
    {
        "kylechui/nvim-surround",
        event = "BufRead",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "stevearc/quicker.nvim",
        event = "FileType qf",
        ---@module "quicker"
        ---@type quicker.SetupOptions
        config = function()
            require("quicker").setup()
        end,
    },
    {
        "RRethy/nvim-align",
        cmd = "Align",
    },
    -- 本当にいる？
    -- {
    --     "dinhhuy258/git.nvim",
    --     event = "BufRead",
    --     config = function()
    --         require("my_plugins.git")
    --     end,
    -- },
    {
        "numToStr/Comment.nvim",
        event = "BufRead",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "stevearc/stickybuf.nvim",
        event = "WinNew",
        config = function()
            require("stickybuf").setup()
        end,
    },
    -- NOTE:  vim
    {
        "soramugi/auto-ctags.vim",
        ft = "seq",
        -- event = "BufRead",
        config = function()
            require("my_plugins.auto-ctags")
        end,
    },
    -- NOTE:  vim
    {
        "majutsushi/tagbar",
        -- enabled = function()
        --  return not vim.g.vscode
        -- end,
        ft = "seq",
        cmd = "TagbarToggle",
        config = function()
            require("my_plugins.tagbar")
        end,
        init = function()
            vim.keymap.set("n", "<F8>", "<Cmd>TagbarToggle<CR>", { noremap = true })
        end,
    },
    -- NOTE: vim
    {
        "skywind3000/asyncrun.vim",
        lazy = true,
        -- enabled = function()
        --  return not vim.g.vscode
        -- end,
        ft = { "seq", "python" },
        dependencies = {
            "mh21/errormarker.vim",
            ft = { "seq", "python" },
            init = function()
                require("my_plugins.errormarker")
            end,
            config = function()
                vim.keymap.set(
                    "n",
                    "<ESC><ESC>",
                    ":<C-u>nohlsearch<CR>:RemoveErrorMarkers<CR>",
                    { noremap = true, silent = true }
                )
            end,
        },
        config = function()
            require("my_plugins.asyncrun")
        end,
    },
    --}}}
    ----------------------------------------------------------------------
    --                               move                               --
    ----------------------------------------------------------------------
    --{{{
    {
        "rainbowhxch/accelerated-jk.nvim",
        keys = { "j", "k" },
        -- lazy = true,
        config = function()
            vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", { noremap = false, silent = true })
            vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", { noremap = false, silent = true })
        end,
    },
    {
        "jinh0/eyeliner.nvim",
        keys = { "f", "F", "t", "T" },
        config = function()
            require("eyeliner").setup({
                bold = true,
            })
        end,
    },
    -- flash.nvimへ乗り換え検討
    {
        "ggandor/lightspeed.nvim",
        keys = { "f", "F", "t", "T" },
        config = function()
            require("my_plugins.lightspeed")
        end,
    },
    {
        "phaazon/hop.nvim",
        branch = "v2",
        keys = { "zz" },
        init = function()
            vim.keymap.set("n", "zz", "<cmd>lua require'hop'.hint_words()<CR>", {})
        end,
        config = function()
            require("my_plugins.hop")
        end,
    },
    --}}}
    ----------------------------------------------------------------------
    --                             filetype                             --
    ----------------------------------------------------------------------
    --{{{
    { dir = "~/vimfiles/localplugins/seq.vim", ft = "seq" },
    --}}}
}

-- lazy setup {{{
require("lazy").setup(plugins, {
    performance = {
        checker = {
            -- automatically check for plugin updates
            enabled = false,
            concurrency = nil, ---@type number? set to 1 to check for updates very slowly
            notify = true, -- get a notification when new updates are found
            frequency = 3600, -- check for updates every hour
        },
        rtp = {
            reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
            ---@type string[]
            paths = {}, -- add any custom paths here that you want to includes in the rtp
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "editorconfig",
                "health",
                "man",
                "nvim",
                "rplugin",
                "shada",
                "spellfile",
            },
        },
    },
})
-- }}}
