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
    {
        "nvim-telescope/telescope.nvim",
        enabled = function()
            return not vim.g.vscode
        end,
        lazy = true,
        keys = { "<Space>" },
        dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
        config = function()
            require("my_plugins.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = true,
        dependencies = { "telescope.nvim" },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = function()
            return not vim.g.vscode
        end,
        lazy = true,
        event = { "BufRead", "BufNewFile", "InsertEnter" },
        run = ":TSUpdate",
        config = function()
            require("my_plugins.treesitter")
        end,
    },
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        dependencies = "nvim-treesitter",
        config = function()
            require("my_plugins.playground")
        end,
    },
    {
        "mrjones2014/nvim-ts-rainbow",
        enabled = function()
            return not vim.g.vscode
        end,
        event = { "BufRead", "BufNewFile", "InsertEnter" },
        dependencies = "nvim-treesitter",
        config = function()
            require("my_plugins.nvim-ts-rainbow")
        end,
    },
    {
        "kyazdani42/nvim-tree.lua",
        enabled = function()
            return not vim.g.vscode
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("my_plugins.nvim-tree")
        end,
        cmd = "NvimTreeFindFileToggle",
        init = function()
            vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeFindFileToggle<CR>", { noremap = true })
        end,
    },
    {
        "s1n7ax/nvim-comment-frame",
        keys = { "<Space>c" },
        config = function()
            require("my_plugins.nvim-comment-frame")
        end,
        dependencies = "nvim-treesitter",
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre" },
        dependencies = {
            { "folke/neodev.nvim" },
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                config = function()
                    require("my_plugins.mason_tool_installer")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },
            { "williamboman/mason.nvim" },
            "cmp-nvim-lsp",
        },
        config = function()
            require("my_plugins.lspconfig")
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("my_plugins.mason-null-ls") -- require your null-ls config here (example below)
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = "williamboman/mason.nvim",
        event = { "FocusLost", "CursorHold" },
        config = function()
            require("my_plugins.null-ls")
        end,
    },
    -- {
    --  "mhartington/formatter.nvim",
    --  config = function()
    --      require("my_plugins.formatter")
    --  end,
    -- },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lua", ft = "lua" },
            { "hrsh7th/cmp-path", event = "CmdlineEnter" },
            { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
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
            -- {
            --  "zbirenbaum/copilot-cmp",
            --  dependencies = {
            --      "zbirenbaum/copilot.lua",
            --      config = function()
            --          require("copilot").setup()
            --      end,
            --  },
            --  config = function()
            --      require("copilot_cmp").setup()
            --  end,
            -- },
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
    { "nvim-tree/nvim-web-devicons", lazy = true },
    -- vim
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    {
        "nvim-zh/colorful-winsep.nvim",
        event = "WinNew",
        config = function()
            require("colorful-winsep").setup()
        end,
    },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "nvim-lua/popup.nvim", lazy = true },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
            require("catppuccin").setup()
        end,
    },
    { "sainnhe/gruvbox-material", lazy = true },
    { "rafi/awesome-vim-colorschemes", lazy = true },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        config = function()
            require("my_plugins.nightfox")
        end,
    },
    { "Mofiqul/dracula.nvim", lazy = true },
    {
        "rose-pine/neovim",
        lazy = true,
        name = "rose-pine",
        version = "v1.*",
        config = function()
            require("my_plugins.rose-pine")
        end,
    },
    { "navarasu/onedark.nvim", lazy = true },
    { "Th3Whit3Wolf/one-nvim", lazy = true },
    { "folke/tokyonight.nvim", lazy = true },
    { "Mofiqul/vscode.nvim", lazy = true },
    { "rebelot/kanagawa.nvim", lazy = true },
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    },
    {
        "drmingdrmer/vim-toggle-quickfix",
        enabled = function()
            return not vim.g.vscode
        end,
        event = "QuickFixCmdPre",
        config = function()
            vim.api.nvim_set_keymap("n", "<M-q>", "<Plug>window:quickfix:toggle", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<M-l>", "<Plug>window:location:toggle", { noremap = true, silent = true })
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
        "xiyaowong/nvim-cursorword",
        enabled = function()
            return not vim.g.vscode
        end,
        event = "CursorHold",
        config = function()
            require("my_plugins.nvim-cursorword")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("my_plugins.indent-blankline")
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
        "nvim-lualine/lualine.nvim",
        enabled = function()
            return not vim.g.vscode
        end,
        -- event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            {
                "SmiteshP/nvim-navic",
                event = { "FocusLost", "CursorHold" },
                config = function()
                    require("my_plugins.nvim-navic").setup()
                end,
            },
        },
        -- init = function()
        --  vim.opt.laststatus = 0
        --  vim.opt.showtabline = 0
        -- end,
        config = function()
            require("my_plugins.lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        enabled = function()
            return not vim.g.vscode
        end,
        version = "v3.*",
        -- event = { "InsertEnter", "FocusLost", "BufRead", "BufNewFile" },
        config = function()
            require("my_plugins.bufferline")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "petertriho/nvim-scrollbar",
        event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
        dependencies = {
            "kevinhwang91/nvim-hlslens",
            config = function()
                require("my_plugins.hlslens")
            end,
        },
        config = function()
            require("my_plugins.nvim-scrollbar")
        end,
    },
    { "MunifTanjim/nui.nvim", lazy = true },
    {
        "folke/noice.nvim",
        enabled = function()
            return not vim.g.vscode
        end,
        event = { "BufRead", "BufNewFile", "InsertEnter", "CmdlineEnter" },
        config = function()
            require("my_plugins.noice")
        end,
        dependencies = {
            { "MunifTanjim/nui.nvim" },
            {
                "rcarriga/nvim-notify",
                enabled = function()
                    return not vim.g.vscode
                end,
            },
            { "nvim-treesitter" },
        },
    },
    {
        "PHSix/faster.nvim",
        -- keys = { "j", "k" },
        lazy = true,
        config = function()
            vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
            vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
        end,
    },
    -- vim
    {
        "kana/vim-smartchr",
        event = "InsertEnter",
        config = function()
            require("my_plugins.vim-smartchr")
        end,
    },
    -- vim
    { "kraxli/vim-renamer", cmd = "Renamer" },
    {
        "kylechui/nvim-surround",
        event = "BufRead",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "gabrielpoca/replacer.nvim",
        ft = "qf",
        config = function()
            require("my_plugins.replacer")
        end,
    },
    {
        "RRethy/nvim-align",
        cmd = "Align",
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
    -- {
    --  "CRAG666/code_runner.nvim",
    --  config = function()
    --      require("my_plugins.code_runner")
    --  end,
    -- },
    {
        "stevearc/overseer.nvim",
        lazy = true,
        config = function()
            require("my_plugins.overseer")
        end,
    },
    -- vim
    {
        "skywind3000/asyncrun.vim",
        enabled = function()
            return not vim.g.vscode
        end,
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
    {
        "dinhhuy258/git.nvim",
        event = "BufRead",
        config = function()
            require("my_plugins.git")
        end,
    },
    -- vim
    {
        "soramugi/auto-ctags.vim",
        event = "BufRead",
        config = function()
            require("my_plugins.auto-ctags")
        end,
    },
    -- {
    --  "stevearc/aerial.nvim",
    --  -- lazy = true,
    --  config = function()
    --      require("my_plugins.aerial")
    --  end,
    --  cmd = "AerialToggle",
    --  init = function()
    --      vim.keymap.set("n", "<F9>", "<cmd>AerialToggle!<CR>")
    --  end,
    --  dependencies = {
    --      "nvim-treesitter/nvim-treesitter",
    --      "nvim-tree/nvim-web-devicons",
    --  },
    -- },
    -- vim
    {
        "majutsushi/tagbar",
        enabled = function()
            return not vim.g.vscode
        end,
        ft = "seq",
        cmd = "TagbarToggle",
        config = function()
            require("my_plugins.tagbar")
        end,
        init = function()
            vim.keymap.set("n", "<F8>", "<Cmd>TagbarToggle<CR>", { noremap = true })
        end,
    },
    { "MTDL9/vim-log-highlighting", ft = "log" },
    { "mechatroner/rainbow_csv", ft = "csv" },
    { dir = "~/vimfiles/localplugins/seq.vim", ft = "seq" },
    {
        "numToStr/Comment.nvim",
        event = "BufRead",
        config = function()
            require("Comment").setup()
        end,
    },
    -- vim
    { "tpope/vim-repeat", lazy = true, keys = { "." } },
    -- {
    --  "jghar/mkdir.nvim",
    --  event = "BufWritePre",
    -- },
    {
        "stevearc/stickybuf.nvim",
        event = "WinNew",
        config = function()
            require("stickybuf").setup()
        end,
    },
}

require("lazy").setup(plugins, {
    performance = {
        checker = {
            -- automatically check for plugin updates
            enabled = true,
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

--起動時間を表示する
-- vim.api.nvim_create_autocmd("User", {
--  pattern = "LazyVimStarted",
--  callback = function()
--      local stats = require("lazy").stats()
--      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
--      vim.g.starttime = ("Neovim loaded " .. stats.count .. " plugins  in " .. ms .. "ms")
--      vim.cmd([[ echomsg printf(starttime) ]])
--  end,
--  once = true,
-- })
