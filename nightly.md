# Neovim Nightly
Install nvim nightly version
```
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
xattr -c ./nvim-macos.tar.gz
tar xzvf nvim-macos.tar.gz
V=$(./nvim-macos/bin/nvim -v | awk "NR==1{print $1}" | sed "s/NVIM v//"); cp -r nvim-macos /opt/homebrew/Cellar/neovim/$V
brew unlink nvim && brew link nvim
rm -rf nvim-macos nvim-macos.tar.gz
```
