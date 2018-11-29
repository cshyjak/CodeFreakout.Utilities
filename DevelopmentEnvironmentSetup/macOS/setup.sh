xcode-select --install

echo "Check for homebrew and install if needed"

if ! [ -x "$(command -v brew)" ]; then
    echo "Brew not installed, attempting to install now"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
pyenv install 3.7.0
pyenv install 3.6.6

if ! [ -x "$(command -v wget)" ]; then
    echo "wget, attempting to install now"
    brew install wget
else
    echo "wget already installed"
fi

echo "Install Dev Tools"
brew cask install docker
brew cask install visual-studio-code
brew cask install azure-data-studio 
brew cask install sourcetree
brew cask install postman
brew cask install macpass
brew cask install mysqlworkbench
brew cask install tunnelblick
brew cask install gimp
brew cask install google-chrome
brew cask install google-drive-file-stream 
brew cask install google-chat
brew cask install slack
brew cask install vlc
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vectr
brew cask install cyberduck
brew cask install spotify
brew cask install github
brew cask install dotnet-sdk
brew cask install the-unarchiver

brew install packer
brew install terraform
brew install node
brew install mysql@5.7

echo "Download tools for manual installation"
mkdir ~/Downloads/ManualInstall
cd ~/Downloads/ManualInstall

wget https://aka.ms/vs/mac/download -O visualstudioformacinstaller.dmg
wget http://www.perforce.com/downloads/perforce/r18.3/bin.macosx1013x86_64/P4V.dmg

echo "Retrieve the following from the app store"
echo "OneNote"
echo "Microsoft Remote Desktop 10"
echo "XCode"