if empty(globpath(&rtp, 'autoload/restart.vim'))
  finish
endif

" :Restart 時に変数の定義を行う
command! MyRestart Restart --cmd "let g:restarted = 1"

" この変数を使用して :Restart が行われたかどうかの判定を行う
if !exists("g:restarted")
    let $PATH = $PATH . ";C:/cpp/boost"
endif
