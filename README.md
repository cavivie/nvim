# Neovim Config
Personal neonvim configuration.

# Installation
```shell
# pull repo
git clone https://github.com/cavivie/nvim.git $HOME/.config/nvim

# install deps
brew tap daipeihust/tap && brew install im-select
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install ripgrep
cargo install stylua
cargo install lolcat

# install nvim
brew install neovim --head

# load plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
