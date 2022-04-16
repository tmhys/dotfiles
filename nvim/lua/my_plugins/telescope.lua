local M = {}
M.setup = function()
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<esc>"] = actions.close
        --["jj"] = actions.close
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {"%.dll","%.exe","%.qm","%.dat"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    --borderchars = {
	--  --style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    --  { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    --  prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    --  results = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    -- review = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    --},
--    borderchars = {
--    prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
--    results = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
-- review = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
--  },
    --borderchars = { '═', '║', "=", "║", "╔", "╗", "╝", "╚" },
    --borderchars = { '─', '│', '─', '│', '+', '+', '+', '+' },
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
  }

--vim.api.nvim_set_keymap('n', '<Space>f', '<telescope>', {})
vim.api.nvim_set_keymap('n', '<Space>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>f<Space>', '<cmd>Telescope<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>ft', '<cmd>Telescope tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fm', '<cmd>Telescope oldfiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fq', '<cmd>Telescope quickfix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fc', '<cmd>Telescope colorscheme<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fv', '<cmd>Telescope find_files search_dirs=~/AppData/Local/nvim<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fd', '<cmd>Telescope find_files search_dirs=~/dotfiles<CR>', { noremap = true, silent = true })
end
return M
