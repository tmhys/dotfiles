if empty(globpath(&rtp, 'plugin/workspace.vim'))
  finish
endif

nnoremap <Space>tw :ToggleWorkspace<CR>
