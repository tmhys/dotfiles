UsePlugin 'vim-lsp'

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> <f2> <plug>(lsp-rename)
	nnoremap <buffer> <F5> :LspDocumentFormat<CR>
	autocmd BufWritePre *.py LspDocumentFormatSync
	"inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 2
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 1
let g:lsp_text_edit_enabled = 0

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

"let g:lsp_signs_error = {'text': '✗'}
"let g:lsp_signs_warning = {'text': '‼', 'icon': '/path/to/some/icon'}
"let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'}
