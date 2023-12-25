#!/bin/bash

# Update and install dependencies
sudo apt-get update
sudo apt-get install -y software-properties-common

# Install Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

# Install Docker
sudo apt-get install -y docker.io

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker
