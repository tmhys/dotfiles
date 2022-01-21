vim.cmd[[runtime plugin/astronauta.vim]]

local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local cnoremap = vim.keymap.cnoremap
local vnoremap = vim.keymap.vnoremap
local map = vim.keymap.map

nnoremap{'gf gF'}
nnoremap{'za za
vnoremap{'za zf
nnoremap{'; :
vnoremap{'; :
inoremap{'<M-Insert> <C-R><C-O>*<esc>ka<del><esc>i<BS><esc>eEa
noremap{'<silent> <S-Insert> <ESC>:set noautoindent nosmartindent<CR>i<C-R>+<ESC>:set autoindent smartindent<CR>
inoremap{'<silent> <CR> <C-g>u<CR>
noremap{'g<CR> g;
nnoremap{'x "_x
nnoremap{'s "_s
nnoremap{'S "_S
nnoremap{'<silent> <ESC><ESC> :<C-u>nohlsearch<CR>
inoremap{'jj <Esc>
inoremap{'jk <Esc>
inoremap{'qq <Esc>
inoremap{'hhh <Esc>
inoremap{'lll <Esc>
inoremap{'kkk <Esc>
nnoremap{'<C-j> <C-w>j
nnoremap{'<C-k> <C-w>k
nnoremap{'<C-l> <C-w>l
nnoremap{'<C-h> <C-w>h
nnoremap{'<S-h> ^
nnoremap{'<S-l> $
vnoremap{'<S-l> $  " 矩形選択モード時のカーソル移動
vnoremap{'v $h
inoremap{'<c-j> <down>
inoremap{'<c-k> <up>
inoremap{'<c-h> <left>
inoremap{'<c-l> <right>
nnoremap{'<TAB> %
vnoremap{'<TAB> %
nnoremap{'<C-Up> "zdd<Up>"zP
nnoremap{'<C-Down> "zdd"zp
vnoremap{'<C-Up> "zx<Up>"zP`[V`]
vnoremap{'<C-Down> "zx"zp`[V`]
noremap{'<Space>tn :<C-u>tabnew<CR>
nnoremap{'<C-Tab> gt
nnoremap{'<S-C-Tab> gT
nnoremap{'gs :<C-u>vertical wincmd f<CR>
nnoremap{'<Space>p "0p
nnoremap{'<silent> <Space><Space> *N
nnoremap{'# <Space><Space>:%s/<C-r>///g<Left><Left>
nnoremap{'<M-3> :%s/<C-r>"///g<Left><Left>
vnoremap{'# :s///gc<Left><Left><Left><Left><C-r><C-w><Right>
nnoremap{'<Space>o :<C-u>call append(expand('.'), '')<Cr>j
cnoremap{'<expr> j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
cnoremap{'<C-h> <Home>
cnoremap{'<C-l> <Del>
cnoremap{'<C-l> <End>
cnoremap{'<C-j> <Right>
cnoremap{'<C-k> <Down>
cnoremap{'<C-b> <S-Left>
cnoremap{'<C-b> <S-Right>
cnoremap{'<C-o> <C-\>e(getcmdtype() == '/' <Bar><Bar> getcmdtype() == '?') ? '\<' . getcmdline() . '\>' : getcmdline()<CR>
nnoremap{'<M-j> ]c
nnoremap{'<M-k> [c
nnoremap{'<M-h> <C-w>hdo
nnoremap{'<M-l> <C-w>hdp
nnoremap{'<M-j> :cn<CR>
nnoremap{'<M-k> :cp<CR>
nnoremap{'<C-g> :vim /<C-r><C-w>/jg **
nnoremap{'<M-g> :vim //jg **<Left><Left><Left><Left><Left><Left>
onoremap{'8 i(
onoremap{'2 i"
onoremap{'7 i'
onoremap{'@ i`
onoremap{'[ i[
onoremap{'{ i{
nnoremap{'cp ciw<C-r>0<ESC>
nnoremap{'<F3> :<C-u>setlocal relativenumber!<CR>
nnoremap{'<F4> :<C-u>set scrollbind!<CR>
tnoremap{'<silent> <ESC> <C-\><C-n>

----vim.cmd([[
----let g:auto_ctags_set_tags_option = 1
----let g:auto_ctags_warn_once = 1
----]])
--
--nnoremap {'za', 'za'}
--vnoremap {'za', 'zf'}
--nnoremap {';', ':'}
--vnoremap {';', ':'}
--inoremap {'<M-Insert>', '<C-R><C-O>*<esc>ka<del><esc>i<BS><esc>eEa'}
----map {'<S-Insert>', '<C-R>+'}
--inoremap {'<silent> <CR>', '<C-g>u<CR>'}
--nnoremap {'g<CR>', 'g;'}
--nnoremap {'x', '"_x'}
--nnoremap {'s', '"_s'}
--nnoremap {'S', '"_S'}
--nnoremap {'<silent> <ESC><ESC>', ':<C-u>nohlsearch<CR>'}
--inoremap {'jj', '<Esc>'}
--inoremap {'jk', '<Esc>'}
--inoremap {'qq', '<Esc>'}
--inoremap {'hhh', '<Esc>'}
--inoremap {'lll', '<Esc>'}
--inoremap {'kkk', '<Esc>'}
--nnoremap {'<C-j>', '<C-w>j'}
--nnoremap {'<C-k>', '<C-w>k'}
--nnoremap {'<C-l>', '<C-w>l'}
--nnoremap {'<C-h>', '<C-w>h'}
--nnoremap {'<S-h>', '^'}
--nnoremap {'<S-l>', '$'}
--vnoremap {'<S-l>', '$'}
--vnoremap {'v', '$h'}
--inoremap {'<c-j>', '<down>'}
--inoremap {'<c-k>', '<up>'}
--inoremap {'<c-h>', '<left>'}
--inoremap {'<c-l>', '<right>'}
--nnoremap {'<TAB>', '%'}
--vnoremap {'<TAB>', '%'}
--nnoremap {'<C-Up>', '"zdd<Up>"zP'}
--nnoremap {'<C-Down>', '"zdd"zp'}
--vnoremap {'<C-Up>', '"zx<Up>"zP`[V`]'}
--vnoremap {'<C-Down>', '"zx"zp`[V`]'}
--nnoremap {'<Space>tn', ':<C-u>tabnew<CR>'}
--nnoremap {'<C-Tab>', 'gt'}
--nnoremap {'<S-C-Tab>', 'gT'}
--nnoremap {'gs', ':<C-u>vertical wincmd f<CR>'}
--nnoremap {'<Space>p', '"0p'}
--nnoremap {'<silent> <Space><Space>', '*N'}
--nnoremap {'#', '<Space><Space>:%s/<C-r>///g<Left><Left>'}
--nnoremap {'<M-3>', ':%s/<C-r>"///g<Left><Left>'}
--vnoremap {'#', ':s///gc<Left><Left><Left><Left>'}
----nnoremap {'<Space>o', ':<C-u>call append(expand('.'), '')<Cr>j'}
--nnoremap {'<M-j>', ']c'}
--nnoremap {'<M-k>', '[c'}
--nnoremap {'<M-h>', '<C-w>hdo'}
--nnoremap {'<M-l>', '<C-w>hdp'}
----nnoremap {'<C-g> :vim /<C-r><C-w>/jg **<CR>'}
--nnoremap {'<M-g> :vim //jg **<Left><Left><Left><Left><Left><Left>'}
--onoremap {'8', 'i('}
--onoremap {'2', 'i"'}
--onoremap {'7', 'i\''}
--onoremap {'@', 'i`'}
--onoremap {'[', 'i['}
--onoremap {'{', 'i{'}
--nnoremap {'cp', 'ciw<C-r>0<ESC>'}
--nnoremap {'<F3>', ':<C-u>setlocal relativenumber!<CR>'}
--nnoremap {'<F4>', ':<C-u>set scrollbind!<CR>'}
----tnoremap {'<silent> <ESC>', '<C-\><C-n>'}
--
--vim.cmd([[
--let $MYVIMRC =expand('$HOME\AppData\Local\nvim\init.lua')
--let $MYGVIMRC =expand('$HOME\AppData\Local\nvim\ginit.vim')
--command! Evimrc :e $MYVIMRC
--command! Egvimrc :e $MYGVIMRC
--
--"-{{{Quickfix windowトグル
--function! s:toggle_quickfix_window()
--  let _ = winnr('$')
--  cclose
--  if _ == winnr('$')
--  cwindow
--  endif
--endfunction
--nnoremap {'<M-q>', '<silent> :<C-u>call <SID>toggle_quickfix_window()<CR>
--""--}}}
--""--QuickFix 横画面分割で結果を表示
--au FileType qf nnoremap {'<S-CR>', '<C-w><CR><C-w>L
--""--Quickfix次の項目にジャンプ
--nnoremap {'<M-j> :cn<CR>
--nnoremap {'<M-k>', ':cp<CR>
--""-- マーク設定 : {{{
--""-- 基本マップ
--nnoremap {'[Mark]', '<Nop>
--nmap {'m', '[Mark]
--""-- 現在位置をマーク
--if !exists('g:markrement_char')
--    let g:markrement_char = [
--    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
--    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
--    \ ]
--endif
--nnoremap {'<silent>[Mark]m :<C-u>call <SID>AutoMarkrement()<CR>
--function! s:AutoMarkrement()
--    if !exists('b:markrement_pos')
--        let b:markrement_pos = 0
--    else
--        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
--    endif
--    execute 'mark' g:markrement_char[b:markrement_pos]
--    echo 'marked' g:markrement_char[b:markrement_pos]
--endfunction
--""-- 次/前のマーク
--nnoremap {'[Mark]n ]`
--nnoremap {'[Mark]N [`
--""-- 一覧表示
--nnoremap {'[Mark]l :<C-u>marks<CR>
--""--}}}
--inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
--inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
--inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
--]])
