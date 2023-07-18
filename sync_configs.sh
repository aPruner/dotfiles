# Small lil script to copy the updated config.lua file
# into the .config directory and launch neovim to sync packages
# as the config grows more complex, this script will have to evolve
git pull
cp config.lua ~/.config/lvim/config.lua
lvim
