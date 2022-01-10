local vim=vim
require('impatient')
require("options")
--require("maps")
vim.cmd("source $HOME/AppData/Local/nvim/viml/maps.vim")
--require("autocmd")
vim.cmd("source $HOME/AppData/Local/nvim/viml/autocmd.vim")
--Packer
require("plugins")
vim.cmd("colorscheme gruvbox")
