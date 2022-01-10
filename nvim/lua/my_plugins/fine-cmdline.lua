vim.api.nvim_set_keymap(
  'n',
  ':',
  '<cmd>lua require("fine-cmdline").open()<CR>',
  {noremap = true}
)
vim.api.nvim_set_keymap(
  'n',
  ';',
  '<cmd>lua require("fine-cmdline").open()<CR>',
  {noremap = true}
)


local fineline = require('fine-cmdline')
local fn = fineline.fn

require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = false
  },
  popup = {
    buf_options = {
      filetype = 'FineCmdlinePrompt',
    },
    position = {
      row = '30%',
      col = '50%',
    },
    size = {
      width = '60%',
      height = 1
    },
    win_options = {
      winblend=10,
      --winhighlight = 'Normal:Normal',
    },
    border = {
	  style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      --style = 'rounded',
      --style = 'single',
      --highlight = 'FloatBorder',
      --text={
      --  top="cmdline",
      --  top_align="center",
      --},
    },
  },
  hooks = {
    before_mount = function(input)
	-- Beware, the prompt can mess around with the completion
      input.input_props.prompt = ':'
    end,
    after_mount = function(input)
      -- code
    end,
    set_keymaps = function(imap, feedkeys)
	  imap('<Esc>', fn.close)
      imap('<C-c>', fn.close)
      imap('qq', fn.close)
      --imap('<CR>', '<CR><CR>')

      imap('<Up>', fn.up_history)
      imap('<Down>', fn.down_history)
      -- code
    end
  }
})
