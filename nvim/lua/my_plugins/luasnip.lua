require("luasnip.loaders.from_vscode").lazy_load()

local ls = require("luasnip")
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

ls.add_snippets(nil, {
    seq = {
        -- wait
        snip({
            trig = "wt",
        }, {
            text({ "wait(t(" }),
            insert(1),
            text({ "))" }),
            insert(0),
        }),
        snip({
            trig = "wu",
        }, {
            text({ "wait(u(" }),
            insert(1),
            text({ "))" }),
            insert(0),
        }),
        snip({
            trig = "ws",
        }, {
            text({ "wait(s(" }),
            insert(1),
            text({ "))" }),
            insert(0),
        }),
        snip({
            trig = "wm",
        }, {
            text({ "wait(m(" }),
            insert(1),
            text({ "))" }),
            insert(0),
        }),

        -- on / off
        snip({
            trig = "on",
        }, {
            text({ "on(" }),
            insert(1),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "off",
        }, {
            text({ "off(" }),
            insert(1),
            text({ ")" }),
            insert(0),
        }),

        -- motor
        snip({
            trig = "acc",
        }, {
            text({ "accel(" }),
            insert(1, "Mortor"),
            text({ "," }),
            insert(2, "Direction"),
            text({ "," }),
            insert(3, "Pulse"),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "con",
        }, {
            text({ "const(" }),
            insert(1, "Mortor"),
            text({ "," }),
            insert(2, "Direction"),
            text({ "," }),
            insert(3, "PPS"),
            text({ "," }),
            insert(4, "Pulse"),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "tolmt",
        }, {
            text({ "const(" }),
            insert(1, "Mortor"),
            text({ "," }),
            insert(2, "Direction"),
            text({ "," }),
            insert(3, "PPS"),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "eve",
        }, {
            text({ "ever(" }),
            insert(1),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "chksm",
        }, {
            text({ "chksm(" }),
            insert(1),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "chksmp",
        }, {
            text({ "chksmp(" }),
            insert(1),
            text({ ")" }),
            insert(0),
        }),

        -- condition
        snip({
            trig = "u",
        }, {
            text({ "u(" }),
            insert(1),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "s",
        }, {
            text({ "s(" }),
            insert(1),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "f",
        }, {
            text({ "f(" }),
            insert(1),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "v",
        }, {
            text({ "v(" }),
            insert(1),
            text({ ")" }),
            insert(0),
        }),
        snip({
            trig = "if",
        }, {
            text({ "if(" }),
            insert(1),
            text({ "){", "  " }),
            insert(2),
            text({ "", "}" }),
            insert(0),
        }),
        snip({
            trig = "else",
        }, {
            text({ "else{" }),
            insert(1),
            text({ "", "}" }),
            insert(0),
        }),
    },
})
