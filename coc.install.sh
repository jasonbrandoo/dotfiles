#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Install extensions
mkdir -p $HOME/AppData/Local/coc/extensions
cd $HOME/AppData/Local/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install coc-pairs coc-prettier coc-eslint coc-emmet coc-tailwindcss coc-html coc-tsserver coc-css coc-json --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

