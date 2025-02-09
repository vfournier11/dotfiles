#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$0")

stow --dotfiles stow \
  fish \
  nvim \
  wezterm

WINDOWS_FOLDER=/mnt/c/Users/vfournier
if test -e "$WINDOWS_FOLDER"; then
  echo "$WINDOWS_FOLDER found."
  echo "  updating Wezterm"
  rm -f $WINDOWS_FOLDER/.wezterm.lua # use `-f` to fail silently.
  cp $SCRIPT_DIR/wezterm/.config/wezterm/wezterm.lua /mnt/c/Users/vfournier/.wezterm.lua
fi

echo "Add 'source ~/.config/fish/shared.fish' to your fish configuration."
