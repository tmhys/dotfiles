vim.cmd([[
let g:asyncrun_auto = "make"
let g:errormarker_errortext=""
let g:errormarker_warningtext=""
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>:RemoveErrorMarkers<CR>
]])
