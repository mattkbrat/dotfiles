#/bin/bash

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*');

echo "installing lazygit v ${LAZYGIT_VERSION}"

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz";

tar xf lazygit.tar.gz lazygit;

sudo install lazygit -D -t /usr/local/bin/;
