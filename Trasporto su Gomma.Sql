
CREATE DATABASE TrasportoGomma;
USE TrasportoGomma;


CREATE TABLE Passeggero (
    id_passeggero INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);


CREATE TABLE Mezzo (
    id_mezzo INT AUTO_INCREMENT PRIMARY KEY,
    targa VARCHAR(20) UNIQUE NOT NULL,
    tipo VARCHAR(30), -- es. autobus, minibus
    posti INT NOT NULL
);


CREATE TABLE Tratta (
    id_tratta INT AUTO_INCREMENT PRIMARY KEY,
    partenza VARCHAR(100) NOT NULL,
    destinazione VARCHAR(100) NOT NULL,
    durata TIME,
    distanza_km DECIMAL(6,2)
);


CREATE TABLE Fermata (
    id_fermata INT AUTO_INCREMENT PRIMARY KEY,
    localita VARCHAR(100) NOT NULL,
    orario TIME
);


CREATE TABLE Prenotazione (
    id_prenotazione INT AUTO_INCREMENT PRIMARY KEY,
    id_passeggero INT NOT NULL,
    id_tratta INT NOT NULL,
    data_prenotazione DATE NOT NULL,
    stato VARCHAR(20) DEFAULT 'attiva',
    FOREIGN KEY (id_passeggero) REFERENCES Passeggero(id_passeggero),
    FOREIGN KEY (id_tratta) REFERENCES Tratta(id_tratta)
);


CREATE TABLE Biglietto (
    id_biglietto INT AUTO_INCREMENT PRIMARY KEY,
    id_prenotazione INT NOT NULL,
    codice_validazione VARCHAR(30) UNIQUE NOT NULL,
    data_emissione DATE NOT NULL,
    valido BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_prenotazione) REFERENCES Prenotazione(id_prenotazione)
);


CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_prenotazione INT NOT NULL,
    importo DECIMAL(8,2) NOT NULL,
    metodo VARCHAR(30), -- carta, contanti, paypal...
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (id_prenotazione) REFERENCES Prenotazione(id_prenotazione)
);


CREATE TABLE Mezzo_Tratta (
    id_mezzo INT,
    id_tratta INT,
    PRIMARY KEY (id_mezzo, id_tratta),
    FOREIGN KEY (id_mezzo) REFERENCES Mezzo(id_mezzo),
    FOREIGN KEY (id_tratta) REFERENCES Tratta(id_tratta)
);
