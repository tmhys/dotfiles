UsePlugin 'nerdtree'

augroup NERDTree_CLOSE
	autocmd!
	"NERDTree以外を閉じたらNERDTreeも閉じる
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	"autocmd VimLeavePre * NERDTreeClose
augroup END

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
"}}}

" NERDTreeでルートを変更したらchdirする
let g:NERDTreeChDirMode = 2

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:loaded_nerdtree_fs_menu = 1
