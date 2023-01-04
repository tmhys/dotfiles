-- local api = require("core.utils").api
-- local palette = require "core.utils.palette" "nord"

-- HACK: avoid to set duplicatedly (ex. after PackerCompile)
if not _G.__vim_notify_overwritten then
  vim.notify = function(...)
    local args = { ... }
    require "notify"
    require "noice"
    vim.schedule(function()
      vim.notify(unpack(args))
    end)
  end
  _G.__vim_notify_overwritten = true
end

-- api.create_autocmd("ColorScheme", {
--   group = api.create_augroup("noice-colors", {}),
--   pattern = "nord",
--   callback = function()
--     api.set_hl(0, "NoiceLspProgressSpinner", { fg = palette.white })
--     api.set_hl(0, "NoiceLspProgressTitle", { fg = palette.orange })
--     api.set_hl(0, "NoiceLspProgressClient", { fg = palette.yellow })
-- end,
-- })
