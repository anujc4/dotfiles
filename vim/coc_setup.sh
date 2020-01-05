#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Install latest nodejs
if [ ! -x "$(command -v node)" ]; then
    curl --fail -LSs https://install-node.now.sh/latest | sh
    export PATH="/usr/local/bin/:$PATH"
fi

# Use package feature to install coc.nvim
mkdir -p ~/.local/share/nvim/site/pack/coc/start
cd ~/.local/share/nvim/site/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi

npm install coc-pairs --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-highlight --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-yank --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-spell-checker --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-go --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-json --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

