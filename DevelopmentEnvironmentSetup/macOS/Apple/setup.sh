xcode-select --install

echo "Install Rosetta"
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

if ! [ -x "$(command -v brew)" ]; then
    echo "Brew not installed, attempting to install now"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Brew already installed"
fi

brew update

if ! [ -x "$(command -v pyenv)" ]; then
    echo "pyenv, attempting to install now"
    brew install pyenv
else
    echo "Pyenv already installed"
fi

if ! [ -x "$(command -v pyenv-virtualenv)" ]; then
    echo "pyenv-virtualenv, attempting to install now"
    brew install pyenv-virtualenv
    echo 'eval "$(pyenv init -)"' | sudo tee -a ~/.bash_profile
    echo 'eval "$(pyenv virtualenv-init -)"' | sudo tee -a ~/.bash_profile
else
    echo "pyenv-virtualenv already installed"
fi

echo "Install Alternate Python Versions"
pyenv install 3.10.0

if ! [ -x "$(command -v wget)" ]; then
    echo "wget, attempting to install now"
    brew install wget
else
    echo "wget already installed"
fi

echo "Install Dev Tools"
brew install docker
brew install kubectx
brew install warrensbox/tap/tfswitch
tfswitch --latest
brew install --cask postman
brew install awscli
brew install jq
brew install git
brew install git-lfs
git lfs install
git lfs install --system
brew install git-flow
brew install --cask p4v
brew install --cask visual-studio-code
brew install --cask visual-studio
brew install --cask dotnet-sdk
brew install --cask tableplus
brew install helm
brew install bash
brew install argocd
brew install kubeseal

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

echo "General Utils"
brew install --cask macpass
brew install --cask slack
brew cask install the-unarchiver
brew install nomad
brew install --cask miro
brew install --cask zoom
brew install --cask keybase
brew install --cask transmission
brew install --cask microsoft-teams

echo "Google"
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask google-chat-electron

echo "Firefox"
brew install --cask firefox

echo "Entertainment"
brew install --cask spotify
brew install --cask iina
brew install --cask handbrake

echo "Networking"
brew install tunnelblick
brew install wireguard-go
brew install wireguard-tools

echo "Setup SSH Keys"
ssh-keygen

cat > ~/.ssh/config <<- EOM
Host *
   UseKeychain yes
   AddKeysToAgent yes
   IdentityFile ~/.ssh/id_rsa
EOM