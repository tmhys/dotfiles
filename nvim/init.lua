if vim.loader then
	vim.loader.enable()
end
require("options")
require("maps")
require("autocmds")
require("lazy_plugins")

if vim.fn.has("clipboard") == 1 then
	vim.cmd("call GuiClipboard()")
end
