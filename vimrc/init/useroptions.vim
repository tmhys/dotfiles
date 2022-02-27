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

let g:did_install_default_menus = 1

set encoding=UTF-8
scriptencoding utf-8
set renderoptions=type:directx,renmode:5
set shortmess+=I
set shortmess-=S
set pythonthreedll=$HOME\vimfiles\python-3.8.3-embed-amd64\python38.dll
set laststatus=2
set cmdheight=2
set completeopt=menuone
set lazyredraw
set updatetime=700
set autoindent
set autoread
"set expandtab
set tabstop=4
set shiftwidth=4
set number
set signcolumn=yes
set wildmenu wildmode=full
set sessionoptions-=blank
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
set background=dark "light dark
if has('multi_byte_ime')
  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  highlight CursorIM guifg=NONE guibg=#ecbcbc
endif
if executable('pt')
	set grepprg=pt\ --nogroup\
	set grepformat=%f:%l:%c:%m
endif
"↓必要です？
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
