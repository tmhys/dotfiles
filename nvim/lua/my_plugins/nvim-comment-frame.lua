require('nvim-comment-frame').setup({
    keymap = '<leader>cf',
    --       ^^^^^^^^^^^ change this to what ever you want

    multiline_keymap = '<leader>C',
  --                 ^^^^^^^^^^^ change this to what ever you want

--treesitter‚ª•K{‚È‚Ì‚Åseq‚Å‚Í“®ì‚µ‚È‚¢
   -- languages = {
   --      -- configuration for Lua programming language
   --      -- @NOTE global configuration will be overridden by language level
   --      -- configuration if provided
   --      seq = {
   --          -- start the comment with this string
   --          start_str = '%',
   --
   --          -- end the comment line with this string
   --          end_str = '%',
   --
   --          -- fill the comment frame border with this character
   --          fill_char = '*',
   --
   --          -- width of the comment frame
   --          frame_width = 100,
   --
   --          -- wrap the line after 'n' characters
   --          line_wrap_len = 70,
   --
   --          -- automatically indent the comment frame based on the line
   --          auto_indent = false,
   --
   --          -- add comment above the current line
   --          add_comment_above = false,
   --      },
   --  }
})
