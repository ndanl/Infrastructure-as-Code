#!/bin/bash

### could make this a bit better, but eh its fine...

set -x

GIT_REPO="https://github.com/agill17/Infrastructure-as-Code.git"

### install ansible
sudo yum update -y
sudo yum install ansible -y
sudo yum install git -y

### really not needed anymore,
##  since playbook has its own inventory file with a local group
#touch /tmp/hosts
#cat <<EOT > /tmp/hosts
#localhost ansible_connection=local
#EOT

mkdir -p /opt/ansible/local_play
cd /opt/ansible/local_play

git clone $GIT_REPO .
cd /opt/ansible/local_play/Ansible/httpd

ansible-playbook main.yml -i inventory
