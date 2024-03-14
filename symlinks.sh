# iTerm2
rm "${HOME}/Library/Preferences/com.googlecode.iterm2.plist"
ln -s -f ./iterm2/com.googlecode.iterm2.plist "${HOME}/Library/Preferences/com.googlecode.iterm2.plist"

# Git
ln -s -f ./git/.gitconfig ~/.gitconfig
ln -s -f ./git/.gitignore_global ~/.gitignore_global

# Fish
ln -s -f ./fish ~/.config/fish
ln -s -f ./omf ~/.config/omf