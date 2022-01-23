--vim.api.nvim_set_keymap('n', '<CR>', '<cmd>FineCmdline<CR>', {noremap = true})
require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ': '
  },
  popup = {
    position = {
      row = '10%',
      col = '50%',
    },
    size = {
      width = '60%',
    },
    border = {
      style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      --style = 'rounded',
    },
    --win_options = {
    --  winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    --},
  },
  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,
    set_keymaps = function(imap, feedkeys)
      -- Restore default keybindings...
      -- Except for `<Tab>`, that's what everyone uses to autocomplete
      imap('<Esc>', fn.close)
      imap('qq', fn.close)
      imap('jj', fn.close)

      imap('<Up>', fn.up_search_history)
      imap('<Down>', fn.down_search_history)
    end
  }
})
vim.api.nvim_set_keymap('n', ';', '<cmd>FineCmdline<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
