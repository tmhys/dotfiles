UsePlugin 'tagbar'

"let g:tagbar_ctags_bin = 'C:\ProgramData\chocolatey\bin\ctags.exe'
"let g:tagbar_ctags_bin = '$HOME\scoop\shims\ctags.exe'
"上記設定をコメントアウトしておかないと何故かうまく行かない
"設定ファイルは
"$HOME/ctags.d/config.ctags
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
" ctagsの設定ファイルと整合が取れていること
let g:tagbar_type_toml = {
    \ 'ctagstype' : 'toml',
    \ 'kinds' : [
        \ 'p:plugin'
    \ ],
    \ 'sort' : 0
\ }
