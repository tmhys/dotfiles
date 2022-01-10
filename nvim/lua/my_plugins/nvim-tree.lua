-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {".git",".svn",".dat",".dbg",".exe"}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}


vim.g.nvim_tree_disable_window_picker = 1 --0 by default, will disable the window picker.
--vim.g.nvim_tree_icon_padding = '  ' --one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
--vim.g.nvim_tree_indent_markers = 1 --0 by default, this option shows indent markers when folders are open
--vim.g.nvim_tree_respect_buf_cwd = 1 --0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
--vim.g.nvim_tree_symlink_arrow = ' >> ' -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
--vim.g.nvim_tree_window_picker_exclude = {
--       filetype= {
--         packer,
--         qf
--	 },
--       buftype= {
--         terminal
--     }}
---- Dictionary of buffer option names mapped to a list of option values that
---- indicates to the window picker that the buffer's window should not be
---- selectable.
--vim.g.nvim_tree_show_icons = {
--     git= 1,
--     folders= 1,
--     files= 1,
--     folder_arrows= 1,
--     }
----If 0, do not show the icons for one of 'git' 'folder' and 'files'
----1 by default, notice that if 'files' is 1, it will only display
----if nvim-web-devicons is installed and on your runtimepath.
----if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
----but this will not work when you set indent_markers (because of UI conflict)
--
---- default will show icon by default if no icon is provided
---- default shows no icon by default
--vim.g.nvim_tree_icons = {
--     default= ,
--     symlink= ,
--     git= {
--       unstaged= "✗",
--       staged= "✓",
--       unmerged= "",
--       renamed= "➜",
--       untracked= "★",
--       deleted= "",
--       ignored= "◌"
--       },
--     folder= {
--       arrow_open= "",
--       arrow_closed= "",
--       default= "",
--       open= "",
--       empty= "",
--       empty_open= "",
--       symlink= "",
--       symlink_open= ""
--       },
--       lsp= {
--         hint= "",
--         info= "",
--         warning= "",
--         error= "",
--       }
--     }
--
--require'nvim-tree'.setup {
--  disable_netrw       = true,
--  hijack_netrw        = true,
--  open_on_setup       = false,
--  ignore_ft_on_setup  = {},
--  update_to_buf_dir   = {
--    enable = true,
--    auto_open = true,
--  },
--  auto_close          = false,
--  open_on_tab         = false,
--  update_cwd          = true,
--  update_focused_file = {
--    enable      = false,
--    update_cwd  = true,
--    ignore_list = {}
--  },
--  system_open = {
--    cmd  = nil,
--    args = {}
--  },
--  filters = {
--    dotfiles = false,
--    custom = {".git",".svn",".dat",".dbg",".exe"}
--  },
--  view = {
--    width = 30,
--    height = 30,
--    side = 'left',
--    auto_resize = false,
--    mappings = {
--      custom_only = false,
--      list = {}
--    }
--  }
--}
----vim.cmd('au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif')
--
--
----nnoremap <C-n> =NvimTreeToggle<CR>
----au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
----
--
----tree_TreeToggle = function()
----	if (not packer_plugins['barbar.nvim'].loaded) or (not packer_plugins['nvim-tree.lua'].loaded) then
----      vim.cmd [[packadd barbar.nvim]]
----	  vim.cmd [[packadd nvim-tree.lua]]
----    end
----
----	local tree = require'nvim-tree'
----	local view = require'nvim-tree.view'
----	local lib = require'nvim-tree.lib'
----
----	if view.win_open() then
----		require'bufferline.state'.set_offset(0)
----		view.close()
----	else
----		--if vim.g.nvim_tree_follow == 1 then
----		--	require'bufferline.state'.set_offset(31, 'File Explorer')
----        --    -- tree.find_files(true)
----		--end
----		if not view.win_open() then
----			require'bufferline.state'.set_offset(31, 'File Explorer')
----			lib.open()
----		end
----	end
----end
------
------vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent= true })
----vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>lua tree_TreeToggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
