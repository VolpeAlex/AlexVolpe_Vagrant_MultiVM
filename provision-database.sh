#!/bin/bash
apt-get update -y
apt-get upgrade -y
sudo apt-get install -y mysql-server
sudo systemctl enable mysql
sudo systemctl start mysql

# Creo l'utente con accesso da qualsiasi host tramite il '%'
sudo mysql -e "CREATE USER 'vagrantuser'@'%' IDENTIFIED BY 'Password&1';"

# Assegno i privilegi all'utente su tutti i database ma non 
# Grant Option
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'vagrantuser'@'%';"

# Creo il database e la tabella, e inserisco i dati
sudo mysql -u vagrantuser -p'Password&1' -e "
CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;
CREATE TABLE IF NOT EXISTS utenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_creazione TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO utenti (nome, cognome, email) VALUES
    ('Mario', 'Rossi', 'mario.rossi@example.com'),
    ('Luca', 'Bianchi', 'luca.bianchi@example.com'),
    ('Giulia', 'Verdi', 'giulia.verdi@example.com'),
    ('Sara', 'Neri', 'sara.neri@example.com');
"
# Permetto le connessioni remote
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql
