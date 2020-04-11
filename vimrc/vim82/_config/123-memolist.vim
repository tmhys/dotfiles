if empty(globpath(&rtp, 'autoload/memolist.vim'))
  finish
endif

nnoremap <Space>mn  :MemoNew<CR>
nnoremap <Space>ml  :MemoList<CR>
nnoremap <Space>mg  :MemoGrep<CR>
