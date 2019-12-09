
" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Intergration
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'

" Interface
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Language
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'othree/html5.vim'

" Colorscheme
Plugin 'tomasiser/vim-code-dark'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on
" End of Vundle

source ~/.vimrc.setup
source ~/.vimrc.plugin
source ~/.vimrc.coc
