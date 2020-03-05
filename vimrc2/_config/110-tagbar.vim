if empty(globpath(&rtp, 'autoload/tagbar.vim'))
  finish
endif

"let g:tagbar_ctags_bin = 'C:\ProgramData\chocolatey\bin\ctags.exe'
let g:tagbar_ctags_bin = '$HOME\scoop\shims\ctags.exe'

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_seq = {
	\ 'ctagstype' : 'seq',
	\ 'kinds' : [
		\ 'u:unit'
	\ ],
	\ 'sort' : 0
\ }
let g:tagbar_type_toml = {
    \ 'ctagstype' : 'toml',
    \ 'kinds' : [
        \ 'p:plugin'
    \ ],
    \ 'sort' : 0
\ }
