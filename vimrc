"for Chrosh
"
" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
" Last Change: 30-Sep-2018.
" Maintainer: TH

"Chrosh上で256カラーに必要らしい
set termguicolors

let g:vimproc#download_windows_dll = 1
"indentguide　消すな
let g:indent_guides_enable_on_vim_startup = 1

"startifyでのアイコン画像が崩れる 消すな
set encoding=utf8

"ChromeOSではないとき
"if hostname()!=?'localhost'
"endif

""dein{{{
if executable('git')
	if &compatible
		set nocompatible
	endif

	" dein path
	let s:dein_dir = expand('~/.cache/dein')
	let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

	" install dein.vim if not found
	if &runtimepath !~# '/dein.vim'
	  if !isdirectory(s:dein_repo_dir)
	    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	  endif
	  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
	endif

	if dein#load_state(s:dein_dir)
	  call dein#begin(s:dein_dir)

	  "toml設定{{{
	  "Plugin list
	  "let g:rc_dir    = expand('~/.vim/rc')
	  "let s:toml      = g:rc_dir . '/dein.toml'
	  "let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	  ""キャッシュしておく
	  "call dein#load_toml(s:toml,      {'lazy': 0})
	  "call dein#load_toml(s:lazy_toml, {'lazy': 1})
	 " }}}

	  "call dein#add('')
	  call dein#add(s:dein_repo_dir)
	  call dein#add('Shougo/neocomplcache')
	  call dein#add('Shougo/neocomplete.vim')
	  call dein#add('Shougo/neomru.vim')
	  call dein#add('Shougo/neosnippet-snippets')
	  call dein#add('Shougo/neosnippet.vim')
	  call dein#add('Shougo/unite.vim')
	  call dein#add('Shougo/vimfiler.vim')
	  call dein#add('cespare/vim-toml')
	  call dein#add('davidhalter/jedi-vim')
	  call dein#add('haya14busa/incsearch-fuzzy.vim')
	  call dein#add('haya14busa/incsearch.vim')
	  call dein#add('itchyny/lightline.vim')
	  call dein#add('kevinw/pyflakes-vim')
	  call dein#add('junegunn/vim-easy-align')
	  call dein#add('majutsushi/tagbar')
	  call dein#add('mattn/benchvimrc-vim')
	  call dein#add('mhinz/vim-startify')
	  call dein#add('miura/ImageJMacro_Highlighter')
	  call dein#add('nathanaelkane/vim-indent-guides')
	  call dein#add('qpkorr/vim-renamer')
	  call dein#add('rhysd/accelerated-jK')
	  call dein#add('scrooloose/nerdtree')
	  call dein#add('simeji/winresizer')
	  call dein#add('sunuslee/vim-plugin-random-colorscheme-picker')
	  call dein#add('thinca/vim-qfreplace')
	  call dein#add('thinca/vim-quickrun')
	  call dein#add('thinca/vim-singleton')
	  call dein#add('thinca/vim-template')
	  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
	  call dein#add('tpope/vim-surround')
	  call dein#add('w0rp/ale')
	  call dein#add('tyru/current-func-info.vim')
	  call dein#add('tyru/open-browser.vim')
	  call dein#add('tyru/restart.vim')
	  call dein#add('yuratomo/dotnet-complete')

	  "ColorScheme
	  call dein#add('altercation/vim-colors-solarized')
	  call dein#add('arcticicestudio/nord-vim')
	  call dein#add('cocopon/iceberg.vim')
	  call dein#add('itchyny/landscape.vim')
	  call dein#add('joshdick/onedark.vim')
	  call dein#add('nerdpad/dracula-vim')
	  call dein#add('nightsense/nemo')
	  call dein#add('sjl/badwolf')
	  call dein#add('tomasr/molokai')
	  call dein#add('vim-scripts/Wombat')
	  call dein#add('gosukiwi/vim-atom-dark')
	  call dein#add('vim-scripts/newspaper.vim')
	  call dein#add('tyrannicaltoucan/vim-quantum')
	  call dein#add('w0ng/vim-hybrid')
	  call dein#add('tpope/vim-fugitive')

	if hostname()!=?'localhost'
	  call dein#add('ryanoasis/vim-devicons')
	endif
"{{{
	  "call dein#add('vim-scripts/YankRing.vim')
	  "call dein#add('Shougo/vimproc.vim')
	  "call dein#add('osyo-manga/vim-brightest')
	  "call dein#add('easymotion/vim-easymotion')
	  "call dein#add('hail2u/vim-css3-syntax')
	  "call dein#add('haya14busa/incsearch-easymotion.vim')
	  "call dein#add('jelera/vim-javascript-syntax')
	  "call dein#add('junegunn/goyo.vim')
	  "call dein#add('kana/vim-tabpagecd')
	  "call dein#add('mattn/emmet-vim')
	  "call dein#add('othree/html5.vim')
	  "call dein#add('rcmdnk/vim-markdown')
	  "call dein#add('scrooloose/syntastic')
	  "call dein#add('ujihisa/unite-colorscheme')
"}}}
	  call dein#end()
	  call dein#save_state()
	endif

	"Required
	filetype plugin indent on
	syntax enable

	" If you want to install not installed plugins on startup.
	if dein#check_install()
	  call dein#install()
	endif

endif
"}}}

""Lightline{{{
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
		    if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|seoul256\|Tomorrow\|molokai'
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
            \ },
		    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      		\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
            \ }

		    "\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      		"\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
            "\ 'separator': { 'left': '', 'right': '' },
            "\ 'subseparator': { 'left': '', 'right': '' }

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

"Chrosh環境などNERDfontがないとき
	elseif
		let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

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

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

	endif
"}}}

"}}}

"""基本設定{{{
"カラー設定{{{
set background=light "light dark
colorscheme molokai "nord atom-dark badwolf hybrid newspaper wombat molokai solarized evening desert morning elford koehler landscape
"}}}

"フォント設定{{{
if has('win32')
  	set guifont=Cica:h11
	set printfont=Cica:h8
	set renderoptions=type:directx,renmode:5
	set ambiwidth=double
	set enc=utf-8
	source $VIMRUNTIME/delmenu.vim
	set langmenu=ja_jp.utf-8
	source $VIMRUNTIME/menu.vim
	set antialias
  	set linespace=1
"chrosh用
"  if has('kaoriya')
"    set ambiwidth=auto
"  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  set guifontset=a14,r14,k14
endif

set laststatus=2
"}}}

"シンタックスハイライト関係{{{
syntax on
set autoindent
"set expandtab
set tabstop=4
set shiftwidth=4
"set cursorline
"set cursorcolumn
set number

filetype plugin on
"}}}

"Quickfixウィンドウ開く{{{
autocmd QuickFixCmdPost *grep* cwindow
"}}}

"バックアップファイルの保存先変更{{{
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

let $DATE = strftime("%Y%m%d_%H%M%S")

set backup
set writebackup
set backupdir=$HOME/.vimbackup
au BufWritePre * let &bex = '.' .strftime("%Y%m%d_%H%M%S")
set undodir=$HOME/.vimbackup
set undofile
set noswapfile

"自動的にセッション保存{{{
au VimLeave * NERDTreeClose
au VimLeave	* mks! ~/.vim/session/$DATE.vim
"}}}

"chrosh用
"透過{{{
"gui
"set transparency=230
"}}}

"Alignを日本語環境で使用するための設定 未使用{{{
:let g:Align_xstrlen = 3
"}}}

"対になる括弧点滅{{{
set showmatch
set matchtime=1
"}}}

"文末スペース削除{{{
autocmd BufWritePre * :%s/\s\+$//ge
"}}}

"オムニ補完{{{
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor
imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"
"au BufNewFile,BufRead *.cs imap <expr> . pumvisible() ? "\<C-E>.\<C-X>\<C-O>\<C-P>" : ".\<C-X>\<C-O>\<C-P>"
"}}}

"メニューバーツールバー消す{{{
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=e
set showtabline=2
"}}}

"相対行番号表示&トグル
"set relativenumber
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

"同期スクロールトグル
nnoremap <F4> :<C-u>set scrollbind!<CR>

"IME状態に応じたカーソル色設定{{{
if has('multi_byte_ime')
  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  highlight CursorIM guifg=NONE guibg=#ecbcbc
endif
"}}}

"折りたたみ設定{{{
au FileType vim setlocal foldmethod=marker
au FileType seq setlocal foldmethod=marker
"}}}

"}}}

set scrolloff=10
set backspace=indent,eol,start
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”,｛:｝
"set virtualedit=all
set ignorecase
set smartcase

" 終了時に保存するセッションオプションを設定する{{{
let g:restart_sessionoptions
    \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'
"}}}

"カレントウィンドウを新規タブで開き直す{{{
if v:version >= 700
    nnoremap <M-n> :call OpenNewTab()<CR>
    function! OpenNewTab()
        let f = expand("%:p")
        execute ":q"
        execute ":tabnew ".f
    endfunction
endif
"}}}
"}}}

"""キーマップ{{{
nnoremap Y y$

"---<F6>タイムスタンプを挿入{{{
nmap <F6> <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR><ESC>
inoremap <F6> <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR>
nmap <F6>a <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> appended by <ESC>
inoremap <F6>a <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> appended by
nmap <F6>m <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> modified by <ESC>
inoremap <F6>m <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> modified by
"}}}

"ESCキー連打
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>:Undiff<CR>
nnoremap <silent> <ESC><ESC><ESC><ESC> :Restart<CR>

"jj,kkでEcs
inoremap jj <Esc>
inoremap hhh <Esc>
inoremap lll <Esc>
inoremap kkk <Esc>

"アクティブウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
"S-h,S-lで行頭、行末
nnoremap <S-h> ^
nnoremap <S-l> $
" vを二回で行末まで選択
vnoremap v $h
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
"インサートモードでも移動
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

" TABにて対応ペアにジャンプ
nnoremap <TAB> %
vnoremap <TAB> %

" 行を移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
" 複数行を移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]
"新規タブ
nnoremap <Space>tn :<C-u>tabnew<CR>
nnoremap <C-Tab> gt
nnoremap <S-C-Tab> gT

""縦分割版gf
nnoremap gs :vertical wincmd f<CR>

"最初にヤンクした文字列を繰り返しペースト
vnoremap <Space>p "0p

"ディレクトリ自動で移動
set autochdir&vim

"<Space>cd で編集ファイルのカレントディレクトリへと移動{{{
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>
"}}}

"カーソル下の単語をハイライトする
nnoremap <silent> <Space><Space> *N

"カーソル下の単語をハイライトしてから置換する
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

"1行挿入する
nnoremap <Space>o :<C-u>call append(expand('.'), '')<Cr>j

"改行する
nnoremap <M-o> i<CR><ESC>

"ESCで確実にIMEオフ
inoremap <ESC> <ESC>:set iminsert=0<CR>

"括弧補完{{{
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap ( ()<ESC>i
"inoremap < <><ESC>i
inoremap * **<ESC>i
inoremap ' ''<ESC>i
"}}}

""VDsplitをWinmergeライクに{{{
nnoremap <M-j> ]c
nnoremap <M-k> [c
nnoremap <M-h> <C-w>hdo
nnoremap <M-l> <C-w>hdp
"}}}

""vimrcの編集再読み込み{{{
"編集
command! Evimrc :e $MYVIMRC
command! Esysseq :e $VIM/vim80/userautoload/SysSeq.vim
command! Egvimrc :e $MYGVIMRC
"保存したら再読み込み
augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
	autocmd BufWritePost $MYVIMRC nested call lightline#update()
	autocmd BufWritePost $MYGVIMRC nested source $MYGVIMRC
	autocmd BufWritePost SysSeq.vim nested source $MYGVIMRC
augroup END
"}}}

"{{{Quickfix windowトグル
function! s:toggle_quickfix_window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
  cwindow
  endif
endfunction
"}}}
nnoremap <M-q> :<C-u>call <SID>toggle_quickfix_window()<CR>

" マーク設定 : {{{
" 基本マップ
nnoremap [Mark] <Nop>
nmap m [Mark]

" 現在位置をマーク
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif
nnoremap <silent>[Mark]m :<C-u>call <SID>AutoMarkrement()<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction

" 次/前のマーク
nnoremap [Mark]n ]`
nnoremap [Mark]N [`

" 一覧表示
nnoremap [Mark]l :<C-u>marks<CR>

" 前回終了位置に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal g`"' | endif

" バッファ読み込み時にマークを初期化
autocmd BufReadPost * delmarks!

" }}}
"}}}

"""各種プラグイン設定{{{
""winresizer{{{
"キーマップ変更
let g:winresizer_start_key = '<M-w>'
"}}}

"ijmacro{{{
"imageJマクロ
au BufRead,BufNewFile *.ijm set filetype=ijmacro
"}}}

""NERDTree{{{
"""bookmark初期表示
let g:NERDTreeShowBookmarks=1

let NERDTreeIgnore = ['.dat$','.exe$','.dbg$','.bak$']

map <C-n> :NERDTreeToggle<CR>
""NERDTree矢印変更{{{
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
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
""}}}

""NeoComplete{{{
let g:neocomplcache_enable_at_startup = 1
"}}}

"" indent guide{{{
" デフォルト設定はvimrcのほうに記入しないと反映されない
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree','startify','taskpaper','unite']
let g:indent_guides_auto_colors = 0
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray   ctermbg=4
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
""}}}

""C#用の設定{{{
au BufNewFile,BufRead *.cs imap <buffer>
au BufNewFile,BufRead *.cs      setl omnifunc=cs#complete
au BufNewFile,BufRead *.cs      setl bexpr=cs#balloon()
au BufNewFile,BufRead *.cs      setl ballooneval
"}}}

""カーソル移動高速化{{{
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"ラグ対策
set lazyredraw
"}}}

"" カーソル下のURLや単語をブラウザで開く{{{
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)
"}}}

""vim常駐{{{
call singleton#enable()

"" If starting gvim && arguments were given
" (assuming double-click on file explorer)
if has('gui_running') && argc()
    let s:running_vim_list = filter(
    \   split(serverlist(), '\n'),
    \   'v:val !=? v:servername')
    " If one or more Vim instances are running
    if !empty(s:running_vim_list)
        " Open given files in running Vim and exit.
        silent execute '!start gvim'
        \   '--servername' s:running_vim_list[0]
        \   '--remote-tab-silent' join(argv(), ' ')
        qa!
    endif
    unlet s:running_vim_list
endif
"}}}

"" unite.vim{{{
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Space>f [unite]

" 挿入モードで開始する
let g:unite_enable_start_insert=1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{
	"ESCでuniteを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
	"入力モードのときctrl+wでバックスラッシュも削除
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"ctrl+jで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	"ctrl+lで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction "}}}

" vinarise
let g:vinarise_enable_auto_detect = 1

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"}}}

"" Startify{{{
nnoremap <M-s> :Startify<CR>

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
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = [
  \ '$VIM/_vimrc',
  \ '$VIM/_gvimrc',
\ ]

if has('win64')
 let g:startify_custom_header =
            \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')
 endif
"if has('win32')
" let g:startify_custom_header =
"            \ startify#fortune#cowsay('═','║','╔','╗','╝','╚')
" endif

 autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                "\ |   NERDTree
                \ |   wincmd w
                \ | endif
""}}}

"" Start interactive EasyAlign in visual mode (e.g. vipga){{{
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}

"{{{rest.vim
" :Restart 時に変数の定義を行う
command! MyRestart Restart --cmd "let g:restarted = 1"

" この変数を使用して :Restart が行われたかどうかの判定を行う
if !exists("g:restarted")
    let $PATH = $PATH . ";C:/cpp/boost"
endif
"}}}

"{{{incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"}}}

"{{{incsearch-fuzzy
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
"}}}

""winresizer{{{
"キーマップ変更
let g:winresizer_start_key = '<M-w>'
nnoremap <M-w> :WinResizerStartResize<CR>
"}}}

"brightest-master{{{
" ハイライトを有効にします（既定値）
"BrightestEnable
"BrightestDisable

" ハイライトするグループ名を設定します
"" アンダーラインで表示する
"let g:brightest#highlight = {
"\   "group" : "BrightestUnderline"
"\}
"}}}

"Taskpaper{{{
let g:task_paper_date_format = "%Y-%m-%dT%H:%M"

au BufRead,BufNewFile *.taskpaper set filetype=taskpaper

command! Taskpaper :edit $VIM/task.taskpaper
"function! s:open_memo()
"  rightbelow vsplit $VIM/task.taskpaper
"  wincmd p
"
"endfunction
"
"augroup OpenMemo
" au!
" autocmd VimEnter * call s:open_memo()
"augroup END
"}}}

"devicon{{{
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

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
endif
"}}}

"" vim-easymotion の設定{{{
""  " デフォルトのキーマッピングを無効に
""    let g:EasyMotion_do_mapping = 0
""  " f + 2文字 で画面全体を検索してジャンプ
""    nmap <Leader><Leader> <plug>(easymotion-overwin-f2)
""  " 検索時、大文字小文字を区別しない
""    let g:EasyMotion_smartcase = 1
"	"}}}

"{{{VimFiler
"nmap <Space>sf :VimFilerBufferDir<Return>
"nmap <Space>sF :VimFilerExplorer -find<Return>
"let g:vimfiler_enable_auto_cd = 1
"let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_safe_mode_by_default = 0
"let g:vimfiler_tree_leaf_icon = ''
"let g:vimfiler_tree_opened_icon = '▾'
"let g:vimfiler_tree_closed_icon = '▸'
"let g:vimfiler_marked_file_icon = '✓'
"
"nnoremap <F2> :VimFiler -buffer-name=explorer -simple -split -winwidth=30 -toggle -no-quit<Cr>
"
"let s:my_action = { 'is_selectable' : 1 }
"function! s:my_action.func(candidates)
"  wincmd p
"  exec 'split '. a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_split', s:my_action)
"
"let s:my_action = { 'is_selectable' : 1 }
"function! s:my_action.func(candidates)
"  wincmd p
"  exec 'vsplit '. a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_vsplit', s:my_action)
"
"augroup vimfiler
"  autocmd!
"  autocmd FileType vimfiler call s:vimfiler_settings()
"augroup END
"function! s:vimfiler_settings()
"  " tree での制御は，<Space>
"  map <silent><buffer> <Space> <NOP>
"  nmap <silent><buffer> <Space> <Plug>(vimfiler_expand_tree)
"  nmap <silent><buffer> <S-Space> <Plug>(vimfiler_expand_tree_recursive)
"
"  " オープンは，<CR>(enter キー)
"  nmap <buffer><expr> <CR> vimfiler#smart_cursor_map(
"          \ "\<Plug>(vimfiler_cd_file)",
"          \ "\<Plug>(vimfiler_open_file_in_another_vimfiler)")
"
"
"  " マークは，<C-Space>(control-space)
"  nmap <silent><buffer> <C-Space> <Plug>(vimfiler_toggle_mark_current_line)
"  vmap <silent><buffer> <C-Space> <Plug>(vimfiler_toggle_mark_selected_lines)
"
"  " ウィンドウを分割して開く
"  nnoremap <silent><buffer><expr> <C-j> vimfiler#do_switch_action('split')
"  nnoremap <silent><buffer><expr> <C-k> vimfiler#do_switch_action('vsplit')
"
"  " 移動，<Tab> だけでなく <C-l> も
"  nmap <buffer> <C-l> <plug>(vimfiler_switch_to_other_window)
"
"  " 閉じる，<Esc> 2 回叩き
"  nmap <buffer> <Esc><Esc> <Plug>(vimfiler_exit)

"endfunction
"nnoremap <C-n> :VimFiler -buffer-name=explorer -simple -split -winwidth=30 -toggle -no-quit<Cr>
"nnoremap <F2> :VimFiler -buffer-name=explorer -simple -split -winwidth=30 -toggle -no-quit<Cr>
"autocmd! FileType vimfiler call g:my_vimfiler_settings()
"function! s:my_vimfiler_settings()
"  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
"  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
"  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
"endfunction
"
"let s:my_action = { 'is_selectable' : 1 }
"function! s:my_action.func(candidates)
"  wincmd p
"  exec 'split '. a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_split', s:my_action)
"
"let s:my_action = { 'is_selectable' : 1 }
"function! s:my_action.func(candidates)
"  wincmd p
"  exec 'vsplit '. a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_vsplit', s:my_action)
"}}}

""スクリプト実行{{{
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %<CR>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!py -3 %<CR>
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %<CR>
autocmd BufNewFile,BufRead *.cs nnoremap <C-e> :!csc /target:winexe %<CR>
autocmd BufNewFile,BufRead *.js nnoremap <C-e> :!electron .<CR>
"}}}

"QuickRun{{{
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

"}}}

"{{{外部ソフト
if hostname()!=?'localhost'
"WinMerge
nnoremap WM :! C:\"Program Files"\WinMerge\WinMergeU /e/u/wr/maximize/fl "%:p:t"
endif
"}}}
