" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
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

let g:dein#auto_recache = v:true
let g:dein#lazy_rplugins = v:true
let g:dein#install_check_diff = v:true

" begin settings {{{
"if dein#load_state(s:dein_dir)||has('vim_starting')
"reloadよくわからん
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/vimfiles')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  let s:toml_lazy = s:rc_dir . '/dein_lazy.toml'

  " read toml and cache
  " 将来的にこの部分プラグインごとにtomlファイルを作成すれば設定ファイルをより分割できるかも
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

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
