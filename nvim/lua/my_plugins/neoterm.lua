vim.cmd([[
let g:neoterm_default_mod='belowright'
let g:neoterm_size=10
"let g:neoterm_shell = '$SHELL -l'
let g:neoterm_autoscroll=1
let g:test#strategy = 'neoterm'
let g:test#preserve_screen = 1
let g:test#python#runner = 'pytest'

nnoremap <c-t><c-t> :Ttoggle<CR>
tnoremap <c-t><c-t> <C-¥><C-n>:Ttoggle<CR>
]])
