augroup win_config
	autocmd!
	"Quickfixウィンドウ開く
	autocmd QuickFixCmdPost *grep* cwindow
	"qfウィンドウを常に最下部で開く
	autocmd FileType qf wincmd J
	"ウィンドウを常に等分割
	autocmd VimResized * :wincmd =
	"session保存時クイックフィックス閉じる
	autocmd VimLeave * cclose
	autocmd VimLeave	* mks! ~/.vim/session/$DATE.vim
	"文末スペース / 連続改行削除
	autocmd BufWritePre * :%s/\s\+$//ge
	autocmd BufWritePre * :%s/\n\{4,}/\r\r\r/ge
	autocmd BufWritePre * :%s#\($\n\s*\)\+\%$##ge
	"折りたたみ設定
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType toml setlocal foldmethod=marker
	"backupファイルに日付
	autocmd BufWritePre * let &bex = '.' .strftime("%Y%m%d_%H%M%S")
augroup END

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

augroup reload_vimrc
    autocmd!
    "autocmd BufWritePost $MYVIMRC,$MYGVIMMRC,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,ginit.vim,init.vim,_config/*.vim,_gconfig/*.vim
    autocmd BufWritePost $MYVIMRC,$MYGVIMMRC
				\:nested so $MYVIMRC
				\|endif
				\|redraw
				\|echomsg printf('VIMRC has reloaded (%s).', strftime('%c'))
				"| if has('gui_running')
				"|| has('nvim')
				"| so $MYGVIMRC
    "autocmd BufWritePost  /_config/*.vim,/_gconfig/*.vim
	"			\nested call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
augroup END
