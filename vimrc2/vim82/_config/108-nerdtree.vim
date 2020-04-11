if empty(globpath(&rtp, 'autoload/nerdtree.vim'))
  finish
endif

augroup NERDTree_CLOSE
	autocmd!
	"NERDTree以外を閉じたらNERDTreeも閉じる
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	autocmd VimLeavePre * NERDTreeClose
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
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['seq'] = '\uf9cd'
"}}}

" NERDTreeでルートを変更したらchdirする
let g:NERDTreeChDirMode = 2

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
"call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  'NONE')
"call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', 'NONE')
"call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  'NONE')
"call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  'NONE')
"call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  'NONE')
"call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  'NONE')
"call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  'NONE')
"call NERDTreeHighlightFile('h',      'blue',  'none', '#3366FF',  'NONE')
"call NERDTreeHighlightFile('H',      'blue',  'none', '#3366FF',  'NONE')
"call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    'NONE')
"call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    'NONE')
"call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     'NONE')
"call NERDTreeHighlightFile('seq',    'Red',     'none', 'red',     'NONE')
"call NERDTreeHighlightFile('SEQ',    'Red',     'none', 'red',     'NONE')
"call NERDTreeHighlightFile('s',      'Red',     'none', 'red',     'NONE')
"call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', 'NONE')
"call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', 'NONE')
"
