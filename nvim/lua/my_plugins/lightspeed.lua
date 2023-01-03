vim.g.lightspeed_no_default_keymaps = true
require("lightspeed").setup({
    ignore_case = false,
    -- exit_after_idle_msecs = { unlabeled = 2000, labeled = nil },
    --- s/x ---
    -- jump_to_unique_chars = { safety_timeout = 400 },
    jump_to_unique_chars = false,
    safe_labels = {},
    match_only_the_start_of_same_char_seqs = true,
    force_beacons_into_match_width = false,
    -- Display characters in a custom way in the highlighted matches.
    substitute_chars = { ["\r"] = "Å " },
    -- Leaving the appropriate list empty effectively disables "smart" mode,
    -- and forces auto-jump to be on or off.
    -- These keys are captured directly by the plugin at runtime.
    special_keys = {
        next_match_group = "<tab>",
        prev_match_group = "<s-tab>",
    },
    --- f/t ---
    limit_ft_matches = 4,
    repeat_ft_with_target_char = false,
})

vim.cmd([[
nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"

" augroup lightspeed_active
"     au!
"     au user LightspeedFtEnter let g:lightspeed_active = 1
"     au user LightspeedFtLeave unlet g:lightspeed_active
" augroup END

" nmap <expr> zz exists('g:lightspeed_active') ? '<plug>Lightspeed_;_ft' : '<plug>Lightspeed_s'
" nmap <expr> ZZ exists('g:lightspeed_active') ? '<plug>Lightspeed_,_ft' : '<plug>Lightspeed_S'
]])

vim.cmd('unmap s')
vim.cmd('unmap S')
