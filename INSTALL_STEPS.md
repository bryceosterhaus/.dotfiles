```sh
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
fish_add_path /opt/homebrew/bin
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

# Node manager
brew install n

## make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
## make sure the required folders exist (safe to execute even if they already exist)
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
## take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
## install latest node
n latest
### Verify
which node
which npm
which npx

# Install Liferay Stuff
## Java
### Follow https://docs.azul.com/core/install/macos#install-using-a-dmg-installer

## ant and gradle
brew install ant
brew install gradle

## gw
brew tap gdubw/gng
brew install gng

# Symlink Configs
bash symlinks.sh
```
