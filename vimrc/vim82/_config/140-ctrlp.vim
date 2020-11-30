UsePlugin 'ctrlp.vim'

" The prefix key.
"nnoremap    [ctrlp]   <Nop>
"nmap    <Space>f [ctrlp]
"
nnoremap <silent> <M-f> :<C-u>CtrlPCurFile<CR>
nnoremap <silent> <M-b> :<C-u>CtrlPBuffer<CR>
nnoremap <silent> <M-m> :<C-u>CtrlPMRUFiles<CR>
nnoremap <silent> <M-v> :<C-u>CtrlP $HOME/dotfiles/vimrc<CR>
nnoremap <silent> <M-a> :<C-u>CtrlPMixed<CR>
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
" 遅延再描画
let g:ctrlp_lazy_update = 1
"nnoremap <C-p> :CtrlPMixed<CR>
"let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
"


"" The prefix key.
"nnoremap    [ctrlp]   <Nop>
"nmap    <Space>c [ctrlp]
"
"nnoremap <silent> [ctrlp]f :CtrlP<CR>
""nnoremap <silent> <M-f> :<C-u>ctrlp files<CR>
"nnoremap <silent> [ctrlp]m :CtrlPMRU<CR>
"nnoremap <silent> [ctrlp]b :CtrlPBuffer<CR>
"nnoremap <silent> [ctrlp]g :<C-u>ctrlp grep<CR>
"nnoremap <silent> [ctrlp]v :<C-u>ctrlp files $HOME/dotfiles/vimrc<CR><C-u>
"nnoremap <silent> [ctrlp]i :<C-u>ctrlp colors<CR>
"nnoremap <silent> [ctrlp]<Space> :<C-u>ctrlp blines<CR>
"nnoremap <silent> [ctrlp]c :<C-u>ctrlp commits<CR>
"nnoremap <silent> [ctrlp]d :<C-u>ctrlp gfiles<CR>
"nnoremap <silent> [ctrlp]j :<C-u>ctrlp jumps<CR>
"nnoremap <silent> [ctrlp]l :<C-u>ctrlp lines<CR>
"nnoremap <silent> [ctrlp]a :<C-u>ctrlp marks<CR>
"nnoremap <silent> [ctrlp]h :<C-u>ctrlp help<CR>
"nnoremap <silent> [ctrlp]r :<C-u>ctrlp quick_open<CR>
"nnoremap <silent> [ctrlp]n :<C-u>ctrlp filer<CR>
"nnoremap <silent> [ctrlp]/ :<C-u>ctrlp search_history<CR>
"nnoremap <silent> [ctrlp]p :<C-u>ctrlp files $HOME/Programing/python<CR><C-u>
"nnoremap <silent> [ctrlp]s :<C-u>ctrlp sessions<CR>
"" The prefix key.
"nnoremap    [ctrlp]   <Nop>
"nmap    <Space>f [ctrlp]
"
"nnoremap <silent> [ctrlp]f :<C-u>ctrlp files<CR>
""nnoremap <silent> <M-f> :<C-u>ctrlp files<CR>
"nnoremap <silent> [ctrlp]i :<C-u>ctrlp colors<CR>
"nnoremap <silent> [ctrlp]b :<C-u>ctrlp buffers<CR>
"nnoremap <silent> [ctrlp]<Space> :<C-u>ctrlp blines<CR>
"nnoremap <silent> [ctrlp]c :<C-u>ctrlp commits<CR>
"nnoremap <silent> [ctrlp]d :<C-u>ctrlp gfiles<CR>
"nnoremap <silent> [ctrlp]g :<C-u>ctrlp grep<CR>
"nnoremap <silent> [ctrlp]m :<C-u>ctrlp history<CR>
"nnoremap <silent> [ctrlp]j :<C-u>ctrlp jumps<CR>
"nnoremap <silent> [ctrlp]l :<C-u>ctrlp lines<CR>
"nnoremap <silent> [ctrlp]a :<C-u>ctrlp marks<CR>
"nnoremap <silent> [ctrlp]h :<C-u>ctrlp help<CR>
"nnoremap <silent> [ctrlp]r :<C-u>ctrlp quick_open<CR>
"nnoremap <silent> [ctrlp]n :<C-u>ctrlp filer<CR>
"nnoremap <silent> [ctrlp]/ :<C-u>ctrlp search_history<CR>
"nnoremap <silent> [ctrlp]v :<C-u>ctrlp files $HOME/dotfiles/vimrc<CR><C-u>
"nnoremap <silent> [ctrlp]p :<C-u>ctrlp files $HOME/Programing/python<CR><C-u>
"nnoremap <silent> [ctrlp]s :<C-u>ctrlp sessions<CR>
