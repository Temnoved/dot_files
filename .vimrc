

call plug#begin('~/.vim/plugged')

"common
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'rosenfeld/conque-term'
"Plug 'ddollar/nerdcommenter' 
Plug 'christoomey/vim-tmux-navigator'
Plug 'thinca/vim-quickrun'
Plug 'mattn/webapi-vim'
Plug 'tyru/open-browser.vim'
Plug 'superbrothers/vim-quickrun-markdown-gfm'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

"Devops
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'chr4/nginx.vim'

"python
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'python-mode/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'andviro/flake8-vim'
Plug 'PyCQA/pycodestyle'
Plug 'jmcantrell/vim-virtualenv'

"CSS/SCSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }

"HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript'] }
Plug 'tpope/vim-haml', { 'for': 'haml'}

call plug#end()

syntax on
set enc=utf-8
set ls=2
"set expandtab
"set tabstop=2
set number
set noautoindent

"Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"Change leaderkey
:let mapleader = ","

"allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

"Set tab settings for different languages.
autocmd FileType xml,css,html,sh,yaml,yml setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType c,cpp,lua,tex,python setlocal expandtab shiftwidth=4 softtabstop=4

"при переходе за границу в 80 символов в Ruby/Python/sh/js/C/C++ подсвечиваем на темном фоне текст
 augroup vimrc_autocmds
	autocmd!
	autocmd FileType ruby,python,javascript,sh,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType ruby,python,javascript,sh,c,cpp match Excess /\%80v.*/
	autocmd FileType ruby,python,javascript,sh,c,cpp set nowrap
augroup END

"Search settings
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
set ttyfast

if has("gui_running")
	set cursorline
endif

"Plugins settings
map <C-n> :NERDTreeToggle<CR>



""=====================================================
""" Python-mode settings
""=====================================================
""" отключаем автокомплит по коду (вместо него используется jedi-vim)
" let g:pymode_rope = 0
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0

" let g:jedi#auto_initialization = 1
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#popup_on_dot = 1
" let g:jedi#popup_select_first = 1

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
""=====================================================
"" User hotkeys
"=====================================================
"" ConqueTerm
" запуск интерпретатора на F5
nnoremap <F5> :ConqueTermSplit ipython<CR>
nnoremap <buffer> <F9> :exec '!clear; python3' shellescape(@%, 1)<CR>
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



