local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "wbthomason/packer.nvim", lazy = true },
	{ "lewis6991/impatient.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		dependencies = { { "nvim-lua/plenary.nvim", lazy = true }, { "nvim-lua/popup.nvim", lazy = true } },
		init = function()
			require("my_plugins.telescope_setup")
		end,
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
		lazy = true,
		event = { "BufRead", "BufNewFile", "InsertEnter" },
		run = ":TSUpdate",
		config = function()
			require("my_plugins.treesitter")
		end,
	},
	{
		"nvim-treesitter/playground",
		-- lazy = true,
		event = { "BufRead", "BufNewFile", "InsertEnter" },
		dependencies = "nvim-treesitter",
		config = function()
			require("my_plugins.playground")
		end,
	},
	{
		"mrjones2014/nvim-ts-rainbow",
		event = { "BufRead", "BufNewFile", "InsertEnter" },
		dependencies = "nvim-treesitter",
		config = function()
			require("my_plugins.nvim-ts-rainbow")
		end,
	},
	{
		"s1n7ax/nvim-comment-frame",
		event = { "BufRead", "BufNewFile", "InsertEnter" },
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
				event = { "FocusLost", "CursorHold" },
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
			-- require("my_plugins.lsp_config").config()
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = "mason.nvim",
		event = { "FocusLost", "CursorHold" },
		config = function()
			require("my_plugins.null-ls")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "onsails/lspkind-nvim" },
			{ "hrsh7th/cmp-nvim-lua", ft = "lua" },
			{ "hrsh7th/cmp-path", event = "CmdlineEnter" },
			{ "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
			{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
			{
				"saadparwaiz1/cmp_luasnip",
				event = "InsertEnter",
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
			{ "hrsh7th/cmp-omni", event = "InsertEnter" },
			{ "f3fora/cmp-spell", event = "InsertEnter" },
			{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
			{ "ray-x/cmp-treesitter", event = "InsertEnter" },
			{
				"windwp/nvim-autopairs",
				-- event="InsertEnter",
				config = function()
					-- require("my_plugins.nvim-autopairs")
					require("nvim-autopairs").setup()
				end,
			},
		},
		config = function()
			require("my_plugins.nvim-cmp")
		end,
	},
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	{ "dstein64/vim-startuptime", cmd = "StartupTime" }, --# not lua,({
	{
		"nvim-zh/colorful-winsep.nvim",
		event = "WinEnter",
		config = function()
			require("colorful-winsep").setup()
		end,
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-lua/popup.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		run = ":CatppuccinCompile",
		config = function()
			vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup()
			vim.api.nvim_command("colorscheme catppuccin")
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
		event = "QuickFixCmdPre",
		config = function()
			require("my_plugins.vim-toggle-quickfix")
		end,
	},
	{
		"mvllow/modes.nvim",
		event = "ModeChanged",
		config = function()
			require("modes").setup()
		end,
	},
	{ "rinx/nvim-minimap", cmd = { "MinimapOpen" } },
	{
		"xiyaowong/nvim-cursorword",
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
		event = "CursorHold",
		config = function()
			require("my_plugins.marks")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		-- event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		event = { "UIEnter" },
		dependencies = {
			{ "kyazdani42/nvim-web-devicons" },
			{
				"SmiteshP/nvim-navic",
				event = { "FocusLost", "CursorHold" },
				config = function()
					require("my_plugins.nvim-navic").setup()
				end,
			},
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
		version = "v3.*",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		config = function()
			require("my_plugins.bufferline")
		end,
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{
		"petertriho/nvim-scrollbar",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		dependencies = {
			"kevinhwang91/nvim-hlslens",
			event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
			config = function()
				require("my_plugins.hlslens")
			end,
		},
		dependencies = "nvim-hlslens",
		config = function()
			require("my_plugins.nvim-scrollbar")
		end,
	},
	{ "MunifTanjim/nui.nvim", lazy = true },
	{
		"folke/noice.nvim",
		event = { "BufRead", "BufNewFile", "InsertEnter", "CmdlineEnter" },
		-- lazy = true,
		config = function()
			require("my_plugins.noice")
		end,
		-- init = function()
		--     require("my_plugins.noice_init")
		-- end,
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			-- { "rcarriga/nvim-notify", module = "notify" },
			{
				"rcarriga/nvim-notify",
				-- config = lazy_require("notify").init {
				-- render = "minimal",
				-- -- background_colour = require "core.utils.palette"("nord").black,
				-- level = "trace",
				-- on_open = function(win)
				-- api.win_set_config(win, { focusable = false })
				-- end,
				-- },
			},
		},
		dependencies = { "nvim-treesitter" },
	},
	{
		"PHSix/faster.nvim",
		keys = { "j", "k" },
		config = function()
			require("my_plugins.faster")
		end,
	},
	{
		"kana/vim-smartchr",
		event = "InsertEnter",
		config = function()
			require("my_plugins.vim-smartchr")
		end,
	},
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
		event = "BufRead",
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
			vim.api.nvim_set_keymap("n", "zz", "<cmd>lua require'hop'.hint_words()<CR>", {})
		end,
		config = function()
			require("my_plugins.hop")
		end,
	},
	{
		"skywind3000/asyncrun.vim",
		ft = { "seq", "python" },
		dependencies = {
			"mh21/errormarker.vim",
			--lazy = true,
			config = function()
				--# not lua
				require("my_plugins.errormarker")
			end,
		},
		--dependencies = { "mh21/errormarker.vim" },
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
	{
		"soramugi/auto-ctags.vim",
		event = "BufRead",
		config = function()
			require("my_plugins.auto-ctags")
		end,
	},
	{
		"majutsushi/tagbar",
		config = function()
			require("my_plugins.tagbar")
		end,
		cmd = "TagbarToggle",
		init = function()
			vim.api.nvim_set_keymap("n", "<F8>", "<Cmd>TagbarToggle<CR>", { noremap = true })
		end,
	},
	{ "MTDL9/vim-log-highlighting", ft = "log" },
	{ "mechatroner/rainbow_csv", ft = "csv" },
	{ "lark-parser/vim-lark-syntax", ft = "lark" },
	{ dir = "~/vimfiles/localplugins/seq.vim", ft = "seq" },
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},
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
	{
		"sentriz/vim-print-debug",
		event = { "FocusLost", "CursorHold", "InsertEnter" },
		config = function()
			require("my_plugins.vim-print-debug")
		end,
	},
})
