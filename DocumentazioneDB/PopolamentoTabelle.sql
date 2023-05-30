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





/* UTENTE DA FINIRE CON I VARI DATI MANCANTI*/
INSERT INTO Utente
    (Id, Nome, Indirizzo, Telefono, Email, Azienda, pIva, CF)
VALUES
    (1, 'Wilhelmina Jacquemard', '88 Jenna Junction', '+249 468 510 5984', 'wjacquemard0@soundcloud.com', '', '', 'JASJRQ56S50Y724T'),
    (2, 'Care Galland', '634 Banding Parkway', '+420 390 610 3240', 'cgalland1@macromedia.com', '', '', 'DWVCBG98F91K236Q'),
    (3, 'Shandra Aikin', '19788 Orin Terrace', '+62 797 181 6151', 'saikin2@unicef.org', 'Innovatech Solutions', '01083699486', ''),
    (4, 'Bell Pappi', '720 Troy Pass', '+63 118 877 2980', 'bpappi3@theglobeandmail.com', 'TechPro Systems', '71733797883', ''),
    (5, 'Pearce Clissett', '31 Troy Alley', '+7 841 462 3287', 'pclissett4@deliciousdays.com', '', '', 'WKQNDD60T79A336F'),
    (6, 'Odelia Swyer', '8477 Kipling Alley', '+86 460 470 1622', 'oswyer5@kickstarter.com', 'BrightStar Enterprises', '27374892328', ''),
    (7, 'Rene Leek', '3 Forest Dale Drive', '+46 237 515 5297', 'rleek6@mayoclinic.com', '', '', 'TIXHFH23B93B158C'),
    (8, 'Benoit Attwool', '1 Homewood Place', '+62 648 864 2420', 'battwool7@mail.ru', 'GlobalGrowth Ventures', '80578030458', ''),
    (9, 'Nanny Midden', '2 Kedzie Circle', '+54 323 374 9278', 'nmidden8@chicagotribune.com', 'OptimaTech Services', '07768562249', ''),
    (10, 'Pierette Lanyon', '66 Almo Avenue', '+60 500 286 1025', 'planyon9@123-reg.co.uk', '', '', 'JESQKI34V98X702A'),
    (11, 'Earl Bateman', '43 East Hill', '+86 739 166 0837', 'ebatemana@usatoday.com', 'NexusLink Solutions', '05803936568', ''),
    (12, 'Nicholle Worcester', '03 Amoth Junction', '+86 939 352 6540', 'nworcesterb@is.gd', '', '', 'SWPKEM29I05V400X'),
    (13, 'Tiffanie Thrush', '4 Spenser Center', '+212 738 585 4918', 'tthrushc@zimbio.com', 'PrimeEdge Technologies', '66802152950', ''),
    (14, 'Erroll Kennifeck', '6 Iowa Alley', '+86 551 218 0295', 'ekennifeckd@barnesandnoble.com', '', '', 'ULBSZN37A54Q244M'),
    (15, 'Sally Woolforde', '8932 Bartelt Pass', '+86 868 896 0721', 'swoolfordee@sogou.com', 'ProActive Solutions', '31385911745', ''),
    (16, 'Chance Foresight', '3 Roth Court', '+7 774 930 8376', 'cforesightf@wufoo.com', '', '', 'LHZDXM08L97H100H'),
    (17, 'Cherish Thornthwaite', '30752 Lunder Trail', '+48 358 415 1560', 'cthornthwaiteg@nasa.gov', 'EliteConnect Enterprises', '14136049047', ''),
    (18, 'Tania Gabites', '20643 Southridge Road', '+63 573 504 2713', 'tgabitesh@google.it', '', '', 'SEABFI62O29J894F'),
    (19, 'Milzie Dagnall', '95 Elmside Alley', '+1 210 968 1081', 'mdagnalli@fotki.com', '', '', 'CVVTWE02Q34D867I'),
    (20, 'Dulcea Sapseed', '71 Montana Crossing', '+1 714 552 1248', 'dsapseedj@yelp.com', 'QuantumTech Innovations', '65126842363', ''),
    (21, 'Adolpho Quickfall', '6 Vernon Hill', '+58 569 306 2309', 'aquickfallk@foxnews.com', 'Visionary Labs', '78246249335', ''),
    (22, 'Tris Quest', '79721 Little Fleur Point', '+46 213 994 8413', 'tquestl@adobe.com', '', '', 'CCYFDY17G16K364S'),
    (23, 'Hamil Zarfati', '4 Fisk Park', '+375 576 510 9908', 'hzarfatim@mac.com', 'SmartSolutions Inc.', '11138445935', ''),
    (24, 'Nolana Aubin', '77679 Badeau Drive', '+94 891 169 8767', 'naubinn@ycombinator.com', '', '', 'YKWYRF57B22A815R'),
    (25, 'Percival Brocket', '53 Buhler Center', '+62 687 889 9290', 'pbrocketo@cnn.com', 'AgileEdge Technologies', '12745364066', ''),
    (26, 'Delmore Evensden', '6 Maple Wood Terrace', '+351 469 184 2494', 'devensdenp@technorati.com', 'PowerGenix Industries', '71733797883', ''),
    (27, 'Halsy Eyden', '0 Amoth Junction', '+420 787 828 1465', 'heydenq@a8.net', 'NovaTech Ventures', '25555793641', ''),
    (28, 'Gabriel Keaveney', '229 Canary Junction', '+93 119 259 6597', 'gkeaveneyr@google.co.jp', '', '', 'QOGENY87U24W750A'),
    (29, 'Riobard Claus', '36228 Park Meadow Point', '+61 345 792 5121', 'rclauss@xing.com', 'PowerGenix Industries', '76532982406', ''),
    (30, 'Faina Danaher', '92698 Mandrake Point', '+1 334 378 6687', 'fdanahert@wsj.com', '', '', 'HTIOCR49U56E694K');



insert into Magazzino
    (Id, Indirizzo)
values
    (27755, '45405 Tennessee Junction'),
    (76934, '1461 Green Ridge Circle'),
    (38043, '9 Johnson Plaza'),
    (89852, '92 Duke Circle'),
    (45419, '113 Waubesa Pass'),
    (73214, '53171 Forest Junction'),
    (76529, '2 Paget Avenue'),
    (94046, '0073 Service Drive'),
    (19889, '57 Fair Oaks Avenue'),
    (38958, '904 Grayhawk Alley'),
    (25760, '3446 Division Pass'),
    (93364, '5924 Spaight Terrace'),
    (31478, '5641 Commercial Place'),
    (70333, '8275 Debra Street'),
    (58403, '935 Memorial Avenue'),
    (69714, '40 Clove Drive'),
    (95014, '4 Knutson Terrace'),
    (28412, '894 Morning Park'),
    (39481, '68836 Scott Circle'),
    (22322, '7 Dayton Trail'),
    (38455, '846 Blue Bill Park Plaza'),
    (53569, '4 Buell Center'),
    (81825, '5872 Fisk Terrace'),
    (11988, '8 Sunbrook Park'),
    (43523, '05 Debra Lane'),
    (47023, '64897 Katie Park'),
    (42219, '58109 Hermina Avenue'),
    (65429, '05690 Lerdahl Avenue'),
    (38387, '5244 Mayer Parkway'),
    (13687, '7020 Carberry Street');



/* PRODOTTO */
insert into Prodotto
    (SKU, Nome, Prezzo, Descrizione, Tipo)
values
    (99063, 'PowerPro Elite', 2211.21, 'Il PC PowerPro Elite è un mostro di potenza. Con un processore ad alte prestazioni, una scheda grafica potente e un ampia capacità di archiviazione, ti offre la velocità e le prestazioni necessarie per le tue attività più esigenti.', 'Pc'),

    (16677, 'ErgoType Pro', 2383.26, 'La tastiera ErgoType Pro offre un design ergonomico avanzato per una \
    digitazione comoda e senza sforzo. Dotata di tasti retroilluminati e funzionalità wireless, è perfetta per aumentare la produttività.', 'Tastiera'),

    (91220, 'SleekBook Ultra', 2130.28, 'Il PC SleekBook Ultra è un concentrato di eleganza e prestazioni. Con un design sottile e leggero, è perfetto per chi cerca un equilibrio tra portabilità e prestazioni elevate.', 'Pc'),

    (25939, 'Gamer Delight', 1818.03, 'La tastiera Gamer Delight è pensata per i veri appassionati di gaming. Con tasti programmabili, retroilluminazione RGB personalizzabile e una risposta rapida, ti offre un esperienza di gioco superiore.', 'Tastiera'),

    (29119, 'GamingBeast Pro', 457.19, 'Il PC GamingBeast Pro è progettato per i veri gamer. Con una scheda grafica ad alte prestazioni, un processore potente e una memoria espandibile, ti offre un esperienza di gioco immersiva e senza compromessi.', 'Pc'),

    (92565, 'SilentKey Stealth', 1984.8, 'La tastiera SilentKey Stealth offre una digitazione silenziosa grazie ai tasti a ridotto impatto acustico. Ideale per uffici e ambienti tranquilli, ti permette di lavorare senza disturbi.', 'Tastiera'),

    (43228, 'MultiTaskMaster Plus', 1235.51, 'Il PC MultiTaskMaster Plus è progettato per gestire multitasking intensi. Con un processore veloce, una memoria generosa e molte porte di connessione, puoi eseguire diverse attività contemporaneamente senza rallentamenti.', 'Pc'),

    (74925, 'CompactFlex Ultra', 1468.2, 'La tastiera CompactFlex Ultra è estremamente compatta e flessibile. Puoi piegarla e portarla ovunque con te, senza rinunciare alla comodità di una tastiera completa.', 'tastiera'),

    (42165, 'MediaCenter Hub', 2270.34, 'Il PC MediaCenter Hub è il centro multimediale perfetto per la tua casa. Con una scheda grafica di qualità e una connettività avanzata, trasforma il tuo salotto in un esperienza di intrattenimento completa.', 'Pc'),

    (56758, 'WirelessWave Plus', 2138.33, 'La tastiera WirelessWave Plus ti offre la libertà del wireless. Con una connessione stabile e una portata estesa, puoi lavorare o giocare senza i limiti dei cavi.', 'Tastiera'),

    (64890, 'BusinessPro Workstation', 1735.17, 'l PC BusinessPro Workstation è progettato per le esigenze aziendali. Con una potenza di elaborazione affidabile, una sicurezza avanzata e funzionalità di gestione, ti aiuta a gestire le tue attività professionali con efficienza.', 'Pc'),

    (82710, 'ArtisticKey Design', 1544.1, 'La tastiera ArtisticKey Design è un mix perfetto di funzionalità e stile. Con un design elegante e tasti ergonomici, rende la digitazione un esperienza piacevole per gli occhi e le dita.', 'Tastiera');
