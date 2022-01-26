" intial sets
filetype indent on
set ai
set encoding=utf-8
set mouse=a
set incsearch
set confirm
set number
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set nowrap
" set for lightline to appear on start
set laststatus=2

" Plugins
call plug#begin('~/.vim/autoload')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

call plug#end()

" set the colorscheme
set background=dark
colorscheme gruvbox
autocmd vimenter ++nested colorscheme gruvbox
