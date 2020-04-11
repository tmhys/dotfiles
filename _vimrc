"
" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
" Last Change: 09-Apr-2020.
" Maintainer: TH

"最初に書く必要あり
set encoding=utf8

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
	  let g:rc_dir    = expand('~/.vim/rc')
	  let s:toml      = g:rc_dir . '/dein.toml'
	  let s:color     = g:rc_dir . '/color.toml'
	  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	  "キャッシュしておく
	  call dein#load_toml(s:toml,      {'lazy': 0})
	  call dein#load_toml(s:color,     {'lazy': 0})
	  call dein#load_toml(s:lazy_toml, {'lazy': 1})
	 " }}}

	  call dein#end()
	  call dein#save_state()
	endif

	"Required
	filetype plugin indent on

	" If you want to install not installed plugins on startup.
	if dein#check_install()
	  call dein#install()
	endif

command! DU :call dein#update()
command! DR :call dein#recache_runtimepath()

endif
"}}}

"基本設定{{{
"カラー設定{{{
syntax enable
set background=light "light dark
let ayucolor="light"  "mirage dark
colorscheme ayu "nord atom-dark badwolf hybrid newspaper wombat molokai solarized evening desert morning elford koehler landscape papercolor one seoul256
"Chrosh上で256カラーに必要
set termguicolors
"}}}

"vimprocのwindows dllダウンロード
let g:vimproc#download_windows_dll = 1

"ステータスライン常時表示
set laststatus=2

"ラグ対策
set lazyredraw

"シンタックスハイライト関係{{{
syntax on
set autoindent
"set expandtab
set tabstop=4
set shiftwidth=4
"カーソルラインはvim-auto-cursorlineに統合
"set cursorline
"set cursorcolumn
set number
"カラムのカクカク防止
set signcolumn=yes
filetype plugin on
"}}}

"コマンドラインモードでTABキーによるファイル名補完を有効にする
"set wildmenu wildmode=list:longest,full
set wildmenu wildmode=full

"Quickfixウィンドウ開く
autocmd QuickFixCmdPost *grep* cwindow
"qfウィンドウを常に最下部で開く
autocmd FileType qf wincmd J
autocmd VimResized * :wincmd =

"grep代替{{{
if executable('pt')
	set grepprg=pt\ --nogroup\
	set grepformat=%f:%l:%c:%m
elseif executable('ag')
	set grepprg=ag\ --nogroup\ -iS
    set grepformat=%f:%l:%m
elseif executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"}}}

let $DATE = strftime("%Y%m%d_%H%M%S")
set backup
set writebackup
set backupdir=$HOME/.vimbackup
au BufWritePre * let &bex = '.' .strftime("%Y%m%d_%H%M%S")
set undodir=$HOME/.vimbackup
set undofile
set noswapfile

"自動的にセッション保存{{{
au VimLeave * cclose
au VimLeave * NERDTreeClose
au VimLeave	* mks! ~/.vim/session/$DATE.vim
"}}}

"対になる括弧点滅{{{
set showmatch
set matchtime=1
"}}}

"文末スペース / 連続改行削除{{{
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s/\n\{3,}/\r\r/ge
"}}}

"補完{{{
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor
"neosnippetの設定で定義する
"imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"imap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
"}}}

"python{{{
let g:python3_host_prog='C:\Python37\python.exe'
"let g:python_host_prog='C:\Python27'
if !has('nvim')
	set pythonthreedll=C:\Python37\python37.dll
endif
"}}}

"相対行番号表示&トグル
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

set scrolloff=10
set backspace=indent,eol,start
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”,｛:｝
set virtualedit=block
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

"ビープの代わりにビジュアルベル(画面フラッシュ)を使う
"set visualbell

""vimrcの編集再読み込み{{{
	let $MYSEQRC = expand('$VIMRUNTIME\userautoload\SysSeq.vim')
	let $MYPLUGRC =expand('$VIMRUNTIME\userautoload\Plugins.vim')
if has('nvim')
	let $MYSEQRC =expand('$HOME\AppData\Local\nvim\userautoload\SysSeq.vim')
	let $MYVIMRC =expand('$HOME\AppData\Local\nvim\init.vim')
	let $MYGVIMRC =expand('$HOME\AppData\Local\nvim\ginit.vim')
endif

"編集
command! Evimrc :e $MYVIMRC
command! Egvimrc :e $MYGVIMRC
command! Eplug :e $MYPLUGRC
command! Etoml :e $HOME\.vim\rc\dein.toml
command! Eltoml :e $HOME\.vim\rc\dein_lazy.toml
command! Esysseq :e $MYSEQRC
"保存したら再読み込み
augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $HOME/dotfiles/_vimrc nested source $MYVIMRC
	autocmd BufWritePost $HOME/dotfiles/_gvimrc nested source $MYGVIMRC
	autocmd BufWritePost SysSeq.vim				 nested	source $MYGVIMRC
	autocmd BufWritePost $MYVIMRC 				 nested source $MYVIMRC
	autocmd BufWritePost $MYGVIMRC 				 nested source $MYGVIMRC
	"autocmd WinEnter,BufEnter,SessionLoadPost * call lightline#update()
augroup END
"}}}
"}}}

"キーマップ{{{
nnoremap ; :
vnoremap ; :
nnoremap <M-s> :Startify<CR>
"command line window
"nnoremap : q:a
"nnoremap / q/a

" for masui special.
noremap g<CR> g;
"Quickfixウインドウと干渉する
"nnoremap <CR> :<C-u>w<CR>

"行末までヤンク
nnoremap Y y$
"xとsでヤンクしない
nnoremap x "_x
nnoremap s "_s
nnoremap S "_S

"---<F6>タイムスタンプを挿入{{{
nnoremap <F6> <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR><ESC>
inoremap <F6> <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR>
nnoremap <F6>a <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> appended by <ESC>
inoremap <F6>a <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> appended by
nnoremap <F6>m <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> modified by <ESC>
inoremap <F6>m <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> modified by
"}}}

"ESCキー連打
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>:Undiff<CR>:HierClear<CR>:AnzuClearSearchStatus<CR>
nnoremap <silent> <ESC><ESC><ESC><ESC> :Restart<CR>

"jj,kkでEcs
inoremap jj <Esc>
inoremap qq <Esc>
inoremap hhh <Esc>
inoremap lll <Esc>
inoremap kkk <Esc>

"アクティブウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
" acceleratedと干渉する
"nnoremap j gj
"nnoremap k gk
"S-h,S-lで行頭、行末
nnoremap <S-h> ^
nnoremap <S-l> $
" vを二回で行末まで選択
vnoremap v $h
"" 検索後にジャンプした際に検索単語を画面中央に持ってくる
"nnoremap n nzz
"nnoremap N Nzz
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
"noremap <Space>tn :<C-u>tabnew<CR> :UniteStartup<CR>
noremap <Space>tn :<C-u>tabnew<CR>
nnoremap <C-Tab> gt
nnoremap <S-C-Tab> gT

""縦分割版gf
nnoremap gs :vertical wincmd f<CR>

"最初にヤンクした文字列を繰り返しペースト
nnoremap <Space>p "0p

"ディレクトリ自動で移動
"set autochdir&vim

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
nnoremap # <Space><Space>:%s/<C-r>///g<Left><Left>
"ヤンクした部分を置換する
nnoremap <M-3> :%s/<C-r>"///g<Left><Left>
"選択範囲内で置換
vnoremap # :s///gc<Left><Left><Left><Left>

"1行挿入する
nnoremap <Space>o :<C-u>call append(expand('.'), '')<Cr>j

"改行する
"nnoremap <M-o> i<CR><ESC>

"ESCで確実にIMEオフ
inoremap <ESC> <ESC>:set iminsert=0<CR>

"コマンドモード{{{
" 一文字戻る
cnoremap <C-h> <Home>
" カーソルの下の文字を削除
"cnoremap <C-BS> <Left>
" 行末へ移動
cnoremap <C-l> <Del>
" 一文字進む
cnoremap <C-l> <End>
" コマンドライン履歴を一つ進む
cnoremap <C-j> <Right>
" コマンドライン履歴を一つ戻る
cnoremap <C-k> <Down>
" 前の単語へ移動
cnoremap <C-b> <S-Left>
" 次の単語へ移動
cnoremap <C-b> <S-Right>
"検索時の / のエスケープを簡単に入力
cnoremap <C-o> <C-\>e(getcmdtype() == '/' <Bar><Bar> getcmdtype() == '?') ? '\<' . getcmdline() . '\>' : getcmdline()<CR>
"}}}

"括弧補完{{{
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap ( ()<ESC>i
inoremap < <><ESC>i
inoremap * **<ESC>i
inoremap ' ''<ESC>i
"}}}

""VDsplitをWinmergeライクに{{{
nnoremap <M-j> ]c
nnoremap <M-k> [c
nnoremap <M-h> <C-w>hdo
nnoremap <M-l> <C-w>hdp
"}}}

"{{{Quickfix windowトグル
function! s:toggle_quickfix_window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
  cwindow
  endif
endfunction
nnoremap <M-q> :<C-u>call <SID>toggle_quickfix_window()<CR>
"}}}

"QuickFix 横画面分割で結果を表示
au FileType qf nnoremap <S-CR> <C-w><CR><C-w>L
"Quickfix次の項目にジャンプ
nnoremap <M-j> :cn<CR>
nnoremap <M-k> :cp<CR>

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

""スクリプト実行{{{
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %<CR>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!py %<CR>
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %<CR>
autocmd BufNewFile,BufRead *.cs nnoremap <C-e> :!csc /target:winexe %<CR>
autocmd BufNewFile,BufRead *.js nnoremap <C-e> :!electron .<CR>
"}}}

"grep
nnoremap <C-g> :vim /<C-r><C-w>/jg **<CR>
nnoremap <M-g> :vim //jg **<Left><Left><Left><Left><Left><Left>

"カッコ内操作を便利に(JPキーボード)
onoremap 8 i(
onoremap 2 i"
onoremap 7 i'
onoremap @ i`
onoremap [ i[
onoremap { i{
"}}}

"ctags{{{
"let g:tagbar_ctags_bin = 'C:\tools\ctags58j2bin\ctags.exe'
"let g:tagbar_ctags_bin = 'C:\ProgramData\chocolatey\bin\ctags.exe'
let g:tagbar_ctags_bin = 'C:\Users\thtom\scoop\shims\ctags.exe'
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

set tags=./tags;,tags;$HOME

function! s:execute_ctags() abort
  " 探すタグファイル名
  let tag_name = '.tags'
  " ディレクトリを遡り、タグファイルを探し、パス取得
  let tags_path = findfile(tag_name, '.;')
  " タグファイルパスが見つからなかった場合
  if tags_path ==# ''
    return
  endif

  " タグファイルのディレクトリパスを取得
  " `:p:h`の部分は、:h filename-modifiersで確認
  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  " 見つかったタグファイルのディレクトリに移動して、ctagsをバックグラウンド実行（エラー出力破棄）
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction

augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END
"}}}

"{{{外部ソフト
if hostname()!=?'localhost'
	"WinMerge
	command! WinMerge :! C:\"Program Files"\WinMerge\WinMergeU /e/u/wr/maximize/fl "%:p:t"
	"ImageJ マクロ実行
	"command! ImageJ :
endif
"}}}

"その他の設定ファイル読み込み
runtime! userautoload/*.vim
