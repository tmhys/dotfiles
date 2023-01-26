--------------
-- packer comand & keymap
---------------
vim.api.nvim_create_user_command("PackerInstall", "packadd packer.nvim | require'packers'.install()", { force = true })
vim.api.nvim_create_user_command("PackerUpdate", "packadd packer.nvim | require'packers'.update()", { force = true })
vim.api.nvim_create_user_command("PackerSync", "packadd packer.nvim | require'packers'.sync()", { force = true })
vim.api.nvim_create_user_command(
    "PackerClean",
    "packadd packer.nvim | lua require'packers'.clean()]vim.cmd[[command! PackerCompile packadd packer.nvim | lua require'packers'.compile()",
    { force = true }
)
vim.api.nvim_set_keymap("n", "<F12>", ":PackerSync<CR>", { noremap = true, silent = true })

---------------
-- plugins
---------------
vim.cmd([[packadd packer.nvim]])
return require("packer").startup({
    function()
        use({ "wbthomason/packer.nvim", opt = true })
        ---------------
        -- utility{{{
        ---------------
        use({ "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" })
        use({ "lewis6991/impatient.nvim" })
        use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
        use({
            "nvim-zh/colorful-winsep.nvim",
            event = "WinEnter",
            config = function()
                require("colorful-winsep").setup({})
            end,
        })
        use({ "nvim-lua/plenary.nvim", opt = true, module_pattern = { "plenary.*" } })
        use({ "nvim-lua/popup.nvim" })
        use({
            "folke/noice.nvim",
            event = { "BufRead", "BufNewFile", "InsertEnter", "CmdlineEnter" },
            -- opt = true,
            config = function()
                require("my_plugins.noice")
            end,
            -- setup = function()
            --     require("my_plugins.noice_setup")
            -- end,
            requires = {
                { "MunifTanjim/nui.nvim" },
                -- { "rcarriga/nvim-notify", module = "notify" },
                {
                    "rcarriga/nvim-notify",
                    module = { "notify" },
                    -- config = lazy_require("notify").setup {
                    -- render = "minimal",
                    -- -- background_colour = require "core.utils.palette"("nord").black,
                    -- level = "trace",
                    -- on_open = function(win)
                    -- api.win_set_config(win, { focusable = false })
                    -- end,
                    -- },
                },
            },
            wants = { "nvim-treesitter" },
        })
        --}}}

        ---------------
        -- colorschemes{{{
        ---------------
        use({
            "catppuccin/nvim",
            as = "catppuccin",
            run = ":CatppuccinCompile",
            config = function()
                vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
                require("catppuccin").setup()
                vim.api.nvim_command("colorscheme catppuccin")
            end,
        })
        use({ "sainnhe/gruvbox-material", opt = true })
        use({ "rafi/awesome-vim-colorschemes", opt = true })
        use({
            "EdenEast/nightfox.nvim",
            opt = true,
            config = function()
                require("my_plugins.nightfox")
            end,
        })
        use({ "Mofiqul/dracula.nvim", opt = true })
        use({
            "rose-pine/neovim",
            opt = true,
            as = "rose-pine",
            tag = "v1.*",
            config = function()
                require("my_plugins.rose-pine")
            end,
        })
        use({ "navarasu/onedark.nvim", opt = true })
        use({ "Th3Whit3Wolf/one-nvim", opt = true })
        use({ "folke/tokyonight.nvim", opt = true })
        use({ "Mofiqul/vscode.nvim", opt = true })
        use({ "rebelot/kanagawa.nvim", opt = true })
        --}}}

        ---------------
        -- interface{{{
        ---------------
        use({
            "kevinhwang91/nvim-bqf",
            ft = "qf",
        })
        use({
            "drmingdrmer/vim-toggle-quickfix",
            event = "QuickFixCmdPre",
            config = function()
                require("my_plugins.vim-toggle-quickfix")
            end,
        })
        use({
            "mvllow/modes.nvim",
            event = "ModeChanged",
            config = function()
                require('modes').setup()
            end,
        })
        use({ "rinx/nvim-minimap", cmd = { "MinimapOpen" } })
        -- colorschemesによっては表示がうまくいかない
        use({
            "xiyaowong/nvim-cursorword",
            event = "CursorHold",
            config = function()
                require("my_plugins.nvim-cursorword")
            end,
        })
        use({
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            config = function()
                require("my_plugins.indent-blankline")
            end,
        })
        use({
            "lewis6991/gitsigns.nvim",
            event = { "FocusLost", "CursorHold" },
            config = function()
                require("my_plugins.gitsigns")
            end,
        })
        use({
            "chentoast/marks.nvim",
            event = "CursorHold",
            config = function()
                require("my_plugins.marks")
            end,
        })
        use({
            "nvim-lualine/lualine.nvim",
            event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
            requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
            setup = function()
                vim.opt.laststatus = 0
                vim.opt.showtabline = 0
            end,
            config = function()
                require("my_plugins.lualine")
            end,
        })
        use({
            "akinsho/bufferline.nvim",
            tag = "v3.*",
            event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
            -- disable = true,
            config = function()
                require("my_plugins.bufferline")
            end,
            requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        })
        -- use({
        --     "alvarosevilla95/luatab.nvim",
        --     event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
        --     config = function()
        --         require("my_plugins.luatab")
        --     end,
        --     requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        -- })
        use({
            "petertriho/nvim-scrollbar",
            event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
            requires = { "kevinhwang91/nvim-hlslens",
                event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
                config = function()
                    require("my_plugins.hlslens")
                end,
            },
            wants = "nvim-hlslens",
            config = function()
                require("my_plugins.nvim-scrollbar")
            end,
        })
        --}}}

        ---------------
        -- useful func{{{
        ---------------
        use({
            "kana/vim-smartchr",
            event = "InsertEnter",
            config = function()
                require("my_plugins.vim-smartchr")
            end,
        })
        use({ "kraxli/vim-renamer", cmd = "Renamer" })
        -- 使い方学ぶべし
        use({
            "kylechui/nvim-surround",
            event = "BufRead",
            config = function()
                require("nvim-surround").setup()
            end,
        })
        use({
            "gabrielpoca/replacer.nvim",
            ft = "qf",
            config = function()
                require("my_plugins.replacer")
            end,
        })
        use({
            "junegunn/vim-easy-align",
            cmd = "EasyAlign",
            config = function()
                require("my_plugins.vim-easy-align")
            end,
        })
        use({
            "simeji/winresizer",
            cmd = "WinResizerStartResize",
            setup = function()
                vim.api.nvim_set_keymap("n", "<M-w>", "<Cmd>WinResizerStartResize<CR>", { noremap = true })
            end,
        })
        use({
            "PHSix/faster.nvim",
            disable = true,
            opt = true,
            keys = { "j", "k" },
            config = function()
                require("my_plugins.faster")
            end,
        })
        --ユニーク文字ハイライト
        use({
            "jinh0/eyeliner.nvim",
            event = "BufRead",
            config = function()
                require("eyeliner").setup({
                    bold = true,
                })
            end,
        })
        use({
            "ggandor/lightspeed.nvim",
            keys = { "f", "F", "t", "T" },
            config = function()
                require("my_plugins.lightspeed")
            end,
        })
        use({
            "phaazon/hop.nvim",
            branch = "v2",
            module = "hop",
            setup = function()
                vim.api.nvim_set_keymap("n", "zz", "<cmd>lua require'hop'.hint_words()<CR>", {})
            end,
            config = function()
                require("my_plugins.hop")
            end,
        })
        --}}}

        ---------------
        --code runner{{{
        ---------------
        use({
            "skywind3000/asyncrun.vim",
            ft = { "seq", "python" },
            requires = {
                "mh21/errormarker.vim",
                --opt = true,
                config = function()
                    require("my_plugins.errormarker")
                end,
            },
            --wants = { "mh21/errormarker.vim" },
            config = function()
                require("my_plugins.asyncrun")
            end,
        })
        --}}}

        ---------------
        --git{{{
        ---------------
        --これがベスト？
        use({
            "dinhhuy258/git.nvim",
            event = "BufRead",
            config = function()
                require("my_plugins.git")
            end,
        })
        --}}}

        ---------------
        --tags{{{
        ---------------
        use({
            "soramugi/auto-ctags.vim",
            event = "BufRead",
            config = function()
                require("my_plugins.auto-ctags")
            end,
        })
        use({
            "majutsushi/tagbar",
            config = function()
                require("my_plugins.tagbar")
            end,
            cmd = "TagbarToggle",
            setup = function()
                vim.api.nvim_set_keymap("n", "<F8>", "<Cmd>TagbarToggle<CR>", { noremap = true })
            end,
        })
        -- }}}

        ---------------
        --filetype specific{{{
        ---------------
        use({ "MTDL9/vim-log-highlighting", ft = "log" })
        use({ "mechatroner/rainbow_csv", ft = { "csv" } })
        use({ "lark-parser/vim-lark-syntax", ft = { "lark" } })
        use({ "osyo-manga/vim-precious", requires = "Shougo/context_filetype.vim", ft = { "lua", "toml" } })
        --}}}

        ---------------
        -- fuzzy finder{{{
        ---------------
        use({
            "nvim-telescope/telescope.nvim",
            opt = true,
            module = { "telescope" },
            cmd = "Telescope",
            requires = { { "nvim-lua/plenary.nvim", opt = true }, { "nvim-lua/popup.nvim", opt = true } },
            setup = function()
                require("my_plugins.telescope_setup")
            end,
            config = function()
                require("my_plugins.telescope")
            end,
        })
        use({
            "nvim-telescope/telescope-file-browser.nvim",
            opt = true,
            wants = { "telescope.nvim" },
        })

        use({
            "kyazdani42/nvim-tree.lua",
            requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
            config = function()
                require("my_plugins.nvim-tree")
            end,
            cmd = "NvimTreeFindFileToggle",
            setup = function()
                vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>NvimTreeFindFileToggle<CR>", { noremap = true })
            end,
        })
        --}}}

        ---------------
        -- treesitter{{{
        ---------------
        use({
            "nvim-treesitter/nvim-treesitter",
            opt = true,
            event = { "BufRead", "BufNewFile", "InsertEnter" },
            run = ":TSUpdate",
            config = function()
                require("my_plugins.treesitter")
            end,
        })
        use({
            "nvim-treesitter/playground",
            -- opt = true,
            event = { "BufRead", "BufNewFile", "InsertEnter" },
            wants = "nvim-treesitter",
            config = function()
                require("my_plugins.playground")
            end,
        })
        use({
            "SmiteshP/nvim-navic",
            module = "nvim-navic",
            event = { "FocusLost", "CursorHold" },
            config = function()
                require("my_plugins.nvim-navic").setup()
            end,
        })
        use({
            "mrjones2014/nvim-ts-rainbow",
            event = { "BufRead", "BufNewFile", "InsertEnter" },
            wants = "nvim-treesitter",
            config = function()
                require("my_plugins.nvim-ts-rainbow")
            end,
        })
        use({
            "s1n7ax/nvim-comment-frame",
            event = { "BufRead", "BufNewFile", "InsertEnter" },
            config = function()
                require("my_plugins.nvim-comment-frame")
            end,
            wants = "nvim-treesitter",
        })

        ---------------
        -- lsp{{{
        ---------------
        use({
            "neovim/nvim-lspconfig",
            event = { "BufReadPre" },
            requires = {
                { "folke/neodev.nvim", module = { "neodev" } },
                {
                    "WhoIsSethDaniel/mason-tool-installer.nvim",
                    event = { "FocusLost", "CursorHold" },
                    config = function()
                        require("my_plugins.mason_tool_installer")
                    end,
                },
                { "williamboman/mason-lspconfig.nvim", module = { "mason-lspconfig" } },
                { "williamboman/mason.nvim", module = { "mason" } },
            },
            wants = {
                "neodev.nvim",
                "mason.nvim",
                "mason-lspconfig.nvim",
                -- needs these plugins to setup capabilities
                "cmp-nvim-lsp",
            },
            -- setup = function()
            --     require("my_plugins.lspconfig_setup")
            --     -- require("my_plugins.lsp_config").setup()
            -- end,
            config = function()
                require("my_plugins.lspconfig")
                -- require("my_plugins.lsp_config").config()
            end,
        })
        use({
            "jose-elias-alvarez/null-ls.nvim",
            wants = "mason.nvim",
            event = { "FocusLost", "CursorHold" },
            config = function()
                require("my_plugins.null-ls")
            end,
        })

        -- }}}


        ---------------
        -- completion{{{
        ---------------
        use({
            "hrsh7th/nvim-cmp",
            module = "cmp",
            -- event = "InsertEnter",
            -- wants = { "vim-vsnip" },
            requires = {
                { "onsails/lspkind-nvim", module = "lspkind" },
                { "hrsh7th/cmp-nvim-lua", ft = "lua" },
                { "hrsh7th/cmp-path", event = "CmdlineEnter" },
                { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
                { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
                {
                    "saadparwaiz1/cmp_luasnip",
                    event = "InsertEnter",
                    requires = {
                        {
                            "L3MON4D3/LuaSnip",
                            module = { "luasnip" },
                            requires = {
                                { "rafamadriz/friendly-snippets" },
                            },
                            config = function()
                                require("my_plugins.luasnip")
                            end,
                        },
                    },
                },
                { "hrsh7th/cmp-omni", event = "InsertEnter" },
                { "f3fora/cmp-spell", event = "InsertEnter" },
                { "hrsh7th/cmp-buffer", event = "InsertEnter" },
                { "ray-x/cmp-treesitter", event = "InsertEnter" },
                {
                    "windwp/nvim-autopairs",
                    module = "nvim-autopairs",
                    -- event="InsertEnter",
                    config = function()
                        require("my_plugins.nvim-autopairs")
                    end,
                },
                -- { "hrsh7th/vim-vsnip", wants = "nvim-cmp" },
                -- { "hrsh7th/cmp-vsnip", wants = "nvim-cmp" },
                -- { "tzachar/cmp-tabnine", wants = "nvim-cmp", run = "powershell ./install.ps1" },
                -- { "quangnguyen30192/cmp-nvim-tags", wants = "nvim-cmp" }, --ctagsと相性悪い
            },
            config = function()
                require("my_plugins.nvim-cmp")
            end,
        })

        --}}}

        ---------------
        --Comment {{{
        ---------------
        --gccでコメントアウト
        use({
            "numToStr/Comment.nvim",
            event = "BufRead",
            config = function()
                require('Comment').setup()
            end,
        })
        --}}}

        ---------------
        --??? {{{
        ---------------
        use({ "tpope/vim-repeat", opt = true, keys = { "." } })
        use({
            "jghauser/mkdir.nvim",
            event = "BufWritePre",
        })
        -- quickfixなどでファイルを開かないようにする
        use({
            "stevearc/stickybuf.nvim",
            event = "WinNew",
            config = function()
                require("stickybuf").setup()
            end,
        })
        use({
            "sentriz/vim-print-debug",
            event = { "FocusLost", "CursorHold", "InsertEnter" },
            config = function()
                require("my_plugins.vim-print-debug")
            end,
        })

        --}}}

        -- others{{{
        use({ "~/vimfiles/localplugins/seq.vim", ft = "seq" })
        --}}}


    end,

    config = {
        compile_path = vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua",
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
