vim.cmd([[
command! PackerInstall packadd packer.nvim | lua require'packers'.install()
command! PackerUpdate packadd packer.nvim | lua require'packers'.update()
command! PackerSync packadd packer.nvim | lua require'packers'.sync()
command! PackerClean packadd packer.nvim | lua require'packers'.clean()]vim.cmd[[command! PackerCompile packadd packer.nvim | lua require'packers'.compile()

augroup my_autocmd
    autocmd!
    autocmd TextyankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
	"backup�t�@�C���ɓ��t
	autocmd BufWritePre * let &bex = '.' .strftime("%Y%m%d_%H%M%S")
	"�����X�y�[�X / �A�����s�폜
	function! s:remove_dust()
  	  let l:cursor = getpos(".")
	  keeppatterns %s/\s\+$//ge
	  keeppatterns %s/\n\{4,}/\r\r\r/ge
	  keeppatterns %s#\($\n\s*\)\+\%$##ge
  	  call setpos(".", cursor)
  	  unlet l:cursor
  	endfunction
	autocmd BufWritePre * call s:remove_dust()
	" �O��I���ʒu�Ɉړ�
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal g`"' | endif
	" �o�b�t�@�ǂݍ��ݎ��Ƀ}�[�N��������
	autocmd BufReadPost * delmarks!
	"" �F�͂��g���̃J���[�X�L�[���ɍ��킹��
	""blueyed/vim-diminactive���
	"autocmd ColorScheme * highlight NormalNC guifg=#a0a0a0 guibg=#121212
	"autocmd WinEnter,BufWinEnter * setlocal wincolor=
	"autocmd WinLeave * setlocal wincolor=NormalNC
	"Quickfix�E�B���h�E�J��
	autocmd QuickFixCmdPost *grep* cwindow
	"�E�B���h�E����ɓ�����
	autocmd VimResized * :wincmd =
	"session�ۑ����N�C�b�N�t�B�b�N�X����
	autocmd VimLeave * cclose
	autocmd VimLeave * mks! ~/.vim/session/$DATE.vim
	"qf�E�B���h�E����ɍŉ����ŊJ��
	autocmd FileType qf wincmd J
	"�܂肽���ݐݒ�
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType toml setlocal foldmethod=marker
    autocmd FileType gitcommit setlocal spell
    autocmd BufNewFile,BufRead *.py
        \ setlocal errorformat=%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
        \ foldmethod=indent
    autocmd BufNewFile,BufRead *.seq,*.s,*.h,*.tbl setfiletype seq
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


]])
