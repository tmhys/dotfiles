local icons = require("icons")
local function is_available_navic()
	local ok, _ = pcall(require, "nvim-navic")
	if not ok then
		return false
	end
	return require("nvim-navic").is_available()
end

local function tagname()
	local p = vim.fn["tagbar#currenttag"]("%s", "")
	return p
end

local navic = require("nvim-navic")
local sections_1 = {
	-- lualine_a = { "mode" },
	lualine_a = {},
	lualine_b = { { "filetype", icon_only = true }, { "filename" } },
	lualine_c = { tagname },
	lualine_x = {
		{
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = {
				error = icons.diagnostics.BoldError .. " ",
				warn = icons.diagnostics.BoldWarning .. " ",
				info = icons.diagnostics.BoldInformation .. " ",
				hint = icons.diagnostics.BoldHint .. " ",
			},
		},
	},
	lualine_y = { { "branch", "diff", "g:asyncrun_status" }, { "location" } },
	-- lualine_z = { "location" },
	lualine_z = {},
}

local sections_2 = {
	lualine_a = { "mode" },
	lualine_b = { "" },
	lualine_c = { { "filetype", icon_only = true }, { "filename", path = 1 } },
	lualine_x = { "encoding", "fileformat", "filetype" },
	lualine_y = { "filesize", "progress" },
	lualine_z = { "location" },
}

function LualineToggle()
	local lualine_require = require("lualine_require")
	local modules = lualine_require.lazy_require({ config_module = "lualine.config" })
	local utils = require("lualine.utils.utils")

	local current_config = modules.config_module.get_config()
	if vim.inspect(current_config.sections) == vim.inspect(sections_1) then
		current_config.sections = utils.deepcopy(sections_2)
	else
		current_config.sections = utils.deepcopy(sections_1)
	end
	require("lualine").setup(current_config)
end

vim.api.nvim_set_keymap("n", "!", "<Cmd>lua LualineToggle()<CR>", { noremap = true, silent = true })

local my_extension = {
	sections = { lualine_b = { "filetype" } },
	filetypes = { "packager", "vista", "NvimTree", "coc-explorer", "tagbar" },
}

require("lualine").setup({
	options = {
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		icons_enabled = true,
		globalstatus = true,
		--theme = "nightfox",
		-- theme = "16color",
		disabled_filetypes = {},
		always_divide_middle = true,
		refresh = { -- sets how often lualine should refresh it's contents (in ms)
			-- statusline = 10000, -- The refresh option sets minimum time that lualine tries
			-- tabline = 1000,            -- to maintain between refresh. It's not guarantied if situation
			-- winbar = 1000              -- arises that lualine needs to refresh itself before this time
		},
	},
	sections = sections_1,
	winbar = {},
	inactive_sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "quickfix", my_toggleterm, "symbols-outline", my_extension },
})
