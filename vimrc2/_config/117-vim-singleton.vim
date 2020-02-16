if empty(globpath(&rtp, 'autoload/singleton.vim'))
  finish
endif

if hostname()!=?'localhost'
call singleton#enable()
endif
