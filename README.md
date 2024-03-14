# Init xcode
xcode-select --install

# Set MacOS defaults
bash ./macos.sh

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew utils
brew install wget
brew install coreutils

# Install Fish Shell
brew install fish
fish
echo $(command -s fish) | sudo tee -a /etc/shells
chsh -s $(command -s fish)

# Init SSH
bash ./ssh.sh

# Install Github CLI
brew install gh

# Clone Repos
bash ./repos.sh

# Install Applications
bash ./applications.sh

# Install Node
brew install node

# Node manager
npm install -g n
## make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
## take ownership of node install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

# Install Liferay Stuff
## Java
https://docs.azul.com/core/install/macos#install-using-a-dmg-installer

## ant and gradle
brew install ant
brew install gradle

# Symlink Configs
bash symlinks.sh