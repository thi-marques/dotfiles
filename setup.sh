#!/bin/bash

# Symbolic links
ln -s $PWD/shell/bashrc $HOME/.bashrc
ln -s $PWD/shell/zshrc $HOME/.zshrc
ln -s $PWD/shell/profile $HOME/.profile
ln -s $PWD/spaceship $HOME/.config/spaceship
ln -s $PWD/nvim $HOME/.config/nvim
ln -s $PWD/lazygit $HOME/.config/lazygit

KITTY_DIR="$HOME/.config/kitty/"
if [ -d $KITTY_DIR ]; then
	echo "Deleting existent kitty directory"
	rm -rf $KITTY_DIR
fi
ln -s $PWD/kitty $HOME/.config/kitty 

echo "Symbolic links created"
