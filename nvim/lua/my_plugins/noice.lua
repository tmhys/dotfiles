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
require("noice").setup {
  cmdline = {
    -- format = {
    --   cmdline = { icon = "" },
    --   search_down = { icon = "" },
    --   search_up = { icon = "" },
    --   filter = { icon = "" },
    -- },
  },
  popupmenu = {
    --backend = "cmp",
    backend = "nui",
  },
  lsp = {
    hover = {
      enabled = true,
    },
    signature = {
      enabled = true,
    },
  },
  format = {
    spinner = {
      name = "dots12",
      --name = "sand",
    },
  },
  }
