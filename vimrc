
" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Intergration
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'

" Interface
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Code Display
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Raimondi/delimitMate'

" Completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'dense-analysis/ale'

" Language
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'othree/html5.vim'
call vundle#end()

filetype plugin indent on
" End of Vundle

" FZF
set rtp+=~/.fzf
nnoremap <c-p> :GFiles<cr>
" End of FZF

source ~/.vimrc.setup
source ~/.vimrc.interface
source ~/.vimrc.code_display
source ~/.vimrc.completion
