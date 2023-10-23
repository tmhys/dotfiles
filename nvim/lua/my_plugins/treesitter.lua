require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "python", "lua", "vim", "vimdoc" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	-- ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "c", "rust" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

-- require("nvim-treesitter.configs").setup({
--  highlight = {
--      enable = true,
--      disable = {
--          -- 'lua',
--          -- 'ruby',
--          -- 'toml',
--          -- 'c_sharp',
--          -- "seq",
--      },
--  },
--  indent = {
--      disable = {
--          -- "seq",
--      },
--  },
--  rainbow = {
--      disable = {
--          -- "seq",
--      },
--  },
--  incremental_selection = {
--      disable = {
--          -- "seq",
--      },
--  },
--  -- ensure_installed = { "vim", "python", "toml", "lua","javascript" },
--  -- ensure_installed = "all",
-- })
--
-- -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- -- parser_config.seq = {
-- --  install_info = {
-- --      url = "~/vimfiles/tree-sitter-seq", -- local path or git repo
-- --      files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
-- --      -- optional entries:
-- --      branch = "main", -- default branch in case of git repo if different from master
-- --      generate_requires_npm = false, -- if stand-alone parser without npm dependencies
-- --      requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
-- --  },
-- --  filetype = "seq", -- if filetype does not match the parser name
-- -- }
