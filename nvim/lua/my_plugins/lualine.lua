local function is_available_navic()
    local ok, _ = pcall(require, "nvim-navic")
    if not ok then
        return false
    end
    return require("nvim-navic").is_available()
end
local navic = require("nvim-navic")
local sections_1 = {
    lualine_a = { "mode" },
    lualine_b = { { "filetype", icon_only = true }, { "filename" } },
    lualine_c = { { navic.get_location,cond = navic.is_available} },
    -- lualine_c = { { 'require("nvim-gps").get_location()', cond = is_available_gps } },
    -- lualine_x = { "diagnostics"  },
    lualine_x = {
    {
      'diagnostics',

      -- Table of diagnostic sources, available sources are:
      --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
      -- or a function that returns a table as such:
      --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
      sources = { 'nvim_diagnostic'},


      -- symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
      symbols = {error = '🅴 ', warn = '🆆"', info = '🅸 ', hint = '🅷 '},
    }
  },
    lualine_y = { "branch", "diff", "g:asyncrun_status" },
    lualine_z = { "location" },
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
        icons_enabled = true,
        --theme = "nightfox",
        theme = "auto",
        --component_separators = { left = '', right = ''},
        --section_separators = { left = '', right = ''},
        --component_separators = { left = '薰ｱ', right = '薰ｳ'},
        --section_separators = { left = '薰ｰ', right = '薰ｲ'},
        ----component_separators = { left = "\ue0b0", right = "\ue0b2" },
        ----section_separators = { left = "\ue0b1", right = "\ue0b3" },
        --component_separators = { left = "", right = "" },
        --section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    -- sections = sections_1,
    winbar = sections_1,
    inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    --extensions = { "quickfix", my_toggleterm, "symbols-outline", my_extension },
    extensions = { "quickfix", my_toggleterm, "symbols-outline", my_extension },
})

vim.opt.laststatus = 0
