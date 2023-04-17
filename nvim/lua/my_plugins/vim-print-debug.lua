vim.g.print_debug_default = '"{}"'
vim.api.nvim_set_keymap("n", "<Space><Space>p", ":call print_debug#print_debug()<cr>" ,{noremap = true, silent =true})
--nnoremap <leader>p :call print_debug#print_debug()<cr>
vim.cmd([[
    let g:print_debug_templates = {
        \   'go':         'fmt.Printf("+++ {}\n")',
        \   'python':     'print(f"+++ {}")',
        \   'javascript': 'console.log(`+++ {}`);',
        \   'c':          'printf("+++ {}\n");',
        \   'seq':          'buzzer_single,',
        \ }
]])

-- vim.g.print_debug_templates = {(
--     'go' ='fmt.Printf("+++ {}\n")',
--     'python' = 'print(f"+++ {}")',
--     'javascript' =  'console.log(`+++ {}`);',
--     'c' = 'printf("+++ {}\n");',
--     )}
