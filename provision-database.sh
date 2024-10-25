#!/bin/bash
apt-get update -y
apt-get upgrade -y
sudo apt-get install -y mysql-server

# Creo l'utente con accesso da qualsiasi host tramite il '%'
sudo mysql -e "CREATE USER 'vagrantuser'@'%' IDENTIFIED BY 'Password&1';"

# Assegno i privilegi all'utente su tutti i database ma non 
# Grant Option
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'vagrantuser'@'%';"

# Permetto le connessioni remote
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
