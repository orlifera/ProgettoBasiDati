CREATE TABLE Utente(
    Id_Utente INT NOT NULL,
    Nome VARCHAR(50),
    Indirizzo VARCHAR(120),
    Telefono VARCHAR(13),
    Email VARCHAR(30),
    Spedizione INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(Spedizione) REFERENCES Spedizione(Id) ON DELETE CASCADE ON UPDATE
    SET
        NULL
);

CREATE TABLE Prodotto(
    SKU INT NOT NULL,
    Nome VARCHAR(20),
    Prezzo VARCHAR(8),
    Descrizione TEXT,
    Tipo VARCHAR(255),
    PRIMARY KEY(SKU)
);

CREATE TABLE Scelto(
    Utente INT NOT NULL,
    Prodotto INT NOT NULL,
    PRIMARY KEY(Utente, Prodotto),
    FOREIGN KEY(Utente) REFERENCES Utente(Id_Utente) ON DELETE CASCADE ON UPDATE
    SET
        NULL
);

CREATE TABLE Contenuto(
    Prodotto INT NOT NULL,
    Carrello INT NOT NULL,
    PRIMARY KEY(Prodotto, Carrello),
    FOREIGN KEY(Prodotto) REFERENCES Prodotto(SKU) ON DELETE CASCADE ON UPDATE
    SET
        NULL,
        FOREIGN KEY(Carrello) REFERENCES Carrello(Id_Cart) ON DELETE CASCADE ON UPDATE
    SET
        NULL,
);

CREATE TABLE Carrello(
    Id_Cart INT NOT NULL,
    Data_Aggiunta DATE,
    Quantita INT NOT NULL,
    Utente INT NOT NULL,
    Pagamento INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(Utente) REFERENCES Utente(Id_Utente) ON DELETE CASCADE ON UPDATE
    SET
        NULL,
        FOREIGN KEY(Pagamento) REFERENCES Pagamento(Id_Transazione) ON DELETE CASCADE ON UPDATE
    SET
        NULL
);

CREATE TABLE Magazzino(
    Id_Magazzino INT NOT NULL,
    Indirizzo VARCHAR(60),
    PRIMARY KEY(Id_Magazzino)
);

CREATE TABLE Situato(
    Magazzino INT NOT NULL,
    Prdotto INT NOT NULL,
    PRIMARY KEY(Magazzino, Prodotto),
    FOREIGN KEY(Magazzino) REFERENCES Magazzino(Id_Magazzino) ON DELETE CASCADE ON UPDATE
    SET
        NULL,
        FOREIGN KEY(Prodotto) REFERENCES Prodotto(SKU) ON DELETE CASCADE ON UPDATE
    SET
        NULL
);

CREATE TABLE Pagamento(
    Id_Transazione INT NOT NULL,
    Data_Pagamento DATE,
    Metodo VARCHAR(20),
    Prezzo_Spedizione VARCHAR(5),
    Prezzo_Totale VARCHAR(8),
    PRIMARY KEY(Id_Transazione),
);

CREATE TABLE Ordine(
    Id_Ordine INT NOT NULL,
    Data_Ordine DATE,
    Pagamento INT NOT NULL,
    Tracking INT NOT NULL,
    PRIMARY KEY(Id_Ordine),
    FOREIGN KEY(Pagamento) REFERENCES Pagamento(Id_Transazione) ON DELETE CASCADE ON UPDATE
    SET
        NULL,
        FOREIGN KEY(Tracking) REFERENCES Spedizione(Id_Spedizione) ON DELETE CASCADE ON UPDATE
    SET
        NULL
);

CREATE TABLE Spedizione(
    Id_Spedizione INT NOT NULL,
    Data_Spedizione DATE,
    Data_Consegna DATE,
    Peso INT NOT NULL,
    PRIMARY KEY(Id_Spedizione)
);

CREATE TABLE Destinatario(
    Utente INT NOT NULL,
    Tracking INT NOT NULL,
    PRIMARY KEY(Utente, Tracking),
    FOREIGN KEY(Utente) REFERENCES Utente(Id_Utente) ON DELETE CASCADE ON UPDATE
    SET
        NULL,
        FOREIGN KEY(Tracking) REFERENCES Spedizione(Id_Spedizione) ON DELETE CASCADE ON UPDATE
    SET
        NULL
);