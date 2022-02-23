packadd vim-jetpack
silent! call jetpack#begin()
" 起動時読込
Jetpack 'tani/vim-jetpack', { 'opt': 1 }
Jetpack 'rafi/awesome-vim-colorschemes'
Jetpack 'Yggdroot/indentLine'
Jetpack 'tyru/current-func-info.vim'
Jetpack 'soramugi/auto-ctags.vim'
Jetpack 'blueyed/vim-diminactive'
Jetpack 'cohama/vim-hier'
Jetpack 'yssl/QFEnter'
Jetpack 'thinca/vim-quickrun'
Jetpack 'osyo-manga/shabadou.vim'
Jetpack 'dannyob/quickfixstatus'
Jetpack 'rhysd/clever-f.vim'
Jetpack 'junegunn/vim-easy-align'
Jetpack 'kshenoy/vim-signature'
Jetpack 'mhinz/vim-signify'
Jetpack 'kraxli/vim-renamer'
Jetpack 'rhysd/accelerated-jK'
Jetpack 'simeji/winresizer'
Jetpack 'thinca/vim-qfreplace'
Jetpack 'tpope/vim-fugitive'
Jetpack 'mopp/autodirmake.vim'
Jetpack 'vim-scripts/errormarker.vim'
Jetpack 'dstein64/vim-startuptime'
Jetpack 'neoclide/coc.nvim', {'branch': 'release'}
Jetpack 'mattn/emmet-vim'
Jetpack 'RobRoseKnows/lark-vim'
Jetpack 'cespare/vim-toml'
Jetpack 'osyo-manga/vim-watchdogs'
Jetpack 'mechatroner/rainbow_csv'
Jetpack 'tpope/vim-markdown'
Jetpack 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Jetpack 'skanehira/preview-markdown.vim'

" fuzzyfinder{{{
"" lazy load timer
Jetpack 'farmergreg/vim-lastplace'
"Jetpack 'liuchengxu/vim-clap'										 , { 'on': [] } " Clap
"	Jetpack 'tamago324/vim-clap-help' 								 , { 'on': [] } " ClapでHelp
"	Jetpack 'hokorobi/vim-clap-sessions'							 , { 'on': [] }
Jetpack 'ctrlpvim/ctrlp.vim'										 , { 'on': [] }
	Jetpack 'mattn/ctrlp-matchfuzzy'								 , { 'on': [] }
	Jetpack 'mattn/ctrlp-mark'										 , { 'on': [] }
	Jetpack 'hara/ctrlp-colorscheme'								 , { 'on': [] }
"Jetpack 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Jetpack 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
"}}}

Jetpack 'easymotion/vim-easymotion'
Jetpack 'majutsushi/tagbar'
Jetpack 'itchyny/vim-cursorword'

" lazy load hold
Jetpack 'tmhys/vim-auto-cursorline'

" lazy load insert
"Jetpack 'KazuakiM/vim-qfsigns'										 , { 'on': [] }
"Jetpack 'KazuakiM/vim-qfstatusline'								 , { 'on': [] }
Jetpack 'tpope/vim-surround'


" Shougoware関連
Jetpack 'Shougo/neosnippet-snippets'
Jetpack 'Shougo/neosnippet.vim'
"Jetpack 'Shougo/vimproc.vim'

Jetpack 'haya14busa/incsearch-fuzzy.vim'
	Jetpack 'haya14busa/incsearch.vim'
Jetpack 'scrooloose/nerdtree'
	Jetpack 'tiagofumo/vim-nerdtree-syntax-highlight'
	Jetpack 'Xuyuanp/nerdtree-git-plugin'
Jetpack 'itchyny/lightline.vim'
	Jetpack 'delphinus/lightline-delphinus'
Jetpack 'machakann/vim-highlightedyank'
Jetpack 'markonm/traces.vim'
Jetpack 'roxma/nvim-yarp'
Jetpack 'roxma/vim-hug-neovim-rpc'
Jetpack 'tyru/restart.vim'
Jetpack 'jiangmiao/auto-pairs'

Jetpack 'ryanoasis/vim-devicons'

call jetpack#end()
