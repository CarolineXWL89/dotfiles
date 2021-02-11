set nu
set ruler
set cursorline
set encoding=utf-8
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set background=dark
set shellslash

syntax on

" Scala syntax highlighting
au BufRead,BufNewFile *.scala set filetype=scala
au! Syntax sacla source ~/.vim/syntax/scala.vim

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ycm-core/YouCompleteMe'
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
