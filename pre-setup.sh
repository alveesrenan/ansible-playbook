#!/bin/bash
project_name=ansible-playbook

# adding user to sudoers
sudo su -c "echo '$USER ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"

# installing curl, git, ansible and python
sudo apt-get update && sudo apt-get install curl git ansible python-apt -y

# enabling git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs -y

# getting git user and email
read -p "git author: " GIT_AUTHOR
read -p "git username: " GIT_USER
read -p "git email: "  GIT_EMAIL
read -p "git personal token access: " GIT_TOKEN_ACCESS

git config --global user.name "$(echo $GIT_AUTHOR)"
git config --global user.email "$(echo $GIT_EMAIL)"
git-lfs install

git clone https://github.com/alveesrenan/${project_name}.git
cd ${project_name} && bash setup.sh
