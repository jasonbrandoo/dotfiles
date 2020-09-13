" Initial vim setup
source ~/vimfiles/.vimrc.setup

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set shellslash
set rtp+=~/vimfiles/bundle/Vundle.vim

call vundle#begin('~/vimfiles/bundle')
Plugin 'VundleVim/Vundle.vim'

" Integration
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf' "cd into /Users/user/vimfiles/bundle/fzf then do 'bash install'
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
Plugin 'vim-airline/vim-airline'

" Completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax Highlighting
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'HerringtonDarkholme/yats.vim'

" Colorscheme
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End of Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim plugin settings
source ~/vimfiles/.vimrc.plugin

" Coc vim settings
source ~/vimfiles/.vimrc.coc
