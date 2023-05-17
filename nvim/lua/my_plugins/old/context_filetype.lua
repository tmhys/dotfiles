vim.cmd([[
let g:context_filetype#filetypes = {
      \ 'lua': [
      \   {
      \    'start': 'vim.cmd\s*(',
      \    'end': ')', 'filetype': 'vim',
      \   },
]])
