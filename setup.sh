#!/bin/bash

echo "Setting dotfile symlinks..."
ln -sf $HOME/repos/jmnel/dotfiles/shared/compton/compton.conf $HOME/.config/compton/compton.conf
echo "compton: shared/compton/compton.conf -> .config/compton/compton.conf"

ln -sf $HOME/repos/jmnel/dotfiles/shared/neovim/init.vim $HOME/.config/nvim/init.vim
echo "neovim: shared/neovim/init.vim -> .config/nvim/init.vim"

echo "Done."
