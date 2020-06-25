if empty(globpath(&rtp, 'plugin/hier.vim'))
  finish
endif

"gvimrcに書かないと反映されない
" エラーを赤字の波線で
execute "highlight qf_error_ucurl gui=undercurl guisp=Red"
let g:hier_highlight_group_qf  = "qf_error_ucurl"
" 警告を青字の波線で
execute "highlight qf_warning_ucurl gui=undercurl guisp=Blue"
let g:hier_highlight_group_qfw = "qf_warning_ucurl"
let g:hier_highlight_group_qfi = ""

" To highlight with a undercurl in quickfix error
"execute 'highlight qf_error_ucurl gui=undercurl guisp=Red'
"let g:hier_highlight_group_qf = 'qf_error_ucurl'
"
"function! ResetHierAutocmd()
"    try
"        autocmd! Hier
"    catch /E216/
"
"    endtry
"endfunction
"
"augroup MyHier
"    autocmd!
"    autocmd QuickFixCmdPre * call ResetHierAutocmd()
"augroup END

if has('kaoriya')
	nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>:Undiff<CR>:HierClear<CR>
else
	nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>:HierClear<CR>
endif
