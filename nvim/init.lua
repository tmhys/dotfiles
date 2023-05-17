if vim.loader then
	vim.loader.enable()
end

require("options")
require("maps")
require("autocmds")
require("lazy_plugins")
