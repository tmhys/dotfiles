local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
    impatient.enable_profile()
else
    vim.notify(impatient)
end

require("options")
require("maps")
require("autocmds")
-- require("plugins")
require("lazy_plugins")
