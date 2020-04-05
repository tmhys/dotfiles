if empty(globpath(&rtp, 'autoload/session.vim'))
  finish
endif

"" 現在のディレクトリ直下の .vimsessions/ を取得
"let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
"if isdirectory(s:local_session_directory)
"  " session保存ディレクトリをそのディレクトリの設定
"  let g:session_directory = s:local_session_directory
"  " vim終了時に自動保存
"  let g:session_autosave = 'yes'
"  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
"  let g:session_autoload = 'yes'
"  " 5分間に1回自動保存
"  let g:session_autosave_periodic = 5
"else
  let g:session_autosave = 'no'
  let g:session_autoload = 'no'
"endif
"unlet s:local_session_directory
