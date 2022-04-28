---------------
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
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "lewis6991/impatient.nvim" })
		--use({ "nathom/filetype.nvim" })
		--use({ "tjdevries/astronauta.nvim" })
		-- nvim CursorHold bug fix
		--use({
		--	"antoinemadec/FixCursorHold.nvim",
		--	config = function()
		--		require("my_plugins.FixCursorHold")
		--	end,
		--})
		use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
		use({ "vim-jp/vimdoc-ja", event = "VimEnter" })
		--}}}
		---------------
		-- colorschemes{{{
		---------------
		use({ "rafi/awesome-vim-colorschemes", opt = true })
		use({
			"sainnhe/gruvbox-material",
			--opt = true
		})
		use({
			"Mofiqul/dracula.nvim",
			--opt = true
		})
		use({
			"rose-pine/neovim",
			as = "rose-pine",
			tag = "v1.*",
			config = function()
				require("my_plugins.rose-pine")
			end,
		})
		use({
			"catppuccin/nvim",
			as = "catppuccin",
		})
		use({
			"navarasu/onedark.nvim",
			--opt = true
		})
		use({
			"Th3Whit3Wolf/one-nvim",
			--opt = true
		})
		use({
			"folke/tokyonight.nvim",
			--opt = true
		})
		use({
			"Mofiqul/vscode.nvim",
			--opt = true
		})
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
			"sunjon/Shade.nvim",
			event = "VimEnter",
			config = function()
				require("my_plugins.Shade")
			end,
		})
		use({
			"mvllow/modes.nvim",
			event = "VimEnter",
			config = function()
				require("my_plugins.modes")
			end,
		})
		use({
			"rcarriga/nvim-notify",
			event = "VimEnter",
			config = function()
				require("my_plugins.nvim-notify")
			end,
		})
		-- カーソル移動が見やすくなるやつ
		use({
			"edluffy/specs.nvim",
			event = "VimEnter",
			config = function()
				require("my_plugins.specs")
			end,
		})
		use({ "rinx/nvim-minimap", cmd = { "MinimapOpen" } })
		use({ "xiyaowong/nvim-cursorword", event = "CursorHold" })
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "VimEnter",
			config = function()
				require("my_plugins.indent-blankline")
			end,
		})
		use({ "mhinz/vim-signify", event = "VimEnter" })
		use({
			"chentau/marks.nvim",
			--event = "VimEnter",
			config = function()
				require("my_plugins.marks")
			end,
		})
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			--requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/lsp-status.nvim" },
			config = function()
				require("my_plugins.lualine")
			end,
		})
		use({
			"alvarosevilla95/luatab.nvim",
			config = function()
				require("my_plugins.luatab")
			end,
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		use({
			"SmiteshP/nvim-gps",
			after = "nvim-treesitter",
			config = function()
				require("my_plugins.gps")
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		})
		use({
			"kevinhwang91/nvim-hlslens",
			event = "VimEnter",
			config = function()
				require("my_plugins.hlslens")
			end,
		})
		use({
			"petertriho/nvim-scrollbar",
			--event = "VimEnter",
			after = "nvim-hlslens",
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
		use({ "tpope/vim-surround", event = "InsertEnter" })
		--use({ "thinca/vim-qfreplace", ft = "qf" })
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
			"b3nj5m1n/kommentary",
			event = "VimEnter",
			config = function()
				require("my_plugins.kommentary")
			end,
		})
		--acceralate jk
		use({
			"PHSix/faster.nvim",
			event = "VimEnter",
			config = function()
				require("my_plugins.faster")
			end,
		})
		--ユニーク文字ハイライト
		use({
			"unblevable/quick-scope",
			event = "VimEnter",
			--event = "VimEnter",
			config = function()
				require("my_plugins.quick-scope")
			end,
		})
		use({
			"rhysd/clever-f.vim",
			event = "VimEnter",
			config = function()
				require("my_plugins.clever-f")
			end,
		})
		use({
			"phaazon/hop.nvim",
			event = "VimEnter",
			config = "v1",
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
			event = "VimEnter", --lazy load できない？
			config = function()
				--vim.api.nvim_set_keymap("n", "<Space>r", "<Cmd>AsyncRun python  -u %<CR>" ,{noremap = true, silent =true})--これはさすがにワークする
				require("my_plugins.asyncrun")
			end,
		})
		use({
			"mh21/errormarker.vim",
			after = "asyncrun.vim",
			config = function()
				require("my_plugins.errormarker")
			end,
		})
		--}}}

		---------------
		--git{{{
		---------------
		use({
			"tpope/vim-fugitive",
			event = "VimEnter",
			config = function()
				require("my_plugins.fugitive")
			end,
		})
		--}}}

		---------------
		--tags{{{
		---------------
		use({
			"ludovicchabant/vim-gutentags",
			event = "VimEnter",
		})
		use({
			"majutsushi/tagbar",
			event = "VimEnter",
			config = function()
				require("my_plugins.tagbar")
			end,
		})
		--}}}

		---------------
		--filetype specific{{{
		---------------
		use({
			"skanehira/preview-markdown.vim",
			ft = { "markdown" },
			config = function()
				require("my_plugins.preview-markdown")
			end,
		})
		use({ "mechatroner/rainbow_csv", ft = { "csv" } })
		use({ "lark-parser/vim-lark-syntax", ft = { "lark" } })
		use({ "osyo-manga/vim-precious", requires = "Shougo/context_filetype.vim", ft = { "lua", "toml" } })
		--}}}

		---------------
		-- fuzzy finder{{{
		---------------
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("my_plugins.telescope").setup()
			end,
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		})

		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("my_plugins.nvim-tree")
			end,
		})
		--}}}

		---------------
		-- treesitter{{{
		---------------
		use({
			"nvim-treesitter/nvim-treesitter",
			branch = "0.5-compat",
			run = ":TSUpdate",
			config = function()
				require("my_plugins.treesitter")
			end,
		})
		use({
			"p00f/nvim-ts-rainbow",
			config = function()
				require("my_plugins.nvim-ts-rainbow")
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		})
		--いる？
		use({
			"nvim-treesitter/playground",
			config = function()
				require("my_plugins.playground")
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		})
		--いる？
		use({
			"theHamsta/nvim-dap-virtual-text",
			requires = { "mfussenegger/nvim-dap" },
			config = function()
				require("my_plugins.nvim-dap-virtual-text")
			end,
		})
		--}}}

		---------------
		-- lsp{{{
		---------------
		use({
			"neovim/nvim-lspconfig",
			after = "cmp-nvim-lsp",
			config = function()
				require("my_plugins.lspconfig")
			end,
		})
		use({
			"williamboman/nvim-lsp-installer",
			after = { "nvim-lspconfig", "lsp_signature.nvim" },
			config = function()
				require("my_plugins.lsp-installer")
			end,
		})
		use({
			"ray-x/lsp_signature.nvim",
			after = "nvim-lspconfig",
			config = function()
				require("my_plugins.lsp-signature")
			end,
		})
		use({ "weilbith/nvim-lsp-smag", after = "nvim-lspconfig" })
		use({
			"j-hui/fidget.nvim",
			after = "nvim-lspconfig",
			config = function()
				require("my_plugins.fidget")
			end,
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("my_plugins.null-ls")
			end,
		})
		--}}}

		---------------
		--lsp ui{{{
		---------------
		use({
			"tami5/lspsaga.nvim",
			after = "nvim-lsp-installer",
			config = function()
				require("my_plugins.lspsaga")
			end,
		})
		use({
			"folke/trouble.nvim",
			requires = { "folke/lsp-colors.nvim" },
			after = "nvim-lsp-installer",
			config = function()
				require("my_plugins.trouble")
			end,
		})
		--}}}

		---------------
		-- completion{{{
		---------------
		--cmpのrequiresで記載しているが個別で設定必要
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("my_plugins.nvim-autopairs")
			end,
		})
		use({ "hrsh7th/vim-vsnip", event = "InsertEnter" })

		use({
			"hrsh7th/nvim-cmp",
			--event = "InsertEnter",
			after = { "vim-vsnip" },
			requires = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "onsails/lspkind-nvim" },
				{ "hrsh7th/cmp-omni", after = "nvim-cmp" },
				{ "f3fora/cmp-spell", after = "nvim-cmp" },
				{ "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
				{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
				{ "ray-x/cmp-treesitter", after = "nvim-cmp" },
				{ "tzachar/cmp-tabnine", after = "nvim-cmp", run = "powershell ./install.ps1" },
				{ "quangnguyen30192/cmp-nvim-tags", after = "nvim-cmp" },
			},
			config = function()
				require("my_plugins.nvim-cmp")
			end,
		})
		--}}}

		---------------
		--??? {{{
		---------------
		use({ "lfilho/cosco.vim", event = "InsertEnter" })
		use({ "jghauser/mkdir.nvim", event = "VimEnter" })
		use({ "stevearc/stickybuf.nvim", event = "VimEnter" })
		--use({ "gbprod/yanky.nvim ", event = "VimEnter" })
		--use({ 'rmagatti/auto-session', --event = "VimEnter",
		--	config = function()
		--		require("my_plugins.auto-session")
		--	end,
		--})
		--use({ "nvim-telescope/telescope-frecency.nvim" })

		--便利さがわからんのでコメントアウト
		----カーソル下の単語ハイライトしまくれるやつ
		--use({
		--	"t9md/vim-quickhl",
		--	event = "BufReadPost",
		--	--event = "VimEnter",
		--	config = function()
		--		require("my_plugins.vim-quickhl")
		--	end,
		--})
		--use({ "mhinz/vim-sayonara", cmd = "Sayonara" })

		--use({
		--	"voldikss/vim-translator",
		--	event = "VimEnter",
		--	config = function()
		--		require("my_plugins.vim-translator")
		--	end,
		--})

		--}}}

		---- others{{{
		use({ "~/vimfiles/localplugins/seq.vim" })
		----}}}
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
