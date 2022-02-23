" install vim-pulg{{{
if has('vim_starting')
  set rtp+=~/vimfiles/plugged
  if !isdirectory(expand('~/vimfiles/plugged'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/vimfiles/plugged')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/vimfiles/plugged/vim-plug/autoload')
  end
endif
"}}}
" auto - install plugins{{{
" https://qiita.com/b4b4r07/items/fa9c8cceb321edea5da0
let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

function! s:plug.check_installation()
  if empty(self.plugs)
    return
  endif

  let list = []
  for [name, spec] in items(self.plugs)
    if !isdirectory(spec.dir)
      call add(list, spec.uri)
    endif
  endfor

  if len(list) > 0
    let unplugged = map(list, 'substitute(v:val, "^.*github\.com/\\(.*/.*\\)\.git$", "\\1", "g")')

    " Ask whether installing plugs like NeoBundle
    echomsg 'Not installed plugs: ' . string(unplugged)
    if confirm('Install plugs now?', "yes\nNo", 2) == 1
      PlugInstall
      " Close window for vim-plug
      silent! close
      " Restart vim
      silent! !vim
      quit!
    endif

  endif
endfunction

augroup check-plug
  autocmd!
  autocmd VimEnter * if !argc() | call s:plug.check_installation() | endif
augroup END
"}}}
" プラグインインストール{{{
silent! call plug#begin('~/vimfiles/plugged')
" 起動時読込
Plug 'rafi/awesome-vim-colorschemes'

"いる？
Plug 'mopp/autodirmake.vim'
Plug 'vim-scripts/errormarker.vim'

Plug 'Yggdroot/indentLine'			", { 'on': [] }
Plug 'tyru/current-func-info.vim' 	", { 'on': [] }
Plug 'soramugi/auto-ctags.vim'    	", { 'on': [] }
Plug 'blueyed/vim-diminactive'    	", { 'on': [] }
Plug 'cohama/vim-hier'            	", { 'on': [] }
Plug 'yssl/QFEnter'               	", { 'on': [] }
Plug 'thinca/vim-quickrun'        	", { 'on': [] }
	Plug 'osyo-manga/shabadou.vim'	", { 'on': [] }
	Plug 'dannyob/quickfixstatus'	", { 'on': [] }
Plug 'rhysd/clever-f.vim'			", { 'on': [] }
Plug 'junegunn/vim-easy-align'		", { 'on': [] }
Plug 'kshenoy/vim-signature'		", { 'on': [] }
Plug 'mhinz/vim-signify'			", { 'on': [] }
Plug 'kraxli/vim-renamer'			", { 'on': [] }
Plug 'rhysd/accelerated-jK'			", { 'on': [] }
Plug 'simeji/winresizer'			", { 'on': [] }
Plug 'thinca/vim-qfreplace'			", { 'on': [] }
Plug 'tpope/vim-fugitive'			", { 'on': [] }
Plug 'dstein64/vim-startuptime'		", { 'on': [] }

"LSP
Plug 'prabirshrestha/asyncomplete.vim',
Plug 'prabirshrestha/asyncomplete-lsp.vim',
Plug 'prabirshrestha/vim-lsp',
Plug 'mattn/vim-lsp-settings',
Plug 'mattn/vim-lsp-icons',

Plug 'hrsh7th/vim-vsnip'			", { 'on': [] }
Plug 'hrsh7th/vim-vsnip-integ'		", { 'on': [] }

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Filetype specific
"Plug 'mattn/emmet-vim'								, { 'for': ['html', 'css'] }
Plug 'RobRoseKnows/lark-vim'						, { 'for': ['lark'] }
Plug 'cespare/vim-toml'								, { 'for': ['toml'] }
Plug 'osyo-manga/vim-watchdogs'						, { 'for': ['seq'] }
Plug 'mechatroner/rainbow_csv'						, { 'for': ['csv'] }
"Plug 'tpope/vim-markdown'							, { 'for': ['markdown'] }
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'skanehira/preview-markdown.vim'

" fuzzyfinder{{{
"" lazy load timer
Plug 'farmergreg/vim-lastplace', { 'on': [] }
"Plug 'liuchengxu/vim-clap'										 ", { 'on': [] }
"	Plug 'tamago324/vim-clap-help' 								 ", { 'on': [] }
"	Plug 'hokorobi/vim-clap-sessions'							 ", { 'on': [] }
Plug 'ctrlpvim/ctrlp.vim'										 ", { 'on': [] }
	Plug 'mattn/ctrlp-matchfuzzy'								 ", { 'on': [] }
	Plug 'mattn/ctrlp-mark'										 ", { 'on': [] }
	Plug 'hara/ctrlp-colorscheme'								 ", { 'on': [] }
"}}}

Plug 'easymotion/vim-easymotion'								 ", { 'on': [] }
Plug 'majutsushi/tagbar'										 ", { 'on': [] }
Plug 'itchyny/vim-cursorword'									 ", { 'on': [] }

" lazy load hold
"Plug 'tmhys/vim-auto-cursorline'								 ", { 'on': [] }

" lazy load insert
"Plug 'KazuakiM/vim-qfsigns'									 ", { 'on': [] }
"Plug 'KazuakiM/vim-qfstatusline'								 ", { 'on': [] }
Plug 'tpope/vim-surround'										 ", { 'on': [] }


" Shougoware関連
"Plug 'Shougo/neosnippet-snippets'
"Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/vimproc.vim'

"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'

Plug 'haya14busa/incsearch-fuzzy.vim'					", { 'on': [] }
	Plug 'haya14busa/incsearch.vim'						", { 'on': [] }
Plug 'markonm/traces.vim'								", { 'on': [] }
Plug 'machakann/vim-highlightedyank'					", { 'on': [] }

Plug 'scrooloose/nerdtree'							 	", { 'on': [] }
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 	 	", { 'on': [] }
	Plug 'Xuyuanp/nerdtree-git-plugin' 				 	", { 'on': [] }

Plug 'itchyny/lightline.vim'
	Plug 'delphinus/lightline-delphinus'
Plug 'jiangmiao/auto-pairs'							 	", { 'on': [] }

Plug 'tyru/restart.vim'									", { 'on': [] }

Plug 'ryanoasis/vim-devicons'

call plug#end()

" Load Event
augroup load_us_hold
    autocmd!
    autocmd CursorHold * call plug#load(
				\'vim-auto-cursorline'					,
                \ )| autocmd! load_us_hold
    autocmd CursorHold * call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
augroup END

" Load Event
function! s:load_plug(timer)
    call plug#load(
				\)
				" 'Yggdroot/indentLine',
				" 'tyru/current-func-info.vim' ,
				" 'soramugi/auto-ctags.vim'    ,
				" 'blueyed/vim-diminactive'    ,
				" 'cohama/vim-hier'            ,
				" 'yssl/QFEnter'               ,
				" 'thinca/vim-quickrun'        ,
				" 'osyo-manga/shabadou.vim',
				" 'dannyob/quickfixstatus',
				" 'rhysd/clever-f.vim',
				" 'junegunn/vim-easy-align',
				" 'kshenoy/vim-signature',
				" 'mhinz/vim-signify',
				" 'kraxli/vim-renamer',
				" 'rhysd/accelerated-jK',
				" 'simeji/winresizer',
				" 'thinca/vim-qfreplace',
				" 'tpope/vim-fugitive',
				" 'dstein64/vim-startuptime',
				" 'hrsh7th/vim-vsnip',
				" 'hrsh7th/vim-vsnip-integ',
				" 'farmergreg/vim-lastplace',
				" 'ctrlpvim/ctrlp.vim',
				" 'mattn/ctrlp-matchfuzzy',
				" 'mattn/ctrlp-mark'										 ,
				" 'hara/ctrlp-colorscheme',
				" 'easymotion/vim-easymotion'								 ,
				" 'majutsushi/tagbar'										 ,
				" 'itchyny/vim-cursorword'									 ,
				" 'tmhys/vim-auto-cursorline'								 ,
				" 'tpope/vim-surround'										 ,
				" 'haya14busa/incsearch-fuzzy.vim',
				" 'haya14busa/incsearch.vim',
				" 'markonm/traces.vim',
				" 'machakann/vim-highlightedyank',
				" 'scrooloose/nerdtree',
				" 'tiagofumo/vim-nerdtree-syntax-highlight' 	 ,
				" 'Xuyuanp/nerdtree-git-plugin' 				 ,
				" 'jiangmiao/auto-pairs'							 ,
				" 'tyru/restart.vim',
                " )
				"\'vim-clap'							,
				"\'vim-clap-help' 					,
				"\'vim-clap-sessions'				,
				"\'vim-brightest'					,
				"\'deoplete.nvim',
	" clap denite ctrlpどれかお好みで　今はctrlpが好きです
	call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
endfunction

" 500ミリ秒後にプラグインを読み込む
call timer_start(800, function("s:load_plug"))

"" Load Event
"augroup load_us_insert
"    autocmd!
"    autocmd InsertEnter * call plug#load(
"				\'auto-pairs',
"				\'vim-surround',
"				\'shabadou.vim',
"				\'vim-smartchr',
"				\'hrsh7th/vim-vsnip',
"				\'hrsh7th/vim-vsnip-integ',
"                \ )| autocmd! load_us_insert
"				"\'vim-qfsigns',
"				"\'vim-qfstatusline',
"				"\'deoplete-vim-lsp',
"    autocmd InsertEnter * call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
"augroup END
"}}}
"その他の設定ファイル読み込み{{{
runtime! userautoload/*.vim
" 各種設定の読み込み
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
runtime! _config/*.vim
"}}}
