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