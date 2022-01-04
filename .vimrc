set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" lightline um statuszeile unten im Bild zu haben
Plugin 'itchyny/lightline.vim'

"indentation guides
Plugin 'nathanaelkane/vim-indent-guides'

"editorconfig support
Plugin 'editorconfig/editorconfig-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" activate status line
set laststatus=2
" activate line numbers
set number
" activate syntax highlighting
syntax on

" configure lightline
let g:lightline = {}
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = {'left': '', 'right': '' }
let g:lightline.tabline = {
	    \ 'left': [ [ 'tabs' ] ],
	    \ 'right': [ [ 'bufnum'] ] }

let g:indent_guides_enable_on_vim_startup = 1

set expandtab
set tabstop=4
