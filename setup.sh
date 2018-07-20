#!/bin/bash
check_status() {
  if [[ $1 != 0 ]]; then
    echo
    echo $2
    exit $1
  fi
}

# removing galaxy roles if it was previously installed
rm -rf roles/galaxy
check_status $? 'Error when removing galaxy roles'

# installing features through ansible galaxy rules
ansible-galaxy install -p roles/galaxy/ -r roles/roles.yml
check_status $? 'Error when fetching galaxy roles'

# installing provisioning features
ansible-playbook provisioning.yml -i assets/hosts -e username=$USER
check_status $? 'Error when running playbook'

# linking home docker with var lib docker folder
sudo ln -sf /home/docker /var/lib/docker
check_status $? 'Error when creating docker link in home folder'

echo 'Ansible install finished!'
