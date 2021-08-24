UsePlugin 'lualine.nvim'

lua << EOF
require'lualine'.setup {
  options = {lower = true},
  sections = {lualine_a = {{'mode', lower = false}}, lualine_b = {'branch'}}   }
EOF
