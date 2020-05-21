if empty(globpath(&rtp, 'autoload/startify.vim'))
  finish
endif

nnoremap <M-s> :Startify<CR>
"autocmd TabNew * :Startify
"noremap <Space>tn :<C-u>tabnew<CR> :Startify<CR>

" 起動時の画面の設定
"let g:startify_session_sort = 1
let NERDTreeHijackNetrw = 0
let g:startify_enable_unsafe = 1
let g:startify_change_to_dir       = 0
let g:startify_enable_special      = 0
let g:startify_enable_special = 1
let g:startify_files_number = 10
let g:startify_fortune_use_unicode = 1
let g:startify_session_autoload       = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_number = 10
let g:startify_session_persistence    = 1
let g:startify_update_oldfiles     = 1
let g:startify_use_env             = 1
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]
let g:startify_session_savevars = [
           \ 'g:startify_session_savevars',
           \ 'g:startify_session_savecmds',
           \ 'g:random_plugin_use_feature'
           \ ]

let g:startify_list_order = [
        \ ['⚑  Sessions:'],
        \ 'sessions',
        \ ['♻  MRU:'],
        \ 'files',
        \ ['♲  MRU in Current Directory:'],
        \ 'dir',
        \ ]
"        \ ['☺  Bookmarks:'],
"        \ 'bookmarks',

" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
let g:startify_custom_indices = ['d', 'f', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
"let g:startify_bookmarks = [
"  \ '$VIM/_vimrc',
"  \ '$VIM/_gvimrc',
"\ ]

"let g:ascii = [
"        \ '        __',
"        \ '.--.--.|__|.--------.',
"        \ '|  |  ||  ||        |',
"        \ ' \___/ |__||__|__|__|',
"        \ ''
"        \]
"let g:startify_custom_header = g:ascii + startify#fortune#boxed()
let g:startify_custom_header =
            \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')

" autocmd VimEnter *
"                \   if !argc()
"                \ |   Startify
"                "\ |   NERDTree
"                \ |   wincmd w
"                \ | endif
