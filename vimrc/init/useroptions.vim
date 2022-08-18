"オプション全リセット→なぜかプラグインまで読み込まなくなる
"set all&

""""""""""""""""""""""""""""""""""""""""
" 不要な機能無効化
""""""""""""""""""""""""""""""""""""""""
"適当にオフにしてます、困ったらオンにしてね
"本当にオフになっているんだろうか
"vimrc_example.vimの中身の以下もコメントアウトしてます
"   source $VIMRUNTIME/defaults.vim

let g:loaded_getscript          = v:true
let g:loaded_getscriptPlugin    = v:true
let g:loaded_gzip               = v:true
let g:loaded_logiPat            = v:true
let g:loaded_matchit            = v:true
let g:loaded_matchparen         = v:true
let g:loaded_netrw              = v:true
let g:loaded_netrwPlugin        = v:true
let g:loaded_netrwFileHandlers  = v:true
let g:loaded_netrwSettings      = v:true
let g:loaded_rrhelper           = v:true
let g:loaded_ruby_provider      = v:true
let g:loaded_shada_plugin       = v:true
let g:loaded_spellfile_plugin   = v:true
let g:loaded_tar                = v:true
let g:loaded_tarPlugin          = v:true
let g:loaded_tutor_mode_plugin  = v:true
let g:loaded_2html_plugin       = v:true
let g:loaded_vimball            = v:true
let g:loaded_vimballPlugin      = v:true
let g:loaded_zip                = v:true
let g:loaded_zipPlugin          = v:true
let g:no_vimrc_example          = v:true
let g:loaded_gtags              = v:true
let g:did_install_default_menus = v:true
let g:loaded_gtags_cscope       = v:true
let g:loaded_man                = v:true
let g:skip_defaults_vim         = v:true

""""""""""""""""""""""""""""""""""""""""
" 文字コード
""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
scriptencoding utf-8
set fileencodings=cp932,sjis,utf-8
"set fileformats = dos,unix,mac

""""""""""""""""""""""""""""""""""""""""
" 開始メッセージ
""""""""""""""""""""""""""""""""""""""""
"Vimの開始時に挨拶メッセージを表示しない
set shortmess+=c
set shortmess+=I
"検索時に検索件数メッセージを表示しない。例えば "[1/5]"
set shortmess-=S

""""""""""""""""""""""""""""""""""""""""
" UI関連
""""""""""""""""""""""""""""""""""""""""
set background=light "light dark
set cmdheight=2
set cursorline
set laststatus=2
set showtabline=2
set noshowmode
set nowrap
" set wrap
" set breakindent
" set linebreak

set number
set pumheight=20
set scrolloff=10
set sidescrolloff=8
set signcolumn=yes
set tabstop=4
set termguicolors
if has('kaoriya')
    set ambiwidth=auto
else
    set ambiwidth=double
endif

""""""""""""""""""""""""""""""""""""""""
" インデント
""""""""""""""""""""""""""""""""""""""""
set autoindent
" autoindentもセットでオンすること
set smartindent
" インデント時のスペース
set shiftwidth=4
set shiftround

""""""""""""""""""""""""""""""""""""""""
" クリップボード
""""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamed
set nopaste
set wildmenu wildmode=full
set sessionoptions-=blank

""""""""""""""""""""""""""""""""""""""""
" カッコ
""""""""""""""""""""""""""""""""""""""""
set showmatch
set matchtime=1
set matchpairs& matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”,｛:｝

""""""""""""""""""""""""""""""""""""""""
" GUI
""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set guioptions&
    set guioptions+=C
    set guioptions-=T
    set guioptions+=C
    set guioptions-=m
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
    set guioptions-=e
endif

""""""""""""""""""""""""""""""""""""""""
" バックアップ
""""""""""""""""""""""""""""""""""""""""
"set expandtab
set undofile
set noswapfile
set backup
set writebackup
" backupdirなどなければ作る{
function! s:mkdir(dir)
    if !isdirectory(a:dir)
       " "p" を渡すことでネストしたディレクトリ全てが作成される
        call mkdir(a:dir, "p")
    endif
endfunction
let $DATE = strftime("%Y%m%d_%H%M%S")
set backupdir=$HOME/.vimbackup
set undodir=$HOME/.vimbackup
call s:mkdir(&backupdir)
call s:mkdir(&undodir)
"}

""""""""""""""""""""""""""""""""""""""""
" その他
""""""""""""""""""""""""""""""""""""""""
set pythonthreedll=$HOME\vimfiles\python-3.8.3-embed-amd64\python38.dll
set completeopt=menuone,noselect
set lazyredraw
set updatetime=250
set autoread
set virtualedit=block
set backspace& backspace=indent,eol,start
set ignorecase
set smartcase
set wildignore& wildignore+=*.so,*.swp,*.zip,*.jpg,*.png,*.exe,*.dll
if executable('pt')
    set grepprg=pt\ --nogroup\
    set grepformat=%f:%l:%c:%m
endif
