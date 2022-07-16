#!/bin/bash
 
# APT
sudo curl -sSL https://packages.sury.org/php/README.txt | sudo bash -x
sudo echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y openssl ca-certificates apt-transport-https wget curl dnsutils git gnupg2 htop lsb-release software-properties-common sshfs vim-nox

# SECURITY
sudo apt install -y ufw
sudo apt install -y fail2ban
sudo ufw allow OpenSSH
sudo ufw allow proto tcp from any to any port 80,443
sudo ufw enable

# PHP 8.0
sudo apt install -y \
apt install -y \
php8.0-cli \
php8.0-fpm \
php8.0-common \
php8.0-apcu \
php8.0-bcmath \
php8.0-curl \
php8.0-gd \
php8.0-gmp \
php8.0-igbinary \
php8.0-imagick \
php8.0-imap \
php8.0-intl \
php8.0-mailparse \
php8.0-mbstring \
php8.0-mysql \
php8.0-opcache \
php8.0-readline \
php8.0-soap \
php8.0-tidy \
php8.0-xmlrpc \
php8.0-xml \
php8.0-zip

# MYSQL
sudo apt install mysql-client mysql-server 

# GITHUB
mkdir /tmp/github-install
cd /tmp/git
VERSION=`curl  "https://api.github.com/repos/cli/cli/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/' | cut -c2-` 
wget https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz
tar xvf gh_${VERSION}_linux_amd64.tar.gz
sudo cp gh_${VERSION}_linux_amd64/bin/gh /usr/local/bin/
cd
rm -rf /tmp/github-install

# FEEDBACK
echo "OK"
