if empty(globpath(&rtp, 'autoload/session.vim'))
  finish
endif

" session保存ファイル名
"let g:session_default_name = '.session'
" session保持ファイルの拡張子
let g:session_extension = '.vim'
" session保存ディレクトリを現在のディレクトリにする
let g:session_directory = '~/.vim/session'
" vim終了時に自動保存しない
let g:session_autosave = 'no'
" 引数なしでvimを起動した時にセッションを復元しない
let g:session_autoload = 'no'
" 1分間に1回自動保存をしない
let g:session_autosave_periodic = 10
