"不要な機能停止{{{
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
let g:did_install_default_menus = 1
"}}}
"set{{{
set encoding=UTF-8
scriptencoding utf-8
set renderoptions=type:directx,renmode:5
if !has('kaoriya')
	let g:vimproc#download_windows_dll = 1
endif
set shortmess+=I                                 " 起動時のメッセージを消す
set shortmess-=S                                 " 検索件数表示
"pythonインターフェース有効化
"anacondaで指定すると動作が超絶不安定
"pynvimのインストール方法謎
set pythonthreedll=$HOME\vimfiles\python-3.8.3-embed-amd64\python38.dll
"let g:python3_host_prog = '$HOME\AppData\Local\Programs\Python\Python38\python'
"ステータスライン常時表示
set laststatus=2
set cmdheight=2
"候補が一つでも表示、勝手にインサートされない
"set completeopt=menuone,noinsert
set completeopt=menuone
"ラグ対策
set lazyredraw
set updatetime=700
set autoindent
set autoread
"set expandtab
set tabstop=4
set shiftwidth=4
set number
"カラムのカクカク防止
set signcolumn=yes
"dein後に設定する
"filetype plugin on
"コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=full
"自動的にセッション保存
set sessionoptions-=blank
"対になる括弧点滅
set showmatch
set matchtime=1

set scrolloff=10
set backspace=indent,eol,start
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”,｛:｝
set virtualedit=block
set ignorecase
set smartcase
set wildignore+=*.so,*.swp,*.zip,*.jpg,*.png,*.exe,*.dll
set undofile
set noswapfile
set guioptions-=T
set guioptions+=C
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=e
set showtabline=2
"color {{{
set termguicolors
set background=dark "light dark
syntax enable
"}}}
"grep代替{{{
if executable('pt')
	set grepprg=pt\ --nogroup\
	set grepformat=%f:%l:%c:%m
"elseif executable('ag')
"	set grepprg=ag\ --nogroup\ -iS
"    set grepformat=%f:%l:%m
"elseif executable('rg')
"    set grepprg=rg\ --vimgrep\ --no-heading
"    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"}}}
"}}}
"backup{{{
" ネストしたディレクトリを作成する関数
function! s:mkdir(dir)
    if !isdirectory(a:dir)
       " "p" を渡すことでネストしたディレクトリ全てが作成される
        call mkdir(a:dir, "p")
    endif
endfunction
let $DATE = strftime("%Y%m%d_%H%M%S")
set backup
set writebackup
set backupdir=$HOME/.vimbackup
call s:mkdir(&backupdir)
set undodir=$HOME/.vimbackup
call s:mkdir(&undodir)
"}}}
"IME状態に応じたカーソル色設定{{{
if has('multi_byte_ime')
  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  highlight CursorIM guifg=NONE guibg=#ecbcbc
endif
"}}}
