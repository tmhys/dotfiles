"適当にオフにしてます、困ったらオンにしてね
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwSettings = 1
let g:loaded_rrhelper = 1
let g:loaded_ruby_provider = 1
let g:loaded_shada_plugin = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:no_vimrc_example=1

let g:did_install_default_menus = 1

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
