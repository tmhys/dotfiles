local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
    impatient.enable_profile()
end
require("options")
require("maps")
require("autocmds")
require("plugins")
vim.cmd("colorscheme ayu")

-- gui‚²‚Æ‚Ìİ’è
if vim.g.nvy then
    vim.opt.guifont = "PlemolJP Console NF:h12"
end
