" install dir {{{
let s:dein_dir = expand('~/vimfiles/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

"let g:dein#auto_recache = v:true
let g:dein#auto_recache = !has('win32')
let g:dein#lazy_rplugins = v:true
let g:dein#install_check_diff = v:true

" begin settings {{{
if dein#min#load_state(s:dein_dir)
  " .toml file
  let s:rc_dir = expand('~/vimfiles')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif

  let s:dein_plug = expand('~/vimfiles/dein_plug')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif

  "let s:init_dir = expand('~/vimfiles/init/')
  "if !isdirectory(s:rc_dir)
  "  call mkdir(s:rc_dir, 'p')
  "endif

  let s:toml = s:rc_dir . '/dein.toml'
  let s:toml_lazy = s:rc_dir . '/dein_lazy.toml'


  " dein inline_vimrcs setting.{{{

  "let g:dein#inline_vimrcs = ['useroptions.vim',
  "  		  \'usermaps.vim',
  "  		  \'userautocmds.vim']

  "if has('gui_running')
  "    call add(g:dein#inline_vimrcs, 'gnvim.vim'))
  "endif

  "call map(g:dein#inline_vimrcs, { _, val -> s:init_dir .. val })

  " }}}


  call dein#begin(s:dein_dir)


  " read toml and cache
  " 将来的にこの部分プラグインごとにtomlファイルを作成すれば設定ファイルをより分割できるかも
  call dein#add('~/vimfiles/localplugins/seq.vim', {'lazy': 0})
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  "" プラグインごとにtoml めんどくせ{{{
  "call dein#load_toml(s:dein_plug.'dein.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'nerdtree.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'indentLine.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'ctags.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-diminactive.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'current-func-info.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-signature.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-signify.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'quickfix.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-renamer.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'asyncrun.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'incsearch.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'trace.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-highlightedyank.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-cursorword.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-easymotion.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'accelerated-jk.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'clever-f.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'quick-scope.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-easy-align.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'winresizer.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-fugitive.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-startuptime.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-lastplace.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-vsnip.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-vsnip.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'auto-pairs.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-surround.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'ctrlp_sub.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'restart.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'lark-vim.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'vim-toml.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'context_filetype.toml', {'lazy': 1})
  "call dein#load_toml(s:dein_plug.'rainbow_csv.toml', {'lazy': 1})

  "call dein#load_toml(s:dein_plug.'vimdoc-ja.toml', {'lazy': 0})
  "call dein#load_toml(s:dein_plug.'colorscheme.toml', {'lazy': 0})
  "call dein#load_toml(s:dein_plug.'lightline.toml', {'lazy': 0})
  "call dein#load_toml(s:dein_plug.'lsp.toml', {'lazy': 0})
  "call dein#load_toml(s:dein_plug.'ctrlp.toml', {'lazy': 0})
  "call dein#load_toml(s:dein_plug.'vim-devicons.toml', {'lazy': 0})
  "}}}


  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

filetype plugin on
