if empty(globpath(&rtp, 'autoload/singleton.vim'))
  finish
endif

if !has('nvim')
call singleton#enable()
endif
