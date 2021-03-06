UsePlugin 'lightline.vim'

command! -bar LightlineUpdate    call lightline#init()| call lightline#colorscheme()| call lightline#update()
"カラースキームを自動で変更
augroup LightlineColorscheme
	  autocmd!
	  autocmd ColorScheme * call s:lightline_update()
	  "autocmd GuiEnter * LightlineUpdate
	  "autocmd GuiEnter * call s:lightline_update()
	  "autocmd BufWritePost $VIMRC, $GVIMRC call s:lightline_update()
	  "autocmd ColorSchemePre * call s:lightline_update()
augroup END

function! s:lightline_update()
  if !exists('g:loaded_lightline')
	    return
  endif
	  try
   if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|Tomorrow\|molokai\|tender\|papercolor\|one\|ayu'"seoul256
	  let g:lightline.colorscheme = substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') .
          \ (g:colors_name ==# 'solarized' ? '_' . &background : '')
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
    endif
  catch
  endtry
endfunction

let g:lightline = {
    \ 'active': {
	\   'right': [['lineinfo'],['percent'],[ 'qfstatusline', 'fileformat','fileencoding','filetype']],
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive','dir', 'filename' ],
	\			  ['currenttag']]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive',
    \   'dir': 'LightLineDir',
    \   'readonly': 'LightLineReadonly',
    \   'modified': 'LightLineModified',
    \   'filename': 'LightLineFilename',
    \   'filetype': 'LightLineFiletype',
    \   'fileformat': 'LightLineFileformat',
	\	'currenttag': 'LightLineCurrentTag',
	\   'percent': 'MyLightLinePercent',
	\   'lineinfo': 'MyLightLineLineInfo'
    \ },
	\ 'component_expand': {'qfstatusline': 'qfstatusline#Update'},
	\ 'component_type':   {'qfstatusline': 'error'},
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \ }

let g:Qfstatusline#UpdateCmd = function('lightline#update')


""mode短縮形{{{
"let g:lightline = {
"      \ 'mode_map': {
"        \ 'n' : 'N',
"        \ 'i' : 'I',
"        \ 'R' : 'R',
"        \ 'v' : 'V',
"        \ 'V' : 'VL',
"        \ "\<C-v>": 'VB',
"        \ 'c' : 'C',
"        \ 's' : 'S',
"        \ 'S' : 'SL',
"        \ "\<C-s>": 'SB',
"        \ 't': 'T',
"        \ },
"      \ }
""      }}}

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

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

if !empty(globpath(&rtp, 'autoload/tagbar.vim'))
	function! LightLineCurrentTag()
	  return tagbar#currenttag('%s', '')
	endfunction
endif
if !empty(globpath(&rtp, 'autoload/vista.vim'))
	function! LightLineCurrentTag() abort
	  return get(b:, 'vista_nearest_method_or_function', '')
	endfunction
	autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
endif

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
