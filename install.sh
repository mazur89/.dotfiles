# bash
ln -sf ~/.dotfiles/bashrc ~/.bashrc

# zsh
sudo apt-get -y install zsh
rm -rf ~/.zshrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
rm -rf ~/.oh-my-zsh
ln -sf ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh
