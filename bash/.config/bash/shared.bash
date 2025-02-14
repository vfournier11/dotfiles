alias sb='source ~/.bashrc'

# --- Prompt ---
eval "$(starship init bash)"

# --- Vim/NeoVim ---

# "Modern Neovim" is from https://alpha2phi.medium.com/
alias mnv="NVIM_APPNAME=modern-neovim nvim"

# --- asdf ---
# Add shims directory to path (required)
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# Set up shell completions (optional)
. <(asdf completion bash)

# --- NodeJS ---
export PATH="$PATH:$HOME/.asdf/installs/nodejs/20.18.0/bin"
