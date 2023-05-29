CREATE TABLE Utente
(
    Id INT NOT NULL,
    Nome VARCHAR(255),
    Indirizzo VARCHAR(255),
    Telefono VARCHAR(255),
    Email VARCHAR(255),
    Azienda VARCHAR(255),
    pIva VARCHAR(255),
    CF VARCHAR(255),
    PRIMARY KEY(Id)
);

CREATE TABLE Magazzino
(
    Id INT NOT NULL,
    Indirizzo VARCHAR(255),
    PRIMARY KEY(Id_Magazzino)
);

CREATE TABLE Prodotto
(
    SKU INT NOT NULL,
    Nome VARCHAR(255),
    Prezzo FLOAT,
    Descrizione TEXT,
    Tipo VARCHAR(255),
    PRIMARY KEY(SKU)
);

CREATE TABLE Situato
(
    Magazzino INT NOT NULL,
    Prodotto INT NOT NULL,
    PRIMARY KEY(Magazzino, Prodotto),
    FOREIGN KEY(Magazzino) REFERENCES Magazzino(Id) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY (Prodotto) REFERENCES Prodotto (SKU) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE Carrello
(
    Id INT NOT NULL,
    DataAggiunta TIMESTAMP,
    Quantita INT NOT NULL,
    Utente INT NOT NULL,
    PRIMARY KEY(Id, DataAggiunta),
    FOREIGN KEY(Utente) REFERENCES Utente(Id) ON DELETE CASCADE ON UPDATE SET NULL,
);

CREATE TABLE Contenuto
(
    Prodotto INT NOT NULL,
    Carrello INT NOT NULL,
    PRIMARY KEY(Prodotto, Carrello),
    FOREIGN KEY(Prodotto) REFERENCES Prodotto(SKU) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY(Carrello) REFERENCES Carrello(Id) ON DELETE CASCADE ON UPDATE SET NULL,
);

CREATE TABLE Pagamento
(
    Id INT NOT NULL,
    DataPagamento TIMESTAMP,
    Metodo VARCHAR(255),
    PrezzoSpedizione FLOAT,
    PrezzoTotale FLOAT,
    Carrello INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(Carrello) REFERENCES Carrello(Id) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE Spedizione
(
    Id INT NOT NULL,
    DataSpedizione TIMESTAMP,
    DataConsegna TIMESTAMP,
    Peso INT NOT NULL,
    PRIMARY KEY(Id_Spedizione),
);

CREATE TABLE Ordine
(
    Id INT NOT NULL,
    DataOrdine TIMESTAMP,
    Pagamento INT NOT NULL,
    Spedizione INT NOT NULL,
    PRIMARY KEY(Id_Ordine),
    FOREIGN KEY(Pagamento) REFERENCES Pagamento(Id) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY(Spedizione) REFERENCES Spedizione(Id) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE Destinatario
(
    Utente INT NOT NULL,
    Spedizione INT NOT NULL,
    PRIMARY KEY(Utente, Tracking),
    FOREIGN KEY(Utente) REFERENCES Utente(Id_Utente) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY(Spedizione) REFERENCES Spedizione(Id_Spedizione) ON DELETE CASCADE ON UPDATE SET NULL
);