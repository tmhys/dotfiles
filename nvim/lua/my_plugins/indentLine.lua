local M = {}
M.setup = function()

local opt = vim.opt  -- to set options
vim.g.indentLine_fileTypeExclude= {'help',
'nerdtree',
'denite',
'startify',
'taskpaper',
'unite',
'tagbar',
'dashboard'}
vim.opt.listchars.extends = {tab=\¦\ }

end
return M
