#!/bin/bash
images=(
  'fabiohbarbosa/ansible-runner:ubuntu-16.04-xenial'
  'fabiohbarbosa/ansible-runner:mint-18.2-sonya' 
  'fabiohbarbosa/ansible-runner:mint-18.1-serena' 
  'fabiohbarbosa/ansible-runner:mint-18-sarah' 
  'fabiohbarbosa/ansible-runner:ubuntu-16.10-yakkety' 
  'fabiohbarbosa/ansible-runner:ubuntu-17.04-zesty'
)

check_status() {
  if [[ $1 != 0 ]]; then
    echo
    echo $2
    exit $1
  fi
}

for i in "${images[@]}"
do
  USER=runner docker run -it --rm -v `pwd`:/runner --name ubuntu-playbook-test ${i} bash /runner/setup.sh
  check_status $? "Error when running ${i} test"
done