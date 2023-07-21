# Small lil script to copy the updated config.lua file
# into the .config directory and launch neovim to sync packages
# as the config grows more complex, this script will have to evolve
git pull
cp config.lua ~/.config/lvim/config.lua
# TODO: As the config grows and eventually I start splitting things out into more
# separate folders/files, I should create a list and loop through it in this script
cp -R ftplugin ~/.config/lvim
lvim
