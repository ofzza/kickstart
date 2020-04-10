#!/bin/bash

# Get some system information
# ---------------------------------------------------------------------
source /etc/os-release && cat /etc/os-release

# Update APT-GET
# ---------------------------------------------------------------------
sudo apt-get update -y
sudo apt-get upgrade -y

# Install build-essentials
# ---------------------------------------------------------------------
sudo apt-get install -y build-essential

# Install some generally useful tools
# ---------------------------------------------------------------------
sudo apt-get install -y zip unzip

# Install docker deps (https://dev.to/bowmanjd/install-docker-on-windows-wsl-without-docker-desktop-34m9)
# ---------------------------------------------------------------------
sudo apt install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg2
# Add docker repo
curl -fsSL https://download.docker.com/linux/$ID/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/${ID} ${VERSION_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
# Install docker
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# Add user to docker group
sudo usermod -aG docker $USER
# Create docker socket
DOCKER_DIR=/mnt/wsl/shared-docker
mkdir -pm o=,ug=rwx "$DOCKER_DIR"
chgrp docker "$DOCKER_DIR"
# Configure docker socket
mkdir -p /etc/docker
cat <<EOT >> /etc/docker/daemon.json
{
  "hosts": ["unix:///mnt/wsl/shared-docker/docker.sock"],
  "iptables": false
}
EOT

# Install/upgrade git
# ---------------------------------------------------------------------
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update -y
sudo apt-get install git -y
git --version

# Install node
# ---------------------------------------------------------------------
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install NVM
# ---------------------------------------------------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install Python 2.7
# ---------------------------------------------------------------------
sudo apt-get install -y python2.7
# Export Python executable for use by NPM
npm config set python python2.7

# Install PowerShell
# ---------------------------------------------------------------------
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo add-apt-repository universe
sudo apt-get install -y powershell

# Install NPM globals
# ---------------------------------------------------------------------
sudo npm install -g -y node-gyp
sudo npm install -g -y gulp-cli
sudo npm install -g -y grunt-cli
sudo npm install -g -y typescript
sudo npm install -g -y @angular/cli
sudo npm install -g -y prettier
sudo npm install -g -y http-server

# Install deno
# ---------------------------------------------------------------------
curl -fsSL https://deno.land/x/install/install.sh | sh

# Install DotNet runtime
# ---------------------------------------------------------------------

sudo apt-get update; sudo apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y dotnet-sdk-6.0

# Install Rust
# ---------------------------------------------------------------------
curl https://sh.rustup.rs -sSf | sh

# Install zsh
# ---------------------------------------------------------------------
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set theme
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="minimal"/' ~/.zshrc

# Install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Install Hurl (https://hurl.dev)
# ---------------------------------------------------------------------
curl -LO https://github.com/Orange-OpenSource/hurl/releases/download/1.6.1/hurl_1.6.1_amd64.deb
dpkg -i hurl_1.6.1_amd64.deb
