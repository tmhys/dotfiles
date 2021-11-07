UsePlugin 'restart.vim'

" 終了時に保存するセッションオプションを設定する{{{
let g:restart_sessionoptions
    \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'
"}}}
" :Restart 時に変数の定義を行う
command! MyRestart Restart --cmd "let g:restarted = 1"

" この変数を使用して :Restart が行われたかどうかの判定を行う
if !exists("g:restarted")
    let $PATH = $PATH . ";C:/cpp/boost"
endif

nnoremap <silent> <ESC><ESC><ESC><ESC> :<C-u>Restart<CR>
