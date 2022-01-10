UsePlugin 'scrollbar.nvim'

augroup ScrollbarInit
	autocmd!
	autocmd WinEnter,FocusGained,CursorMoved,VimResized * silent! lua require('scrollbar').show()
    autocmd WinLeave,FocusLost                          * silent! lua require('scrollbar').clear()
augroup end
