set nocompatible              " be iMproved, required

if has("syntax")
  syntax on
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'othree/html5.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/a.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
set nofoldenable

" Plugin 'vim-scripts/taglist.vim'
" let Tlist_Show_One_File=1
" let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

Plugin 'majutsushi/tagbar'
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = 1
" let g:tagbar_autoshowtag = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key='f'

Plugin 'fatih/vim-go'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_insertion = 1

call vundle#end()
filetype plugin indent on
filetype on

set ambiwidth=double
set autoread
set backspace=indent,eol,start
set expandtab
set hidden             " Hide buffers when they are abandoned
set ignorecase		" Do case insensitive matching
set lbr
set nu
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set smarttab
set smartcase		" Do smart case matching
set incsearch
set autoindent
set autowrite
set hlsearch
set encoding=utf-8

"删除多余空格
"" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction
autocmd BufWrite *.py :call DeleteTrailingWS()

hi Pmenu    ctermfg=white  ctermbg=magenta    cterm=none 
hi PmenuSel ctermfg=white  ctermbg=lightgray  cterm=none
hi linenr   ctermfg=darkgray

"php auto complete
function AddPHPFunctionList()
    set dictionary-=~/.vim/dic/php.dic dictionary+=~/.vim/dic/php.dic
    set complete-=k complete+=k
endfunction

set shiftwidth=4
set tabstop=4
set softtabstop=4

autocmd FileType php call AddPHPFunctionList()
autocmd FileType c setlocal path+=include

autocmd FileType js set shiftwidth=2
autocmd FileType js set tabstop=2
autocmd FileType js set softtabstop=2

autocmd FileType vue set shiftwidth=2
autocmd FileType vue set tabstop=2
autocmd FileType vue set softtabstop=2

autocmd FileType html set shiftwidth=2
autocmd FileType html set tabstop=2
autocmd FileType html set softtabstop=2

set timeout ttimeoutlen=100 timeoutlen=5000

map <BS> gcc
map j gj
map k gk

let mapleader=';'
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>f :GoTestFunc<CR>
au FileType go nmap <leader>d :GoDoc<CR>

map <leader>nerd<CR> :NERDTree<CR>
map <leader>tag<CR> :TagbarToggle<CR>
map <leader>w+ :vertical resize +2<CR>
map <leader>w- :vertical resize -2<CR>
map <leader>h+ :resize +2<CR>
map <leader>h- :resize -2<CR>
map <leader>C :CtrlPClearCache<CR>
map <leader>' ysiw"
