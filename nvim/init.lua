-- local impatient_ok, impatient = pcall(require, "impatient")
-- if impatient_ok then
--  impatient.enable_profile()
-- else
--  vim.notify(impatient)
-- end
if vim.loader then
	vim.loader.enable()
end

require("options")
require("maps")
require("autocmds")
require("lazy_plugins")
