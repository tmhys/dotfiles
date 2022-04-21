function! s:remove_dust()
  let l:cursor = getpos(".")
  keeppatterns %s/\s\+$//ge
  keeppatterns %s/\n\{4,}/\r\r\r/ge
  keeppatterns %s#\($\n\s*\)\+\%$##ge
  call setpos(".", cursor)
  unlet l:cursor
endfunction

augroup my_autocmd
	autocmd!
	"backupファイルに日付
	autocmd BufWritePre * let &bex = '.' .strftime("%Y%m%d_%H%M%S")
	"文末スペース / 連続改行削除
	autocmd BufWritePre * call s:remove_dust()
	" 前回終了位置に移動 vim-lastplaceで代用しているつもり
	"autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal g`"' | endif
	" バッファ読み込み時にマークを初期化
	autocmd BufReadPost * delmarks!
	"" 色はお使いのカラースキームに合わせて
	""blueyed/vim-diminactive代替
	"autocmd ColorScheme * highlight NormalNC guifg=#a0a0a0 guibg=#121212
	"autocmd WinEnter,BufWinEnter * setlocal wincolor=
	"autocmd WinLeave * setlocal wincolor=NormalNC
	"Quickfixウィンドウ開く
	autocmd QuickFixCmdPost *grep* cwindow
	"ウィンドウを常に等分割
	autocmd VimResized * :wincmd =
	"session保存時クイックフィックス閉じる
	autocmd VimLeave * cclose
	autocmd VimLeave * mks! ~/.vim/session/$DATE.vim
	"qfウィンドウを常に最下部で開く
	autocmd FileType qf wincmd J
	"折りたたみ設定
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType toml setlocal foldmethod=marker
    autocmd FileType gitcommit setlocal spell
    autocmd BufNewFile,BufRead *.py
        \ setlocal errorformat=%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
        \ foldmethod=indent
    autocmd BufNewFile,BufRead *.seq,*.s,*.h,*.tbl setfiletype seq
    autocmd BufNewFile,BufRead *.toml setfiletype toml
    autocmd BufNewFile,BufRead *.csv setfiletype csv
    autocmd BufNewFile,BufRead *.lark setfiletype lark
augroup END

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $HOME/vimfiles/*,$HOME/vimfiles/init/*.vim,$HOME/vimrc/init/*.vim,$MYVIMRC
				\:nested source $MYVIMRC
				\|if has('gui_running') |source $MYGVIMRC |endif
				\|if exists('g:loaded_webdevicons') | call webdevicons#refresh() | endif
				\|redraw
				\|echomsg printf('VIMRC has reloaded (%s).', strftime('%c'))
augroup END

"lazy loadでVinEnterを指定していると２重で実行されてしまう
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
