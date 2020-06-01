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

Plugin 'jph00/swift-apple'

Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

Plugin 'chr4/nginx.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'scrooloose/nerdtree'
let g:NERDTreeIgnore=['dist', '\.pyc$']
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/Pods/*,*/*.xcworkspace/*,*/*.xcodeproj/*
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-surround'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
set nofoldenable

" Plugin 'vim-scripts/taglist.vim'
" let Tlist_Show_One_File=1
" let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

Plugin 'majutsushi/tagbar'
let g:tagbar_autofocus = 1
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
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1

Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_hover = ""

call vundle#end()
filetype plugin indent on
syntax on
filetype on

set shiftwidth=2
set tabstop=2
set softtabstop=2

set ambiwidth=double
set autoread
set autoindent
set autowrite
set backspace=indent,eol,start
set cscopetag
set expandtab
set encoding=utf-8
set hidden             " Hide buffers when they are abandoned
set hlsearch
set ignorecase		" Do case insensitive matching
set incsearch
set lbr
set nu
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set smarttab
set smartcase		" Do smart case matching

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

autocmd FileType c setlocal path+=include

autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript.tsx setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sass setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vuejs setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType go setlocal shiftwidth=2 tabstop=2 softtabstop=2

set timeout ttimeoutlen=100 timeoutlen=5000

map <BS> gcc
map j gj
map k gk

let mapleader=';'
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <c-]> gd
au FileType go nmap <leader>doc<CR> :GoDoc<CR>
au FileType go nmap <leader>info<CR> :GoInfo<CR>

map <leader>C :CtrlPClearCache<CR>
map <leader>nerd<CR> :NERDTree<CR>
map <leader>tag<CR> :TagbarToggle<CR>
map <leader>W :vertical resize +2<CR>
map <leader>w :vertical resize -2<CR>
map <leader>H :resize +2<CR>
map <leader>h :resize -2<CR>
