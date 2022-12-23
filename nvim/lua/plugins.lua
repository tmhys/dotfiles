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
                require("my_plugins.colorful-winsep")
            end,
        })
        use({ "nvim-lua/plenary.nvim", opt = true, module_pattern = { "plenary.*" } })
        use({ "nvim-lua/popup.nvim" })
        use({
            "folke/noice.nvim",
            opt = true,
            config = function()
                require("my_plugins.noice")
            end,
            requires = {
                { "MunifTanjim/nui.nvim" },
                { "rcarriga/nvim-notify", module = "notify" },
            },
            wants = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
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
            config = function()
                require("my_plugins.nvim-bqf")
            end,
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
                require("my_plugins.modes")
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
        -- use({ "mhinz/vim-signify", event = "BufEnter" })
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
            "alvarosevilla95/luatab.nvim",
            event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
            config = function()
                require("my_plugins.luatab")
            end,
            requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        })
        use({
            "kevinhwang91/nvim-hlslens",
            event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
            config = function()
                require("my_plugins.hlslens")
            end,
        })
        use({
            "petertriho/nvim-scrollbar",
            event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
            requires = { "kevinhwang91/nvim-hlslens", opt = true },
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
                require("my_plugins.nvim-surround")
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
        -- hopとlightingこれ一つにしたいが
        -- use({
        --     "ggandor/leap.nvim",
        --     -- event = "VimEnter",
        --     -- event = "BufRead",
        --     config = function()
        --         require("my_plugins.leap")
        --     end,
        -- })
        use({
            "ggandor/lightspeed.nvim",
            event = "BufRead",
            config = function()
                require("my_plugins.lightspeed")
            end,
        })
        use({
            "phaazon/hop.nvim",
            branch = "v2",
            module = "hop",
            -- kesy = "zz",
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
            requires = { "mh21/errormarker.vim",opt = true ,
            config = function()
                require("my_plugins.errormarker")
            end,
        },
            wants = {"mh21/errormarker.vim"},
            config = function()
                require("my_plugins.asyncrun")
            end,
        })
        -- use({
        --     "mh21/errormarker.vim",
        --     wants = "asyncrun.vim",
        --     config = function()
        --         require("my_plugins.errormarker")
        --     end,
        -- })
        --}}}

        ---------------
        --git{{{
        ---------------
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

        -- use({ "ctrlpvim/ctrlp.vim",
        --      requires = { "kyazdani42/nvim-web-devicons" },
        --      config = function()
        --              require("my_plugins.ctrlp")
        --      end,
        --     requires = { { "mattn/ctrlp-matchfuzzy" },
        --     { "mattn/ctrlp-mark" } ,
        --     { "hara/ctrlp-colorscheme"},
        --     -- { "mattn/vim-ctrlp-syntax-highlight"}
        --     -- { "mattn/vim-ctrlp-syntax-highlight"}
        --     { "~/vimfiles/localplugins/vim-ctrlp-syntax-highlight" }
        -- },
        --       })

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
            event = { "BufReadPost" },
            run = ":TSUpdate",
            config = function()
                require("my_plugins.treesitter")
            end,
        })
        use({
            "SmiteshP/nvim-navic",
            module = "nvim-navic",
            setup = function()
                require("my_plugins.nvim-navic")
            end,
        })
        use({
            "p00f/nvim-ts-rainbow",
            wants = "nvim-treesitter",
            config = function()
                require("my_plugins.nvim-ts-rainbow")
            end,
        })
        use({
            "s1n7ax/nvim-comment-frame",
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
            setup = function()
                require("my_plugins.lspconfig_setup")
                -- require("my_plugins.lsp_config").setup()
            end,
            config = function()
                require("my_plugins.lspconfig")
                -- require("my_plugins.lsp_config").config()
            end,
        })
        use({
            "ray-x/lsp_signature.nvim",
            wants = "mason.nvim",
            config = function()
                require("my_plugins.lsp-signature")
            end,
        })
        use({
            "j-hui/fidget.nvim",
            wants = "mason.nvim",
            config = function()
                require("my_plugins.fidget")
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
        --lsp ui{{{
        ---------------
        -- use({
        --  "tami5/lspsaga.nvim",
        --  branch = "main",
        --  wants = "mason.nvim",
        --  config = function()
        --      require("my_plugins.lspsaga")
        --  end,
        -- })
        -- use({
        --  "folke/trouble.nvim",
        --  requires = { "folke/lsp-colors.nvim" },
        --  wants = "mason.nvim",
        --  config = function()
        --      require("my_plugins.trouble")
        --  end,
        -- })
        -- }}}

        ---------------
        -- completion{{{
        ---------------
        use({
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            -- wants = { "vim-vsnip" },
            requires = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "onsails/lspkind-nvim" },
                { "saadparwaiz1/cmp_luasnip",
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
                }},
                -- { "hrsh7th/vim-vsnip", wants = "nvim-cmp" },
                -- { "hrsh7th/cmp-vsnip", wants = "nvim-cmp" },
                { "hrsh7th/cmp-omni", wants = "nvim-cmp" },
                { "f3fora/cmp-spell", wants = "nvim-cmp" },
                { "hrsh7th/cmp-nvim-lua", wants = "nvim-cmp" },
                { "hrsh7th/cmp-buffer", wants = "nvim-cmp" },
                { "hrsh7th/cmp-path", wants = "nvim-cmp" },
                { "hrsh7th/cmp-cmdline", wants = "nvim-cmp" },
                { "ray-x/cmp-treesitter", wants = "nvim-cmp" },
                -- { "tzachar/cmp-tabnine", wants = "nvim-cmp", run = "powershell ./install.ps1" },
                -- { "quangnguyen30192/cmp-nvim-tags", wants = "nvim-cmp" },
                {
                    "windwp/nvim-autopairs",
                    wants = "nvim-cmp",
                    config = function()
                        require("my_plugins.nvim-autopairs")
                    end,
                },
            },
            config = function()
                require("my_plugins.nvim-cmp")
            end,
        })

        --}}}

        ---------------
        --??? {{{
        ---------------
        use({ "tpope/vim-repeat",
        opt = true,
        keys = {"."},
         })
        use({
            "jghauser/mkdir.nvim",
            event = "BufWritePre",
        })
        -- quickfixなどでファイルを開かないようにする
        use({ "stevearc/stickybuf.nvim", event = "BufEnter" })
        use({
            "sentriz/vim-print-debug",
            event = "BufRead",
            config = function()
                require("my_plugins.vim-print-debug")
            end,
        })

        --}}}

        -- others{{{
        use({ "~/vimfiles/localplugins/seq.vim", ft = "seq" })
        --}}}

        ---------------
        --Comment {{{
        ---------------
        use({
            "numToStr/Comment.nvim",
            event = "BufRead",
            config = function()
                require("my_plugins.Comment")
            end,
        })
        use({
            "b3nj5m1n/kommentary",
            event = "VimEnter",
            config = function()
                require("my_plugins.kommentary")
            end,
        })
        --}}}

        ---------------
        -- disabled plugins {{{
        ---------------
        -- use({
        --     "lfilho/cosco.vim",
        --     event = "InsertEnter",
        --     config = function()
        --         require("my_plugins.cosco")
        --     end,
        -- })
        -- use({ "wadackel/nvim-syntax-info", opt = true })
        -- use({
        --     "Shatur/neovim-session-manager",
        --     opt = true,
        --     -- event = "VimEnter",
        --     config = function()
        --         require("my_plugins.neovim-session-manager")
        --     end,
        -- })
        -- use({
        --     "iamcco/markdown-preview.nvim",
        --     ft = { "markdown" },
        --     run = ":call mkdp#util#install()",
        -- })
        -- use({
        --     "SidOfc/mkdx",
        --     ft = { "markdown" },
        --     setup = function()
        --         require("my_plugins.mkdx")
        --     end,
        -- })
        -- use({
        --  "delphinus/cellwidths.nvim",
        --  opt = true,
        --  config = function()
        --      -- 'listchars' と 'fillchars' を事前に設定しておくのがお勧めです。
        --      -- vim.opt.listchars = { eol = "⏎" }
        --      -- vim.opt.fillchars = { eob = "‣" }
        --      require("cellwidths").setup({
        --          -- name = "default",
        --          -- name = "empty",          -- 空の設定です。
        --          -- name = "default",        -- vim-ambiwidth のデフォルトです。
        --          name = "cica", -- vim-ambiwidth の Cica 用設定です。
        --          -- name = "sfmono_square",  -- SF Mono Square 用設定です。
        --      })
        --  end,
        -- })
        -- use({
        --  "vim-jp/vimdoc-ja",
        --  opt = true,
        -- })
        -- use({
        --  "xiyaowong/nvim-transparent",
        --  opt = true,
        --  config = function()
        --      require("my_plugins.nvim-transparent")
        --  end,
        -- })
        -- use({
        --  "goolord/alpha-nvim",
        --  requires = { "kyazdani42/nvim-web-devicons" },
        --  opt = true,
        --  -- event = "VimEnter",
        --  config = function()
        --      require("my_plugins.alpha-nvim")
        --  end,
        -- })
        -- use({
        --  "folke/which-key.nvim",
        --  opt = true,
        --  -- event = "VimEnter",
        --  config = function()
        --      require("my_plugins.which-key")
        --  end,
        -- })
        --{{{textobject関連
        --use({ "mfussenegger/nvim-treehopper", event = "VimEnter" })
        --}}}

        --use({ "gbprod/yanky.nvim ", event = "VimEnter" })
        --use({
        --      "rmagatti/auto-session", --event = "VimEnter",
        --      config = function()
        --              require("my_plugins.auto-session")
        --      end,
        --})

        --便利さがわからんのでコメントアウト
        ----カーソル下の単語ハイライトしまくれるやつ
        --use({
        --      "t9md/vim-quickhl",
        --      event = "BufReadPost",
        --      --event = "VimEnter",
        --      config = function()
        --              require("my_plugins.vim-quickhl")
        --      end,
        --})
        --use({ "mhinz/vim-sayonara", cmd = "Sayonara" })

        --use({
        --      "voldikss/vim-translator",
        --      event = "VimEnter",
        --      config = function()
        --              require("my_plugins.vim-translator")
        --      end,
        --})

        --use({
        --      "andymass/vim-matchup",
        --      event = "VimEnter",
        --      config = function()
        --              require("my_plugins.vim-matchup")
        --      end,
        --})

        -- use({ "weilbith/nvim-lsp-smag", wants = "nvim-lspconfig" }) --ctagsが使えなくなる

        ---------------
        -- memo{{{
        ---------------
        -- use({
        --      "renerocksai/telekasten.nvim",
        --      wants = { "telescope.nvim" },
        --      requires = { "renerocksai/calendar-vim" },
        --      config = function()
        --              require("my_plugins.telekasten")
        --      end,
        --      cmd = "Telekasten",
        --      -- setup = function()
        -- })
        --}}}

        -- タブを閉じたりするとエラーが出る
        -- カーソルがあったウィンドウのみ明るくするやつ
        -- use({
        --      "sunjon/Shade.nvim",
        --      event = "WinNew",
        --      config = function()
        --              require("my_plugins.Shade")
        --      end,
        -- })
        -- カーソル移動が見やすくなるやつ
        -- use({
        --     "edluffy/specs.nvim",
        --     event = "CursorMoved",
        --     config = function()
        --         require("my_plugins.specs")
        --     end,
        -- })
        -- use({ "tpope/vim-surround", event = "InsertEnter" })
        --use({ "thinca/vim-qfreplace", ft = "qf" })
        -- use({
        --     "rapan931/lasterisk.nvim",
        --     config = function()
        --         require("my_plugins.lasterisk")
        --     end,
        -- })
        -- 使い方学ぶべし
        --acceralate jk
        -- use({
        --  "rhysd/accelerated-jK",
        --  event = "BufRead",
        --  config = function()
        --      require("my_plugins.accelerated-jk")
        --  end,
        -- })
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
