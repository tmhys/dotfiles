try
  packadd vim-jetpack
catch /^Vim\%((\a\+)\)\=:E919:/
  let s:jetpackfile = expand('~/.vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim')
  let s:jetpackurl = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
  packadd vim-jetpack
endtry

call jetpack#begin()
call jetpack#add('tani/vim-jetpack', { 'opt': 1 })
" call jetpack#load_toml('jetpack_plug/dein.toml')
" call jetpack#load_toml('jetpack_plug/dein_lazy.toml')
call jetpack#add('itchyny/lightline.vim')
call jetpack#add('delphinus/lightline-delphinus')
call jetpack#add('tpope/vim-fugitive')
call jetpack#add('ctrlpvim/ctrlp.vim')
call jetpack#add('mattn/ctrlp-matchfuzzy')
call jetpack#add('mattn/ctrlp-mark')
call jetpack#add('hara/ctrlp-colorscheme')
call jetpack#add('mattn/vim-ctrlp-syntax-highlight')
call jetpack#add('ryanoasis/vim-devicons')
call jetpack#add('prabirshrestha/vim-lsp')
call jetpack#add('prabirshrestha/asyncomplete.vim')
call jetpack#add('prabirshrestha/asyncomplete-buffer.vim')
call jetpack#add('hrsh7th/vim-vsnip')
call jetpack#add('hrsh7th/vim-vsnip-integ')
call jetpack#add('farmergreg/vim-lastplace')
call jetpack#add('rafi/awesome-vim-colorschemes',{'on_event':'ColorSchemePre'})
call jetpack#add('preservim/nerdtree',{'on_event': 'VimEnter'},{'on_map': 'C-n'})
call jetpack#add('tiagofumo/vim-nerdtree-syntax-highlight')
call jetpack#add('Xuyuanp/nerdtree-git-plugin')
call jetpack#add('soramugi/auto-ctags.vim')
call jetpack#add('majutsushi/tagbar')
call jetpack#add('nathanaelkane/vim-indent-guides')
call jetpack#add('kshenoy/vim-signature')
call jetpack#add('mhinz/vim-signify')
call jetpack#add('machakann/vim-highlightedyank')
call jetpack#add('itchyny/vim-cursorword')
call jetpack#add('yssl/QFEnter')
call jetpack#add('thinca/vim-qfreplace')
call jetpack#add('tpope/vim-commentary')
call jetpack#add('junegunn/vim-easy-align')
call jetpack#add('simeji/winresizer', { 'on_cmd': 'WinResizerStartResize' })
call jetpack#add('kraxli/vim-renamer')
call jetpack#add('dstein64/vim-startuptime')
call jetpack#add('vim-jp/vimdoc-ja')
call jetpack#add('tyru/restart.vim')
call jetpack#add('skywind3000/asyncrun.vim')
call jetpack#add('mh21/errormarker.vim')
call jetpack#add('haya14busa/incsearch-fuzzy.vim')
call jetpack#add('haya14busa/incsearch.vim')
call jetpack#add('markonm/traces.vim')
call jetpack#add('easymotion/vim-easymotion')
call jetpack#add('rhysd/accelerated-jK')
call jetpack#add('rhysd/clever-f.vim')
call jetpack#add('unblevable/quick-scope')
call jetpack#add('jiangmiao/auto-pairs')
call jetpack#add('tpope/vim-surround')
call jetpack#add('kana/vim-smartchr')
call jetpack#add('mattn/ctrlp-mark')
call jetpack#add('hara/ctrlp-colorscheme')
call jetpack#add('lark-parser/vim-lark-syntax')
call jetpack#add('cespare/vim-toml')
call jetpack#add('Shougo/context_filetype.vim')
call jetpack#add('osyo-manga/vim-precious')
call jetpack#add('mechatroner/rainbow_csv')
call jetpack#add('prabirshrestha/asyncomplete-lsp.vim')
call jetpack#add('mattn/vim-lsp-settings')
call jetpack#end()

" for name in jetpack#names()
"   if !jetpack#tap(name)
"     call jetpack#sync()
"     break
"   endif
" endfor

"その他の設定ファイル読み込み{{{
" 各種設定の読み込み
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
runtime! _jpconfig/*.vim
"}}}
