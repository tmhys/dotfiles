local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn  = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g   = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

---------------
--disable
---------------
g.did_install_default_menus = 1
g.did_install_syntax_menu   = 1
g.did_indent_on             = 1
g.did_load_ftplugin         = 1
g.loaded_2html_plugin       = 1
g.loaded_gzip               = 1
g.loaded_man                = 1
g.loaded_matchit            = 1
g.loaded_matchparen         = 1
g.loaded_netrwPlugin        = 1
g.loaded_remote_plugins     = 1
g.loaded_shada_plugin       = 1
g.loaded_spellfile_plugin   = 1
g.loaded_tarPlugin          = 1
g.loaded_tutor_mode_plugin  = 1
g.loaded_zipPlugin          = 1
g.skip_loading_mswin        = 1
g.loaded_clipboard_provider = 1 --checkhealthでエラーが出るようになる
g.loaded_getscript          = 1
g.loaded_getscriptPlugin    = 1
g.loaded_logiPat            = 1
g.loaded_netrwFileHandlers  = 1
g.loaded_netrwSettings      = 1
g.loaded_rplugin            = 1
g.loaded_rrhelper           = 1
g.loaded_spec               = 1
g.loaded_tar                = 1
g.loaded_vimball            = 1
g.loaded_vimballPlugin      = 1
g.loaded_zip                = 1
g.load_black                = 1
g.loaded_fzf                = 1
g.loaded_gtags              = 1
g.loaded_gtags_cscope       = 1
g.loaded_node_provider      = 0
g.loaded_perl_provider      = 0
g.loaded_python3_provider   = 0
g.loaded_python_provider    = 0
g.loaded_pythonx_provider   = 0
g.loaded_ruby_provider      = 0
g.do_filetype_lua           = 1
g.did_load_filetypes        = 0

---------------
--
---------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
opt.encoding       = 'UTF-8'
opt.fileformats    = 'dos,unix,mac'
opt.fileencodings  = {'cp932','sjis','UTF-8'} -- the encoding written to a file
opt.ambiwidth      = 'single' --doubleにすると表示が変
opt.autoindent     = true
opt.autoread       = true
opt.background     = "dark" --"dark" or "light"
opt.backup         = true
opt.backspace      = "indent,eol,start"
opt.backupdir      = fn.stdpath('config')..'/.undo'
opt.cmdheight      = 2
opt.completeopt    = 'menu,menuone,noselect'
opt.cursorline     = true -- highlight the current line
opt.makeencoding   = 'cp932'
opt.expandtab      = true                -- Use spaces instead of tabs
opt.ignorecase     = true               -- Ignore case
opt.laststatus     = 2
--opt.lazyredraw     = true
opt.matchtime      = 1
opt.matchpairs     = vim.bo.matchpairs .. ",<:>,「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”,｛:｝"--only vimrc option
opt.number         = true                   -- Show line numbers
opt.scrolloff      = 10                   -- Lines of context
opt.shiftwidth     = 4
opt.showmatch      = true
opt.showtabline    = 2
opt.signcolumn     = 'yes'
opt.smartcase      = true                -- Do not ignore case with capitals
opt.tabstop        = 4
opt.termguicolors  = true            -- True color support
opt.undodir        = fn.stdpath('config')..'/.undo'
opt.undofile       = true
opt.updatetime     = 250  -- update interval for gitsigns
opt.virtualedit    = 'block'
opt.wildmenu       = true
opt.wildmode       = 'full'
opt.writebackup    = true
opt.wrap           = false -- display lines as one long line only init.lua option
opt.timeoutlen     = 400 --only init.lua option
opt.smartindent    = true              -- Insert indents automatically only init.lua option
opt.sidescrolloff  = 8               -- Columns of context only init.lua optionj
opt.showmode       = false -- we don't need to see things like -- INSERT -- anymore only init.lua option
opt.shiftround     = true               -- Round indent only init.lua option
opt.pumheight      = 20 --only init.lua option
opt.numberwidth    = 4 -- set number column width to 2 {default 4} only init.lua option
opt.mouse          = "a" --only init.lua option
opt.list           = true                     -- Show some invisible characters  only init.lua option
opt.joinspaces     = false              -- No double spaces with join only init.lua option
opt.conceallevel   = 0 -- so that `` is visible in markdown files only init.lua option
opt.colorcolumn    = "99999" -- fixes indentline for now only init.lua option
opt.clipboard      = "unnamedplus"  -- allows neovim to access the system clipboard only init.lua option
opt.foldexpr       = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding only init.lua option
opt.foldmethod     = "manual" --only init.lua option
opt.hlsearch       = true -- highlight all matches on previous search pattern only init.lua option
opt.relativenumber = false -- set relative numbered lines only init.lua option
opt.ruler          = false --only init.lua option
opt.spell          = false --only init.lua option
opt.spelllang      = "en" --only init.lua option
opt.splitbelow     = true               -- Put new windows below current only init.lua option
opt.splitright     = true               -- Put new windows right of current only init.lua option
opt.title          = true -- set the title of window to the value of the titlestring only init.lua option
vim.o.errorbells   = false-- ビープ音除去
vim.o.visualbell   = false-- ビープ音除去
--opt.shortmess 	   = vim.o.shortmess
--                		.. "I"
--                		.. "c" -- silence insert mode completion messages
--                		--.. "F" -- Don't print a message when opening a file
--                		--.. "c" -- silence insert mode completion messages
vim.opt.shortmess = {
  A = true, -- ignore annoying swap file messages
--F = true, -- Don't give file info when editing a file, NOTE: this breaks autocommand messages
  I = true,
  O = true, -- file-read message overwrites previous
  T = true, -- truncate non-file messages in middle
  W = true, -- Don't show [w] or written when writing
  c = true,-- silence insert mode completion messages
  f = true, -- (file x of x) instead of just (x of x
  o = true, -- file-read message overwrites previous
  s = true,
  t = true, -- truncate file messages at start
}
vim.opt.fillchars = {
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}

opt.wildignore = {
  ".DS_Store",
  ".git",
  ".svn",
  ".hg",
  "*.a",
  "*.o",
  "*.obj",
  "*.out",
  "*.so",
  "*.dll",
  "*.exe",
  "*.bin",
  "*~",
  "*.swp",
  "*.tmp",
  "*.bmp",
  "*.gif",
  "*.ico",
  "*.jpg",
  "*.jpeg",
  "*.png",
  "__pycache__",
  "*.pyc",
  "*pycache*",
  "*.tar",
  "*.gz",
  "*.bz2",
  "*.zstd",
  "*.xz",
  "*.zip",
  '*.ttf',
  '*.otf',
  '*.woff',
  '*.woff2',
  '*.eot'
}

opt.sessionoptions = opt.sessionoptions
              - "blank"        -- Don't save empty windows in the session
              - "buffers"      -- Don't save hidden buffers into the session
              - "help"         -- Ignore the help buffer for sessions
              - "options"      -- Don't save any vim options (this list)
              - "globals"      -- Ignore any g:-variables
              + "localoptions" -- Include buffer local overrides             + "tabpages"     -- This session is for all tabs, not individual ones
opt.hidden         = true                   -- Enable background buffers only init.lua option

---------------
-- nvim only
---------------
opt.inccommand     = 'split'
opt.pumblend       = 10
