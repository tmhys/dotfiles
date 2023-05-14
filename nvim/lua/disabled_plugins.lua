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
--# not lua
-- use({
--     "simeji/winresizer",
--     cmd = "WinResizerStartResize",
--     setup = function()
--         vim.api.nvim_set_keymap("n", "<M-w>", "<Cmd>WinResizerStartResize<CR>", { noremap = true })
--     end,
-- })
-- { "hrsh7th/vim-vsnip", wants = "nvim-cmp" },
-- { "hrsh7th/cmp-vsnip", wants = "nvim-cmp" },
-- { "tzachar/cmp-tabnine", wants = "nvim-cmp", run = "powershell ./install.ps1" },
-- { "quangnguyen30192/cmp-nvim-tags", wants = "nvim-cmp" }, --ctagsと相性悪い

---------------
--session{{{
---------------
--[[ use({
            "rmagatti/session-lens",
            -- opt = true,
            -- requires = {
            -- -- {
            -- --  "rmagatti/auto-session",
            -- --  -- event = "BufRead",
            -- -- -- event = "VimEnter",
            -- --  config = function()
            -- --          require("my_plugins.auto-session")
            -- --  end,
            -- -- },
            -- {'nvim-telescope/telescope.nvim',opt = true},
            -- },
            wants = { "auto-session", "telescope.nvim" },
            config = function()
                require("my_plugins.session-lens")
            end,
        })

        use({
            "rmagatti/auto-session",
            -- event = { "FocusLost", "CursorHold" },
            config = function()
                require("my_plugins.auto-session")
            end,
        }) ]]
--}}}

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

-- hopとlightingこれ一つにしたいが
-- use({
--     "ggandor/leap.nvim",
--     -- event = "VimEnter",
--     -- event = "BufRead",
--     -- opt = true,
--     -- module = "leap",
--     config = function()
--         require("my_plugins.leap")
--     end,
-- })

-- use({ "mhinz/vim-signify", event = "BufEnter" })

-- use({
--     "akinsho/bufferline.nvim",
--     tag = "v3.*",
--     event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
--     -- disable = true,
--     config = function()
--         require("my_plugins.bufferline")
--     end,
--     requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
-- })

use({
    "ray-x/lsp_signature.nvim",
    disable = true,
    wants = "mason.nvim",
    config = function()
        require("my_plugins.lsp-signature")
    end,
})

use({
    "j-hui/fidget.nvim",
    disable = true,
    event = "VimEnter",
    wants = "mason.nvim",
    config = function()
        require("my_plugins.fidget")
    end,
})

-- use({
--     "alvarosevilla95/luatab.nvim",
--     event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
--     config = function()
--         require("my_plugins.luatab")
--     end,
--     requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
-- })

-- use({ "osyo-manga/vim-precious", requires = "Shougo/context_filetype.vim", ft = { "lua", "toml" } })

-- {
--  "sentriz/vim-print-debug",
--  event = { "FocusLost", "CursorHold", "InsertEnter" },
--  config = function()
--      require("my_plugins.vim-print-debug")
--  end,
-- },
-- {
--  "epwalsh/obsidian.nvim",
--  event = { "BufReadPre G:/Dropbox/Dropbox/DropsyncFiles/**.md" },
--  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
--  -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
--  dependencies = {
--      "nvim-lua/plenary.nvim",
--      "hrsh7th/nvim-cmp",
--      "nvim-telescope/telescope.nvim",
--  },
--  config = function()
--      require("my_plugins.obsidian")
--  end,
-- },
    { "lark-parser/vim-lark-syntax", ft = "lark" },
