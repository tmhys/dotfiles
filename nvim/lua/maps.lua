vim.api.nvim_set_keymap("c", "<C-b>", "<S-Left>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("c", "<C-b>", "<S-Right>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("c", "<C-h>", "<Home>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("c", "<C-j>", "<Right>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("c", "<C-k>", "<Down>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("c", "<C-l>", "<Del>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("c", "<C-l>", "<End>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "<M-Insert>", "<C-R><C-O>*<esc>ka<del><esc>i<BS><esc>eEa" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "<c-h>", "<left>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "<c-j>", "<down>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "<c-k>", "<up>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "<c-l>", "<right>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "hhh", "<Esc>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "jj", "<Esc>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "jk", "<Esc>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "kkk", "<Esc>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "lll", "<Esc>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "qq", "<Esc>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "#", "<Space><Space>:%s/<C-r>///g<Left><Left>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", ";", ":" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<C-Down>", '"zdd"zp' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<C-Tab>", "gt" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<C-Up>", '"zdd<Up>"zP' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<C-g>", ":vim /<C-r><C-w>/jg **" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<F3>", ":<C-u>setlocal relativenumber!<CR>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<F4>", ":<C-u>set scrollbind!<CR>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<M-3>", ':%s/<C-r>"///g<Left><Left>' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<M-g>", ":vim //jg **<Left><Left><Left><Left><Left><Left>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<M-h>", "<C-w>hdo" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<M-j>", ":cn<CR>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<M-j>", "]c" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<M-k>", ":cp<CR>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<M-k>", "[c" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<M-l>", "<C-w>hdp" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<S-C-Tab>", "gT" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<S-h>", "^" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<S-l>", "$" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<Space>o", ":<C-u>call append(expand('.'), '')<Cr>j" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<Space>p", '"0p' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<Space>tn", ":<C-u>tabnew<CR>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "<TAB>", "%" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "Q", "<Nop>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "S", '"_S' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "cp", "ciw<C-r>0<ESC>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "g<CR>", "g;" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "gf", "gF" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "gs", ":<C-u>vertical wincmd f<CR>" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "s", '"_s' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "x", '"_x' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("n", "za", "za" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("o", "2", 'i"' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("o", "7", "i'" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("o", "8", "i(" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("o", "@", "i`" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("o", "[", "i[" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("o", "{", "i{" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("i", "<CR>", "<C-g>u<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<ESC><ESC>", ":<C-u>nohlsearch<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space><space>", "*N", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "#", ":s///gc<Left><Left><Left><Left><C-r><C-w><Right>",{noremap = true, silent =true})
vim.api.nvim_set_keymap("v", ";", ":" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("v", "<C-Down>", '"zx"zp`[V`]' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("v", "<C-Up>", '"zx<Up>"zP`[V`]' ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("v", "<S-l>", "$  " ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("v", "<TAB>", "%" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("v", "v", "$h" ,{noremap = true, silent =true})
vim.api.nvim_set_keymap("v", "za", "zf" ,{noremap = true, silent =true})


----vim.cmd([[runtime plugin/astronauta.vim]])
--local nnoremap = vim.keymap.nnoremap
--local inoremap = vim.keymap.inoremap
--local cnoremap = vim.keymap.cnoremap
--local vnoremap = vim.keymap.vnoremap
--local onoremap = vim.keymap.onoremap
--
--nnoremap({ "Q", "<Nop>" })
--nnoremap({ "gf", "gF" })
--nnoremap({ "za", "za" })
--vnoremap({ "za", "zf" })
--nnoremap({ ";", ":" })
--vnoremap({ ";", ":" })
--inoremap({ "<M-Insert>", "<C-R><C-O>*<esc>ka<del><esc>i<BS><esc>eEa" })
----inoremap{'<silent> <CR>','<C-g>u<CR>'}
--vim.api.nvim_set_keymap("i", "<CR>", "<C-g>u<CR>", { noremap = true, silent = true })
--nnoremap({ "g<CR>", "g;" })
--nnoremap({ "x", '"_x' })
--nnoremap({ "s", '"_s' })
--nnoremap({ "S", '"_S' })
----nnoremap{'<silent> <ESC><ESC>',':<C-u>nohlsearch<CR>'}
--vim.api.nvim_set_keymap("n", "<ESC><ESC>", ":<C-u>nohlsearch<CR>", { noremap = true, silent = true })
--inoremap({ "jj", "<Esc>" })
--inoremap({ "jk", "<Esc>" })
--inoremap({ "qq", "<Esc>" })
--inoremap({ "hhh", "<Esc>" })
--inoremap({ "lll", "<Esc>" })
--inoremap({ "kkk", "<Esc>" })
--nnoremap({ "<C-j>", "<C-w>j" })
--nnoremap({ "<C-k>", "<C-w>k" })
--nnoremap({ "<C-l>", "<C-w>l" })
--nnoremap({ "<C-h>", "<C-w>h" })
--nnoremap({ "<S-h>", "^" })
--nnoremap({ "<S-l>", "$" })
--vnoremap({ "<S-l>", "$  " })
--vnoremap({ "v", "$h" })
--inoremap({ "<c-j>", "<down>" })
--inoremap({ "<c-k>", "<up>" })
--inoremap({ "<c-h>", "<left>" })
--inoremap({ "<c-l>", "<right>" })
--nnoremap({ "<TAB>", "%" })
--vnoremap({ "<TAB>", "%" })
--nnoremap({ "<C-Up>", '"zdd<Up>"zP' })
--nnoremap({ "<C-Down>", '"zdd"zp' })
--vnoremap({ "<C-Up>", '"zx<Up>"zP`[V`]' })
--vnoremap({ "<C-Down>", '"zx"zp`[V`]' })
--nnoremap({ "<Space>tn", ":<C-u>tabnew<CR>" })
--nnoremap({ "<C-Tab>", "gt" })
--nnoremap({ "<S-C-Tab>", "gT" })
--nnoremap({ "gs", ":<C-u>vertical wincmd f<CR>" })
--nnoremap({ "<Space>p", '"0p' })
----nnoremap{'<silent> <Space><Space>', '*N'}
--vim.api.nvim_set_keymap("n", "<space><space>", "*N", { noremap = true, silent = true })
--nnoremap({ "#", "<Space><Space>:%s/<C-r>///g<Left><Left>" })
--nnoremap({ "<M-3>", ':%s/<C-r>"///g<Left><Left>' })
--vnoremap({ "#", ":s///gc<Left><Left><Left><Left><C-r><C-w><Right>" })
--nnoremap({ "<Space>o", ":<C-u>call append(expand('.'), '')<Cr>j" })
----cnoremap{'<expr>',"j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'"}
--cnoremap({ "<C-h>", "<Home>" })
--cnoremap({ "<C-l>", "<Del>" })
--cnoremap({ "<C-l>", "<End>" })
--cnoremap({ "<C-j>", "<Right>" })
--cnoremap({ "<C-k>", "<Down>" })
--cnoremap({ "<C-b>", "<S-Left>" })
--cnoremap({ "<C-b>", "<S-Right>" })
----cnoremap{'<C-o>','<C-\>e(getcmdtype() == '/' <Bar><Bar> getcmdtype() == '?') ? '\<' . getcmdline() . '\>' : getcmdline()<CR>'}
--nnoremap({ "<M-j>", "]c" })
--nnoremap({ "<M-k>", "[c" })
--nnoremap({ "<M-h>", "<C-w>hdo" })
--nnoremap({ "<M-l>", "<C-w>hdp" })
--nnoremap({ "<M-j>", ":cn<CR>" })
--nnoremap({ "<M-k>", ":cp<CR>" })
--nnoremap({ "<C-g>", ":vim /<C-r><C-w>/jg **" })
--nnoremap({ "<M-g>", ":vim //jg **<Left><Left><Left><Left><Left><Left>" })
--onoremap({ "8", "i(" })
--onoremap({ "2", 'i"' })
--onoremap({ "7", "i'" })
--onoremap({ "@", "i`" })
--onoremap({ "[", "i[" })
--onoremap({ "{", "i{" })
--nnoremap({ "cp", "ciw<C-r>0<ESC>" })
--nnoremap({ "<F3>", ":<C-u>setlocal relativenumber!<CR>" })
--nnoremap({ "<F4>", ":<C-u>set scrollbind!<CR>" })
--nnoremap({ "<F12>", ":PackerSync<CR>" })
----tnoremap{'<silent>','<ESC> <C-\><C-n>'}


--vim.api.nvim_create_user_command("Evimrc", "silent! e $HOME\AppData\Local\nvim\init.lua", {force = true})

vim.cmd([[
let $MYVIMRC =expand('$HOME\AppData\Local\nvim\init.lua')
let $MYGVIMRC =expand('$HOME\AppData\Local\nvim\ginit.vim')
command! Evimrc :silent! e $MYVIMRC
command! Egvimrc :silent! e $MYGVIMRC

"{{{Quickfix windowトグル
function! s:toggle_quickfix_window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
  cwindow
  endif
endfunction
nnoremap <silent><M-q> :<C-u>call <SID>toggle_quickfix_window()<CR>
"}}}
"ディレクトリ自動で移動
"set autochdir&vim
"<Space>cd で編集ファイルのカレントディレクトリへと移動{{{
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
    if a:bang == ''
        pwd
    endif
endfunction
" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>
"}}}
noremap! <silent> <S-Insert> <ESC>:set noautoindent nosmartindent<CR>i<C-R>+<ESC>:set autoindent smartindent<CR>
]])
