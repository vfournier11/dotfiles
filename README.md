# dotfiles

## pre-requesites

 - stow (with `--dotfiles` support use `nix-shell -p stow`)

## installing

 - `./install.sh`

## neovim

fixing `lua-language-server` downloaded from mason.nvim being a dynamically linked executable not compatible with NixOS.

```sh
cd ~/.local/share/nvim/mason/packages/lua-language-server/libexec/bin/
ln -sf $(which lua-language-server) lua-language-server
```

