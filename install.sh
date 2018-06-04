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
sudo apt-get -y install tmux
rm -rf ~/.tmux.conf
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

# emacs
sudo apt-get -y install emacs
rm -rf ~/.emacs.d
ln -sf ~/.dotfiles/emacs.d ~/.emacs.d
