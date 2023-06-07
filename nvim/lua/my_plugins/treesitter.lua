require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = {
			-- 'lua',
			-- 'ruby',
			-- 'toml',
			-- 'c_sharp',
			-- "seq",
		},
	},
	indent = {
		disable = {
			-- "seq",
		},
	},
	rainbow = {
		disable = {
			-- "seq",
		},
	},
	incremental_selection = {
		disable = {
			-- "seq",
		},
	},
	-- nvimGPS = {
	--     disable = {
	--         "seq",
	--     },
	-- },
	--ensure_installed = { "vim", "lua", "python", "toml" },
	--ensure_installed = { "vim", "python", "toml", "lua" ,"seq"},
	-- ensure_installed = { "vim", "python", "toml", "lua","javascript" },
	ensure_installed = "all",
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.seq = {
	install_info = {
		url = "~/vimfiles/tree-sitter-seq", -- local path or git repo
		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		branch = "main", -- default branch in case of git repo if different from master
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
	filetype = "seq", -- if filetype does not match the parser name
}
