"オプション全リセット→なぜかプラグインまで読み込まなくなる
"set all&

"適当にオフにしてます、困ったらオンにしてね
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

set encoding=UTF-8
scriptencoding utf-8
set fileencodings=cp932,sjis,utf-8
"set fileformats = dos,unix,mac
set shortmess+=I
set shortmess-=S
set pythonthreedll=$HOME\vimfiles\python-3.8.3-embed-amd64\python38.dll
set laststatus=2
set cmdheight=2
set completeopt=menuone
set lazyredraw
set updatetime=250
set autoindent
set autoread
set clipboard+=unnamed
set nopaste
"set expandtab
set tabstop=4
set shiftwidth=4
set number
set signcolumn=yes
set wildmenu wildmode=full
set sessionoptions-=blank
set cursorline
set showmatch
set matchtime=1
set scrolloff=10
set backspace& backspace=indent,eol,start
set matchpairs& matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”,｛:｝
set virtualedit=block
set ignorecase
set smartcase
set wildignore& wildignore+=*.so,*.swp,*.zip,*.jpg,*.png,*.exe,*.dll
set undofile
set noswapfile
set nowrap
set sidescrolloff=8
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
set showtabline=2
set termguicolors
if has('kaoriya')
	set ambiwidth=auto
else
	set ambiwidth=double
endif
set background=dark "light dark
if executable('pt')
	set grepprg=pt\ --nogroup\
	set grepformat=%f:%l:%c:%m
endif

"{{{ backupdirなどなければ作る
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
