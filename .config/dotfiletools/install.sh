#!/bin/sh


setup_mac(){
    brew install vim
    brew install fzf
    $(brew --prefix)/opt/fzf/install
    brew install direnv
}

setup_ubuntu(){
    sudo apt-get install vim fzf direnv
    $(brew --prefix)/opt/fzf/install
}



CONFIG_FOLDER="$HOME/.cfg/"
GIT_REPO="git@github.com:beneeng/dotfiles.git"

if command -v git &> /dev/null; then
       echo "install git first"
       exit 1 
fi

alias config='git --git-dir=$CONFIG_FOLDER --work-tree=$HOME'

[ -z $(grep "^.cfg$" .gitignore 2>/dev/null) ] && echo ".cfg" >> .gitignore

git clone --bare $GIT_REPO $CONFIG_FOLDER

#checkout config
config checkout

# remove untracked files in home directory from `config status`
config config --local status.showUntrackedFiles no


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        setup_ubuntu
elif [[ "$OSTYPE" == "darwin"* ]]; then
        setup_mac
fi

export KEEP_ZSHRC='yes'
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


