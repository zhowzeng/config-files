set nocompatible
set encoding=utf-8

" ====================
" Vundle Plugin
" ====================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-python/python-syntax'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'JulesWang/css.vim'
Plugin 'tpope/vim-haml'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'gavocanov/vim-js-indent'
Plugin 'mxw/vim-jsx'
Plugin 'gkz/vim-ls'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dense-analysis/ale'
Plugin 'evanleck/vim-svelte'
call vundle#end()
filetype plugin indent on

let g:python_highlight_all = 1
let g:html_indent_inctags='html,head,body'
let g:gitgutter_diff_base='HEAD'
let g:NERDTreeMapActivateNode='e'
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'
let g:ale_fixers = {'python': ['autopep8', 'isort', 'autoimport'],}
let g:ale_linters = {'python': ['flake8'],}
let g:ale_python_autopep8_options='--ignore E226,E24,W50,W690,E501'
let g:ale_python_flake8_executable='python3'
let g:ale_python_flake8_options='-m flake8 --ignore=E226,E24,W50,W690,E501'
highlight javascriptImport ctermfg=Red
highlight javascriptExport ctermfg=Red
autocmd FileType nerdtree nmap <buffer> e ge
autocmd FileType nerdtree nmap <buffer> s gs
autocmd FileType nerdtree nmap <buffer> v gv
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif

" ====================
" Color
" ====================
syntax on
set t_Co=256
colorscheme codedark  " monokai

" ====================
" Appearance
" ====================
set hlsearch
set incsearch
set ignorecase
set smartcase
set modelines=1
set nofoldenable
set nowrap
set nrformats=alpha,octal,hex
set number
set numberwidth=1
set ruler
set wildmenu
set cursorline
set scrolloff=3
set splitbelow
set splitright
set colorcolumn=120
autocmd BufWritePre * :%s/\s\+$//e
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" ====================
" FileType
" ====================
autocmd FileType html,css,javascript,ls,vue,svelte setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal filetype=javascript.jsx
autocmd FileType javascript.jsx setlocal autoindent
autocmd FileType pug,sass,styl setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType perl,python,java setlocal expandtab shiftwidth=4
autocmd FileType yaml,yml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType sh,cpp,make setlocal shiftwidth=4 tabstop=4
autocmd FileType c,cuda setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType php setlocal shiftwidth=4 tabstop=4 expandtab
autocmd BufRead,BufEnter *.md setlocal expandtab shiftwidth=2 softtabstop=2
autocmd BufNewFile *.h setlocal shiftwidth=4 tabstop=4 expandtab
autocmd BufNewFile,BufEnter *.vue setfiletype vue
autocmd FileType vue setlocal autoindent expandtab shiftwidth=2
\ | syntax include @PUG syntax/pug.vim | unlet b:current_syntax
\ | syntax include @JS syntax/javascript.vim | unlet b:current_syntax
\ | syntax include @SASS syntax/sass.vim | unlet b:current_syntax
\ | syntax region vueTemplate matchgroup=vueTag start=/^<template.*>$/ end='</template>' contains=@PUG keepend
\ | syntax region vueScript matchgroup=vueTag start=/^<script.*>$/ end='</script>' contains=@JS keepend
\ | syntax region vueStyle matchgroup=vueTag start=/^<style.*>$/ end='</style>' contains=@SASS keepend
\ | syntax match htmlArg /v-text\|v-html\|v-if\|v-show\|v-else\|v-for\|v-on\|v-bind\|v-model\|v-pre\|v-cloak\|v-once/ contained
\ | syntax keyword htmlArg contained key ref slot
\ | syntax keyword htmlTagName contained component transition transition-group keep-alive slot
\ | syntax sync fromstart
autocmd BufNewFile,BufRead *.py set foldmethod=indent
" autocmd BufNewFile *.py silent! 0r $HOME/.vim/template/tmpl.py | 4
" autocmd BufNewFile *.html silent! 0r $HOME/.vim/template/tmpl.html | 12delete | 9
" autocmd BufNewFile *.pug silent! 0r $HOME/.vim/template/tmpl.pug | 9delete
" autocmd BufNewFile *.vue silent! 0r $HOME/.vim/template/tmpl.vue | 13delete | 2
" autocmd BufNewFile *.pl silent! 0r $HOME/.vim/template/tmpl.pl | 4
" autocmd BufNewFile *.c silent! 0r $HOME/.vim/template/tmpl.c | 7delete | 3
" autocmd BufRead,BufNewFile *.asm set filetype=nasm tabstop=4 shiftwidth=4


" ====================
" Mapping
" ====================
nnoremap <Tab> <C-W>w
nnoremap <C-W><C-W> <C-W>p
nnoremap + <C-W>+
nnoremap _ <C-W>-
nnoremap < <C-W><
nnoremap > <C-W>>
nnoremap <C-C> <C-A>
nnoremap ` :NERDTreeToggle<CR>
nnoremap tt :TagbarToggle<CR>
xnoremap s :sort<CR>
nmap <F8> :ALEFix<CR>
nmap <F7> :ALEToggle<CR>
nnoremap <CR> :noh<CR>
