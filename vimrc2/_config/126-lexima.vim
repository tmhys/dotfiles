if empty(globpath(&rtp, 'autoload/lexima.vim'))
  finish
endif

call lexima#add_rule({'char': '<TAB>', 'at': '\%#)', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#"', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#''', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#]', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#}', 'leave': 1})
