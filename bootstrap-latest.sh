#!/usr/bin/env bash

sudo apt-get update -q
sudo apt-get install -y -q software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get install -y -q ansible
sudo apt-get install -y -q python-pip