require("luasnip.loaders.from_vscode").lazy_load()

local ls = require('luasnip')
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamic = ls.dynamic_node


--TODO add snippets for seq
-- ls.add_snippets(nil, {
--   all = {
--     snip({
--       trig = 'std',
--       }, {
--       text({'#include <bits/stdc++.h>', 'using namespace std;', ''}),
--       insert(0),
--     }),
--   },
-- })
