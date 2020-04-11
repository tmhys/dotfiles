if empty(globpath(&rtp, 'autoload/lexima.vim'))
  finish
endif

""pumvisibleのtabと重複する要検討
"call lexima#add_rule({'char': '<S-Space>', 'at': '\%#)', 'leave': 1})
"call lexima#add_rule({'char': '<S-Space>', 'at': '\%#"', 'leave': 1})
"call lexima#add_rule({'char': '<S-Space>', 'at': '\%#''', 'leave': 1})
"call lexima#add_rule({'char': '<S-Space>', 'at': '\%#]', 'leave': 1})
"call lexima#add_rule({'char': '<S-Space>', 'at': '\%#}', 'leave': 1})
