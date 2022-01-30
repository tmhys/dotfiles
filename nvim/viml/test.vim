function! TestErrFmt()
  let msg = [
        \ '1) SampleTest::Error',
        \ 'Failed asserting that two strings are equal.',
        \ 'expected:1',
        \ 'actual:2',
        \ '',
        \ '/Users/kanno/.vim_sandbox/2012-08-04-1329.vim in 5',
        \ ]
  try
    let errorformat = &g:errorformat
    let &g:errorformat = '%E%n)\ %.%#,%Z%f\ in\ %l,%C%m,%-G%.%#'
    cgetexpr msg
    cwindow
  finally
    let &g:errorformat = errorformat
  endtry
endfunction
