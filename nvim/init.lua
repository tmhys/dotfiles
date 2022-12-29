local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
	impatient.enable_profile()
else
	vim.notify(impatient)
end

require("options")
require("maps")
require("autocmds")
require("plugins")

-- if vim.g.nvy then
--     -- vim.opt.guifont = "JetBrains Mono:h10"
--     vim.opt.guifont = "PlemolJP Console NF:h12"
--     -- vim.opt.guifont = "Cica:h12"
-- end
