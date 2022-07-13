vim.cmd([[
" The prefix key.
nnoremap    [ctrlp]   <Nop>
nmap    <Space>f [ctrlp]
"
""let g:ctrlp_line_prefix= '> '
nnoremap <silent> [ctrlp]f :<C-u>CtrlPCurFile<CR>
nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
nnoremap <silent> [ctrlp]v :<C-u>CtrlP $HOME/dotfiles/vimrc<CR>
nnoremap <silent> [ctrlp]a :<C-u>CtrlPMixed<CR>
nnoremap <silent> [ctrlp]c :<C-u>CtrlPColorscheme<CR>
nnoremap <silent> [ctrlp]k :<C-u>CtrlPMark<CR>
let g:ctrlp_clear_cache_on_exit = 0   " �I�����L���b�V�����N���A���Ȃ�
" �x���ĕ`��
let g:ctrlp_lazy_update = 1
if v:version  == 802  && has("patch1665")
	let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
endif
" CtrlP�̃E�B���h�E�ő卂��
autocmd VimEnter,VimResized *  let g:ctrlp_match_window = 'max:' . string(min([(&lines/3), 20]) - 1)

"���̂����[�N���Ȃ�
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

let g:ctrlp_reuse_window = 'quickfix'
" # lightline.vim�ŕ\�����Ă���X�e�[�^�X���C���Ƃ̏Փ˂�����邽��
let g:ctrlp_buffer_func = {
	\ 'enter': 'CtrlPEnter',
	\ 'exit': 'CtrlPLeave',
\ }

" # ctrlp�ɓ���Ƃ��C�X�e�[�^�X���C���̕\����off��
function! CtrlPEnter()
	set laststatus=0
	let b:qs_local_disable=1
endfunction

" # ctrlp����o��Ƃ��C�X�e�[�^�X���C���̕\����on��
function! CtrlPLeave()
	set laststatus=2
	let b:qs_local_disable=0
endfunction
]])
