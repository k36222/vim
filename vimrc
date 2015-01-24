scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (���̍s�Ɋւ��Ă�:help modeline���Q��)
"
" An example for a Japanese version vimrc file.
" ���{��ł̃f�t�H���g�ݒ�t�@�C��(vimrc) - Vim7�p����
"
" Last Change: 25-Jan-2015.
" Maintainer:  MURAOKA Taro <koron.kaoriya@gmail.com>
"
" ���:
" ���̃t�@�C���ɂ�Vim�̋N�����ɕK���ݒ肳���A�ҏW���̋����Ɋւ���ݒ肪��
" ����Ă��܂��BGUI�Ɋւ���ݒ��gvimrc�ɏ�������Ă��܂��B
"
" �l�p�ݒ��_vimrc�Ƃ����t�@�C�����쐬�������ōs�Ȃ��܂��B_vimrc�͂��̃t�@
" �C���̌�ɓǍ��܂�邽�߁A�����ɏ����ꂽ���e���㏑�����Đݒ肷�邱�Ƃ��o��
" �܂��B_vimrc��$HOME�܂���$VIM�ɒu���Ă����K�v������܂��B$HOME��$VIM����
" �D�悳��A$HOME�ł݂������ꍇ$VIM�͓Ǎ��܂�܂���B
"
" �Ǘ��Ҍ����ɖ{�ݒ�t�@�C���𒼐ڏ����������ɍς܂��邱�Ƃ�ړI�Ƃ��āA�T�C
" �g���[�J���Ȑݒ��ʃt�@�C���ōs�Ȃ���悤�ɔz�����Ă���܂��BVim�N������
" �T�C�g���[�J���Ȑݒ�t�@�C��($VIM/vimrc_local.vim)�����݂���Ȃ�΁A�{�ݒ�
" �t�@�C���̎�v�������ǂݍ��܂��O�Ɏ����I�ɓǂݍ��݂܂��B
"
" �ǂݍ��݌�A�ϐ�g:vimrc_local_finish����0�̒l�ɐݒ肳��Ă����ꍇ�ɂ͖{��
" ��t�@�C���ɏ����ꂽ���e�͈�؎��s����܂���B�f�t�H���g�����S�č����ւ�
" �����ꍇ�ɗ��p���ĉ������B
"
" �Q�l:
"   :help vimrc
"   :echo $HOME
"   :echo $VIM
"   :version

"---------------------------------------------------------------------------
" �T�C�g���[�J���Ȑݒ�($VIM/vimrc_local.vim)������Γǂݍ��ށB�ǂݍ��񂾌��
" �ϐ�g:vimrc_local_finish�ɔ�0�Ȓl���ݒ肳��Ă����ꍇ�ɂ́A����ȏ�̐ݒ�
" �t�@�C���̓Ǎ��𒆎~����B
if 1 && filereadable($VIM . '/vimrc_local.vim')
  unlet! g:vimrc_local_finish
  source $VIM/vimrc_local.vim
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" ���[�U�D��ݒ�($HOME/.vimrc_first.vim)������Γǂݍ��ށB�ǂݍ��񂾌�ɕϐ�
" g:vimrc_first_finish�ɔ�0�Ȓl���ݒ肳��Ă����ꍇ�ɂ́A����ȏ�̐ݒ�t�@
" �C���̓Ǎ��𒆎~����B
if 1 && exists('$HOME') && filereadable($HOME . '/.vimrc_first.vim')
  unlet! g:vimrc_first_finish
  source $HOME/.vimrc_first.vim
  if exists('g:vimrc_first_finish') && g:vimrc_first_finish != 0
    finish
  endif
endif

" plugins���̃f�B���N�g����runtimepath�֒ǉ�����B
for s:path in split(glob($VIM.'/plugins/*'), '\n')
  if s:path !~# '\~$' && isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
unlet s:path

if has("vim_starting")
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" �C���X�g�[���������v���O�C���������ɏ���
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle "Shougo/neocomplete.vim"
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'hsitz/VimOrganizer'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'vim-scripts/utl.vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-speeddating'
"NeoBundle 'jceb/vim-orgmode'
"NeoBundle 'mattn/zencoding-vim'
"NeoBundle 'kannokanno/previm'
"NeoBundle 'tyru/open-browser.vim'

call neobundle#end()

let g:ft_ignore_pat = '\.org'

filetype on
filetype plugin indent on

NeoBundleCheck

"let g:org_agenda_files = ['$HOME/org/index.org', '$HOME/org/project.org']
"let g:org_agenda_files = ['$HOME/org/*.org']
"---------------------------------------------------------------------------
" VimOrganizer 
"---------------------------------------------------------------------------
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()
let g:org_command_for_emacsclient = '$HOME/emacsclientsw'
let g:org_agenda_select_dirs = ['$HOME/org']
let g:org_agenda_files = split(glob("$HOME/org/*.org"),"\n")
syntax on

"---------------------------------------------------------------------------
" ���{��Ή��̂��߂̐ݒ�:
"
" �t�@�C����Ǎ��ގ��Ƀg���C���镶���G���R�[�h�̏������m�肷��B�����R�[�h��
" �����ʋ@�\�𗘗p����ꍇ�ɂ͕ʓriconv.dll���K�v�Biconv.dll�ɂ��Ă�
" README_w32j.txt���Q�ƁB���[�e�B���e�B�X�N���v�g��ǂݍ��ނ��ƂŐݒ肳���B
source $VIM/plugins/kaoriya/encode_japan.vim
" ���b�Z�[�W����{��ɂ��� (Windows�ł͎����I�ɔ��f�E�ݒ肳��Ă���)
if !(has('win32') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif
" MacOS X���j���[�̓��{�ꉻ (���j���[�\���O�ɍs�Ȃ��K�v������)
if has('mac')
  set langmenu=japanese
endif
" ���{����͗p��keymap�̐ݒ�� (�R�����g�A�E�g)
if has('keymap')
  " ���[�}��������keymap
  "silent! set keymap=japanese
  "set iminsert=0 imsearch=0
endif
" ��GUI���{��R���\�[�����g���Ă���ꍇ�̐ݒ�
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif

"---------------------------------------------------------------------------
" ���j���[�t�@�C�������݂��Ȃ��ꍇ�͗\��'guioptions'�𒲐����Ă���
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

"---------------------------------------------------------------------------
" Bram���̒񋟂���ݒ����C���N���[�h (�ʃt�@�C��:vimrc_example.vim)�B����
" �ȑO��g:no_vimrc_example�ɔ�0�Ȓl��ݒ肵�Ă����΃C���N���[�h�͂��Ȃ��B
if 1 && (!exists('g:no_vimrc_example') || g:no_vimrc_example == 0)
  if &guioptions !~# "M"
    " vimrc_example.vim��ǂݍ��ގ���guioptions��M�t���O�����āAsyntax on
    " ��filetype plugin on�������N����menu.vim�̓ǂݍ��݂������B�������Ȃ�
    " ��enc�ɑΉ����郁�j���[�t�@�C�����ǂݍ��܂�Ă��܂��A����̌�œǂݍ�
    " �܂��.vimrc��enc���ݒ肳�ꂽ�ꍇ�ɂ��̐ݒ肪���f���ꂸ���j���[������
    " �����Ă��܂��B
    set guioptions+=M
    source $VIMRUNTIME/vimrc_example.vim
    set guioptions-=M
  else
    source $VIMRUNTIME/vimrc_example.vim
  endif
endif

"---------------------------------------------------------------------------
" �����̋����Ɋւ���ݒ�:
"
" �������ɑ啶���������𖳎� (noignorecase:�������Ȃ�)
set ignorecase
" �啶���������̗������܂܂�Ă���ꍇ�͑啶�������������
set smartcase

"---------------------------------------------------------------------------
" �ҏW�Ɋւ���ݒ�:
"
" �^�u�̉�ʏ�ł̕�
set softtabstop=4
set shiftwidth=4
set tabstop=4
" �^�u���X�y�[�X�ɓW�J���Ȃ� (expandtab:�W�J����)
set expandtab
"set noexpandtab
" �����I�ɃC���f���g���� (noautoindent:�C���f���g���Ȃ�)
set autoindent
" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start
" �������Ƀt�@�C���̍Ō�܂ōs������ŏ��ɖ߂� (nowrapscan:�߂�Ȃ�)
set wrapscan
" ���ʓ��͎��ɑΉ����銇�ʂ�\�� (noshowmatch:�\�����Ȃ�)
set showmatch
" �R�}���h���C���⊮����Ƃ��ɋ������ꂽ���̂��g��(�Q�� :help wildmenu)
set wildmenu
" �e�L�X�g�}�����̎����܂�Ԃ�����{��ɑΉ�������
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI�ŗL�ł͂Ȃ���ʕ\���̐ݒ�:
"
" �s�ԍ����\�� (number:�\��)
set nonumber
" ���[���[��\�� (noruler:��\��)
set ruler
" �^�u����s��\�� (list:�\��)
set nolist
" �ǂ̕����Ń^�u����s��\�����邩��ݒ�
set listchars=tab:^\ ,trail:~
" �����s��܂�Ԃ��ĕ\�� (nowrap:�܂�Ԃ��Ȃ�)
set wrap
" ��ɃX�e�[�^�X�s��\�� (�ڍׂ�:he laststatus)
set laststatus=2
" �R�}���h���C���̍��� (Windows�pgvim�g�p����gvimrc��ҏW���邱��)
set cmdheight=2
" �R�}���h���X�e�[�^�X�s�ɕ\��
set showcmd
" �^�C�g����\��
set title
" ��ʂ����n�ɔ��ɂ��� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
"colorscheme evening " (Windows�pgvim�g�p����gvimrc��ҏW���邱��)

"---------------------------------------------------------------------------
" �t�@�C������Ɋւ���ݒ�:
"
" �o�b�N�A�b�v�t�@�C�����쐬���Ȃ� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
"set nobackup


"---------------------------------------------------------------------------
" �t�@�C�����ɑ啶���������̋�ʂ��Ȃ��V�X�e���p�̐ݒ�:
"   (��: DOS/Windows/MacOS)
"
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  " tags�t�@�C���̏d���h�~
  set tags=./tags,tags
endif

"---------------------------------------------------------------------------
" �R���\�[���ł̃J���[�\���̂��߂̐ݒ�(�b��I��UNIX��p)
if has('unix') && !has('gui_running')
  let s:uname = system('uname')
  if s:uname =~? "linux"
    set term=builtin_linux
  elseif s:uname =~? "freebsd"
    set term=builtin_cons25
  elseif s:uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet s:uname
endif

"---------------------------------------------------------------------------
" �R���\�[���łŊ��ϐ�$DISPLAY���ݒ肳��Ă���ƋN�����x���Ȃ錏�֑Ή�
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"---------------------------------------------------------------------------
" �v���b�g�z�[���ˑ��̓��ʂȐݒ�

" Win�ł�PATH��$VIM���܂܂�Ă��Ȃ��Ƃ���exe�������o���Ȃ��̂ŏC��
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  " Mac�ł̓f�t�H���g��'iskeyword'��cp932�ɑΉ�������Ă��Ȃ��̂ŏC��
  set iskeyword=@,48-57,_,128-167,224-235
endif

"---------------------------------------------------------------------------
" KaoriYa�Ńo���h�����Ă���v���O�C���̂��߂̐ݒ�

" autofmt: ���{�ꕶ�͂̃t�H�[�}�b�g(�܂�Ԃ�)�v���O�C��.
set formatexpr=autofmt#japanese#formatexpr()

" vimdoc-ja: ���{��w���v�𖳌�������.
if kaoriya#switch#enabled('disable-vimdoc-ja')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimdoc-ja"'), ',')
endif

" vimproc: ������vimproc�𖳌�������
if kaoriya#switch#enabled('disable-vimproc')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimproc$"'), ',')
endif

"---------------------------------------------------------------------------
"�S�p�X�y�[�X�����o��
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#FF0000
    match ZenkakuSpace /�@/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif

"---------------------------------------------------------------------------
"�}�����[�h��ctrl+T2�񂤂��Ō��ݎ����}��
imap <silent> <C-T><C-T> <C-R>=strftimer("%H:%M:%S")<CR>

"---------------------------------------------------------------------------
"�t�@�C�����J�������ɃJ�����g�f�B���N�g����ύX����
source $VIMRUNTIME/macros/cd.vim

"---------------------------------------------------------------------------
"
let g:previm_open_cmd = ''

"---------------------------------------------------------------------------
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"�C���T�[�g���[�h�ŊJ�n
let g:unite_enable_start_insert = 1
"�ŋߊJ�����t�@�C�������̕ۑ���let g:unite_source_file_mru_limit = 50

"file_mru�̕\���t�H�[�}�b�g���w��B��ɂ���ƕ\���X�s�[�h�������������
let g:unite_source_file_mru_filename_format = ''

"���݊J���Ă���t�@�C���̃f�B���N�g�����̃t�@�C���ꗗ�B
"�J���Ă��Ȃ��ꍇ�̓J�����g�f�B���N�g��
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"�o�b�t�@�ꗗ
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"���W�X�^�ꗗ
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"�ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"�u�b�N�}�[�N�ꗗ
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"�u�b�N�}�[�N�ɒǉ�
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"unite���J���Ă���Ԃ̃L�[�}�b�s���O
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESC��unite���I��
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "���̓��[�h�̂Ƃ�jj�Ńm�[�}�����[�h�Ɉړ�
  imap <buffer> jj <Plug>(unite_insert_leave)
  "���̓��[�h�̂Ƃ�ctrl+w�Ńo�b�N�X���b�V�����폜
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+j�ŏc�ɕ������ĊJ��
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+j�ŉ��ɕ������ĊJ��
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+o�ł��̏ꏊ�ɊJ��
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

"------------------------------------
" neocomplete.vim
"------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" docstring�͕\�����Ȃ�
autocmd FileType python setlocal completeopt-=preview
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" Copyright (C) 2009-2013 KaoriYa/MURAOKA Taro
