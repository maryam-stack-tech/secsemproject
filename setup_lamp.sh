#!/bin/bash

# Update package list
brew update

# Install required packages
brew install httpd php git

# Install MySQL
brew install mysql

# Start and enable services
sudo brew services start httpd

# Ensure MySQL data directory exists
sudo mkdir -p /usr/local/var/mysql

# Initialize and start MySQL
sudo mysqld --initialize --user=mysql
sudo brew services start mysql

# Secure MySQL installation (interactive)
mysql_secure_installation


laravel_project_dir="/home/vagrant/laravel_project"
mkdir -p "$laravel_project_dir"

# Clone the Laravel repository into the specified directory
laravel_repo="https://github.com/laravel/laravel.git"
git clone "$laravel_repo" "$laravel_project_dir"

# Change directory to the Laravel project
cd "$laravel_project_dir"

# Clone PHP application from GitHub
github_repo="https://github.com/laravel/laravel"
app_name="your_app_name"
git clone "$github_repo" "/usr/local/var/www/$app_name"

# Configure Apache to serve the PHP application (create the config manually)

# Restart Apache
sudo brew services restart httpd
