local groupname = "ctrlp"

-- vim.keymap.set("n", "[ctrlp]", "<Nop>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<Space>f", "[ctrlp]", {})
--
-- vim.api.nvim_set_keymap("n","[ctrlp]f","<C-u>CtrlPCurFile<CR>        " , { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n","[ctrlp]b","<C-u>CtrlPBuffer<CR>         " , { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n","[ctrlp]m","<C-u>CtrlPMRUFiles<CR>       " , { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n","[ctrlp]v","<C-u>CtrlP $HOME/dotfiles<CR>" , { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n","[ctrlp]a","<C-u>CtrlPMixed<CR>          " , { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n","[ctrlp]c","<C-u>CtrlPColorscheme<CR>    " , { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n","[ctrlp]k","<C-u>CtrlPMark<CR>           " , { noremap = true, silent = true })

-- vim.api.nvim_create_autocmd({ "VimEnter","VimResized" }, {
--     group = groupname,
--     callback = function()
--         vim.g.ctrlp_match_window = "'max:' . string(min([(&lines/3), 20]) - 1"
--     end,
--     once = false,
-- })


vim.cmd([[
" The prefix key.
nnoremap    [ctrlp]   <Nop>
nmap    <Space>f [ctrlp]
"
""let g:ctrlp_line_prefix= '> '
nnoremap <silent> [ctrlp]f :<C-u>CtrlPCurFile<CR>
nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
nnoremap <silent> [ctrlp]v :<C-u>CtrlP $HOME/dotfiles<CR>
nnoremap <silent> [ctrlp]a :<C-u>CtrlPMixed<CR>
nnoremap <silent> [ctrlp]c :<C-u>CtrlPColorscheme<CR>
nnoremap <silent> [ctrlp]k :<C-u>CtrlPMark<CR>
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
" 遅延再描画
let g:ctrlp_lazy_update = 1
if v:version  == 802  && has("patch1665")
    let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
endif
" CtrlPのウィンドウ最大高さ
autocmd VimEnter,VimResized *  let g:ctrlp_match_window = 'max:' . string(min([(&lines/3), 20]) - 1)

"何故かワークしない
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

let g:ctrlp_reuse_window = 'quickfix'
" # lightline.vimで表示しているステータスラインとの衝突を避けるため

" # ctrlpに入るとき，ステータスラインの表示をoffに
function! CtrlPEnter()
    set laststatus=0
    let b:qs_local_disable=1
endfunction

" # ctrlpから出るとき，ステータスラインの表示をonに
function! CtrlPLeave()
    set laststatus=2
    let b:qs_local_disable=0
endfunction
let g:ctrlp_buffer_func = {
    \ 'enter': 'CtrlPEnter',
    \ 'exit': 'CtrlPLeave',
\ }

]])
