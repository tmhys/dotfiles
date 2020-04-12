if empty(globpath(&rtp, 'autoload/denite.vim'))
  finish
endif

let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
call denite#custom#option('_', {
    \ 'winheight': '40*winheight(0)/100',
    \ 'prompt': '>',
    \ 'cached_filter': v:true,
    \ 'start_filter': v:true,
    \ 'statusline': v:false,
    \ 'highlight_filter_background': 'DeniteFilter',
    \ 'highlight_matched_char': 'Underlined',
    \ 'split': 'floating',
    \ })
"    \ 'cursor_shape': v:true,
"    \ 'cursor_wrap': v:true,

augroup DeniteDetectSize
	    autocmd!
		autocmd VimResized * call <SID>denite_detect_size()
augroup END

function! s:denite_detect_size() abort
	call denite#custom#option('_', {
        \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
        \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
        \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
        \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
        \ })
endfunction
call s:denite_detect_size()

augroup transparent-windows
	autocmd!
	autocmd FileType denite set winblend=10  " こちらも 5 〜 30 で試してみてください。
	autocmd FileType denite-filter set winblend=10
augroup END

" Define mappings
	autocmd FileType denite call s:denite_my_settings()
	function! s:denite_my_settings() abort
	  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
	  nnoremap <silent><buffer><expr> <S-CR> denite#do_map('do_action', 'vsplit')
	  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
	  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
	  nnoremap <silent><buffer><expr> q denite#do_map('quit')
	  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  	  nnoremap <silent><buffer><expr> a denite#do_map('open_filter_buffer')
	  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  	  nnoremap <silent><buffer><expr> <BS>    denite#do_map('move_up_path')
  	  nnoremap <silent><buffer><expr> <C-a>   denite#do_map('do_action', 'my_file_rec')
  	  nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
  	  nnoremap <silent><buffer><expr> <C-k>   denite#do_map('quit')
  	  nnoremap <silent><buffer><expr> <C-j>   denite#do_map('quit')
  	  nnoremap <silent><buffer><expr> <C-h>   denite#do_map('quit')
  	  nnoremap <silent><buffer><expr> <C-h>   denite#do_map('quit')
  	  nnoremap <silent><buffer><expr> <C-g>   denite#do_map('do_action', 'grep')
  	  nnoremap <silent><buffer><expr> <C-n>   denite#do_map('redraw')
  	  nnoremap <silent><buffer><expr> <C-x>   denite#do_map('quick_move')
  	  nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
	endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
	function! s:denite_filter_my_settings() abort
	  call deoplete#custom#buffer_option('auto_complete', v:false)
	endfunction

	call denite#custom#var('session', 'path', '~\.vim\session')

	call denite#custom#source('grep', 'args', ['', '', '!'])

	let ignore=&wildignore .
	\ ',*.pyc,.git,.hg,.svn'
	call denite#custom#var('file/rec', 'command',
	\ ['scantree.py', '--ignore', ignore])

	call denite#custom#var('file/rec', 'command',
	\ ['pt', '--follow', '--nocolor', '--nogroup',
	\  (has('win32') ? '-g:' : '-g='), ''])

	"let s:ignore_globs = ['.git', '.svn', 'node_module']
	"call denite#custom#var('file/rec', 'command',
	"\ ['pt', '--follow',]
	"\+ map(deepcopy(s:ignore_globs),
	"\{k, v -> '--ignore='.v}) +
	"\['--nocolor', '--nogroup',
	"\  (has('win32') ? '-g:' : '-g='), '']
	"\ )
	"call denite#custom#source('file/rec', 'max_candidates', '50000')
"
	" Change sorters.
"	call denite#custom#source(
"	\ 'file/rec', 'sorters', ['sorter/sublime'])

	" Pt command on grep source
	call denite#custom#var('grep', 'command', ['pt'])
	call denite#custom#var('grep', 'default_opts',
			\ ['-i', '--nogroup', '--nocolor', '--smart-case'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])

"	" Specify multiple paths in grep source
"	"call denite#start([{'name': 'grep',
"	"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])
"
	" Define alias
	call denite#custom#alias('source', 'file/rec/git', 'file/rec')
	call denite#custom#var('file/rec/git', 'command',
	      \ ['git', 'ls-files', '-co', '--exclude-standard'])

	call denite#custom#alias('source', 'file/rec/py', 'file/rec')
	call denite#custom#var('file/rec/py', 'command',['scantree.py'])

	" Change ignore_globs
	call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
	      \ [ '.git/', '.ropeproject/', '__pycache__/',
	      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" The prefix key.
nnoremap    [denite]   <Nop>
nmap    <Space>f [denite]

"メニュー
"nnoremap <silent> [denite]d :<C-u>Denite menu -no-start-filter<CR>
"dotfile
nnoremap <silent> [denite]d :<C-u>Denite file/rec:~/dotfiles<CR>
"プラグイン検索
nnoremap <silent> [denite]p :<C-u>Denite file/rec:~/.cache/dein/repos<CR>
"変更履歴
nnoremap <silent> [denite]c :<C-u>Denite change <CR>
"ヘルプ
nnoremap <silent> [denite]h :<C-u>Denite help <CR>
"Sessions
nnoremap <silent> [denite]s :<C-u>Denite session -no-start-filter<CR>
"カラースキーム変更
nnoremap <silent> [denite]i :<C-u>Denite -auto-action=preview colorscheme <CR>
"カレントディレクトリファイル一覧。
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir file file:new<CR>
"バッファ一覧
nnoremap <silent> [denite]b :<C-u>Denite buffer <CR>
"レジスタ一覧
nnoremap <silent> [denite]r :<C-u>Denite register <CR>
"最近使用したファイル一覧
nnoremap <silent> [denite]m :<C-u>Denite file/old <CR>
"バッファ内検索
nnoremap <silent> [denite]<Space> :<C-u>Denite line <CR>
"mark
nnoremap <silent> [denite]a :<C-u>Denite marks<CR>
""ブックマーク一覧
"nnoremap <silent> [denite]c :<C-u>Denite b-cursor-wrap=true -highlight-mode-insert=Search bookmark<CR>
""ブックマークに追加
"nnoremap <silent> [denite]a :<C-u>DeniteBookmarkAdd<CR>
" カーソル以下の単語をgrep
nnoremap <silent> [denite]w :<C-u>DeniteCursorWord grep -buffer-name=search<CR>
"-start_filter=0<CR>
" 普通にgrep
nnoremap <silent> [denite]g :<C-u>Denite -buffer-name=search grep<CR>
" resume previous buffer
nnoremap <silent> ;r :<C-u>Denite -buffer-name=search -resume -mode=normal <CR>
".git以下のディレクトリ検索
nnoremap <silent> [denite]k :<C-u>Denite
      \ -path=`substitute(finddir('.git', './;'), '.git', '', 'g')`
      \ file_rec/git
	  \ -start-filter<CR>
"nnoremap <silent> [denite]<C-r> :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
"nnoremap <silent> [denite]<C-n> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
"nnoremap <silent> [denite]<C-p> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>
nnoremap <silent> [denite]l :<C-u>Denite -buffer-name=search -auto-highlight line<CR>

	" Add custom menus
	let s:menus = {}

	let s:menus.zsh = {
		\ 'description': 'Edit your import zsh configuration'
		\ }
	let s:menus.zsh.file_candidates = [
		\ ['zshrc', '~/.config/zsh/.zshrc'],
		\ ['zshenv', '~/.zshenv'],
		\ ]

	let s:menus.my_commands = {
		\ 'description': 'Example commands'
		\ }
	let s:menus.my_commands.command_candidates = [
		\ ['Split the window', 'vnew'],
		\ ['Open zsh menu', 'Denite menu:zsh'],
		\ ['Format code', 'FormatCode', 'go,python'],
		\ ]

	call denite#custom#var('menu', 'menus', s:menus)