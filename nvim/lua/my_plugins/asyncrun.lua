vim.cmd([[
let g:asyncrun_encs='cp932'
"let g:asyncrun_program = get(g:, 'asyncrun_program', {})
"let g:asyncrun_program.nice = { opts -> 'nice -5' . opts.cmd }

" function s:seqcomp()
"   for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"       exec "imap <buffer><expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
"   endfor
" endfunction

function s:findmainfile() abort
    let s:mainfile = system("rg -l -g '*.seq' -g '!proc.seq' sequence")
    echo s:mainfile
    " AsyncRun -silent -strip SeqCnv_V340 -l fnamemodify(s:mainfile,":t:r")
endfunction

augroup MyGroup
    autocmd!
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
    " autocmd BufNewFile,BufRead *.py noremap <silent><buffer> <Space>r :AsyncRun python -u %<CR>
    autocmd BufNewFile,BufRead *.py noremap <silent><buffer> <C-e> :AsyncRun python -u %<CR>
    autocmd BufNewFile,BufRead *.seq,*.s noremap <silent><buffer> <Space>r :AsyncRun -silent -strip SeqCnv_V340 -l 00_Main<CR>
    " autocmd BufWritePost *.seq,*.s AsyncRun -silent -strip SeqCnv_V340 -l 00_Main
    autocmd BufWritePost *.seq,*.s call s:findmainfile()
    " rg -l -g '*.seq' -g '!proc.seq' sequence

augroup END
]])
