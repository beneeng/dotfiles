#!/bin/bash


setup_mac(){
    brew install vim
    brew install fzf
    $(brew --prefix)/opt/fzf/install
    brew install direnv
}

setup_ubuntu(){
    sudo apt-get install vim fzf direnv curl
}



CONFIG_FOLDER="$HOME/.cfg/"
GIT_REPO="https://github.com/beneeng/dotfiles.git"

command -v git &> /dev/null

if [ "$?" -ne "0" ]; then
       echo "install git first"
       exit 1 
fi


[ -z $(grep "^.cfg$" .gitignore 2>/dev/null) ] && echo ".cfg" >> .gitignore

git clone --bare $GIT_REPO $CONFIG_FOLDER

#checkout config
git --git-dir=$CONFIG_FOLDER --work-tree=$HOME checkout

# remove untracked files in home directory from `config status`
git --git-dir=$CONFIG_FOLDER --work-tree=$HOME config --local status.showUntrackedFiles no


if [[ "$OSTYPE" == "linux-gnu" ]]; then
        setup_ubuntu
elif [[ "$OSTYPE" = "darwin" ]]; then
        setup_mac
fi


git --git-dir=$CONFIG_FOLDER --work-tree=$HOME submodule update --init
vim +PluginInstall +qall

export KEEP_ZSHRC="yes"
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


