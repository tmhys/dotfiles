-- require("noice").setup({
--     popupmenu = {
--         backend = "cmp", -- backend to use to show regular cmdline completions
--     },
--     lsp = {
--         progress = {
--             enabled = false,
--         },
--         signature = {
--             -- enabled = true,
--             enabled = false,
--         },
--     },
-- })
require("noice").setup({
  cmdline = {
      enabled = false,
    -- format = {
    --   cmdline = { icon = "" },
    --   search_down = { icon = "" },
    --   search_up = { icon = "" },
    --   filter = { icon = "" },
    -- },
  },
  popupmenu = {
      enabled = false,
    backend = "cmp",
    -- backend = "nui",
  },
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    progress = {
      enabled = true,
    },
  },
  format = {
    spinner = {
      name = "dots12",
      --name = "sand",
    },
  },
  messages = {
      enabled = false,
      view_search = false,
  },
  })
