#!/usr/bin/env bash

# Install Ansible's AWS dependencies
sudo pip install boto

# Configure Ansible to use a dynamic AWS inventory
wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py
sudo mv ec2.py /etc/ansible/hosts
sudo chmod +x /etc/ansible/hosts
wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini
sudo mv ec2.ini /etc/ansible/ec2.ini