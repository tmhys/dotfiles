vim.cmd([[
" ���Z�q�̊Ԃɋ󔒂�����
"inoremap <expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', ' << ', '<')
"inoremap <expr> > search('^#include <.*\%#', 'bcn')? '>': smartchr#one_of(' > ', ' >> ', '>')
inoremap <expr> + smartchr#one_of(' + ', '++', '+')
inoremap <expr> # smartchr#one_of('# ', '#')
" inoremap <expr> - smartchr#one_of(' - ', '--', '-')
inoremap <expr> / smartchr#one_of(' / ', '// ', '/')
" *�̓|�C���^�Ŏg���̂ŁA�󔒂͂���Ȃ�
inoremap <expr> & smartchr#one_of(' & ', ' && ', '&')
inoremap <expr> % smartchr#one_of(' % ', '%')
inoremap <expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
" inoremap <expr> , smartchr#one_of(', ', ',')
" 3�����Z�q�̏ꍇ�́A���̂݋󔒂�����
inoremap <expr> ? smartchr#one_of('? ', '?')
inoremap <expr> : smartchr#one_of(': ', '::', ':')

" =�̏ꍇ�A�P���ȑ�����r���Z�q�Ƃ��ē��͂���ꍇ�͑O��ɃX�y�[�X�������B
" �������Z����Ƃ��Ă̓��͂̏ꍇ�́A���O�̃X�y�[�X���폜����=�����
inoremap <expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
                \ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
                \ : smartchr#one_of(' = ', ' == ', '=')

" ���L�̕����͘A�����Č���邱�Ƃ��܂�Ȃ̂ŁA��񑱂��ē��͂�������s����
"inoremap <expr> } smartchr#one_of('}', '}<cr>')
" inoremap <expr> ; smartchr#one_of(';', ';<cr>')
" cosco vim���悭�킩��Ȃ��̂ő�p
inoremap <expr> , smartchr#one_of(',', ';', '')
inoremap <expr> ; smartchr#one_of(';', ',', '')
" �u->�v�͓��͂��Â炢�̂ŁA..�Œu����
inoremap <expr> . smartchr#loop('.', '->', '...')
" �s�擪�ł�@���͂ŁA�v���v���Z�X���ߕ������
inoremap <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#one_of('#define', '#include', '#ifdef', '#endif', '@'): '@'

inoremap <expr> " search('^#include\%#', 'bcn')? ' "': '"'
" if�������(�͎����ŊԂɋ󔒂�����
"inoremap <expr> ( search('\<\if\%#', 'bcn')? ' (': '('

]])
