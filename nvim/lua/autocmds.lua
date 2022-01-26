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
				"\nested so $MYVIMRC so $MYGVIMRC | endif
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
    "������Ȃ������H
	autocmd BufWritePre * :%s/\s\+$//ge
	autocmd BufWritePre * :%s/\n\{4,}/\r\r\r/ge
	autocmd BufWritePre * :%s#\($\n\s*\)\+\%$##ge
	autocmd FileType vim setlocal foldmethod=marker
	autocmd BufWritePre * let &bex = '.' .strftime("%Y%m%d_%H%M%S")
augroup END

augroup last_status
	autocmd!
	" �O��I���ʒu�Ɉړ�
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal g`"' | endif
	" �o�b�t�@�ǂݍ��ݎ��Ƀ}�[�N��������
	autocmd BufReadPost * delmarks!
augroup END

augroup gitspellcheck
	autocmd!
    autocmd FileType gitcommit setlocal spell
augroup end

"augroup lua_map
"	autocmd!
"    autocmd FileType lua <buffer> inoremap 00 --
"augroup end

"augroup officelocal
"  "autocmd BufNewFile,BufRead *.seq,*.s,*.h,*.tbl setfiletype seq
"augroup end

]])
