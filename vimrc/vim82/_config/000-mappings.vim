"echo "keymap is loaded"
"USキーボード
nnoremap ; :
vnoremap ; :
"tagjump 複数候補
nnoremap <C-]> g<C-]>
inoremap <C-]> <ESC>g<C-]>
"githubリポジトリコピペ時に改行しちゃうので力技で修正
inoremap <M-Insert> <C-R><C-O>*<esc>ka<del><esc>i<BS><esc>eEa
"command line window
"nnoremap : q:a
"nnoremap / q/a
" https://twitter.com/uvrub/status/1341036672364945408
inoremap <silent> <CR> <C-g>u<CR>
" for masui special.
noremap g<CR> g;
"Quickfixウインドウと干渉する
"nnoremap <CR> :<C-u>w<CR>
"行末までヤンク
nnoremap Y y$
"xとsでヤンクしない
nnoremap x "_x
nnoremap s "_s
nnoremap S "_S
"<F6>タイムスタンプを挿入
nnoremap <F6> <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR><ESC>
inoremap <F6> <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR>
nnoremap <F6>a <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> appended by <ESC>
inoremap <F6>a <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> appended by
nnoremap <F6>m <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> modified by <ESC>
inoremap <F6>m <ESC>a<C-R>=strftime("%Y/%m/%d %H:%M")<CR> modified by
"ESCキー連打
"undiffはkaoriya限定
if has('kaoriya')
"nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>:Undiff<CR>:HierClear<CR>
	nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>:Undiff<CR>
else
	nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>
endif
"jj,kkでEcs
inoremap jj <Esc>
inoremap jk <Esc>
"inoremap oo <Esc>
inoremap qq <Esc>
inoremap hhh <Esc>
inoremap lll <Esc>
inoremap kkk <Esc>
"アクティブウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
" acceleratedと干渉する
"nnoremap j gj
"nnoremap k gk
"S-h,S-lで行頭、行末
nnoremap <S-h> ^
nnoremap <S-l> $
vnoremap <S-l> $  " 矩形選択モード時のカーソル移動
" vを二回で行末まで選択
vnoremap v $h
"" 検索後にジャンプした際に検索単語を画面中央に持ってくる
"nnoremap n nzz
"nnoremap N Nzz
"インサートモードでも移動
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
" TABにて対応ペアにジャンプ
nnoremap <TAB> %
vnoremap <TAB> %
" 行を移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
" 複数行を移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]
"新規タブ
noremap <Space>tn :<C-u>tabnew<CR>
nnoremap <C-Tab> gt
nnoremap <S-C-Tab> gT
""縦分割版gf
nnoremap gs :<C-u>vertical wincmd f<CR>
"最初にヤンクした文字列を繰り返しペースト
nnoremap <Space>p "0p
"ディレクトリ自動で移動
"set autochdir&vim
"<Space>cd で編集ファイルのカレントディレクトリへと移動{{{
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
    if a:bang == ''
        pwd
    endif
endfunction
" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>
"}}}
"カーソル下の単語をハイライトする
nnoremap <silent> <Space><Space> *N
"カーソル下の単語をハイライトしてから置換する
nnoremap # <Space><Space>:%s/<C-r>///g<Left><Left>
"ヤンクした部分を置換する
nnoremap <M-3> :%s/<C-r>"///g<Left><Left>
"選択範囲内で置換
vnoremap # :s///gc<Left><Left><Left><Left>
"1行挿入する
nnoremap <Space>o :<C-u>call append(expand('.'), '')<Cr>j
"改行する
"nnoremap <M-o> i<CR><ESC>
if !has('nvim')
	"ESCで確実にIMEオフ
	inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
endif
"コマンドモード{{{
cnoremap <expr> j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
" 一文字戻る
cnoremap <C-h> <Home>
" カーソルの下の文字を削除
"cnoremap <C-BS> <Left>
" 行末へ移動
cnoremap <C-l> <Del>
" 一文字進む
cnoremap <C-l> <End>
" コマンドライン履歴を一つ進む
cnoremap <C-j> <Right>
" コマンドライン履歴を一つ戻る
cnoremap <C-k> <Down>
" 前の単語へ移動
cnoremap <C-b> <S-Left>
" 次の単語へ移動
cnoremap <C-b> <S-Right>
"検索時の / のエスケープを簡単に入力
cnoremap <C-o> <C-\>e(getcmdtype() == '/' <Bar><Bar> getcmdtype() == '?') ? '\<' . getcmdline() . '\>' : getcmdline()<CR>
"}}}
""括弧補完{{{
"inoremap { {}<ESC>i
"inoremap [ []<ESC>i
"inoremap ( ()<ESC>i
"inoremap < <><ESC>i
""inoremap * **<ESC>i
"inoremap ' ''<ESC>i
""}}}
""VDsplitをWinmergeライクに{{{
nnoremap <M-j> ]c
nnoremap <M-k> [c
nnoremap <M-h> <C-w>hdo
nnoremap <M-l> <C-w>hdp
"}}}
"{{{Quickfix windowトグル
function! s:toggle_quickfix_window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
  cwindow
  endif
endfunction
nnoremap <M-q> :<C-u>call <SID>toggle_quickfix_window()<CR>
"}}}
"QuickFix 横画面分割で結果を表示
au FileType qf nnoremap <S-CR> <C-w><CR><C-w>L
"Quickfix次の項目にジャンプ
nnoremap <M-j> :cn<CR>
nnoremap <M-k> :cp<CR>
" マーク設定 : {{{
" 基本マップ
nnoremap [Mark] <Nop>
nmap m [Mark]
" 現在位置をマーク
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif
nnoremap <silent>[Mark]m :<C-u>call <SID>AutoMarkrement()<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction
" 次/前のマーク
nnoremap [Mark]n ]`
nnoremap [Mark]N [`
" 一覧表示
nnoremap [Mark]l :<C-u>marks<CR>
augroup last_status
	autocmd!
	" 前回終了位置に移動
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal g`"' | endif
	" バッファ読み込み時にマークを初期化
	autocmd BufReadPost * delmarks!
augroup END
" }}}
augroup run_script
	autocmd!
	""スクリプト実行{{{ Space-r quickrunで実行可能 不要かも
	autocmd FileType python nnoremap <buffer> <C-e> :!python %<CR>
	autocmd FileType javascript nnoremap <silent><buffer><C-e> :!electron .<CR>
	"autocmd FileType *.rb nnoremap <C-e> :!ruby %<CR>
	"autocmd FileType *.pl nnoremap <C-e> :!perl %<CR>
	"autocmd FileType *.cs nnoremap <C-e> :!csc /target:winexe %<CR>
augroup END
"}}}
"grep
nnoremap <C-g> :vim /<C-r><C-w>/jg **<CR>
nnoremap <M-g> :vim //jg **<Left><Left><Left><Left><Left><Left>
"カッコ内操作を便利に(JPキーボード)
onoremap 8 i(
onoremap 2 i"
onoremap 7 i'
onoremap @ i`
onoremap [ i[
onoremap { i{
"カーソル下の単語とヤンクした単語を置換
nnoremap cp ciw<C-r>0<ESC>
"相対行番号表示&トグル
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
"同期スクロールトグル
nnoremap <F4> :<C-u>set scrollbind!<CR>
"seq内では有効にしたいが…
"for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"  exec "imap " . k . " " . k . "<C-N><C-P>"
"endfor
"leximaと重複注意
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
tnoremap <silent> <ESC> <C-\><C-n>
"カレントウィンドウを新規タブで開き直す{{{
if v:version >= 700
    nnoremap <M-n> :call OpenNewTab()<CR>
    function! OpenNewTab()
        let f = expand("%:p")
        execute ":q"
        execute ":tabnew ".f
    endfunction
endif
"}}}
