# ANSIBLE-PLAYBOOK #

## Motivation

Automate linux machine installation.

See packages in `provisioning.yml`


## Requirements

* Git LFS
* Ubuntu 16.04 or Ubuntu 17.04 or 18.04
* Linux Mint Sonya 18.2, Linux Mint 18.1 and Linux Mint 18 Sarah
* Sudo privilegies

## Pré Install

* It's needed to have curl and openvpn installed `sudo apt-get update && sudo apt-get install curl -y`
* (OPTIONAL) It's needed to create a ssh key by the command: `ssh-keygen -t rsa -b 4096 -C "${USER_EMAIL}"` and paste the public key on user's settings due to its use on clone repository.

## Install

```sh
$ curl -s -o pre-setup.sh https://github.com/alveesrenan/ansible-playbook/raw/master/pre-setup.sh && sudo chmod +x pre-setup.sh && ./pre-setup.sh
```

## Contribute

Add a new playbook role and run `./test.sh`.  
The `test.sh` script will start a docker container and run the `setup.sh`.
