#!/bin/bash

sudo NEEDRESTART_MODE=a apt-get dist-upgrade --yes

sudo apt update

sudo apt install -y openssh-client

sudo apt install -y openssh-server

sudo apt install -y python3

sudo apt install -y tmux

sudo apt install -y emacs

sudo apt install -y vim

sudo apt install -y git-all

sudo apt install -y nvtop

sudo apt install -y zip

# github cli
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# cloudflared
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflared.list
sudo apt-get update && sudo apt-get install cloudflared

# if sudo install fails for cloudflared, install from source
if [[ $? -ne 0 ]]; then
    sudo rm /usr/share/keyrings/cloudflare-main.gpg
    sudo rm /etc/apt/sources.list.d/cloudflared.list
    sudo apt install golang
    git clone https://github.com/cloudflare/cloudflared.git
    cd cloudflared
    make cloudflared
    go install github.com/cloudflare/cloudflared/cmd/cloudflared
    sudo mv ../cloudflared/cloudflared /usr/bin/cloudflared
    cd ..
    rm -rf cloudflared/
fi
