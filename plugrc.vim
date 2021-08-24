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
let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

if s:plug.is_installed("vim-myplugin")
  " setting
endif
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
" auto - update per week{{{
function! OnVimEnter() abort
  " Run PlugUpdate every week automatically when entering Vim.
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update', g:plug_home)
    if filereadable(l:filename) == 0
      call writefile([], l:filename)
    endif

    let l:this_week = strftime('%Y_%V')
    let l:contents = readfile(l:filename)
    if index(l:contents, l:this_week) < 0
      call execute('PlugUpdate')
      call writefile([l:this_week], l:filename, 'a')
    endif
  endif
endfunction

autocmd VimEnter * call OnVimEnter()
"}}}
" プラグインインストール{{{
silent! call plug#begin('~/vimfiles/plugged')
" 起動時読込
Plug 'thinca/vim-singleton'							"   117 起動数を常に1つに
Plug 'rafi/awesome-vim-colorschemes'				"colorscheme
Plug 'LeafCage/foldCC'								" フォールドの見た目変更
Plug 'Yggdroot/indentLine'							" 106 vim-indent-guidesよりこちらが好みindent可視化
Plug 'tyru/current-func-info.vim'					" カーソル位置関数表示
Plug 'soramugi/auto-ctags.vim'						" auto ctags
Plug 'blueyed/vim-diminactive'						,  " inactiveタブを暗く
Plug 'cohama/vim-hier'								,  " エラー行ハイライト
Plug 'yssl/QFEnter'									"quickfixwindowから開くとき直前のwindowで
Plug 'thinca/vim-quickrun'							,  " 116 すぐ実行
	Plug 'osyo-manga/shabadou.vim'						,
Plug 'dannyob/quickfixstatus'						,  " カーソルをエラー行に配置したときメッセージ表示
Plug 'rhysd/clever-f.vim'							,  " fキー強化
Plug 'haya14busa/incsearch-fuzzy.vim'				,  " 103 一文字ごとにハイライト
	Plug 'haya14busa/incsearch.vim'					,  " 104 一文字ごとにハイライト
Plug 'junegunn/vim-easy-align'						,  " 114 テキスト整形
Plug 'kshenoy/vim-signature'						,  " マーク位置表示
Plug 'machakann/vim-highlightedyank'				,  " yank文字列ハイライト
Plug 'mhinz/vim-signify'							,  " 差分をsignで表示
Plug 'qpkorr/vim-renamer'							,  " ファイル名一括編集
Plug 'rhysd/accelerated-jK'							,  " 100 カーソル移動速度変更
Plug 'simeji/winresizer'							,  " 120 ウィンドウリサイズ
Plug 'thinca/vim-qfreplace'							,  " 一括置換
Plug 'tpope/vim-fugitive'							,  " 115 git用
Plug 'mopp/autodirmake.vim' 						,  " dir自動作成
Plug 'vim-scripts/errormarker.vim'					,  " コンパイラエラー箇所マーク
Plug 'dstein64/vim-startuptime'						,
" lazy load insert
" LSP関連
""以下どっちか使うべし
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
""Plug 'lighttiger2505/deoplete-vim-lsp'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
""Plug 'mattn/vim-lsp-icons'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'

Plug 'mattn/emmet-vim'								, { 'for': ['html', 'css'] }
Plug 'RobRoseKnows/lark-vim'						, { 'for': ['lark'] } " lark syntax
Plug 'cespare/vim-toml'								, { 'for': ['toml'] } " toml syntax
Plug 'osyo-manga/vim-watchdogs'						, { 'for': ['seq'] } " 119 seqのエラーチェック
Plug 'mechatroner/rainbow_csv'						, { 'for': ['csv'] }
Plug 'tpope/vim-markdown'							, { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'skanehira/preview-markdown.vim'

" fuzzyfinder{{{
"" lazy load timer
Plug 'liuchengxu/vim-clap'							, { 'on': [] } " Clap
	Plug 'tamago324/vim-clap-help' 					, { 'on': [] } " ClapでHelp
	Plug 'hokorobi/vim-clap-sessions'				, { 'on': [] }
Plug 'scrooloose/nerdtree'							, { 'on': [] } " 108 nerdtree
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 	, { 'on': [] } " nerdtree用シンタックス
	Plug 'Xuyuanp/nerdtree-git-plugin' 				, { 'on': [] } " git ステータス表示
"}}}

Plug 'easymotion/vim-easymotion'					, { 'on': [] } " 132
Plug 'majutsushi/tagbar'							, { 'on': [] } " 110 tag一覧表示 vistaに乗り換え検討 Seqのタグが反映されない
Plug 'osyo-manga/vim-brightest'						, { 'on': [] } " 131 カーソル下の単語にアンダーライン

" lazy load hold
Plug 'tmhys/vim-auto-cursorline'					, { 'on': [] } " カーソル放置で点滅

" lazy load insert
Plug 'KazuakiM/vim-qfsigns'							, { 'on': [] }
Plug 'KazuakiM/vim-qfstatusline'					, { 'on': [] }
Plug 'jiangmiao/auto-pairs'							, { 'on': [] }
Plug 'tpope/vim-surround'							, { 'on': [] } " 閉じカッコを編集
Plug 'kana/vim-smartchr'							, { 'on': [] } " 118 符号の前後にスペース


" Shougoware関連
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/vimproc.vim'

"if has('nvim')
"	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
"	"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"	Plug 'neovim/nvim-lspconfig'
"	Plug 'glepnir/lspsaga.nvim'
"  	Plug 'folke/lsp-colors.nvim'
"	"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"	Plug 'nvim-lua/completion-nvim'
"	Plug 'nvim-lua/popup.nvim'
"	Plug 'nvim-lua/plenary.nvim'
"	Plug 'nvim-telescope/telescope.nvim'
"	Plug 'hoob3rt/lualine.nvim'
"	Plug 'kyazdani42/nvim-web-devicons'
"endif
"if !has('nvim')
	Plug 'ctrlpvim/ctrlp.vim'							, { 'on': [] }
		Plug 'mattn/ctrlp-matchfuzzy'					, { 'on': [] }
		Plug 'mattn/ctrlp-mark'							, { 'on': [] }
		Plug 'hara/ctrlp-colorscheme'					, { 'on': [] }
	Plug 'itchyny/lightline.vim'						" 107 lightline
		Plug 'delphinus/lightline-delphinus'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'markonm/traces.vim'						" 置換時にリアルタイム描画 nvimは標準で入っているらしい
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'tyru/restart.vim'							" 109 esc連打で再起動
	Plug 'ryanoasis/vim-devicons'						" icon追加 最後に読み込む事
	"Plug 'Shougo/defx.nvim',
	"Plug 'kristijanhusak/defx-icons',
"endif
""deoplete検討
"if !has('nvim') "&& !has('kaoriya')
"	Plug 'Shougo/deoplete.nvim', " { 'on': [] }
"	Plug 'deoplete-plugins/deoplete-jedi',
"	"Plug 'davidhalter/jedi-vim',
"	"Plug 'Shougo/denite.nvim', { 'on': [] }		" lazy loadが何故かできない
"endif

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
				\'vim-clap'							,
				\'vim-clap-help' 					,
				\'vim-clap-sessions'				,
				\'ctrlp.vim'						,
				\'ctrlp-matchfuzzy'					,
				\'ctrlp-mark'						,
				\'ctrlp-colorscheme'				,
				\'nerdtree'							,
				\'vim-nerdtree-syntax-highlight' 	,
				\'nerdtree-git-plugin' 				,
				\'vim-easymotion'					,
				\'tagbar'							,
				\'vim-brightest'					,
                \ )
				"\'deoplete.nvim',
	" clap denite ctrlpどれかお好みで　今はctrlpが好きです
	call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
endfunction

" 500ミリ秒後にプラグインを読み込む
call timer_start(500, function("s:load_plug"))

" Load Event
augroup load_us_insert
    autocmd!
    autocmd InsertEnter * call plug#load(
				\'auto-pairs',
				\'vim-qfsigns',
				\'vim-qfstatusline',
				\'vim-surround',
				\'shabadou.vim',
				\'vim-smartchr',
                \ )| autocmd! load_us_insert
				"\'deoplete-vim-lsp',
    autocmd InsertEnter * call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
augroup END
"}}}
"その他の設定ファイル読み込み{{{
runtime! userautoload/*.vim
" 各種設定の読み込み
"call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
runtime! _config/*.vim
"}}}
