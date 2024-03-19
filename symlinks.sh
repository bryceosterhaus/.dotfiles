# iTerm2
rm "${HOME}/Library/Preferences/com.googlecode.iterm2.plist"
ln -s -f $(pwd)/iterm2/com.googlecode.iterm2.plist "${HOME}/Library/Preferences/com.googlecode.iterm2.plist"

# Git
ln -s -f $(pwd)/git/.gitconfig ~/.gitconfig
ln -s -f $(pwd)/git/..gitconfig.local ~/..gitconfig.local
ln -s -f $(pwd)/git/.gitignore_global ~/.gitignore_global

# Fish
ln -s $(pwd)/fish ~/.config/fish