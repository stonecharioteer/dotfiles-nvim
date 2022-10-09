# Neovim dotfiles
See [stonecharioteer/distributed-dotfiles] for installation using `ansible`.

## Manual Installation

1. Install neovim `>=0.5` nightly using any of the package managers that works
   with your OS.
2. Install packer `git clone https://github.com/wbthomason/packer.nvim
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim`.
3. Launch `neovim` then `:PackerCompile`, restart and `:PackerSync` to install
   all plugins.

## Notes
For any option, try using `:h <OPTION>` to learn more about what's going on
in the configs.
