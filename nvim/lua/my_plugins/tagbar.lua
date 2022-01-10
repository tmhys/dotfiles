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
" ctags�̐ݒ�t�@�C���Ɛ��������Ă��邱��
let g:tagbar_type_toml = {
    \ 'ctagstype' : 'toml',
    \ 'kinds' : [
        \ 'p:plugin'
    \ ],
    \ 'sort' : 0
\ }
]])
