if vim.loader then
    vim.loader.enable()
end

require("options")
require("maps")
vim.schedule(function()
  require("autocmds")
end)
require("lazy_plugins")

-- clipboard �̐ݒ��x�����[�h
-- if vim.fn.has("clipboard") == 1 then
--     vim.defer_fn(function()
--         vim.cmd("call GuiClipboard()")
--     end, 100)
-- end
