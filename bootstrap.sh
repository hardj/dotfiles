#!/usr/bin/env zsh

#cd "$(dirname "${BASH_SOURCE}")";

cd $(dirname ${(%):-%x})

git pull origin master;

function sync-linux() {
    echo "Updating linux config"
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".osx" \
        --exclude ".idea/" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        --exclude "hosts" \
        --exclude ".gitignore" \
        --exclude ".ssh" \
        --exclude ".git" \
        --exclude ".ideavimrc" \
        -avh --no-perms . ~;
    source ~/.zshrc;
}
function sync-mac() {
    echo "Updating mac config"
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".osx" \
        --exclude ".idea/" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        --exclude "hosts" \
        --exclude ".gitignore" \
        -avh --no-perms . ~;
     chmod 700 ~/.ssh
    source ~/.zshrc;
}

if [[ "$1" == "mac" ]]; then
    sync-mac;
elif [[ "$1" == "linux" ]]; then
    sync-linux;
fi;
unset -f sync-mac;
unset -f sync-linux;
