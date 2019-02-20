#!/bin/bash

wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list

apt-get update -y
apt-get install ca-certificates apt-transport-https -y
apt-get install php7.2 php7.2-cli php7.2-common php7.2-bcmath php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-zip php7.2-xml php7.2-gd -y
