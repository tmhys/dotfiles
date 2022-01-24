vim.cmd([[
nmap <space>qs <plug>(QuickScopeToggle)
xmap <space>qs <plug>(QuickScopeToggle)
let g:qs_max_chars = 100
let g:qs_lazy_highlight = 0
let g:qs_delay = 100
augroup vimrc_quick_scope
  autocmd!
  autocmd FileType nvimtree,nerdtree,buffergator,tagbar,qf let b:qs_local_disable=1
augroup END
]])
