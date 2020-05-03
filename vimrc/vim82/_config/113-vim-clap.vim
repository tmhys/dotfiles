if empty(globpath(&rtp, 'autoload/clap.vim'))
  finish
endif

" The prefix key.
nnoremap    [clap]   <Nop>
nmap    <Space>f [clap]

nnoremap <silent> [clap]f :<C-u>Clap files<CR>
"nnoremap <silent> <M-f> :<C-u>Clap files<CR>
nnoremap <silent> [clap]i :<C-u>Clap colors<CR>
nnoremap <silent> [clap]b :<C-u>Clap buffers<CR>
nnoremap <silent> [clap]<Space> :<C-u>Clap blines<CR>
nnoremap <silent> [clap]c :<C-u>Clap commits<CR>
nnoremap <silent> [clap]d :<C-u>Clap gfiles<CR>
nnoremap <silent> [clap]g :<C-u>Clap grep<CR>
nnoremap <silent> [clap]m :<C-u>Clap history<CR>
nnoremap <silent> [clap]j :<C-u>Clap jumps<CR>
nnoremap <silent> [clap]l :<C-u>Clap lines<CR>
nnoremap <silent> [clap]a :<C-u>Clap marks<CR>
nnoremap <silent> [clap]h :<C-u>Clap help<CR>
nnoremap <silent> [clap]r :<C-u>Clap quick_open<CR>
nnoremap <silent> [clap]n :<C-u>Clap filer<CR>
nnoremap <silent> [clap]/ :<C-u>Clap search_history<CR>
nnoremap <silent> [clap]v :<C-u>Clap files $HOME/dotfiles/vimrc<CR>
nnoremap <silent> [clap]p :<C-u>Clap files $HOME/Programing/python<CR>
nnoremap <silent> [clap]s :<C-u>Clap sessions<CR>

let g:clap_session_dir  = 'C:\Users\thtom\.vim\session'

autocmd FileType clap_input inoremap <silent> <buffer> <Esc> <Esc>:call clap#handler#exit()<CR>
"nnoremap <silent> [clap]v :<C-u>Clap files $VIMRUNTIME/_config<CR>
"nnoremap <silent> [clap]s :<C-u>Clap session<CR>

let g:clap_provider_quick_open = {
      \ 'source': ['$VIM/_vimrc', '$VIM/_gvimrc','$VIMRUNTIME/userautoload/SysSeq.vim'],
      \ 'sink': 'e',
      \ }

let g:clap_theme = 'material_design_dark'

"以下他人の設定参考
"" vim-clap {{{
""let g:clap_spinner_frames =  ["●∙∙", "∙●∙", "∙∙●"]
"" let g:clap_prompt_format = ''
"let g:clap_default_external_filter = 'fzf'
"
"" let g:clap_current_selection_sign_definition='➤'
"let g:clap_multi_selection_warning_silent = 1
"let g:clap_current_selection_sign = { 'text': '☛', 'texthl': "ClapCurrentSelectedSign", "linehl": "ClapCurrentSelection" }
"let g:clap_selected_sign  = { 'text': ' •', 'texthl': "ClapSelectedSign", "linehl": "ClapSelected" }
"let g:clap_open_action    = { 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }
"let g:clap_no_matches_msg = 'Keine Gleiche gefunden'
"
"" grep options
"let g:clap_provider_grep_executable  = 'rg'
"let g:clap_provider_grep_opts        = '-H --no-heading --vimgrep --smart-case --hidden'
"let g:clap_provider_grep_delay       = 300
"let g:clap_provider_grep_blink       = [1, 200]
"let g:clap_provider_grep_enable_icon = 0
"
"" Yank provider
"let g:clap_enable_yanks_provider      = 1
"let g:clap_provider_yanks_max_entries = 30
"let g:clap_provider_yanks_min_len     = 3
"
"" Beautify clap input window
"let g:clap_search_box_border_symbols = { 'arrow': ["\ue0b2", "\ue0b0"], 'curve': ["\ue0b6", "\ue0b4"], 'nil': ['', ''] }
"let g:clap_search_box_border_style   = 'curve'
"
"function! ClapEnter() abort
"  call g:clap.display.setbufvar_batch({
"        \ '&wrap'           : 0,
"        \ '&number'         : 0,
"        \ '&relativenumber' : 0,
"        \ '&cursorline'     : 1,
"        \ '&signcolumn'     : 'yes',
"        \ '&spell'          : 0,
"        \ '&colorcolumn'    : 0,
"        \ })
"endfunction " function
"
"function! ClapExit() abort
"endfunction
"
"augroup ClapGrp
"    autocmd!
"    autocmd User ClapOnEnter   call ClapEnter()
"    autocmd User ClapOnExit    call ClapExit()
"augroup END
"
"" Clap quick_open to open some dotfiles quickly.
"let g:clap_provider_quick_open = {
"      \ 'source': [
"      \ '$HOME/.vim/vimrc',
"      \ '$HOME/.zshrc',
"      \ '$HOME/.tmux.conf'
"      \ ],
"      \ 'sink': 'e',
"      \ }
"
"nnoremap <silent><Space>fo :Clap files --hidden<CR>
"nnoremap <silent><Space>fb :Clap buffers<CR>
"nnoremap <silent><Space>fr :Clap history<CR>
"nnoremap <silent><Space>fl :Clap blines<CR>
"nnoremap <silent><Space>/  :Clap grep<CR>
"nnoremap <silent><Space>fm :Clap marks<CR>
"nnoremap <silent><Space>fh :Clap command_history<CR>
"nnoremap <silent><Space>fy :Clap yanks<CR>
"nnoremap <silent><Space>fw :Clap quick_open<CR>
