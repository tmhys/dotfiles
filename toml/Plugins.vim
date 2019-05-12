" Last Change: 12-May-2019.
" Maintainer: TH

if !executable('git')
"AndrewRadev/switch.vim{{{
let g:switch_mapping = "-"
let g:switch_custom_definitions =
    \ [
    \   ['on', 'off']
    \ ]
"}}}
"scrooloose/nerdtree{{{
map <C-n> :NERDTreeToggle<CR>
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
" SuperTab like snippets behavior
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
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

""常時ステータスライン表示
set laststatus=2
			"\ 'colorscheme': 'solarized',

if hostname()!=?'localhost'
		let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive','dir', 'filename' ],
			\			  ['currentfuncname']]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'dir': 'LightLineDir',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'filename': 'LightLineFilename',
            \   'filetype': 'LightLineFiletype',
            \   'fileformat': 'LightLineFileformat',
			\	'currentfuncname': 'LightLineCfi',
  			\ 'percent': 'MyLightLinePercent',
  			\ 'lineinfo': 'MyLightLineLineInfo'
            \ },
		    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      		\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
            \ }

			"\ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6" },
			"\ 'subseparator': { 'left': "\ue0b5", 'right': "\ue0b7" }
		    "\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      		"\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
		    "\ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba" },
      		"\ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb" }
		    "\ 'separator': { 'left': "\ue0c4", 'right': "\ue0c6" },
      		"\ 'subseparator': { 'left': "\ue0c5", 'right': "\ue0c7" }
            "\ 'separator': { 'left': '', 'right': '' },
            "\ 'subseparator': { 'left': '', 'right': '' }
endif

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

                "\ ('' != expand('%:.') ? expand('%:.') : '') .
function! LightLineDir()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:p:h:t') ? expand('%:p:h:t') : '') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ''._ : ''
    endif
    return ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineCfi()
  if exists('*cfi#format')
    return cfi#format('%s', '')
  end
  return ''
endfunction

let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }

let g:lightline.tab_component_function = {
      \ 'filename': 'LightlineTabFilename',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'lightline#tab#tabnum' }

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
  return _ !=# '' ? _ : '[No Name]'
endfunction

"{{{
"
function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
"}}}

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
"}}}
"mhinz/vim-startify{{{
nnoremap <M-s> :Startify<CR>
"autocmd TabNew * :Startify
noremap <Space>tn :<C-u>tabnew<CR> :Startify<CR>

" 起動時の画面の設定
let g:startify_files_number = 10
let g:startify_change_to_dir       = 0
let g:startify_enable_special      = 0
let g:startify_fortune_use_unicode = 1
let g:startify_update_oldfiles     = 1
let g:startify_use_env             = 1
let g:startify_session_autoload       = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence    = 1
let g:startify_session_number = 10
let g:startify_session_sort = 1
let g:startify_enable_special = 1
let g:startify_session_dir = '~/.vim/session'
let NERDTreeHijackNetrw = 0
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]
let g:startify_session_savevars = [
           \ 'g:startify_session_savevars',
           \ 'g:startify_session_savecmds',
           \ 'g:random_plugin_use_feature'
           \ ]

let g:startify_list_order = [
        \ ['⚑  Sessions:'],
        \ 'sessions',
        \ ['♻  MRU:'],
        \ 'files',
        \ ['♲  MRU in Current Directory:'],
        \ 'dir',
        \ ['☺  Bookmarks:'],
        \ 'bookmarks',
        \ ]

" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
let g:startify_custom_indices = ['d', 'f', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = [
  \ '$VIM/_vimrc',
  \ '$VIM/_gvimrc',
  \ '$VIM/vim80/userautoload/SysSeq.vim',
  \ '$VIM/task.taskpaper',
\ ]

"if has('win64')
 let g:startify_custom_header =
            \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')
 "endif
"if has('nvim')
" let g:startify_custom_header =
"            \ startify#fortune#cowsay('═','║','╔','╗','╝','╚')
" endif

 autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                "\ |   NERDTree
                \ |   wincmd w
                \ | endif
"}}}
"rhysd/accelerated-jK{{{
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"}}}
"simeji/winresizer{{{
"キーマップ変更
let g:winresizer_start_key = '<M-w>'
""}}}
"thinca/vim-quickrun{{{
" vimprocで非同期実行
" 成功時にバッファ、失敗時にQuickFixで表示
" 結果表示のサイズ調整など
let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 40,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : ':botright 8sp',
    \ }
\}

" 実行時に前回の表示内容をクローズ&保存してから実行
let g:quickrun_no_default_key_mappings = 1
nmap <Space>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
"}}}
"tpope/vim-fugitive{{{
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]p :Gpush origin master
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>
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
"}}}
"Yggdroot/indentLine{{{
set list listchars=tab:\¦\ "spaceが必要
let g:indentLine_fileTypeExclude = ['help', 'nerdtree','startify','taskpaper','unite','tagbar']
"}}}
"ryanoasis/vim-devicons{{{
if hostname()!=?'localhost'
	" adding the custom source to unite
	let g:webdevicons_enable_unite = 1
	" adding the column to vimfiler
	let g:webdevicons_enable_vimfiler = 1

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
"thinca/vim-singleton{{{
if hostname()!=?'localhost'
call singleton#enable()
endif
"}}}
"Shougo/deoplete.nvim{{{
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
"}}}
"yuttie/comfortable-motion.vim{{{
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
"}}}
""Shougo/unite.vim{{{
"" The prefix key.
"nnoremap    [unite]   <Nop>
"nmap    <Space>f [unite]
"
"" 挿入モードで開始する
"let g:unite_enable_start_insert=1
""最近開いたファイル履歴の保存数
"let g:unite_source_file_mru_limit = 50
"" 大文字小文字を区別しない
"let g:unite_enable_ignore_case = 1
"let g:unite_enable_smart_case = 1
""file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
"let g:unite_source_file_mru_filename_format = ''
"
"" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""現在開いているファイルのディレクトリ下のファイル一覧。
""開いていない場合はカレントディレクトリ
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
""バッファ一覧
"nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
""レジスタ一覧
"nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
""最近使用したファイル一覧
"nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
""ブックマーク一覧
"nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
""ブックマークに追加
"nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
""uniteを開いている間のキーマッピング
"autocmd FileType unite call s:unite_my_settings()
""関数検索
"nnoremap <silent> [unite]u :<C-u>Unite outline<CR>
"function! s:unite_my_settings() "{{{
"	"ESCでuniteを終了
"	nmap <buffer> <ESC> <Plug>(unite_exit)
"	"入力モードのときjjでノーマルモードに移動
"	imap <buffer> jj <Plug>(unite_insert_leave)
"	"入力モードのときctrl+wでバックスラッシュも削除
"	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
"	"ctrl+jで縦に分割して開く
"	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"	"ctrl+lで横に分割して開く
"	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"	"ctrl+oでその場所に開く
"	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
"	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
"endfunction "}}}
"
"" vinarise
"let g:vinarise_enable_auto_detect = 1
"
"" unite-build map
"nnoremap <silent> ,vb :Unite build<CR>
"nnoremap <silent> ,vcb :Unite build:!<CR>
"nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"
""{{{start
"let g:unite_source_alias_aliases = {
"\ "startup_file_mru" : {
"\  "source" : "file_mru",
"\ },
"\ "startup_directory_mru" : {
"\  "source" : "directory_mru",
"\ },
"\}
"
""\ "startup_session" : {
""\  "source" : "session",
""\ },
"
"" 表示数の制限
"call unite#custom_max_candidates("startup_file_mru", 10)
"call unite#custom_max_candidates("startup_directory_mru", 10)
"
"if !exists("g:unite_source_menu_menus")
"  let g:unite_source_menu_menus = {}
"endif
"
"" :Unite menu:startup での出力リスト
"let g:unite_source_menu_menus.startup = {
"\ "description" : "startup menu",
"\ "command_candidates" : [
"\   [ "edit",  "edit" ],
"\   [ "vimrc",  "edit " . $VIMHOME . "$MYVIMRC"],
"\   [ "gvimrc", "edit " . $VIMHOME . "$MYGVIMRC"],
"\   [ "toml", "edit " .  '~/.vim/rc/dein.toml'],
"\   [ "toml_lazy", "edit " .  '~/.vim/rc/dein_lazy.toml'],
"\   [ "unite-file_mru", "Unite file_mru" ],
"\   [ "unite-directory_mru", "Unite directory_mru" ],
"\ ]
"\}
"
""\   [ "vimfiler", "VimFiler" ],
""\   [ "unite-howm", "Unite qfixhowm/new qfixhowm:nocache -hide-source-names -no-split" ],
""\   [ "unite-update", "Unite -log neobundle/update" ],
"
"command! UniteStartup
"\ Unite
"\ output:echo:"===:📑::Menu:===":! menu:startup
"\ output:echo:":":!
"\ output:echo:"===:♻::MRU:File:===":! startup_file_mru
"\ output:echo:":":!
"\ output:echo:"===:♲::MRU:Directory:===":! startup_directory_mru
"\ -hide-source-names
"\ -no-split
"\ -quick-match
"
""\ output:echo:"===:⚑ ::Sessions::===":! startup_session
""\ output:echo:":":!
"
"augroup startup
"    autocmd!
"    autocmd VimEnter * nested :UniteStartup
"augroup END
"
"nnoremap <M-s> :UniteStartup<CR>
""}}}
""}}}
"Shougo/denite.nvim{{{
call denite#custom#option('default', 'prompt', '>')

" denite/insert モードのときは，C- で移動できるようにする
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')

" tabopen や vsplit のキーバインドを割り当て
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')

" jj で denite/insert を抜けるようにする
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')

" The prefix key.
nnoremap    [denite]   <Nop>
nmap    <Space>f [denite]
"現在開いているファイルのディレクトリ下のファイル一覧。
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir -direction=botright -cursor-wrap=true file file:new<CR>
"バッファ一覧
nnoremap <silent> [denite]b :<C-u>Denite -direction=botright -cursor-wrap=true buffer<CR>
"レジスタ一覧
nnoremap <silent> [denite]r :<C-u>Denite -direction=botright -cursor-wrap=true -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [denite]m :<C-u>Denite -direction=botright -cursor-wrap=true file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [denite]c :<C-u>Denite -direction=botright -cursor-wrap=true bookmark<CR>
"ブックマークに追加
nnoremap <silent> [denite]a :<C-u>DeniteBookmarkAdd<CR>

".git以下のディレクトリ検索
nnoremap <silent> [denite]k :<C-u>Denite -direction=botright -cursor-wrap=true
      \ -path=`substitute(finddir('.git', './;'), '.git', '', 'g')`
      \ file_rec/git<CR>

call denite#custom#source('file'    , 'matchers', ['matcher_cpsm', 'matcher_fuzzy'])

call denite#custom#source('buffer'  , 'matchers', ['matcher_regexp'])
call denite#custom#source('file_mru', 'matchers', ['matcher_regexp'])

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
  \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-W>', '<denite:move_up_path>', 'noremap')

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
endif

" カーソル以下の単語をgrep
nnoremap <silent> <Space><C-g> :<C-u>DeniteCursorWord grep -buffer-name=search line<CR><C-R><C-W><CR>
" 普通にgrep
nnoremap <silent> <Space><M-g> :<C-u>Denite -buffer-name=search -mode=normal grep<CR>
" resume previous buffer
nnoremap <silent> ;r :<C-u>Denite -buffer-name=search -resume -mode=normal<CR>

"denite startify
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
inoremap <expr> } smartchr#one_of('}', '}<cr>')
inoremap <expr> ; smartchr#one_of(';', ';<cr>')
" 「->」は入力しづらいので、..で置換え
inoremap <expr> . smartchr#loop('.', '->', '...')
" 行先頭での@入力で、プリプロセス命令文を入力
inoremap <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#one_of('#define', '#include', '#ifdef', '#endif', '@'): '@'

inoremap <expr> " search('^#include\%#', 'bcn')? ' "': '"'
" if文直後の(は自動で間に空白を入れる
inoremap <expr> ( search('\<\if\%#', 'bcn')? ' (': '('
"}}}
end

"" git clone https://github.com/yuttie/comfortable-motion.vim
"" git clone https://github.com/Shougo/unite.vim
" git clone https://github.com/AndrewRadev/switch.vim
" git clone https://github.com/LeafCage/foldCC
" git clone https://github.com/Shougo/context_filetype.vim
" git clone https://github.com/Shougo/denite.nvim
" git clone https://github.com/Shougo/deoplete.nvim
" git clone https://github.com/Shougo/neomru.vim
" git clone https://github.com/Shougo/neosnippet-snippets
" git clone https://github.com/Shougo/neosnippet.vim
" git clone https://github.com/Shougo/unite-session
" git clone https://github.com/Shougo/vimfiler.vim
" git clone https://github.com/Yggdroot/indentLine
" git clone https://github.com/airblade/vim-gitgutter
" git clone https://github.com/cespare/vim-toml
" git clone https://github.com/davidhalter/jedi-vim
" git clone https://github.com/delphinus/vim-auto-cursorline
" git clone https://github.com/deris/vim-shot-f
" git clone https://github.com/equalsraf/neovim-gui-shim
" git clone https://github.com/h1mesuke/unite-outline
" git clone https://github.com/haya14busa/incsearch-fuzzy.vim
" git clone https://github.com/haya14busa/incsearch.vim
" git clone https://github.com/itchyny/lightline.vim
" git clone https://github.com/junegunn/vim-easy-align
" git clone https://github.com/kana/vim-smartchr
" git clone https://github.com/kevinw/pyflakes-vim
" git clone https://github.com/kmnk/denite-dirmark
" git clone https://github.com/kmnk/vim-unite-giti
" git clone https://github.com/machakann/vim-highlightedyank
" git clone https://github.com/majutsushi/tagbar
" git clone https://github.com/mattn/benchvimrc-vim
" git clone https://github.com/mattn/sonictemplate-vim
" git clone https://github.com/mhinz/vim-startify
" git clone https://github.com/miura/ImageJMacro_Highlighter
" git clone https://github.com/osyo-manga/vim-precious
" git clone https://github.com/qpkorr/vim-renamer
" git clone https://github.com/reireias/vim-cheatsheet
" git clone https://github.com/rhysd/accelerated-jK
" git clone https://github.com/roxma/nvim-yarp
" git clone https://github.com/roxma/vim-hug-neovim-rpc
" git clone https://github.com/ryanoasis/vim-devicons
" git clone https://github.com/scrooloose/nerdtree
" git clone https://github.com/simeji/winresizer
" git clone https://github.com/taku-o/vim-copypath
" git clone https://github.com/thinca/vim-qfreplace
" git clone https://github.com/thinca/vim-quickrun
" git clone https://github.com/thinca/vim-singleton
" git clone https://github.com/thinca/vim-template
" git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
" git clone https://github.com/tpope/vim-fugitive
" git clone https://github.com/tpope/vim-surround
" git clone https://github.com/travisjeffery/vim-auto-mkdir
" git clone https://github.com/tyru/current-func-info.vim
" git clone https://github.com/tyru/open-browser.vim
" git clone https://github.com/tyru/restart.vim
" git clone https://github.com/ujihisa/unite-colorscheme
" git clone https://github.com/vim-scripts/errormarker.vim
" git clone https://github.com/w0rp/ale
" git clone https://github.com/yuratomo/dotnet-complete
" git clone https://github.com/nerdtree-git-plugin
