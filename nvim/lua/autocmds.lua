vim.cmd([[
command! PackerInstall packadd packer.nvim | lua require'packers'.install()
command! PackerUpdate packadd packer.nvim | lua require'packers'.update()
command! PackerSync packadd packer.nvim | lua require'packers'.sync()
command! PackerClean packadd packer.nvim | lua require'packers'.clean()]vim.cmd[[command! PackerCompile packadd packer.nvim | lua require'packers'.compile()

augroup highlight_yank
    autocmd!
    au TextyankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END


augroup myvimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC,$MYGVIMMRC
				\nested so $MYVIMRC | lua require'lualine'.setup()
				\|echo printf('VIMRC has reloaded (%s).', strftime('%c'))
    autocmd BufWritePost plugins.lua PackerCompile
augroup END

augroup win_config
	autocmd!
	autocmd QuickFixCmdPost *grep* cwindow
	autocmd FileType qf wincmd J
    autocmd FileType qf nnoremap <S-CR> <C-w><CR><C-w>L
	autocmd VimResized * :wincmd =
	autocmd VimLeave * cclose
	autocmd VimLeave	* mks! ~/.vim/session/$DATE.vim
    "↓これなんやっけ？
	autocmd BufWritePre * :%s/\s\+$//ge
	autocmd BufWritePre * :%s/\r//ge
	autocmd BufWritePre * :%s/\n\{4,}/\n\n\n/ge
	autocmd BufWritePre * :%s#\($\n\s*\)\+\%$##ge
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType toml setlocal foldmethod=marker
	autocmd BufWritePre * let &bex = '.' .strftime("%Y%m%d_%H%M%S")
augroup END

"augroup last_status
"	autocmd!
"	" 前回終了位置に移動
"	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal g`"' | endif
"	" バッファ読み込み時にマークを初期化
"	autocmd BufReadPost * delmarks!
"augroup END

augroup gitspellcheck
	autocmd!
    autocmd FileType gitcommit setlocal spell
augroup end

augroup ErrorFormat
	autocmd!
    autocmd BufNewFile,BufRead *.py
        \ setlocal errorformat=%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
        \ foldmethod=indent
augroup END

augroup officelocal
	autocmd!
    autocmd BufNewFile,BufRead *.seq,*.s,*.h,*.tbl setfiletype seq
augroup END

" echo message vim start up time
if has('vim_starting')
  let g:startuptime = reltime()
  augroup vimrc
	  autocmd!
  	  autocmd VimEnter *
        \ : let g:startuptime = reltime(g:startuptime)
        \ | redraw
        \ | echomsg printf('startuptime: %fms', reltimefloat(g:startuptime) * 1000)
  augroup END
endif

if has('vim_starting')
  function s:reload_vimrc() abort
    execute printf('source %s', $MYVIMRC)
    if has('gui_running')
      execute printf('source %s', $MYGVIMRC)
    endif
    redraw
    echo printf('VIMRC has reloaded (%s).', strftime('%c'))
  endfunction
endif
nmap <silent> <Plug>(my-reload-vimrc) :<C-u>call <SID>reload_vimrc()<CR>
nmap <Space>R <Plug>(my-reload-vimrc)
]])
