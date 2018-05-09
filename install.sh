# bash
rm -rf ~./bashrc
ln -sf ~/.dotfiles/bashrc ~/.bashrc

# zsh
sudo apt-get -y install zsh
rm -rf ~/.zshrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
rm -rf ~/.oh-my-zsh
ln -sf ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh
chsh -s $(which zsh)

# tmux
rm -rf ~/.tmux.conf
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
