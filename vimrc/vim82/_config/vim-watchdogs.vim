UsePlugin 'vim-watchdogs'

"コンパイラexeにパスを通しておくこと
"コンパイルしたいディレクトリに移動してから実行
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:watchdogs_check_BufWritePost_enables = {
\   "seq" : 1
\}
nnoremap <Space>r :QuickRun<CR>

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "<C-c>"

let g:quickrun_config = {
\   "_" : {
\   "outputter/buffer/split" : ":rightbelow 8",
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "sjis",
\ 	'runner'    : 'vimproc',
\ 	'runner/vimproc/updatetime' : 40,
\   "outputter/buffer/close_on_empty" : 1
\	 },
\   "seq/watchdogs_checker" : {
\ 	"hook/close_quickfix/enable_exit" : 1,
\ 	'hook/back_window/enable_exit':           0,
\ 	'hook/back_window/priority_exit':         1,
\   'hook/qfsigns_update/enable_exit':   1,
\   'hook/qfsigns_update/priority_exit': 3,
\ 	"hook/qfstatusline_update/enable_exit" : 1,
\ 	"hook/qfstatusline_update/priority_exit" : 4,
\ 	"hook/echo/enable" : 1,
\ 	"hook/echo/output_success": "> Success.",
\ 	"hook/echo/output_failure": "> Errors Found.",
\ 	'outputter' : 'error',
\ 	'outputter/quickfix/open_cmd' : "",
\ 	'outputter/error/success' : 'quickfix',
\ 	'outputter/error/error'   : 'quickfix',
\   "type" : "watchdogs_checker/SeqCnv_V340",
\	"command" : "SeqCnv_V340",
\	"cmdopt" : "-l",
\ 	"exec":"%c 00_Main %o",
\	"quickfix/errorformat": "%WWarning: %f (%l):%m,%EError: %f (%l):%m",
\   },
\}

augroup my_watchdogs
  autocmd!
  autocmd InsertLeave,BufWritePost,TextChanged *.seq,*.s WatchdogsRun
  autocmd BufRead,BufNewFile *.seq,*.s WatchdogsRun
augroup END
