" Initial vim setup
source ~/.vimrc.setup

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Intergration
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-vinegar'

" Interface
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'

" Completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Language
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'HerringtonDarkholme/yats'

" Colorscheme
Plugin 'tomasiser/vim-code-dark'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End of Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim plugin settings
source ~/.vimrc.plugin

" Coc vim settings
source ~/.vimrc.coc
