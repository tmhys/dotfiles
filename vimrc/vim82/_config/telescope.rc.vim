"if !exists('g:loaded_telescope') | finish | endif
UsePlugin 'telescope.nvim'


nnoremap    [telescope]   <Nop>
nmap    <Space>t [telescope]
"
nnoremap <silent> [telescope]f <cmd>Telescope find_files<cr>
nnoremap <silent> [telescope]b <cmd>Telescope buffers<cr>
nnoremap <silent> [telescope]g <cmd>Telescope live_grep<cr>
nnoremap <silent> [telescope]t <cmd>Telescope help_tags<cr>
nnoremap <silent> [telescope]m <cmd>Telescope oldfiles<cr>
nnoremap <silent> [telescope]v <cmd>Telescope find_files search_dirs=~/dotfiles/vimrc<cr>
"nnoremap <silent> [telescope]m :<C-u>CtrlPMRUFiles<CR>
"nnoremap <silent> [telescope]v :<C-u>telescope $HOME/dotfiles/vimrc<CR>
"nnoremap <silent> [telescope]a :<C-u>CtrlPMixed<CR>
"nnoremap <silent> [telescope]i :<C-u>CtrlPColorscheme<CR>
"nnoremap <silent> [telescope]k :<C-u>CtrlPMark<CR>

"nnoremap <silent> ;f <cmd>Telescope find_files<cr>
"nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
"nnoremap <silent> \\ <cmd>Telescope buffers<cr>
"nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<esc>"] = actions.close,
        ["jj"] = actions.close
      },
    },
  }
}


require('telescope').setup{
  defaults = {
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
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '═', '║', "=", "║", "╔", "╗", "╝", "╚" },
    --borderchars = { '─', '│', '─', '│', '+', '+', '+', '+' },
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

--require('telescope').setup{
--  defaults = {
--    mappings = {
--      n = {
--        ["esc"] = actions.close
--      },
--    },
--  }
--}
EOF
