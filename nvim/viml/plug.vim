" Last Change: 05-Sep-2021.
" Maintainer: TH

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
"Plug 'folke/tokyonight.nvim'
"Plug 'rafi/awesome-vim-colorschemes'
"Plug 'blueyed/vim-diminactive'
"Plug 'thinca/vim-qfreplace'
"Plug 'kshenoy/vim-signature'
""Plug 'mhinz/vim-signify'
"Plug 'Yggdroot/indentLine'
"Plug 'rhysd/clever-f.vim'
"Plug 'junegunn/vim-easy-align'
""Plug 'kraxli/vim-renamer'
"Plug 'rhysd/accelerated-jK'
"Plug 'simeji/winresizer'
"Plug 'tpope/vim-fugitive'
""Plug 'vim-scripts/errormarker.vim'
""Plug 'dstein64/vim-startuptime'
""Plug 'farmergreg/vim-lastplace'
"Plug 'easymotion/vim-easymotion'
"Plug 'osyo-manga/vim-brightest'
""Plug 'yssl/QFEnter'
""Plug 'thinca/vim-quickrun'
""	Plug 'osyo-manga/shabadou.vim'
""Plug 'dannyob/quickfixstatus'
""Plug 'cohama/vim-hier'
""Plug 'KazuakiM/vim-qfsigns'
""Plug 'KazuakiM/vim-qfstatusline'
""Plug 'tpope/vim-surround'
""Plug 'kana/vim-smartchr'
"" Shougoware関連
""Plug 'Shougo/neosnippet-snippets'
""Plug 'Shougo/vimproc.vim'
""Plug 'Shougo/neosnippet.vim'
""Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'nazo6/lspinstall.nvim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'folke/lsp-colors.nvim'
"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-lua/completion-nvim'
"	"Plug 'aca/completion-tabnine', { 'do': './install.sh' }
"	Plug 'nvim-treesitter/completion-treesitter'
"	Plug 'steelsojka/completion-buffers'

"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'hoob3rt/lualine.nvim'
"Plug 'glepnir/galaxyline.nvim'
"Plug 'ChristianChiarulli/dashboard-nvim' ",{'on':[]}
"Plug 'folke/which-key.nvim'
"Plug 'akinsho/bufferline.nvim'
"Plug 'romgrk/barbar.nvim'
"Plug 'windwp/nvim-autopairs'
"Plug 'kyazdani42/nvim-tree.lua'
"Plug 'gelguy/wilder.nvim' , { 'do': ':UpdateRemotePlugins' }
"Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

"" Load Event
"augroup load_us_hold
"    autocmd!
"				"\'vim-auto-cursorline'					,
"                "\'ChristianChiarulli/dashboard-nvim',
"    autocmd UIEnter * call plug#load(
"                \ )| autocmd! load_us_hold
"    autocmd UIEnter * call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
"augroup END

"" Load Event
"function! s:load_plug(timer)
"    call plug#load(
"				\'vim-clap'							,
"				\'vim-clap-help' 					,
"				\'vim-clap-sessions'				,
"				\'ctrlp.vim'						,
"				\'ctrlp-matchfuzzy'					,
"				\'ctrlp-mark'						,
"				\'ctrlp-colorscheme'				,
"				\'nerdtree'							,
"				\'vim-nerdtree-syntax-highlight' 	,
"				\'nerdtree-git-plugin' 				,
"				\'vim-easymotion'					,
"				\'tagbar'							,
"				\'vim-brightest'					,
"                \ )
"				"\'deoplete.nvim',
"	" clap denite ctrlpどれかお好みで　今はctrlpが好きです
"	call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
"endfunction
"
"" 500ミリ秒後にプラグインを読み込む
"call timer_start(500, function("s:load_plug"))

"" Load Event
"augroup load_us_insert
"    autocmd!
"    autocmd InsertEnter * call plug#load(
"				\'vim-qfsigns',
"				\'vim-qfstatusline',
"				\'vim-surround',
"				\'shabadou.vim',
"                \ )| autocmd! load_us_insert
"				"\'deoplete-vim-lsp',
"    autocmd InsertEnter * call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
"augroup END
"}}}
"その他の設定ファイル読み込み{{{
"runtime! userautoload/*.vim
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
runtime! viml/plug/*.vim
"runtime! _gconfig/*.vim
"}}}
