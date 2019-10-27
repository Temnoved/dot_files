

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'python-mode/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'rosenfeld/conque-term'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'andviro/flake8-vim'
Plug 'PyCQA/pycodestyle'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jmcantrell/vim-virtualenv'

call plug#end()

syntax on
set enc=utf-8
set ls=2
"set expandtab
"set tabstop=2
set number
set noautoindent

autocmd FileType xml,css,html,sh,yaml,yml setlocal shiftwidth=2 tabstop=2
autocmd FileType c,cpp,lua,tex,python setlocal expandtab shiftwidth=4 softtabstop=4

set hlsearch
set incsearch

set noswapfile

aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
	set cursorline
endif
set ttyfast


map <C-n> :NERDTreeToggle<CR>

"при переходе за границу в 80 символов в Ruby/Python/sh/js/C/C++ подсвечиваем на темном фоне текст
 augroup vimrc_autocmds
	autocmd!
	autocmd FileType ruby,python,javascript,sh,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType ruby,python,javascript,sh,c,cpp match Excess /\%80v.*/
	autocmd FileType ruby,python,javascript,sh,c,cpp set nowrap
augroup END


"=====================================================
"" Python-mode settings
"=====================================================
"" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" " проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" " провека кода после сохранения
let g:pymode_lint_write = 1
"
" " поддержка virtualenv
let g:pymode_virtualenv = 1
"
" " установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
"
" " подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " отключить autofold по коду
let g:pymode_folding = 0
"
" " возможность запускать код
let g:pymode_run = 0


" Disable choose first function/method at autocomplete/отключение автовыбора
" первой строки при автодополнении
let g:jedi#popup_select_first = 0

"Проверка на соответствие PEP8"
let g:PyFlakeOnWrite = 1
"=====================================================
"" User hotkeys
"=====================================================
"" ConqueTerm
" запуск интерпретатора на F5
nnoremap <F5> :ConqueTermSplit ipython<CR>
nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<CR>
" " а debug-mode на <F6>
nnoremap <F6> :exec "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
" " проверка кода в соответствии с PEP8 через <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
"
" " автокомплит через <Ctrl+Space>
inoremap <C-space> <C-x><C-o>
"
" " переключение между синтаксисами
" nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
" nnoremap <leader>Tj :set ft=javascript<CR>
" nnoremap <leader>Tc :set ft=css<CR>
" nnoremap <leader>Td :set ft=django<CR>



