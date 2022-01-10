vim.cmd([[
let g:tagbar_visibility_symbols = {
    \ 'public'    : '+',
    \ 'protected' : '#',
    \ 'private'   : '-'
    \ }

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_seq = {
	\ 'ctagstype' : 'seq',
	\ 'kinds' : [
		\ 'm:method',
		\ 's:svport'
	\ ],
	\ 'sort' : 0
\ }
" ctags‚Ìİ’èƒtƒ@ƒCƒ‹‚Æ®‡‚ªæ‚ê‚Ä‚¢‚é‚±‚Æ
let g:tagbar_type_toml = {
    \ 'ctagstype' : 'toml',
    \ 'kinds' : [
        \ 'p:plugin'
    \ ],
    \ 'sort' : 0
\ }
]])
