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
		-----------------
		---- utility{{{
		-----------------
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "lewis6991/impatient.nvim" })
		use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
		use({ "vim-jp/vimdoc-ja", event = "VimEnter" })
		--}}}

		---------------
		-- memo{{{
		---------------
		use({
			"renerocksai/telekasten.nvim",
			after = { "telescope.nvim" },
			requires = { "renerocksai/calendar-vim" },
			config = function()
				require("my_plugins.telekasten")
			end,
			cmd = "Telekasten",
			-- setup = function()
		})
		--}}}

		---------------
		-- colorschemes{{{
		---------------
		use({ "sainnhe/gruvbox-material" })
		-- use({ "rafi/awesome-vim-colorschemes", opt = true })
		-- use({
		-- 	"EdenEast/nightfox.nvim",
		-- 	config = function()
		-- 		require("my_plugins.nightfox")
		-- 	end,
		-- 	event = "ColorSchemePre",
		-- })
		-- use({ "Mofiqul/dracula.nvim", event = "ColorSchemePre" })
		-- use({
		-- 	"rose-pine/neovim",
		-- 	as = "rose-pine",
		-- 	tag = "v1.*",
		-- 	config = function()
		-- 		require("my_plugins.rose-pine")
		-- 	end,
		-- 	event = "ColorSchemePre",
		-- })
		-- use({ "catppuccin/nvim", as = "catppuccin", event = "ColorSchemePre" })
		-- use({ "navarasu/onedark.nvim", event = "ColorSchemePre" })
		-- use({ "Th3Whit3Wolf/one-nvim", event = "ColorSchemePre" })
		-- use({ "folke/tokyonight.nvim", event = "ColorSchemePre" })
		-- use({ "Mofiqul/vscode.nvim", event = "ColorSchemePre" })
		-- use({ "rebelot/kanagawa.nvim", event = "ColorSchemePre" })
		--}}}

		---------------
		-- interface{{{
		---------------
        use({"xiyaowong/nvim-transparent",
			event = "VimEnter",
			config = function()
				require("my_plugins.nvim-transparent")
			end,
            -- cmd = "TransparentToggle"
        })
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			event = "VimEnter",
			config = function()
				require("my_plugins.alpha-nvim")
			end,
		})
		use({
			"folke/which-key.nvim",
			event = "VimEnter",
			config = function()
				require("my_plugins.which-key")
			end,
		})
		use({
			"kevinhwang91/nvim-bqf",
			ft = "qf",
			config = function()
				require("my_plugins.nvim-bqf")
			end,
		})
		use({
			"drmingdrmer/vim-toggle-quickfix",
			--ft = "qf",
			event = "QuickFixCmdPre",
			config = function()
				require("my_plugins.vim-toggle-quickfix")
			end,
		})
		-- �^�u������肷��ƃG���[���o��
		-- use({
		-- 	"sunjon/Shade.nvim",
		-- 	event = "WinNew",
		-- 	config = function()
		-- 		require("my_plugins.Shade")
		-- 	end,
		-- })
		use({
			"mvllow/modes.nvim",
			event = "ModeChanged",
			config = function()
				require("my_plugins.modes")
			end,
		})
		use({
			"rcarriga/nvim-notify",
			--event = "VimEnter",
			opt = true,
			config = function()
				require("my_plugins.nvim-notify")
			end,
		})
		-- �J�[�\���ړ������₷���Ȃ���
		use({
			"edluffy/specs.nvim",
			event = "CursorMoved",
			config = function()
				require("my_plugins.specs")
			end,
		})
		use({ "rinx/nvim-minimap", cmd = { "MinimapOpen" } })
		use({ "xiyaowong/nvim-cursorword", event = "CursorHold" })
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("my_plugins.indent-blankline")
			end,
		})
		use({ "mhinz/vim-signify", event = "VimEnter" })
		use({
			"chentoast/marks.nvim",
			event = "CursorHold",
			config = function()
				require("my_plugins.marks")
			end,
		})
		use({
			"nvim-lualine/lualine.nvim",
			event = "VimEnter",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("my_plugins.lualine")
			end,
		})
		use({
			"alvarosevilla95/luatab.nvim",
			event = "VimEnter",
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
		--acceralate jk
		use({
			"PHSix/faster.nvim",
			event = "VimEnter",
			config = function()
				require("my_plugins.faster")
			end,
		})
		--���j�[�N�����n�C���C�g
		use({
			"unblevable/quick-scope",
			event = "VimEnter",
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
			event = "BufRead",
			branch = "v1",
			-- cmd = "zz",
			-- setup = function()
			--              vim.api.nvim_set_keymap('n', 'zz', "<cmd>lua require'hop'.hint_words()<CR>", {})
			-- end,
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
			event = "VimEnter",
			config = function()
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
		-- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
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
			config = function()
				require("my_plugins.tagbar")
			end,
			cmd = "TagbarToggle",
			setup = function()
				vim.api.nvim_set_keymap("n", "<F8>", "<Cmd>TagbarToggle<CR>", { noremap = true })
			end,
		})
		--}}}

		---------------
		--filetype specific{{{
		---------------
		use({
			"iamcco/markdown-preview.nvim",
			ft = { "markdown" },
			run = ":call mkdp#util#install()",
		})
		use({
			"SidOfc/mkdx",
			ft = { "markdown" },
			setup = function()
				require("my_plugins.mkdx")
				-- vim.cmd("source ~/.config/nvim/rc/pluginsetup/mkdx.vim")
			end,
		})
		-- use({
		-- 	"skanehira/preview-markdown.vim",
		-- 	ft = { "markdown" },
		-- 	config = function()
		-- 		require("my_plugins.preview-markdown")
		-- 	end,
		-- })
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
			cmd = "Telescope",
			setup = function()
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>ff",
					"<cmd>Telescope find_files<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>f<Leader>",
					"<cmd>Telescope<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>fb",
					"<cmd>Telescope buffers<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>fg",
					"<cmd>Telescope live_grep<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap("n", "<Leader>ft", "<cmd>Telescope tags<CR>", { noremap = true, silent = true })
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>fm",
					"<cmd>Telescope oldfiles<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>fh",
					"<cmd>Telescope help_tags<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>fq",
					"<cmd>Telescope quickfix<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>fc",
					"<cmd>Telescope colorscheme<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>fv",
					"<cmd>Telescope find_files search_dirs=~/AppData/Local/nvim<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>fd",
					"<cmd>Telescope find_files search_dirs=~/dotfiles<CR>",
					{ noremap = true, silent = true }
				)
			end,
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		})
		use({ "nvim-telescope/telescope-symbols.nvim", after = { "telescope.nvim" } })
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
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
			event = "CursorHold",
			--branch = "0.5-compat",
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
			-- after = "nvim-treesitter/nvim-treesitter",
		})
		----����H
		--use({
		--	"nvim-treesitter/playground",
		--	config = function()
		--		require("my_plugins.playground")
		--	end,
		--	requires = "nvim-treesitter/nvim-treesitter",
		--})
		----����H
		--use({
		--	"theHamsta/nvim-dap-virtual-text",
		--	requires = { "mfussenegger/nvim-dap" },
		--	config = function()
		--		require("my_plugins.nvim-dap-virtual-text")
		--	end,
		--})
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
		use({ "hrsh7th/vim-vsnip", event = "InsertEnter" })

		use({
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
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

		--cmp��requires�ŋL�ڂ��Ă��邪�ʂŐݒ�K�v
		use({
			"windwp/nvim-autopairs",
			--event = "InsertEnter",
			--event = 'InsertEnter',
			after = "nvim-cmp",
			config = function()
				require("my_plugins.nvim-autopairs")
			end,
		})
		--}}}

		---------------
		--??? {{{
		---------------
		use({
			"lfilho/cosco.vim",
			event = "InsertEnter",
			config = function()
				require("my_plugins.cosco")
			end,
		})
		use({ "tpope/vim-repeat", event = "VimEnter" })
		use({ "jghauser/mkdir.nvim", event = "VimEnter" })
		use({ "stevearc/stickybuf.nvim", event = "VimEnter" })
		use({ "MTDL9/vim-log-highlighting", event = "VimEnter" })
		use({ "wadackel/nvim-syntax-info", opt = true })
		use({
			"Shatur/neovim-session-manager",
			event = "VimEnter",
			config = function()
				require("my_plugins.neovim-session-manager")
			end,
		})
		use({
			"sentriz/vim-print-debug",
			event = "VimEnter",
			config = function()
				require("my_plugins.vim-print-debug")
			end,
		})

		--{{{textobject�֘A
		--use({ "mfussenegger/nvim-treehopper", event = "VimEnter" })
		--}}}

		--use({ "gbprod/yanky.nvim ", event = "VimEnter" })
		--use({
		--	"rmagatti/auto-session", --event = "VimEnter",
		--	config = function()
		--		require("my_plugins.auto-session")
		--	end,
		--})
		--use({ "nvim-telescope/telescope-frecency.nvim" })

		--�֗������킩���̂ŃR�����g�A�E�g
		----�J�[�\�����̒P��n�C���C�g���܂������
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

		--use({
		--	"andymass/vim-matchup",
		--	event = "VimEnter",
		--	config = function()
		--		require("my_plugins.vim-matchup")
		--	end,
		--})

		--}}}

		---- others{{{
		use({ "~/vimfiles/localplugins/seq.vim" })
		-- use({ "~/vimfiles/localplugins/seq-calc.vim" })
		----}}}

		---------------
		--Comment {{{
		---------------
		use({
			"numToStr/Comment.nvim",
			event = "VimEnter",
			config = function()
				require("my_plugins.Comment")
			end,
		})
		use({
			"s1n7ax/nvim-comment-frame",
			event = "VimEnter",
			requires = {
				{ "nvim-treesitter" },
			},
			config = function()
				require("my_plugins.nvim-comment-frame")
			end,
		})
		--use({
		--	"b3nj5m1n/kommentary",
		--	event = "VimEnter",
		--	config = function()
		--		require("my_plugins.kommentary")
		--	end,
		--})
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
