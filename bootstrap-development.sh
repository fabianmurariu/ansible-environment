#!/usr/bin/env bash

# Install packages required to build Ansible from source into a package
sudo apt-get update
sudo apt-get --no-install-recommends install -y -q software-properties-common
sudo apt-get --no-install-recommends install -y -q build-essential
sudo apt-get --no-install-recommends install -y -q git
sudo apt-get --no-install-recommends install -y -q asciidoc devscripts
sudo apt-get --no-install-recommends install -y -q python-support cdbs debhelper

sudo apt-get install -y -q libssl-dev
sudo apt-get install -y -q libffi-dev
sudo apt-get install -y -q python-dev

sudo apt-get install -y -q python-pip
sudo apt-get install -y -q python-dev
sudo pip install setuptools
sudo pip install boto3
sudo pip install cryptography

# Clone the current development branch
git clone git://github.com/ansible/ansible.git --recursive
cd ./ansible

# Build and install Ansible from source
make deb
sudo make install

sudo mkdir -p /etc/ansible/

easy_install --upgrade pip
apt-get install -y -q libssl-dev
apt-get install -y -q libffi6 libffi-dev
pip install cryptography
