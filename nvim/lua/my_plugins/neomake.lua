vim.cmd([[

""function QfMakeConv()
""   let qflist = getqflist()
""   for i in qflist
""      let i.text = iconv(i.text,"cp932", "utf-8")
""   endfor
""   call setqflist(qflist)
""endfunction
""
""au QuickfixCmdPost make call QfMakeConv()
"
"augroup neomakesetting
"    autocmd!
"    autocmd BufWritePost *.s Neomake
"    autocmd BufWritePost *.seq Neomake
"    autocmd BufWritePost *.h Neomake
"augroup END
"
"
"let g:neomake_seq_envseq_maker = {
"\   'exe'           : "SeqCnv_V340",
"\   'append_file'   : 0,
"\   'errorformat'   : "%WWarning:\ %f\ (%l):%m,%EError:\ %f\ (%l):%m",
"\   'buffer_output' : 1,
"\ }
"
"
""\   'errorformat'   : "%WWarning:\ %f\ (%l):%m,%EError:\ %f\ (%l):%m",
""\   'errorformat'   : "%WWarning: %f (%l):%m,%EError: %f (%l):%m",
""\   'errorformat'   : "%WWarning: %f (%l):%m,%C,%s,%C,%p,%Z,%EError: %f (%l):%m,%C,%s,%C,%p,%Z",
""\   'errorformat'   : "%WWarning: %f (%l):%m,%EError: %f (%l):%m",
""%WWarning: \%f\ (%l):%r,%C,%s,%C,%p,%Z,%EError: \%f\ (%l):%r,%C,%s,%C,%p,%Z"
""\   'errorformat'   : "%WWarning: %f (%l):%m,%EError: %f (%l):%m",
"
"let g:neomake_seq_envseq_args = '-l -t 00_Main'
"let g:neomake_seq_enabled_makers = ['envseq']

let g:neomake_open_list = 1
let g:neomake_error_sign = {
\ 'text': ' ',
\ }
let g:neomake_warning_sign = {
\ 'text': ' ',
\ }
let g:neomake_info_sign = {
\ 'text': '',
\ }
let g:neomake_message_sign = {
\ 'text': ' ',
\ }
]])
