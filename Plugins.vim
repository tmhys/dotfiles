" Last Change: 02-Dec-2019.
" Maintainer: TH

call plug#begin('~/.vim/plugged')
" plugでインストールするとうまく行かないのでインストール後コピペ
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'junegunn/fzf', has('win32') ? {} : {'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
"| Plug 'Shougo/unite-session'   | Plug 'h1mesuke/unite-outline' | Plug 'ujihisa/unite-colorscheme'  | Plug 'Shougo/unite-help' | Plug 'tsukkee/unite-tag'| Plug 'tacroe/unite-mark'

Plug 'AndrewRadev/switch.vim'
"plug 'airblade/vim-gitgutter'
Plug 'LeafCage/foldCC'
Plug 'Shougo/neomru.vim'
"plug 'soramugi/auto-ctags.vim'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/unite-session'
Plug 'Shougo/vimfiler.vim'
Plug 'cespare/vim-toml'
Plug 'davidhalter/jedi-vim'
Plug 'deris/vim-shot-f'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'h1mesuke/unite-outline'
Plug 'ryanoasis/vim-devicons'
Plug 'delphinus/lightline-delphinus'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kevinw/pyflakes-vim'
Plug 'kmnk/vim-unite-giti'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'mattn/benchvimrc-vim'
Plug 'hrj/vim-DrawIt'
Plug 'mattn/sonictemplate-vim'
Plug 'mhinz/vim-startify'
Plug 'miura/ImageJMacro_Highlighter'
Plug 'qpkorr/vim-renamer'
Plug 'reireias/vim-cheatsheet'
Plug 'rhysd/accelerated-jK'
"Plug 'equalsraf/neovim-gui-shim'
Plug 'simeji/winresizer'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-template'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'travisjeffery/vim-auto-mkdir'
Plug 'tyru/current-func-info.vim'
Plug 'tyru/open-browser.vim'
Plug 'tyru/restart.vim'
Plug 'ujihisa/unite-colorscheme'
Plug 'w0rp/ale'
Plug 'vim-scripts/errormarker.vim'
Plug 'yuratomo/dotnet-complete'
Plug 'Yggdroot/indentLine'
Plug 'thinca/vim-singleton'
Plug 'Shougo/context_filetype.vim'
Plug 'osyo-manga/vim-precious'
""plug 'delphinus/vim-auto-cursorline'
Plug 'tmhys/vim-auto-cursorline'
Plug 'taku-o/vim-copypath'
"Plug 'Shougo/deoplete.nvim'
"plug 'yuttie/comfortable-motion.vim'
"plug 'Shougo/unite.vim'
"Plug 'Shougo/denite.nvim'
"Plug 'roxma/nvim-yarp'
"if="! has('nvim')"
"Plug 'roxma/vim-hug-neovim-rpc'
"if="! has('nvim')"
"Plug 'kmnk/denite-dirmark'
"Plug 'rafi/vim-denite-session'
"Plug 'yyotti/denite-marks'
Plug 'kana/vim-smartchr'
"plug 'nerdtree-git-plugin'
Plug 'terryma/vim-expand-region'
Plug 'cohama/vim-hier'
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-watchdogs'
Plug 'dannyob/quickfixstatus'
Plug 'kshenoy/vim-signature'
"Plug 'Shougo/vimproc.vim'
"if="has('nvim')"
Plug 'mhinz/vim-signify'
"Plug 'ripxorip/aerojump.nvim'
"if="has('nvim')"
"nmap <S-space> <Plug>(AerojumpSpace)
Plug 'liuchengxu/vim-clap'
Plug 'tamago324/vim-clap-help'
Plug 'tpope/vim-markdown'
Plug 'kannokanno/previm'
Plug 'KazuakiM/vim-qfsigns'
Plug 'KazuakiM/vim-qfstatusline'
"plug 'xolox/vim-session'

"colorscheme
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'cocopon/iceberg.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'itchyny/landscape.vim'
Plug 'jacoborus/tender.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'jnurmine/Zenburn'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'nerdpad/dracula-vim'
Plug 'nightsense/nemo'
Plug 'rakr/vim-one'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'vim-scripts/Wombat'
Plug 'vim-scripts/dw_colors'
Plug 'vim-scripts/newspaper.vim'
Plug 'vim-scripts/pyte'
Plug 'vim-scripts/sonoma.vim'
Plug 'w0ng/vim-hybrid'
Plug 'yarisgutierrez/ayu-lightline'
call plug#end()

"AndrewRadev/switch.vim{{{
let g:switch_mapping = "-"
let g:switch_custom_definitions =
    \ [
    \   ['on', 'off']
    \ ]
"}}}
""airblade/vim-gitgutter{{{
"let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
""}}}
"soramugi/auto-ctags.vim{{{
"let g:auto_ctags = 1
"let g:auto_ctags_directory_list = ['.git', '.svn']
"}}}
"scrooloose/nerdtree{{{
"curren directoryに合わせて NERDTreeToggle
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
"""bookmark初期表示
let g:NERDTreeShowBookmarks=1
"lag対策
let g:NERDTreeLimitedSyntax = 1
let NERDTreeIgnore = ['.dat$','.exe$','.dbg$','.bak$','.dll$']
""NERDTree矢印変更{{{
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['seq'] = '\uf9cd'
"}}}
" NERDTreeでルートを変更したらchdirする
let g:NERDTreeChDirMode = 2
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', 'NONE')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  'NONE')
call NERDTreeHighlightFile('h',      'blue',  'none', '#3366FF',  'NONE')
call NERDTreeHighlightFile('H',      'blue',  'none', '#3366FF',  'NONE')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    'NONE')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    'NONE')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     'NONE')
call NERDTreeHighlightFile('seq',    'Red',     'none', 'red',     'NONE')
call NERDTreeHighlightFile('SEQ',    'Red',     'none', 'red',     'NONE')
call NERDTreeHighlightFile('s',      'Red',     'none', 'red',     'NONE')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', 'NONE')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', 'NONE')
"}}}
"Shougo/neosnippet.vim{{{
let g:neosnippet#snippets_directory='~/.vim/my_snippet'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 0
let g:deoplete#max_list = 10000
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "<CR>"
inoremap <expr><S-TAB>
			\pumvisible() ? "\<C-p>" :
			\"\<S-TAB>"
imap <expr><TAB>
		    \ pumvisible() ? "\<C-n>" :
		    \ neosnippet#expandable_or_jumpable() ?
		    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
		    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
"}}}
"haya14busa/incsearch-fuzzy.vim{{{
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
"}}}
"haya14busa/incsearch.vim{{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"}}}
"ryanoasis/vim-devicons{{{
if hostname()!=?'localhost'
	" adding the custom source to unite
	let g:webdevicons_enable_unite = 1
	" adding the column to vimfiler
	let g:webdevicons_enable_vimfiler = 1
	" Adding the custom source to denite
	let g:webdevicons_enable_denite = 0
	let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
	" adding the flags to NERDTree
	let g:webdevicons_enable_nerdtree = 1
	" whether or not to show the nerdtree brackets around flags
	let g:webdevicons_conceal_nerdtree_brackets = 1
	" Force extra padding in NERDTree so that the filetype icons line up vertically
	let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
	" change the default character when no match found
	"let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '?'
	" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
	" disabled by default with no value
	let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
	" enable folder/directory glyph flag (disabled by default with 0)
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
	" enable open and close folder/directory glyph flags (disabled by default with 0)
	let g:DevIconsEnableFoldersOpenClose = 1
	" enable pattern matching glyphs on folder/directory (enabled by default with 1)
	let g:DevIconsEnableFolderPatternMatching = 1
	" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
	let g:DevIconsEnableFolderExtensionPatternMatching = 0
	if exists("g:loaded_webdevicons")
	  call webdevicons#refresh()
	endif
endif
"}}}
"delphinus/lightline-delphinus{{{
"let g:lightline_delphinus_use_powerline_glyphs = 1
"let g:lightline_delphinus_use_nerd_fonts_glyphs = 1
""let g:lightline_delphinus_colorscheme = 1
"let g:lightline_delphinus_tagbar_enable = 1
"let g:lightline_delphinus_gitgutter_enable = 1
"}}}
"itchyny/lightline.vim{{{
command! -bar LightlineUpdate    call lightline#init()| call lightline#colorscheme()| call lightline#update()
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
   if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|Tomorrow\|molokai\|tender\|papercolor\|one\|ayu'"seoul256
      let g:lightline.colorscheme =
            \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '')
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
    endif
  catch
  endtry
endfunction
"
if hostname()!=?'localhost'
		let g:lightline = {
            \ 'active': {
\    'right': [['lineinfo'],['percent'],[ 'qfstatusline', 'fileformat','fileencoding','filetype']],
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive','dir', 'filename' ],
			\			  ['currenttag', 'anzu']]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'dir': 'LightLineDir',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'filename': 'LightLineFilename',
            \   'filetype': 'LightLineFiletype',
            \   'fileformat': 'LightLineFileformat',
			\	'anzu': 'anzu#search_status',
			\	'currenttag': 'LightLineCurrentTag',
  			\   'percent': 'MyLightLinePercent',
  			\   'lineinfo': 'MyLightLineLineInfo'
            \ },
		    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      		\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
            \ }
"\    'component_type':   {'qfstatusline': 'error'},
"\    'component_expand': {'qfstatusline': 'qfstatusline#Update'},
let g:Qfstatusline#UpdateCmd = function('lightline#update')
			"\	'currentfuncname': 'LightLineCfi',
		"{{{separator candidates
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
		"}}}
endif
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
	        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        	\  &ft == 'unite' ? unite#get_status_string() :
        	\  &ft == 'vimshell' ? vimshell#get_status_string() :
        	\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        	\ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
                "\ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                "\ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! LightLineCurrentTag()
  return tagbar#currenttag('%s', '')
endfunction
"右上にworking directory
let g:lightline.tabline = {'right': [['cd']]}
let g:lightline.component = {'cd': '%.35(%{fnamemodify(getcwd(), ":~")}%)'}
"NERDTreeで表示省略
function! MyLightLinePercent()
  if &ft !=? 'nerdtree' || &ft !=? 'tagbar'
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction
function! MyLightLineLineInfo()
  if &ft !=? 'nerdtree' || &ft !=? 'tagbar'
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction
"}}}
"junegunn/vim-easy-align{{{
"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}
"majutsushi/tagbar{{{
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_seq = {
	\ 'ctagstype' : 'seq',
	\ 'kinds' : [
		\ 'u:unit'
	\ ],
	\ 'sort' : 0
\ }
let g:tagbar_type_toml = {
    \ 'ctagstype' : 'toml',
    \ 'kinds' : [
        \ 'p:plugin'
    \ ],
    \ 'sort' : 0
\ }
"}}}
"" Startify{{{
nnoremap <M-s> :Startify<CR>
"autocmd TabNew * :Startify
noremap <Space>tn :<C-u>tabnew<CR> :Startify<CR>
" 起動時の画面の設定
let g:startify_files_number = 10
let g:startify_change_to_dir       = 0
let g:startify_enable_special      = 0
let g:startify_fortune_use_unicode = 1
let g:startify_update_oldfiles     = 1
let g:startify_use_env             = 1
let g:startify_session_autoload       = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence    = 1
let g:startify_session_number = 10
let g:startify_session_sort = 1
let g:startify_enable_special = 1
let g:startify_session_dir = '~/.vim/session'
let NERDTreeHijackNetrw = 0
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]
let g:startify_session_savevars = [
           \ 'g:startify_session_savevars',
           \ 'g:startify_session_savecmds',
           \ 'g:random_plugin_use_feature'
           \ ]
let g:startify_list_order = [
        \ ['⚑  Sessions:'],
        \ 'sessions',
        \ ['♻  MRU:'],
        \ 'files',
        \ ['♲  MRU in Current Directory:'],
        \ 'dir',
        \ ['☺  Bookmarks:'],
        \ 'bookmarks',
        \ ]
" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
let g:startify_custom_indices = ['d', 'f', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = [
  \ '$VIM/_vimrc',
  \ '$VIM/_gvimrc',
  \ '$VIM/vim80/userautoload/SysSeq.vim',
  \ '$VIM/task.taskpaper',
\ ]
"if has('win64')
 let g:startify_custom_header =
            \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')
 "endif
"if has('nvim')
" let g:startify_custom_header =
"            \ startify#fortune#cowsay('═','║','╔','╗','╝','╚')
" endif
 autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                "\ |   NERDTree
                \ |   wincmd w
                \ | endif
"}}}
"miura/ImageJMacro_Highlighter{{{
au BufRead,BufNewFile *.ijm set filetype=ijmacro
"}}}
"rhysd/accelerated-jK{{{
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"}}}
"simeji/winresizer{{{
"キーマップ変更
let g:winresizer_start_key = '<M-w>'
"}}}
"tpope/vim-fugitive{{{
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]p :Gpush origin master<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>
"}}}
"tyru/open-browser.vim{{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)
"}}}
"tyru/restart.vim{{{
" :Restart 時に変数の定義を行う
command! MyRestart Restart --cmd "let g:restarted = 1"
" この変数を使用して :Restart が行われたかどうかの判定を行う
if !exists("g:restarted")
    let $PATH = $PATH . ";C:/cpp/boost"
endif
"}}}
"w0rp/ale{{{
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_linters = {
\   'python': ['flake8', 'autopep8'],
\}
"}}}
"Yggdroot/indentLine{{{
set list listchars=tab:\¦\ "spaceが必要
let g:indentLine_fileTypeExclude = ['help', 'nerdtree','denite','startify','taskpaper','unite','tagbar']
"}}}
"thinca/vim-singleton{{{
if hostname()!=?'localhost'
call singleton#enable()
endif
"}}}
""Shougo/deoplete.nvim{{{
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#omni_patterns = {}
"let g:deoplete#auto_complete_delay = 0
"let g:deoplete#auto_complete_start_length = 1
"let g:deoplete#enable_camel_case = 0
"let g:deoplete#enable_ignore_case = 0
"let g:deoplete#enable_refresh_always = 0
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#file#enable_buffer_path = 0
"let g:deoplete#max_list = 10000
""}}}
""comfortable_motion{{{
"let g:comfortable_motion_scroll_down_key = "j"
"let g:comfortable_motion_scroll_up_key = "k"
""}}}
"" unite.vim{{{
"" The prefix key.
"nnoremap    [unite]   <Nop>
"nmap    <Space>f [unite]
"
"" 挿入モードで開始する
"let g:unite_enable_start_insert=1
""最近開いたファイル履歴の保存数
"let g:unite_source_file_mru_limit = 50
"" 大文字小文字を区別しない
"let g:unite_enable_ignore_case = 1
"let g:unite_enable_smart_case = 1
""file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
"let g:unite_source_file_mru_filename_format = ''
"
"" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""現在開いているファイルのディレクトリ下のファイル一覧。
""開いていない場合はカレントディレクトリ
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
""バッファ一覧
"nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
""レジスタ一覧
"nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
""最近使用したファイル一覧
"nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
""ブックマーク一覧
"nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
""ブックマークに追加
"nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
""uniteを開いている間のキーマッピング
"autocmd FileType unite call s:unite_my_settings()
""関数検索
"nnoremap <silent> [unite]u :<C-u>Unite outline<CR>
"function! s:unite_my_settings() "{{{
"	"ESCでuniteを終了
"	nmap <buffer> <ESC> <Plug>(unite_exit)
"	"入力モードのときjjでノーマルモードに移動
"	imap <buffer> jj <Plug>(unite_insert_leave)
"	"入力モードのときctrl+wでバックスラッシュも削除
"	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
"	"ctrl+jで縦に分割して開く
"	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"	"ctrl+lで横に分割して開く
"	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"	"ctrl+oでその場所に開く
"	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
"	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
"endfunction "}}}
"
"" vinarise
"let g:vinarise_enable_auto_detect = 1
"
"" unite-build map
"nnoremap <silent> ,vb :Unite build<CR>
"nnoremap <silent> ,vcb :Unite build:!<CR>
"nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"
""{{{start
"let g:unite_source_alias_aliases = {
"\ "startup_file_mru" : {
"\  "source" : "file_mru",
"\ },
"\ "startup_directory_mru" : {
"\  "source" : "directory_mru",
"\ },
"\}
"
""\ "startup_session" : {
""\  "source" : "session",
""\ },
"
"" 表示数の制限
"call unite#custom_max_candidates("startup_file_mru", 10)
"call unite#custom_max_candidates("startup_directory_mru", 10)
"
"if !exists("g:unite_source_menu_menus")
"  let g:unite_source_menu_menus = {}
"endif
"
"" :Unite menu:startup での出力リスト
"let g:unite_source_menu_menus.startup = {
"\ "description" : "startup menu",
"\ "command_candidates" : [
"\   [ "edit",  "edit" ],
"\   [ "vimrc",  "edit " . $VIMHOME . "$MYVIMRC"],
"\   [ "gvimrc", "edit " . $VIMHOME . "$MYGVIMRC"],
"\   [ "toml", "edit " .  '~/.vim/rc/dein.toml'],
"\   [ "toml_lazy", "edit " .  '~/.vim/rc/dein_lazy.toml'],
"\   [ "unite-file_mru", "Unite file_mru" ],
"\   [ "unite-directory_mru", "Unite directory_mru" ],
"\ ]
"\}
"
""\   [ "vimfiler", "VimFiler" ],
""\   [ "unite-howm", "Unite qfixhowm/new qfixhowm:nocache -hide-source-names -no-split" ],
""\   [ "unite-update", "Unite -log neobundle/update" ],
"
"command! UniteStartup
"\ Unite
"\ output:echo:"===:📑::Menu:===":! menu:startup
"\ output:echo:":":!
"\ output:echo:"===:♻::MRU:File:===":! startup_file_mru
"\ output:echo:":":!
"\ output:echo:"===:♲::MRU:Directory:===":! startup_directory_mru
"\ -hide-source-names
"\ -no-split
"\ -quick-match
"
""\ output:echo:"===:⚑ ::Sessions::===":! startup_session
""\ output:echo:":":!
"
"augroup startup
"    autocmd!
"    autocmd VimEnter * nested :UniteStartup
"augroup END
"
"nnoremap <M-s> :UniteStartup<CR>
""}}}
""}}}
""Shougo/denite.nvim{{{
"let s:denite_win_width_percent = 0.85
"let s:denite_win_height_percent = 0.7
"" Change denite default options
"call denite#custom#option('_', {
"    \ 'winheight': '40*winheight(0)/100',
"    \ 'prompt': '>',
"    \ 'cached_filter': v:true,
"    \ 'start_filter': v:true,
"    \ 'statusline': v:false,
"    \ 'highlight_filter_background': 'DeniteFilter',
"    \ 'highlight_matched_char': 'Underlined',
"    \ 'split': 'floating',
"    \ })
""    \ 'cursor_shape': v:true,
""    \ 'cursor_wrap': v:true,
"augroup DeniteDetectSize
"	    autocmd!
"		autocmd VimResized * call <SID>denite_detect_size()
"augroup END
"function! s:denite_detect_size() abort
"	call denite#custom#option('_', {
"        \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
"        \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
"        \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
"        \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
"        \ })
"endfunction
"call s:denite_detect_size()
"augroup transparent-windows
"	autocmd!
"	autocmd FileType denite set winblend=10  " こちらも 5 〜 30 で試してみてください。
"	autocmd FileType denite-filter set winblend=10
"augroup END
"" Define mappings
"	autocmd FileType denite call s:denite_my_settings()
"	function! s:denite_my_settings() abort
"	  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
"	  nnoremap <silent><buffer><expr> <S-CR> denite#do_map('do_action', 'vsplit')
"	  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
"	  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
"	  nnoremap <silent><buffer><expr> q denite#do_map('quit')
"	  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
"  	  nnoremap <silent><buffer><expr> a denite#do_map('open_filter_buffer')
"	  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
"  	  nnoremap <silent><buffer><expr> <BS>    denite#do_map('move_up_path')
"  	  nnoremap <silent><buffer><expr> <C-a>   denite#do_map('do_action', 'my_file_rec')
"  	  nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
"  	  nnoremap <silent><buffer><expr> <C-k>   denite#do_map('quit')
"  	  nnoremap <silent><buffer><expr> <C-j>   denite#do_map('quit')
"  	  nnoremap <silent><buffer><expr> <C-h>   denite#do_map('quit')
"  	  nnoremap <silent><buffer><expr> <C-h>   denite#do_map('quit')
"  	  nnoremap <silent><buffer><expr> <C-g>   denite#do_map('do_action', 'grep')
"  	  nnoremap <silent><buffer><expr> <C-n>   denite#do_map('redraw')
"  	  nnoremap <silent><buffer><expr> <C-x>   denite#do_map('quick_move')
"  	  nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
"	endfunction
"autocmd FileType denite-filter call s:denite_filter_my_settings()
"	function! s:denite_filter_my_settings() abort
"	  call deoplete#custom#buffer_option('auto_complete', v:false)
"	endfunction
"	call denite#custom#var('session', 'path', '~\.vim\session')
"	call denite#custom#source('grep', 'args', ['', '', '!'])
"	let ignore=&wildignore .
"	\ ',*.pyc,.git,.hg,.svn'
"	call denite#custom#var('file/rec', 'command',
"	\ ['scantree.py', '--ignore', ignore])
"	call denite#custom#var('file/rec', 'command',
"	\ ['pt', '--follow', '--nocolor', '--nogroup',
"	\  (has('win32') ? '-g:' : '-g='), ''])
"	"let s:ignore_globs = ['.git', '.svn', 'node_module']
"	"call denite#custom#var('file/rec', 'command',
"	"\ ['pt', '--follow',]
"	"\+ map(deepcopy(s:ignore_globs),
"	"\{k, v -> '--ignore='.v}) +
"	"\['--nocolor', '--nogroup',
"	"\  (has('win32') ? '-g:' : '-g='), '']
"	"\ )
"	"call denite#custom#source('file/rec', 'max_candidates', '50000')
""
"	" Change sorters.
""	call denite#custom#source(
""	\ 'file/rec', 'sorters', ['sorter/sublime'])
"	" Pt command on grep source
"	call denite#custom#var('grep', 'command', ['pt'])
"	call denite#custom#var('grep', 'default_opts',
"			\ ['-i', '--nogroup', '--nocolor', '--smart-case'])
"	call denite#custom#var('grep', 'recursive_opts', [])
"	call denite#custom#var('grep', 'pattern_opt', [])
"	call denite#custom#var('grep', 'separator', ['--'])
"	call denite#custom#var('grep', 'final_opts', [])
""	" Specify multiple paths in grep source
""	"call denite#start([{'name': 'grep',
""	"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])
""
"	" Define alias
"	call denite#custom#alias('source', 'file/rec/git', 'file/rec')
"	call denite#custom#var('file/rec/git', 'command',
"	      \ ['git', 'ls-files', '-co', '--exclude-standard'])
"	call denite#custom#alias('source', 'file/rec/py', 'file/rec')
"	call denite#custom#var('file/rec/py', 'command',['scantree.py'])
"	" Change ignore_globs
"	call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
"	      \ [ '.git/', '.ropeproject/', '__pycache__/',
"	      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
"" The prefix key.
"nnoremap    [denite]   <Nop>
"nmap    <Space>f [denite]
""メニュー
""nnoremap <silent> [denite]d :<C-u>Denite menu -no-start-filter<CR>
""dotfile
"nnoremap <silent> [denite]d :<C-u>Denite file/rec:~/dotfiles<CR>
""プラグイン検索
"nnoremap <silent> [denite]p :<C-u>Denite file/rec:~/.cache/dein/repos<CR>
""変更履歴
"nnoremap <silent> [denite]c :<C-u>Denite change <CR>
""ヘルプ
"nnoremap <silent> [denite]h :<C-u>Denite help <CR>
""Sessions
"nnoremap <silent> [denite]s :<C-u>Denite session -no-start-filter<CR>
""カラースキーム変更
"nnoremap <silent> [denite]i :<C-u>Denite -auto-action=preview colorscheme <CR>
""カレントディレクトリファイル一覧。
"nnoremap <silent> [denite]f :<C-u>DeniteBufferDir file file:new<CR>
""バッファ一覧
"nnoremap <silent> [denite]b :<C-u>Denite buffer <CR>
""レジスタ一覧
"nnoremap <silent> [denite]r :<C-u>Denite register <CR>
""最近使用したファイル一覧
"nnoremap <silent> [denite]m :<C-u>Denite file/old <CR>
""バッファ内検索
"nnoremap <silent> [denite]<Space> :<C-u>Denite line <CR>
""mark
"nnoremap <silent> [denite]a :<C-u>Denite marks<CR>
"""ブックマーク一覧
""nnoremap <silent> [denite]c :<C-u>Denite b-cursor-wrap=true -highlight-mode-insert=Search bookmark<CR>
"""ブックマークに追加
""nnoremap <silent> [denite]a :<C-u>DeniteBookmarkAdd<CR>
"" カーソル以下の単語をgrep
"nnoremap <silent> [denite]w :<C-u>DeniteCursorWord grep -buffer-name=search<CR>
""-start_filter=0<CR>
"" 普通にgrep
"nnoremap <silent> [denite]g :<C-u>Denite -buffer-name=search grep<CR>
"" resume previous buffer
"nnoremap <silent> ;r :<C-u>Denite -buffer-name=search -resume -mode=normal <CR>
"".git以下のディレクトリ検索
"nnoremap <silent> [denite]k :<C-u>Denite
"      \ -path=`substitute(finddir('.git', './;'), '.git', '', 'g')`
"      \ file_rec/git
"	  \ -start-filter<CR>
""nnoremap <silent> [denite]<C-r> :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
""nnoremap <silent> [denite]<C-n> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
""nnoremap <silent> [denite]<C-p> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>
"	" Add custom menus
"	let s:menus = {}
"	let s:menus.zsh = {
"		\ 'description': 'Edit your import zsh configuration'
"		\ }
"	let s:menus.zsh.file_candidates = [
"		\ ['zshrc', '~/.config/zsh/.zshrc'],
"		\ ['zshenv', '~/.zshenv'],
"		\ ]
"	let s:menus.my_commands = {
"		\ 'description': 'Example commands'
"		\ }
"	let s:menus.my_commands.command_candidates = [
"		\ ['Split the window', 'vnew'],
"		\ ['Open zsh menu', 'Denite menu:zsh'],
"		\ ['Format code', 'FormatCode', 'go,python'],
"		\ ]
"	call denite#custom#var('menu', 'menus', s:menus)
""denite-startify{{{
"	call denite#custom#alias('source', 'startup_file_mru', 'file/old')
"	call denite#custom#source('startup_file_mru','max_candidates' , 10)
"	call denite#custom#alias('source', 'startup_session', 'session')
"	call denite#custom#source('startup_session','max_candidates',  10)
"if !exists("g:denite_source_menu_menus")
"  let g:denite_source_menu_menus = {}
"endif
"" :Denite menu:startup での出力リスト
"let s:menus.startup = {
"\ "description" : "startup menu",
"\ "command_candidates" : [
"\   [ "edit",  "edit" ],
"\   [ "vimrc",  "edit " . $VIMHOME . "$MYVIMRC"],
"\   [ "gvimrc", "edit " . $VIMHOME . "$MYGVIMRC"],
"\   [ "toml", "edit " .  '~/.vim/rc/dein.toml'],
"\   [ "toml_lazy", "edit " .  '~/.vim/rc/dein_lazy.toml'],
"\ ]
"\}
"command! DeniteStartup
"\ Denite
"\ output:echo"===:⚑ ::Sessions::===":Denite startup_session
"\ output:echo":":!
"\ output:echo"===:📑::Menu:===":Denite menu:startup
"\ output:echo":":!
"\ output:echo"===:♻::MRU:File:===":Denite startup_file_mru
"\ output:echo":":!
"\ -source-names={hide}
"\ -split=no
"\ -quick-move="immediately"
"nnoremap denitestart :Denite output:echo"===:⚑ ::Sessions::===":Denite startup_session<CR>
""}}}
""}}}
"kana/vim-smartchr{{{
" 演算子の間に空白を入れる
inoremap <expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', ' << ', '<')
inoremap <expr> > search('^#include <.*\%#', 'bcn')? '>': smartchr#one_of(' > ', ' >> ', '>')
inoremap <expr> + smartchr#one_of(' + ', '++', '+')
inoremap <expr> - smartchr#one_of(' - ', '--', '-')
inoremap <expr> / smartchr#one_of(' / ', '// ', '/')
" *はポインタで使うので、空白はいれない
inoremap <expr> & smartchr#one_of(' & ', ' && ', '&')
inoremap <expr> % smartchr#one_of(' % ', '%')
inoremap <expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
inoremap <expr> , smartchr#one_of(', ', ',')
" 3項演算子の場合は、後ろのみ空白を入れる
inoremap <expr> ? smartchr#one_of('? ', '?')
inoremap <expr> : smartchr#one_of(': ', '::', ':')
" =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
" 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
inoremap <expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
				\ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
				\ : smartchr#one_of(' = ', ' == ', '=')
" 下記の文字は連続して現れることがまれなので、二回続けて入力したら改行する
"inoremap <expr> } smartchr#one_of('}', '}<cr>')
inoremap <expr> ; smartchr#one_of(';', ';<cr>')
" 「->」は入力しづらいので、..で置換え
inoremap <expr> . smartchr#loop('.', '->', '...')
" 行先頭での@入力で、プリプロセス命令文を入力
inoremap <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#one_of('#define', '#include', '#ifdef', '#endif', '@'): '@'
inoremap <expr> " search('^#include\%#', 'bcn')? ' "': '"'
" if文直後の(は自動で間に空白を入れる
inoremap <expr> ( search('\<\if\%#', 'bcn')? ' (': '('
"}}}
"terryma/vim-expand-region{{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}
"cohama/vim-hier{{{
"gvimrcに書かないと反映されない
"" エラーを赤字の波線で
"execute "highlight qf_error_ucurl gui=undercurl guisp=Red"
"let g:hier_highlight_group_qf  = "qf_error_ucurl"
"" 警告を青字の波線で
"execute "highlight qf_warning_ucurl gui=undercurl guisp=Blue"
"let g:hier_highlight_group_qfw = "qf_warning_ucurl"
"let g:hier_highlight_group_qfi = ""
"}}}
"osyo-manga/vim-anzu{{{
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
"nmap * <Plug>(anzu-star-with-echo)
"nmap # <Plug>(anzu-sharp-with-echo)
" clear status
"nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
"}}}
"osyo-manga/vim-watchdogs{{{
"コンパイラexeにパスを通しておくこと
"コンパイルしたいディレクトリに移動してから実行
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config = {
\   "seq/watchdogs_checker" : {
\       "type" : "watchdogs_checker/SeqCnv_V340",
\ 		"exec":"SeqCnv_V340.exe 00_Main -l",
\		"quickfix/errorformat": "%WWarning: %f (%l):%m,%EError: %f (%l):%m",
\   },
\}
let g:watchdogs_check_BufWritePost_enable=1
let g:quickrun_config._ = {
	  \ "hook/close_quickfix/enable_exit" : 1,
	  \ 'hook/back_window/enable_exit':           0,
	  \ 'hook/back_window/priority_exit':         1,
	  \ "hook/qfstatusline_update/enable_exit" : 1,
      \ "hook/qfstatusline_update/priority_exit" : 4,
	  \ "hook/echo/enable" : 1,
	  \ "hook/echo/output_success": "> Success.",
	  \ "hook/echo/output_failure": "> Errors Found.",
      \ 'outputter' : 'error',
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 40,
	  \ 'outputter/quickfix/open_cmd' : "",
      \ 'outputter/error/success' : 'quickfix',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1
      \ }
" :WatchdogsRun後にlightline.vimを更新
"let g:Qfstatusline#UpdateCmd = function('lightline#update')
nmap <Space>r :cclose<CR>:write<CR>:QuickRun -mode n<CR><M-q>
"}}}
"liuchengxu/vim-clap{{{
" The prefix key.
nnoremap    [clap]   <Nop>
nmap    <Space>c [clap]
nnoremap <silent> [clap]f :<C-u>Clap files<CR>
nnoremap <silent> [clap]i :<C-u>Clap colors<CR>
nnoremap <silent> [clap]b :<C-u>Clap buffers<CR>
nnoremap <silent> [clap]<Space> :<C-u>Clap blines<CR>
nnoremap <silent> [clap]c :<C-u>Clap commits<CR>
nnoremap <silent> [clap]d :<C-u>Clap gfiles<CR>
nnoremap <silent> [clap]g :<C-u>Clap grep<CR>
nnoremap <silent> [clap]m :<C-u>Clap history<CR>
nnoremap <silent> [clap]j :<C-u>Clap jumps<CR>
nnoremap <silent> [clap]l :<C-u>Clap lines<CR>
nnoremap <silent> [clap]a :<C-u>Clap marks<CR>
let g:clap_provider_quick_open = {
      \ 'source': ['~/.vimrc', '~/.spacevim', '~/.bashrc', '~/.tmux.conf'],
      \ 'sink': 'e',
      \ }
"}}}
"KazuakiM/vim-qfsigns{{{
augroup my_qfsigns
  autocmd!
  autocmd BufWritePost * QfsignsUpdate
augroup END
"}}}
