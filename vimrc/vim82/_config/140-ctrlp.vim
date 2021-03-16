UsePlugin 'ctrlp.vim'

" The prefix key.
nnoremap    [ctrlp]   <Nop>
nmap    <Space>f [ctrlp]
"
nnoremap <silent> [ctrlp]f :<C-u>CtrlPCurFile<CR>
nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
nnoremap <silent> [ctrlp]v :<C-u>CtrlP $HOME/dotfiles/vimrc<CR>
nnoremap <silent> [ctrlp]a :<C-u>CtrlPMixed<CR>
nnoremap <silent> [ctrlp]i :<C-u>CtrlPColorscheme<CR>
nnoremap <silent> [ctrlp]k :<C-u>CtrlPMark<CR>
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
" 遅延再描画
let g:ctrlp_lazy_update = 1
"let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
