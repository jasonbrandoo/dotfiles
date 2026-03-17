#!/usr/bin/env bash

git clone --bare https://github.com/jasonbrandoo/dotfiles.git $HOME/.myconf

alias config='/usr/bin/git --git-dir=$HOME/.myconf --work-tree=$HOME'

config checkout || {
  echo "Backing up conflicting files..."
  mkdir -p ~/.config-backup
  config checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | \
    xargs -I{} mv {} ~/.config-backup/{}
  config checkout
}

config config status.showUntrackedFiles no
