vim.cmd([[
nmap <space>m <Plug>(quickhl-manual-this-whole-word)
xmap <space>m <Plug>(quickhl-manual-this-whole-word)
nmap <space>M <Plug>(quickhl-manual-reset)
xmap <space>M <Plug>(quickhl-manual-reset)
"nnoremap <F5> :<C-u>nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR>:QuickhlManualReset<CR><C-l>
nnoremap <ESC><ESC> :<C-u>nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR>:QuickhlManualReset<CR><C-l>

"if ! vimrc#is_supported_truecolor()
"  let g:quickhl_manual_colors = [
"        \   'cterm=bold ctermfg=16 ctermbg=214 gui=bold guifg=#000000 guibg=#ffa724',
"        \   'cterm=bold ctermfg=16 ctermbg=154 gui=bold guifg=#000000 guibg=#aeee00',
"        \   'cterm=bold ctermfg=16 ctermbg=121 gui=bold guifg=#000000 guibg=#8cffba',
"        \   'cterm=bold ctermfg=16 ctermbg=137 gui=bold guifg=#000000 guibg=#b88853',
"        \   'cterm=bold ctermfg=7  ctermbg=21  gui=bold guifg=#ffffff guibg=#d4a00d',
"        \   'cterm=bold ctermfg=16 ctermbg=211 gui=bold guifg=#000000 guibg=#ff9eb8',
"        \   'cterm=bold ctermfg=7  ctermbg=22  gui=bold guifg=#ffffff guibg=#06287e',
"        \   'cterm=bold ctermfg=16 ctermbg=56  gui=bold guifg=#000000 guibg=#a0b0c0',
"        \   'cterm=bold ctermfg=16 ctermbg=153 gui=bold guifg=#ffffff guibg=#0a7383'
"        \ ]
"endif
]])
