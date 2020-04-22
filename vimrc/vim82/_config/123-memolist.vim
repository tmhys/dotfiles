if empty(globpath(&rtp, 'autoload/memolist.vim'))
  finish
endif

nnoremap <M-m>n  :MemoNew<CR>
nnoremap <M-m>l  :MemoList<CR>
nnoremap <M-m>g  :MemoGrep<CR>
