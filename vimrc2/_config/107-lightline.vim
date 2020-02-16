if empty(globpath(&rtp, 'autoload/lightline.vim'))
  finish
endif

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
			\   'right': [['lineinfo'],['percent'],[ 'qfstatusline', 'fileformat','fileencoding','filetype']],
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
			\ 'component_expand': {'qfstatusline': 'qfstatusline#Update'},
			\ 'component_type':   {'qfstatusline': 'error'},
		    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      		\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
            \ }

let g:Qfstatusline#UpdateCmd = function('lightline#update')

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
