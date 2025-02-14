#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$0")

stow --dotfiles stow \
  asdf \
  git \
  fish \
  nvim \
  modern-neovim \
  starship \
  wezterm

WINDOWS_FOLDER=/mnt/c/Users/vfournier
if test -e "$WINDOWS_FOLDER"; then
  echo "$WINDOWS_FOLDER found."
  echo "  updating Wezterm"
  rm -f $WINDOWS_FOLDER/.wezterm.lua # use `-f` to fail silently.
  cp $SCRIPT_DIR/wezterm/dot-config/wezterm/wezterm.lua /mnt/c/Users/vfournier/.wezterm.lua
fi

git config --global core.excludesfile ~/.config/git/gitignore_global

echo "Add 'source ~/.config/fish/shared.fish' to your fish configuration."
