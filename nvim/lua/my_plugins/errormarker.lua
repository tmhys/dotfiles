-- vim.cmd([[
-- let g:asyncrun_auto = "make"
-- let g:errormarker_errortext=""
-- let g:errormarker_warningtext=""
-- nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>:RemoveErrorMarkers<CR>
-- ]])
-- nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>:RemoveErrorMarkers<CR>

local g = vim.g -- a table to access global variables
g.asyncrun_auto = "make"
g.errormarker_errortext=""
g.errormarker_warningtext=""
vim.keymap.set("n", "<ESC><ESC>", ":<C-u>nohlsearch<CR>:RemoveErrorMarkers<CR>", { noremap = true, silent = true })
