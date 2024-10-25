#!/bin/bash
apt-get update -y
apt-get upgrade -y
#Installo le librerie di php per apache e apache stesso
apt-get install -y apache2 php libapache2-mod-php
apt-get update -y
#Installo msqli per far andare il mio sito che usa msqli
sudo apt-get install -y php-mysqli
sudo systemctl restart apache2.service