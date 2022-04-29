CREATE TABLE Festival(
	Nome VARCHAR(100) UNIQUE,
	Data_inizio DATE,
	Data_fine DATE,
	Tema VARCHAR(200),
	PRIMARY KEY(Nome,Data_inizio)
);

CREATE TABLE Sponsor(
    Nome VARCHAR(100) UNIQUE,
    Partita_iva VARCHAR(11),
	Indirizzo_fiscale VARCHAR(100),
	Codice_fiscale VARCHAR(13),
	PRIMARY KEY (Partita_iva)
);

CREATE TABLE Pubblicizza(
	Festival VARCHAR(100),
	Storico_pagamenti FLOAT,
    FOREIGN KEY(Festival) REFERENCES Festival(Nome)
);

CREATE TABLE Giornata(
	Data_effettiva DATE PRIMARY KEY,
	Festival VARCHAR(100),
	FOREIGN KEY(Festival) REFERENCES Festival(Nome),
	ON DELETE CASCADE
);

CREATE TABLE Artista(
	Nome VARCHAR(100) PRIMARY KEY,
	Numero_componenti SMALLINT,
	Genere_musicale VARCHAR(100),
	Headliner BOOL
);

CREATE TYPE Tipo_luci AS ENUM ('standard', 'pro');
CREATE TYPE Tipo_audio AS ENUM ('medio', 'grande','arena');

CREATE TABLE Palcoscenico(
	Nome VARCHAR(50) PRIMARY KEY,
	Location VARCHAR(100),
	Grandezza FLOAT,
	Impianto_luci Tipo_luci[],
	Impianto_audio Tipo_audio[]
);

CREATE TABLE Concerto(
	Giornata DATE,
	Artista VARCHAR(100),
	Ora_inizio TIME,
	Ora_fine TIME,
	Palcoscenico VARCHAR(50),
	
	FOREIGN KEY(Palcoscenico) REFERENCES Palcoscenico(Nome),
	FOREIGN KEY(Artista) REFERENCES Artista(Nome),
	FOREIGN KEY(Giornata) REFERENCES Giornata(Data_effettiva),
	PRIMARY KEY(Giornata, Artista)
);

CREATE TYPE Tipo_camerino AS ENUM ('vip', 'classic');

CREATE TABLE Camerino(
	ID VARCHAR(5) PRIMARY KEY,
	Grandezza FLOAT,
	Tipo Tipo_camerino[]
);

CREATE TABLE Servizio(
	Nome VARCHAR(50) PRIMARY KEY,
	Solo_vip BOOL
);

CREATE TABLE Camerino_servizio(
	Camerino VARCHAR(5) REFERENCES Camerino(ID),
	Servizio VARCHAR(50) REFERENCES Servizio(Nome),
	PRIMARY KEY(Camerino, Servizio)
);

CREATE TABLE Cliente(
	ID VARCHAR(5) PRIMARY KEY,
	Nome VARCHAR(50),
	Cognome VARCHAR(100),
	Indirizzo_fiscale VARCHAR(100),
	Email VARCHAR(100)
);

CREATE TABLE Biglietto(
	ID VARCHAR(5) PRIMARY KEY,
	Festival VARCHAR(100),	
	Prezzo FLOAT,
	Numero_giorni SMALLINT,
	Fisico BOOL,
	Digitale BOOL,
	FOREIGN KEY(Festival) REFERENCES Festival(nome)
);

CREATE TYPE Tipo_consegna AS ENUM ('digitale', 'fisica','entrambe');

CREATE TABLE Acquisto(
	ID VARCHAR(5) PRIMARY KEY,
	Data_ora TIMESTAMP,
	Cliente VARCHAR(5),
	Importo FLOAT,
	Indirizzo_consegna VARCHAR(100),
	Consegna Tipo_consegna[],
	FOREIGN KEY(Cliente) REFERENCES Cliente(ID)
	ON DELETE CASCADE
);

CREATE TABLE Acquisto_biglietto(
	Biglietto VARCHAR(5) REFERENCES Biglietto(ID),
 	Acquisto VARCHAR(5) REFERENCES Acquisto(ID),
	PRIMARY KEY(Biglietto, Acquisto)
);

/* POPOLAZIONE */

