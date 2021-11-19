#!/usr/bin/env bash
# System prep
sudo apt-get update && sudo apt upgrade

# Check for SSH keys
if [ -f ~/.ssh/id_ed25519 ]; then cat ~/.ssh/id_ed25519.pub; else echo "No Ed25519 key-pair found, generating new pair" && ssh-keygen -t ed25519 -C "carolinexwliu89@hotmail.com"; fi
# if [ -f ~/.ssh/id_rsa]; then cat ~/.ssh/id_rsa.pub; else echo "No RSA key-pair found, generating new pair" && ssh-keygen -t rsa -b 4096 -C "carolinexwliu89@hotmail.com"; fi
# if [ -f ~/.ssh/id_ed25519 ]; then cat ~/.ssh/id_ed25519.pub; else echo "No Ed25519 key-pair found"; fi
# if [ -f ~/.ssh/id_rsa]; then cat ~/.ssh/id_rsa.pub; else echo "No Ed25519 key-pair found"; fi

if [ -f ~/.ssh/id_ed25519.pub ]; then output="$(cat ~/.ssh/id_ed25519.pub)"; echo "Ed25519 pub key: ${output}"; else echo "No Ed25519 key-pair found"; fi
if [ -f ~/.ssh/id_rsa.pub ]; then output="$(cat ~/.ssh/id_rsa.pub)"; echo "RSA pub key: ${output}"; else echo "No RSA key-pair found"; fi

# Set up needed git folders
if ! [ -d ~/git ]; then mkdir git; fi

# Clone setup repos
git clone git@github.com:CarolineXWL89/dotfiles.git ~/git/
git clone https://github.com/udifuchs/icc-brightness.git ~/git/

# General installations
sudo apt-get install tmux git curl gparted xclip

# Brightness support
sudo apt install liblcms2-dev
make -C ~/git/icc-brightness
sudo make -C ~/git/icc-brightness install
cp ~/git/icc-brightness/icc-brightness /usr/local/bin
cp ~/git/icc-brightness/icc-brightness-gen /usr/local/bin
cp ~/git/icc-brightness/icc-brightness.desktop /usr/share/gnome/autostart

# Setup for vim
sudo apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs default-jdk npm
for df in git/dotfiles/.*; do if [ -f "${df}" ]; then ln -s $df .; else echo "${df} is a directory"; fi; done
  for f in ~/git/dotfiles/*; do if [ "${f}" == "setup.sh" ]; then echo "skipping setup.sh"; else ln -s $f .; fi; done
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer

# Set up alien to handle RPM files: https://linuxize.com/post/install-rpm-packages-on-ubuntu/
# sudo add-apt-repository universe
# sudo apt-get update && sudo apt upgrade
# sudo apt install alien

# Install apps
sudo apt-get install spotify-client
sudo snap install todoist
sudo snap install slack --classic
