-- vim.cmd([[
-- let g:tagbar_visibility_symbols = {
--     \ 'public'    : '+',
--     \ 'protected' : '#',
--     \ 'private'   : '-'
--     \ }
--
-- nmap <F8> :TagbarToggle<CR>
-- let g:tagbar_type_seq = {
--     \ 'ctagstype' : 'seq',
--     \ 'kinds' : [
--         \ 'm:method',
--         \ 's:svport'
--     \ ],
--     \ 'sort' : 0
-- \ }
-- " ctagsの設定ファイルと整合が取れていること
-- let g:tagbar_type_toml = {
--     \ 'ctagstype' : 'toml',
--     \ 'kinds' : [
--         \ 'p:plugin'
--     \ ],
--     \ 'sort' : 0
-- \ }
-- ]])

local g = vim.g -- a table to access global variables

g.tagbar_visibility_symbols = {
     public     =  '+',
     protected  =  '#',
     private    =  '-'
     }

g.tagbar_type_seq = {
     ctagstype  =  'seq',
     kinds  =  {
         'm:method',
         's:svport'
     },
     sort  =  0
 }
-- " ctagsの設定ファイルと整合が取れていること
g.tagbar_type_toml = {
     ctagstype  =  'toml',
     kinds  =  {
         'p:plugin'
     },
     sort =  0
 }

-- nmap <F8> :TagbarToggle<CR>
vim.keymap.set("n", "<F8>", "<cmd>TagbarToggle<CR>", { noremap = true, silent = true })
