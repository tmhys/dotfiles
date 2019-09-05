" Last Change: 01-Sep-2019.
" Maintainer: TH

""mhinz/vim-startify{{{
"nnoremap <M-s> :Startify<CR>
""autocmd TabNew * :Startify
"noremap <Space>tn :<C-u>tabnew<CR> :Startify<CR>
"
"" 起動時の画面の設定
"let g:startify_files_number = 10
"let g:startify_change_to_dir       = 1
"let g:startify_fortune_use_unicode = 1
"let g:startify_update_oldfiles     = 1
"let g:startify_use_env             = 1
"let g:startify_session_autoload       = 1
"let g:startify_session_delete_buffers = 1
"let g:startify_session_persistence    = 1
"let g:startify_session_number = 10
"let g:startify_session_sort = 1
"let g:startify_enable_special = 0
"let g:startify_session_dir = '~/.vim/session'
"let NERDTreeHijackNetrw = 0
"let g:startify_session_before_save = [
"        \ 'echo "Cleaning up before saving.."',
"        \ 'silent! NERDTreeTabsClose'
"        \ ]
"let g:startify_session_savevars = [
"           \ 'g:startify_session_savevars',
"           \ 'g:startify_session_savecmds',
"           \ 'g:random_plugin_use_feature'
"           \ ]
"
"let g:startify_list_order = [
"        \ ['⚑  Sessions:'],
"        \ 'sessions',
"        \ ['♻  MRU:'],
"        \ 'files',
"        \ ['♲  MRU in Current Directory:'],
"        \ 'dir',
"        \ ['☺  Bookmarks:'],
"        \ 'bookmarks',
"        \ ]
"
"" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
"let g:startify_custom_indices = ['d', 'f', 'h', 'r', 'i', 'o', 'b']
"" よく使うファイルをブックマークとして登録しておく
"let g:startify_bookmarks = [
"  \ '$VIM/_vimrc',
"  \ '$VIM/_gvimrc',
"  \ '$VIM/vim80/userautoload/SysSeq.vim',
"  \ '$VIM/task.taskpaper',
"\ ]
"
""if has('win64')
" let g:startify_custom_header =
"            \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')
" "endif
""if has('nvim')
"" let g:startify_custom_header =
""            \ startify#fortune#cowsay('═','║','╔','╗','╝','╚')
"" endif
"
" autocmd VimEnter *
"                \   if !argc()
"                \ |   Startify
"                "\ |   NERDTree
"                \ |   wincmd w
"                \ | endif
""}}}
"AndrewRadev/switch.vim{{{
let g:switch_mapping = "-"
let g:switch_custom_definitions =
    \ [
    \   ['on', 'off']
    \ ]
"}}}
"airblade/vim-gitgutter{{{
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
"}}}
"scrooloose/nerdtree{{{
"curren directoryに合わせて NERDTreeToggle
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
"""bookmark初期表示
let g:NERDTreeShowBookmarks=1
"lag対策
let g:NERDTreeLimitedSyntax = 1

let NERDTreeIgnore = ['.dat$','.exe$','.dbg$','.bak$','.dll$']


""NERDTree矢印変更{{{
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['seq'] = '\uf9cd'
"}}}

" NERDTreeでルートを変更したらchdirする
let g:NERDTreeChDirMode = 2

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', 'NONE')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('h',      'blue',  'none', '#3366FF',  'NONE')
call NERDTreeHighlightFile('H',      'blue',  'none', '#3366FF',  'NONE')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    'NONE')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    'NONE')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     'NONE')
call NERDTreeHighlightFile('seq',    'Red',     'none', 'red',     'NONE')
call NERDTreeHighlightFile('SEQ',    'Red',     'none', 'red',     'NONE')
call NERDTreeHighlightFile('s',      'Red',     'none', 'red',     'NONE')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', 'NONE')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', 'NONE')
"}}}
"Shougo/neosnippet.vim{{{
let g:neosnippet#snippets_directory='~/.vim/my_snippet'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 0
let g:deoplete#max_list = 10000
"" SuperTab like snippets behavior
"imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
"smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"}}}
"haya14busa/incsearch-fuzzy.vim{{{
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
"}}}
"haya14busa/incsearch.vim{{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"}}}
"ryanoasis/vim-devicons{{{
if hostname()!=?'localhost'
	" adding the custom source to unite
	let g:webdevicons_enable_unite = 1
	" adding the column to vimfiler
	let g:webdevicons_enable_vimfiler = 1
	" Adding the custom source to denite
	let g:webdevicons_enable_denite = 0

	let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
	" adding the flags to NERDTree
	let g:webdevicons_enable_nerdtree = 1
	" whether or not to show the nerdtree brackets around flags
	let g:webdevicons_conceal_nerdtree_brackets = 1
	" Force extra padding in NERDTree so that the filetype icons line up vertically
	let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

	" change the default character when no match found
	"let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '?'

	" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
	" disabled by default with no value
	let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

	" enable folder/directory glyph flag (disabled by default with 0)
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1

	" enable open and close folder/directory glyph flags (disabled by default with 0)
	let g:DevIconsEnableFoldersOpenClose = 1

	" enable pattern matching glyphs on folder/directory (enabled by default with 1)
	let g:DevIconsEnableFolderPatternMatching = 1

	" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
	let g:DevIconsEnableFolderExtensionPatternMatching = 0
	if exists("g:loaded_webdevicons")
	  call webdevicons#refresh()
	endif
endif
"}}}
"itchyny/lightline.vim{{{
"カラースキームを自動で変更
augroup LightlineColorscheme
		  autocmd!
		  autocmd ColorScheme * call s:lightline_update()
		augroup END
		function! s:lightline_update()
		  if !exists('g:loaded_lightline')
		    return
		  endif
		  try
		    if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|Tomorrow\|molokai\|tender\|papercolor\|one\|ayu'"seoul256
		      let g:lightline.colorscheme =
		            \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '')
		      call lightline#init()
		      call lightline#colorscheme()
		      call lightline#update()
		    endif
		  catch
		  endtry
		endfunction
"
"""常時ステータスライン表示
"set laststatus=2
"
"if hostname()!=?'localhost'
"		let g:lightline = {
"            \ 'active': {
"            \   'left': [ [ 'mode', 'paste' ],
"            \             [ 'fugitive','dir', 'filename' ],
"			\			  ['currentfuncname']]
"            \ },
"            \ 'component_function': {
"            \   'fugitive': 'LightLineFugitive',
"            \   'dir': 'LightLineDir',
"            \   'readonly': 'LightLineReadonly',
"            \   'modified': 'LightLineModified',
"            \   'filename': 'LightLineFilename',
"            \   'filetype': 'LightLineFiletype',
"            \   'fileformat': 'LightLineFileformat',
"			\	'currentfuncname': 'LightLineCfi',
"  			\ 'percent': 'MyLightLinePercent',
"  			\ 'lineinfo': 'MyLightLineLineInfo'
"            \ },
"		    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"      		\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
"            \ }
"
"			"\ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6" },
"			"\ 'subseparator': { 'left': "\ue0b5", 'right': "\ue0b7" }
"		    "\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"      		"\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
"		    "\ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba" },
"      		"\ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb" }
"		    "\ 'separator': { 'left': "\ue0c4", 'right': "\ue0c6" },
"      		"\ 'subseparator': { 'left': "\ue0c5", 'right': "\ue0c7" }
"            "\ 'separator': { 'left': '', 'right': '' },
"            "\ 'subseparator': { 'left': '', 'right': '' }
"endif
"
"function! LightLineModified()
"    if &filetype == "help"
"        return ""
"    elseif &modified
"        return "+"
"    elseif &modifiable
"        return ""
"    else
"        return ""
"    endif
"endfunction
"
"                "\ ('' != expand('%:.') ? expand('%:.') : '') .
"function! LightLineDir()
"    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
"                \ ('' != expand('%:p:h:t') ? expand('%:p:h:t') : '') .
"                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
"endfunction
"
"function! LightLineReadonly()
"    if &filetype == "help"
"        return ""
"    elseif &readonly
"        return ""
"    else
"        return ""
"    endif
"endfunction
"
"function! LightLineFugitive()
"    if exists("*fugitive#head")
"        let _ = fugitive#head()
"        return strlen(_) ? ''._ : ''
"    endif
"    return ''
"endfunction
"
"function! LightLineFilename()
"    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
"                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
"                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
"endfunction
"
"function! LightLineFiletype()
"  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
"endfunction
"
"function! LightLineFileformat()
"  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
"endfunction
"
"function! LightLineCfi()
"  if exists('*cfi#format')
"    return cfi#format('%s', '')
"  end
"  return ''
"endfunction
"
"let g:lightline.tab = {
"      \ 'active': [ 'tabnum', 'filename', 'modified' ],
"      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
"      \ }
"
"let g:lightline.tab_component_function = {
"      \ 'filename': 'LightlineTabFilename',
"      \ 'modified': 'lightline#tab#modified',
"      \ 'readonly': 'lightline#tab#readonly',
"      \ 'tabnum': 'lightline#tab#tabnum' }
"
"function! LightlineTabFilename(n) abort
"  let buflist = tabpagebuflist(a:n)
"  let winnr = tabpagewinnr(a:n)
"  let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
"  return _ !=# '' ? _ : '[No Name]'
"endfunction
"
""{{{
""
"function! LightlineModified()
"  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
"endfunction
"
"function! LightlineReadonly()
"  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
"endfunction
"
"function! LightlineFilename()
"  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
"        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"        \  &ft == 'unite' ? unite#get_status_string() :
"        \  &ft == 'vimshell' ? vimshell#get_status_string() :
"        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
"endfunction
"
"function! LightlineFugitive()
"  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
"    return fugitive#head()
"  else
"    return ''
"  endif
"endfunction
"
"function! LightlineFileencoding()
"  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
"endfunction
"
"function! LightlineMode()
"  return winwidth(0) > 60 ? lightline#mode() : ''
"endfunction
""}}}
"
function! MyLightLinePercent()
  if &ft !=? 'nerdtree'
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction

function! MyLightLineLineInfo()
  if &ft !=? 'nerdtree'
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction
"}}}
"delphinus/ightline-delphinus{{{
let g:lightline_delphinus_use_powerline_glyphs = 1
let g:lightline_delphinus_use_nerd_fonts_glyphs = 1
"let g:lightline_delphinus_colorscheme = 1
let g:lightline_delphinus_tagbar_enable = 1
let g:lightline_delphinus_gitgutter_enable = 1
"}}}
"junegunn/vim-easy-align{{{
"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}
"majutsushi/tagbar{{{
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_seq = {
	\ 'ctagstype' : 'seq',
	\ 'kinds' : [
		\ 'u:unit'
	\ ],
	\ 'sort' : 0
\ }
let g:tagbar_type_toml = {
    \ 'ctagstype' : 'toml',
    \ 'kinds' : [
        \ 'p:plugin'
    \ ],
    \ 'sort' : 0
\ }
"}}}
"miura/ImageJMacro_Highlighter{{{
au BufRead,BufNewFile *.ijm set filetype=ijmacro
"}}}
"rhysd/accelerated-jK{{{
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"}}}
"simeji/winresizer{{{
"キーマップ変更
let g:winresizer_start_key = '<M-w>'
"}}}
"thinca/vim-quickrun{{{
" vimprocで非同期実行
" 成功時にバッファ、失敗時にQuickFixで表示
" 結果表示のサイズ調整など
"let g:quickrun_config = get(g:, 'quickrun_config', {})
"let g:quickrun_config._ = {
"      \ 'outputter' : 'error',
"      \ 'runner'    : 'vimproc',
"      \ 'runner/vimproc/updatetime' : 60,
"      \ 'outputter/error/success' : 'quickfix',
"      \ 'outputter/error/error'   : 'quickfix',
"      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
"      \ 'outputter/buffer/close_on_empty' : 1
"      \ }
"      "\ 'outputter/error/success' : 'buffer',
""コンパイラexeにパスを通しておくこと
""コンパイルしたいディレクトリに移動してから実行
""本文中にsequence E177Hと書いてあるファイルがメイン
"
"let g:quickrun_config["seq"] = {
"		\ "exec":"SeqCnv_V340.exe 00_Main -l"
"	  	\}
"let &errorformat = '%WWarning: %f (%l):%m,%EError: %f (%l):%m'
"
"" 実行時に前回の表示内容をクローズ&保存してから実行
"let g:quickrun_no_default_key_mappings = 1
"nmap <Space>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
"}}}
"tpope/vim-fugitive{{{
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]p :Gpush origin master<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>
"}}}
"tyru/open-browser.vim{{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)
"}}}
"tyru/restart.vim{{{
" :Restart 時に変数の定義を行う
command! MyRestart Restart --cmd "let g:restarted = 1"

" この変数を使用して :Restart が行われたかどうかの判定を行う
if !exists("g:restarted")
    let $PATH = $PATH . ";C:/cpp/boost"
endif
"}}}
"w0rp/ale{{{
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_linters = {
\   'python': ['flake8', 'autopep8'],
\}
" nr2char(...) is for describing icons from devicons
let g:ale_echo_msg_error_str = nr2char(0xf421) . ' '
let g:ale_echo_msg_warning_str = nr2char(0xf420) . ' '
let g:ale_echo_msg_info_str = nr2char(0xf05a) . ' '
let g:ale_echo_msg_format = '%severity%  %linter% - %s'
let g:ale_sign_column_always = 1
let g:ale_sign_error = g:ale_echo_msg_error_str
let g:ale_sign_warning = g:ale_echo_msg_warning_str
let g:ale_statusline_format = [
      \ g:ale_echo_msg_error_str . ' %d',
      \ g:ale_echo_msg_warning_str . ' %d',
      \ nr2char(0xf4a1) . '  ']
"}}}
"Yggdroot/indentLine{{{
set list listchars=tab:\¦\ "spaceが必要
let g:indentLine_fileTypeExclude = ['help', 'nerdtree','denite','startify','taskpaper','unite','tagbar']
"}}}
"thinca/vim-singleton{{{
if hostname()!=?'localhost'
call singleton#enable()
endif
"}}}
"kana/vim-smartchr{{{
" 演算子の間に空白を入れる
inoremap <expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', ' << ', '<')
inoremap <expr> > search('^#include <.*\%#', 'bcn')? '>': smartchr#one_of(' > ', ' >> ', '>')
inoremap <expr> + smartchr#one_of(' + ', '++', '+')
inoremap <expr> - smartchr#one_of(' - ', '--', '-')
inoremap <expr> / smartchr#one_of(' / ', '// ', '/')
" *はポインタで使うので、空白はいれない
inoremap <expr> & smartchr#one_of(' & ', ' && ', '&')
inoremap <expr> % smartchr#one_of(' % ', '%')
inoremap <expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
inoremap <expr> , smartchr#one_of(', ', ',')
" 3項演算子の場合は、後ろのみ空白を入れる
inoremap <expr> ? smartchr#one_of('? ', '?')
inoremap <expr> : smartchr#one_of(': ', '::', ':')

" =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
" 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
inoremap <expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
				\ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
				\ : smartchr#one_of(' = ', ' == ', '=')

" 下記の文字は連続して現れることがまれなので、二回続けて入力したら改行する
"inoremap <expr> } smartchr#one_of('}', '}<cr>')
inoremap <expr> ; smartchr#one_of(';', ';<cr>')
" 「->」は入力しづらいので、..で置換え
inoremap <expr> . smartchr#loop('.', '->', '...')
" 行先頭での@入力で、プリプロセス命令文を入力
inoremap <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#one_of('#define', '#include', '#ifdef', '#endif', '@'): '@'

inoremap <expr> " search('^#include\%#', 'bcn')? ' "': '"'
" if文直後の(は自動で間に空白を入れる
inoremap <expr> ( search('\<\if\%#', 'bcn')? ' (': '('
"}}}
"terryma/vim-expand-region{{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}
"cohama/vim-hier{{{
"let g:hier_highlight_group_qfi  = ''
" エラーを赤字の波線で
execute "highlight qf_error_ucurl gui=undercurl guisp=Red"
let g:hier_highlight_group_qf  = "qf_error_ucurl"
" 警告を青字の波線で
execute "highlight qf_warning_ucurl gui=undercurl guisp=Blue"
let g:hier_highlight_group_qfw = "qf_warning_ucurl"
let g:hier_highlight_group_qfi = ""
"}}}
"osyo-manga/vim-watchdogs{{{
let g:quickrun_config = get(g:, 'quickrun_config', {})
      "\ 'outputter/error/success' : 'buffer',
"コンパイラexeにパスを通しておくこと
"コンパイルしたいディレクトリに移動してから実行
"本文中にsequence E177Hと書いてあるファイルがメイン

let g:quickrun_config["seq"] = {
		\ "exec":"SeqCnv_V340.exe 00_Main -l"
	  	\}
let &errorformat = '%WWarning: %f (%l):%m,%EError: %f (%l):%m'

let g:quickrun_config = {
\   "seq/watchdogs_checker" : {
\       "type" : "watchdogs_checker/SeqCnv_V340",
\ 		"exec":"SeqCnv_V340.exe 00_Main -l",
\   },
\   "watchdogs_checker/_" : {
\       "hook/close_quickfix/enable_exit" : 1,
\		"hook/echo/enable" : 1,
\		"hook/echo/output_success": "> No Errors Found.",
\		"hook/echo/output_failure": "> Errors Found.",
\   },
\}

let s:config = {
\   "watchdogs_checker/seq" : {
\ 		"exec":"SeqCnv_V340.exe 00_Main -l",
\   },
\}

"let g:watchdogs_check_CursorHold_enable = {
"	\	"seq" : 1
"	\}
"let g:watchdogs_check_BufWritePost_enable= {
"	\	"seq" : 1
"	\}
let g:watchdogs_check_BufWritePost_enable=1

let g:quickrun_config._ = {
      \ 'outputter' : 'error',
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 40,
	  \ 'outputter/quickfix/open_cmd' : "",
      \ 'outputter/error/success' : 'quickfix',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1
      \ }
unlet s:config
call watchdogs#setup(g:quickrun_config)

"実行時に前回の表示内容をクローズ&保存してから実行
"let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config["seq"] = {
		\ "exec":"SeqCnv_V340.exe 00_Main -l"
	  	\}
nmap <Space>r :cclose<CR>:write<CR>:QuickRun -mode n<CR><M-q>
"}}}
"junegunn/fzf.vim{{{
"command! -bang -nargs=* Pt
"  \ call fzf#vim#grep(
"  \   'pt --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap    [fzf]   <Nop>
nmap    <Space>f [fzf]

nnoremap [fzf]b :Buffers<CR>
nnoremap [fzf]x :Commands<CR>
nnoremap [fzf]f :Files<CR>
nnoremap [fzf]g :Ag<CR>
nnoremap [fzf]i :Colors<CR>
nnoremap [fzf]a :Marks<CR>
nnoremap [fzf]p :Files ~/.cache/dein/repos<CR>
nnoremap [fzf]<Space> BLines<CR>
nnoremap [fzf]m :History<CR>
nnoremap [fzf]t :Tags<CR>

"Command	List
"Files [PATH]	Files (similar to :FZF)
"GFiles [OPTS]	Git files (git ls-files)
"GFiles?	Git files (git status)
"Buffers	Open buffers
"Colors	Color schemes
"Ag [PATTERN]	ag search result (ALT-A to select all, ALT-D to deselect all)
"Lines [QUERY]	Lines in loaded buffers
"BLines [QUERY]	Lines in the current buffer
"Tags [QUERY]	Tags in the project (ctags -R)
"BTags [QUERY]	Tags in the current buffer
"Marks	Marks
"Windows	Windows
"Locate PATTERN	locate command output
"History	v:oldfiles and open buffers
"History:	Command history
"History/	Search history
"Snippets	Snippets (UltiSnips)
"Commits	Git commits (requires fugitive.vim)
"BCommits	Git commits for the current buffer
"Commands	Commands
"Maps	Normal mode mappings
"Helptags	Help tags
"Filetypes	File types

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"}}}
