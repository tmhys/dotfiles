vim.cmd([[
augroup neomakesetting
    autocmd!
    autocmd BufWritePost *.s Neomake
    autocmd BufWritePost *.seq Neomake
    autocmd BufWritePost *.h Neomake
augroup END
"autocmd! BufWritePost * Neomake

"以下を参考に別の言語の環境を作成すること
"let g:neomake_perl_envperl_maker = {
"\   'exe'           : './env.sh',
"\   'args'          : ['perl', '-wc'],
"\   'errorformat'   : '%E%m at %f line %l%s',
"\   'postprocess'   : function('neomake#makers#ft#perl#PerlEntryProcess'),
"\   'buffer_output' : 1,
"\ }
"let g:neomake_perl_enabled_makers = ['envperl']

let g:neomake_seq_envseq_maker = {
\   'exe'           : "SeqCnv_V340",
\   'args'          : ["-l", ">", "SeqBld.txt"],
\   'errorformat'   : "%WWarning: %f (%l):%m,%EError: %f (%l):%m",
\   'buffer_output' : 1,
\ }
let g:neomake_seq_enabled_makers = ['envseq']

" -  -  -  -  -  -  -  -  -  - "
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
