vim.cmd([[
command! PackerInstall packadd packer.nvim | lua require'packers'.install()
command! PackerUpdate packadd packer.nvim | lua require'packers'.update()
command! PackerSync packadd packer.nvim | lua require'packers'.sync()
command! PackerClean packadd packer.nvim | lua require'packers'.clean()]vim.cmd[[command! PackerCompile packadd packer.nvim | lua require'packers'.compile()

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
	"backup�t�@�C���ɓ��t
	autocmd BufWritePre * let &bex = '.' .strftime("%Y%m%d_%H%M%S")
	"�����X�y�[�X / �A�����s�폜
	autocmd BufWritePre * call s:remove_dust()
	" �O��I���ʒu�Ɉړ� vim-lastplace�ő�p���Ă������
	"autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal g`"' | endif
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
    autocmd BufNewFile,BufRead *.toml setfiletype toml
    autocmd BufNewFile,BufRead *.csv setfiletype csv
    autocmd BufNewFile,BufRead *.lark setfiletype lark
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
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
]])
