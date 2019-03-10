"
" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
" Last Change: 09-Mar-2019.
" Maintainer: TH

let g:vimproc#download_windows_dll = 1
"indentguide　消すな
let g:indent_guides_enable_on_vim_startup = 1

"Chrosh上で256カラーに必要
	set termguicolors

"startifyでのアイコン画像が崩れる 消すな
set encoding=utf8

""dein{{{
if executable('git')
	if &compatible
		set nocompatible
	endif

	" dein path
	let s:dein_dir = expand('~/.cache/dein')
	let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

	" install dein.vim if not found
	if &runtimepath !~# '/dein.vim'
	  if !isdirectory(s:dein_repo_dir)
	    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	  endif
	  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
	endif

	if dein#load_state(s:dein_dir)
	  call dein#begin(s:dein_dir)

	  "toml設定{{{
	  "Plugin list
	  "let g:rc_dir    = expand('~/.vim/rc')
	  "let s:toml      = g:rc_dir . '/dein.toml'
	  "let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	  ""キャッシュしておく
	  "call dein#load_toml(s:toml,      {'lazy': 0})
	  "call dein#load_toml(s:lazy_toml, {'lazy': 1})
	 " }}}

	  "call dein#add('')
	  call dein#add(s:dein_repo_dir)
	  call dein#add('AndrewRadev/switch.vim')
	  call dein#add('LeafCage/foldCC')
	  call dein#add('Shougo/neocomplcache')
	  call dein#add('Shougo/neocomplete.vim')
	  call dein#add('Shougo/neomru.vim')
	  call dein#add('Shougo/neosnippet-snippets')
	  call dein#add('Shougo/neosnippet.vim')
	  call dein#add('Shougo/unite.vim')
	  call dein#add('Shougo/vimfiler.vim')
	  call dein#add('cespare/vim-toml')
	  call dein#add('davidhalter/jedi-vim')
	  call dein#add('deris/vim-shot-f')
	  call dein#add('haya14busa/incsearch-fuzzy.vim')
	  call dein#add('haya14busa/incsearch.vim')
	  call dein#add('h1mesuke/unite-outline')
	  call dein#add('itchyny/lightline.vim')
	  call dein#add('junegunn/vim-easy-align')
	  call dein#add('kevinw/pyflakes-vim')
	  call dein#add('machakann/vim-highlightedyank')
	  call dein#add('majutsushi/tagbar')
	  call dein#add('mattn/benchvimrc-vim')
	  call dein#add('mattn/sonictemplate-vim')
	  call dein#add('mhinz/vim-startify')
	  call dein#add('miura/ImageJMacro_Highlighter')
	  call dein#add('qpkorr/vim-renamer')
	  call dein#add('reireias/vim-cheatsheet')
	  call dein#add('reireias/vim-cheatsheet')
	  call dein#add('rhysd/accelerated-jK')
	  "call dein#add('ryanoasis/vim-devicons')
	  call dein#add('scrooloose/nerdtree')
	  call dein#add('simeji/winresizer')
	  call dein#add('thinca/vim-qfreplace')
	  call dein#add('thinca/vim-quickrun')
	  "call dein#add('thinca/vim-singleton')
	  call dein#add('thinca/vim-template')
	  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
	  call dein#add('tpope/vim-fugitive')
	  call dein#add('tpope/vim-surround')
	  call dein#add('travisjeffery/vim-auto-mkdir')
	  call dein#add('tyru/current-func-info.vim')
	  call dein#add('tyru/open-browser.vim')
	  call dein#add('tyru/restart.vim')
	  call dein#add('w0rp/ale')
	  call dein#add('yuratomo/dotnet-complete')
	  call dein#add('Yggdroot/indentLine')

	  "ColorScheme
	  "call dein#add('raphamorim/lucario')
	  call dein#add('NLKNguyen/papercolor-theme')
	  call dein#add('altercation/vim-colors-solarized')
	  call dein#add('arcticicestudio/nord-vim')
	  call dein#add('chriskempson/vim-tomorrow-theme')
	  call dein#add('cocopon/iceberg.vim')
	  call dein#add('gosukiwi/vim-atom-dark')
	  call dein#add('itchyny/landscape.vim')
	  call dein#add('jacoborus/tender.vim')
	  call dein#add('jdkanani/vim-material-theme')
	  call dein#add('joshdick/onedark.vim')
	  call dein#add('junegunn/seoul256.vim')
	  call dein#add('nanotech/jellybeans.vim')
	  call dein#add('nerdpad/dracula-vim')
	  call dein#add('nightsense/nemo')
	  call dein#add('rakr/vim-one')
	  call dein#add('sjl/badwolf')
	  call dein#add('tomasr/molokai')
	  call dein#add('tyrannicaltoucan/vim-quantum')
	  call dein#add('vim-scripts/Wombat')
	  call dein#add('vim-scripts/newspaper.vim')
	  call dein#add('w0ng/vim-hybrid')

	  call dein#add('shinchu/lightline-seoul256.vim')
"{{{
	  "call dein#add('terryma/vim-multiple-cursors')
	  "call dein#add('Shougo/vimproc.vim')
	  "call dein#add('nathanaelkane/vim-indent-guides')
	  "call dein#add('easymotion/vim-easymotion')
	  "call dein#add('hail2u/vim-css3-syntax')
	  "call dein#add('haya14busa/incsearch-easymotion.vim')
	  "call dein#add('jelera/vim-javascript-syntax')
	  "call dein#add('junegunn/goyo.vim')
	  "call dein#add('kana/vim-tabpagecd')
	  "call dein#add('mattn/emmet-vim')
	  "call dein#add('osyo-manga/vim-brightest')
	  "call dein#add('othree/html5.vim')
	  "call dein#add('rcmdnk/vim-markdown')
	  "call dein#add('scrooloose/syntastic')
	  "call dein#add('sunuslee/vim-plugin-random-colorscheme-picker')
	  "call dein#add('ujihisa/unite-colorscheme')
	  "call dein#add('vim-scripts/YankRing.vim')
	  "call dein#add('yuttie/comfortable-motion.vim')
"}}}
	if hostname()!=?'localhost'
	  call dein#add('ryanoasis/vim-devicons')
	  call dein#add('thinca/vim-singleton')
	endif

	  call dein#end()
	  call dein#save_state()
	endif

	"Required
	filetype plugin indent on
	syntax enable

	" If you want to install not installed plugins on startup.
	if dein#check_install()
	  call dein#install()
	endif

endif
"}}}

""Lightline{{{
"カラースキームを自動で変更
augroup LightlineColorscheme
		  autocmd!
		  autocmd ColorScheme * call s:lightline_update()
		augroup END
		function! s:lightline_update()
		  if !exists('g:loaded_lightline')
		    return
		  endif
		  try
		    if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|Tomorrow\|molokai\|tender\|papercolor\|one'"seoul256
		      let g:lightline.colorscheme =
		            \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '')
		      call lightline#init()
		      call lightline#colorscheme()
		      call lightline#update()
		    endif
		  catch
		  endtry
		endfunction

""常時ステータスライン表示
set laststatus=2
			"\ 'colorscheme': 'solarized',

		let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive','dir', 'filename' ],
			\			  ['currentfuncname']]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'dir': 'LightLineDir',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'filename': 'LightLineFilename',
            \   'filetype': 'LightLineFiletype',
            \   'fileformat': 'LightLineFileformat',
			\	'currentfuncname': 'LightLineCfi',
  			\ 'percent': 'MyLightLinePercent',
  			\ 'lineinfo': 'MyLightLineLineInfo'
            \ },
		    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      		\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
            \ }

			"\ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6" },
			"\ 'subseparator': { 'left': "\ue0b5", 'right': "\ue0b7" }
		    "\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      		"\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
		    "\ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba" },
      		"\ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb" }
		    "\ 'separator': { 'left': "\ue0c4", 'right': "\ue0c6" },
      		"\ 'subseparator': { 'left': "\ue0c5", 'right': "\ue0c7" }
            "\ 'separator': { 'left': '', 'right': '' },
            "\ 'subseparator': { 'left': '', 'right': '' }

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

                "\ ('' != expand('%:.') ? expand('%:.') : '') .
function! LightLineDir()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:p:h:t') ? expand('%:p:h:t') : '') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ''._ : ''
    endif
    return ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineCfi()
  if exists('*cfi#format')
    return cfi#format('%s', '')
  end
  return ''
endfunction

let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }

let g:lightline.tab_component_function = {
      \ 'filename': 'LightlineTabFilename',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'lightline#tab#tabnum' }

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
  return _ !=# '' ? _ : '[No Name]'
endfunction

"{{{
"
function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
"}}}

function! MyLightLinePercent()
  if &ft !=? 'nerdtree'
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction

function! MyLightLineLineInfo()
  if &ft !=? 'nerdtree'
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction

"}}}
