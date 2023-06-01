CREATE TABLE Utente
(
    Id INT NOT NULL,
    Nome VARCHAR(255),
    Indirizzo VARCHAR(120),
    Telefono VARCHAR(20),
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
    PRIMARY KEY(Id)
);

CREATE TABLE Prodotto
(
    SKU INT NOT NULL,
    Nome VARCHAR(255),
    Prezzo FLOAT,
    Descrizione TEXT,
    Tipo VARCHAR(255),
    Magazzino INT NOT NULL,
    PRIMARY KEY(SKU),
    FOREIGN KEY(Magazzino) REFERENCES Magazzino(Id) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE Carrello
(
    Id INT NOT NULL,
    DataAggiunta TIMESTAMP,
    Quantita INT NOT NULL,
    Utente INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(Utente) REFERENCES Utente(Id) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE Contenuto
(
    Prodotto INT NOT NULL,
    Carrello INT NOT NULL,
    PRIMARY KEY(Prodotto, Carrello),
    FOREIGN KEY(Prodotto) REFERENCES Prodotto(SKU) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY(Carrello) REFERENCES Carrello(Id) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE Pagamento
(
    Id INT NOT NULL,
    DataPagamento TIMESTAMP,
    Metodo VARCHAR(255),
    PrezzoSpedizione FLOAT,
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
    Utente INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(Utente) REFERENCES Utente(Id) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE Ordine
(
    Id INT NOT NULL,
    DataOrdine TIMESTAMP,
    Pagamento INT NOT NULL,
    Spedizione INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(Pagamento) REFERENCES Pagamento(Id) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY(Spedizione) REFERENCES Spedizione(Id) ON DELETE CASCADE ON UPDATE SET NULL
);


/*

 _____             _                   _       
|  _  |___ ___ ___| |___ _____ ___ ___| |_ ___ 
|   __| . | . | . | | .'|     | -_|   |  _| . |
|__|  |___|  _|___|_|__,|_|_|_|___|_|_|_| |___|
          |_|  

*/


/* UTENTE */
INSERT INTO Utente
    (Id, Nome, Indirizzo, Telefono, Email, Azienda, pIva, CF)
VALUES
    (1, 'Wilhelmina Jacquemard', '88 Jenna Junction', '+249 468 510 5984', 'wjacquemard0@soundcloud.com', NULL, NULL, 'JASJRQ56S50Y724T'),
    (2, 'Care Galland', '634 Banding Parkway', '+420 390 610 3240', 'cgalland1@macromedia.com', NULL, NULL, 'WKQNDD60T79A336F'),
    (3, 'Shandra Aikin', '19788 Orin Terrace', '+62 797 181 6151', 'saikin2@unicef.org', 'Innovatech Solutions', '01083699486', NULL),
    (4, 'Bell Pappi', '720 Troy Pass', '+63 118 877 2980', 'bpappi3@theglobeandmail.com', 'TechPro Systems', '27374892328', NULL),
    (5, 'Pearce Clissett', '31 Troy Alley', '+7 841 462 3287', 'pclissett4@deliciousdays.com', NULL, NULL, 'DWVCBG98F91K236Q'),
    (6, 'Odelia Swyer', '8477 Kipling Alley', '+86 460 470 1622', 'oswyer5@kickstarter.com', 'BrightStar Enterprises', '80578030458', NULL),
    (7, 'Rene Leek', '3 Forest Dale Drive', '+46 237 515 5297', 'rleek6@mayoclinic.com', NULL, NULL, 'TIXHFH23B93B158C'),
    (8, 'Benoit Attwool', '1 Homewood Place', '+62 648 864 2420', 'battwool7@mail.ru', 'GlobalGrowth Ventures', '07768562249', NULL),
    (9, 'Nanny Midden', '2 Kedzie Circle', '+54 323 374 9278', 'nmidden8@chicagotribune.com', 'OptimaTech Services', '05803936568', NULL),
    (10, 'Pierette Lanyon', '66 Almo Avenue', '+60 500 286 1025', 'planyon9@123-reg.co.uk', NULL, NULL, 'CVVTWE02Q34D867I'),
    (11, 'Earl Bateman', '43 East Hill', '+86 739 166 0837', 'ebatemana@usatoday.com', 'NexusLink Solutions', '66802152950', NULL),
    (12, 'Nicholle Worcester', '03 Amoth Junction', '+86 939 352 6540', 'nworcesterb@is.gd', NULL, NULL, 'HTIOCR49U56E694K'),
    (13, 'Tiffanie Thrush', '4 Spenser Center', '+212 738 585 4918', 'tthrushc@zimbio.com', 'PrimeEdge Technologies', '31385911745', NULL),
    (14, 'Erroll Kennifeck', '6 Iowa Alley', '+86 551 218 0295', 'ekennifeckd@barnesandnoble.com', NULL, NULL, 'QOGENY87U24W750A'),
    (15, 'Sally Woolforde', '8932 Bartelt Pass', '+86 868 896 0721', 'swoolfordee@sogou.com', 'ProActive Solutions', '14136049047', NULL),
    (16, 'Chance Foresight', '3 Roth Court', '+7 774 930 8376', 'cforesightf@wufoo.com', NULL, NULL, 'CCYFDY17G16K364S'),
    (17, 'Cherish Thornthwaite', '30752 Lunder Trail', '+48 358 415 1560', 'cthornthwaiteg@nasa.gov', 'EliteConnect Enterprises', '65126842363', NULL),
    (18, 'Tania Gabites', '20643 Southridge Road', '+63 573 504 2713', 'tgabitesh@google.it', NULL, NULL, 'ULBSZN37A54Q244M'),
    (19, 'Milzie Dagnall', '95 Elmside Alley', '+1 210 968 1081', 'mdagnalli@fotki.com', NULL, NULL, 'SEABFI62O29J894F'),
    (20, 'Dulcea Sapseed', '71 Montana Crossing', '+1 714 552 1248', 'dsapseedj@yelp.com', 'QuantumTech Innovations', '11138445935', NULL),
    (21, 'Adolpho Quickfall', '6 Vernon Hill', '+58 569 306 2309', 'aquickfallk@foxnews.com', 'Visionary Labs', '12745364066', NULL),
    (22, 'Tris Quest', '79721 Little Fleur Point', '+46 213 994 8413', 'tquestl@adobe.com', NULL, NULL, 'JESQKI34V98X702A'),
    (23, 'Hamil Zarfati', '4 Fisk Park', '+375 576 510 9908', 'hzarfatim@mac.com', 'SmartSolutions Inc.', '25555793641', NULL),
    (24, 'Nolana Aubin', '77679 Badeau Drive', '+94 891 169 8767', 'naubinn@ycombinator.com', NULL, NULL, 'SWPKEM29I05V400X'),
    (25, 'Percival Brocket', '53 Buhler Center', '+62 687 889 9290', 'pbrocketo@cnn.com', 'AgileEdge Technologies', '76532982406', NULL),
    (26, 'Delmore Evensden', '6 Maple Wood Terrace', '+351 469 184 2494', 'devensdenp@technorati.com', 'PowerGenix Industries', '71733797883', NULL),
    (27, 'Halsy Eyden', '0 Amoth Junction', '+420 787 828 1465', 'heydenq@a8.net', NULL, NULL, 'LHZDXM08L97H100H'),
    (28, 'Gabriel Keaveney', '229 Canary Junction', '+93 119 259 6597', 'gkeaveneyr@google.co.jp', NULL, NULL, 'KSPSNP42M20C983R'),
    (29, 'Riobard Claus', '36228 Park Meadow Point', '+61 345 792 5121', 'rclauss@xing.com', 'ML Tech', '78246249335', NULL),
    (30, 'Faina Danaher', '92698 Mandrake Point', '+1 334 378 6687', 'fdanahert@wsj.com', NULL, NULL, 'YKWYRF57B22A815R');


/* MAGAZZINO */
insert into Magazzino
    (Id, Indirizzo)
values
    (27755, '45405 Tennessee Junction'),
    (76934, '1461 Green Ridge Circle'),
    (38043, '9 Johnson Plaza'),
    (89852, '92 Duke Circle'),
    (45419, '113 Waubesa Pass');


/* PRODOTTO */
insert into Prodotto
    (SKU, Nome, Prezzo, Descrizione, Tipo, Magazzino)
values
    (99063, 'PowerPro Elite', 2211.21, 'Il PC PowerPro Elite è un mostro di potenza. Con un processore ad alte prestazioni, una scheda grafica potente e un ampia capacità di archiviazione, ti offre la velocità e le prestazioni necessarie per le tue attività più esigenti.', 'Pc', 27755),
    (16677, 'ErgoType Pro', 2383.26, 'La tastiera ErgoType Pro offre un design ergonomico avanzato per una digitazione comoda e senza sforzo. Dotata di tasti retroilluminati e funzionalità wireless, è perfetta per aumentare la produttività.', 'Tastiera', 27755),
    (91220, 'SleekBook Ultra', 2130.28, 'Il PC SleekBook Ultra è un concentrato di eleganza e prestazioni. Con un design sottile e leggero, è perfetto per chi cerca un equilibrio tra portabilità e prestazioni elevate.', 'Pc', 27755),
    (25939, 'Gamer Delight', 1818.03, 'La tastiera Gamer Delight è pensata per i veri appassionati di gaming. Con tasti programmabili, retroilluminazione RGB personalizzabile e una risposta rapida, ti offre un esperienza di gioco superiore.', 'Tastiera', 76934),
    (29119, 'GamingBeast Pro', 457.19, 'Il PC GamingBeast Pro è progettato per i veri gamer. Con una scheda grafica ad alte prestazioni, un processore potente e una memoria espandibile, ti offre un esperienza di gioco immersiva e senza compromessi.', 'Pc', 38043),
    (92565, 'SilentKey Stealth', 1984.8, 'La tastiera SilentKey Stealth offre una digitazione silenziosa grazie ai tasti a ridotto impatto acustico. Ideale per uffici e ambienti tranquilli, ti permette di lavorare senza disturbi.', 'Tastiera', 38043),
    (43228, 'MultiTaskMaster Plus', 1235.51, 'Il PC MultiTaskMaster Plus è progettato per gestire multitasking intensi. Con un processore veloce, una memoria generosa e molte porte di connessione, puoi eseguire diverse attività contemporaneamente senza rallentamenti.', 'Pc', 89852),
    (74925, 'CompactFlex Ultra', 1468.2, 'La tastiera CompactFlex Ultra è estremamente compatta e flessibile. Puoi piegarla e portarla ovunque con te, senza rinunciare alla comodità di una tastiera completa.', 'tastiera', 89852),
    (42165, 'MediaCenter Hub', 2270.34, 'Il PC MediaCenter Hub è il centro multimediale perfetto per la tua casa. Con una scheda grafica di qualità e una connettività avanzata, trasforma il tuo salotto in un esperienza di intrattenimento completa.', 'Pc', 89852),
    (56758, 'WirelessWave Plus', 2138.33, 'La tastiera WirelessWave Plus ti offre la libertà del wireless. Con una connessione stabile e una portata estesa, puoi lavorare o giocare senza i limiti dei cavi.', 'Tastiera', 45419),
    (64890, 'BusinessPro Workstation', 1735.17, 'l PC BusinessPro Workstation è progettato per le esigenze aziendali. Con una potenza di elaborazione affidabile, una sicurezza avanzata e funzionalità di gestione, ti aiuta a gestire le tue attività professionali con efficienza.', 'Pc', 45419),
    (82710, 'ArtisticKey Design', 1544.1, 'La tastiera ArtisticKey Design è un mix perfetto di funzionalità e stile. Con un design elegante e tasti ergonomici, rende la digitazione un esperienza piacevole per gli occhi e le dita.', 'Tastiera', 45419);


/* CARRELLO */
insert into Carrello
    (Id, DataAggiunta, Quantita, Utente)
values
    (798, '2023-06-27 18:25:38', 2, 27),
    (810, '2023-05-11 01:45:10', 1, 26),
    (100, '2023-06-17 14:18:15', 7, 9),
    (486, '2023-05-20 04:24:56', 1, 6),
    (859, '2023-06-27 18:25:38', 3, 28),
    (888, '2023-04-25 04:24:56', 3, 21),
    (813, '2023-05-03 06:18:48', 6, 2),
    (942, '2023-04-26 07:41:46', 6, 25),
    (407, '2023-04-18 15:00:18', 5, 10),
    (418, '2023-05-11 09:06:54', 2, 7),
    (577, '2023-04-06 14:18:15', 2, 14),
    (314, '2023-06-02 06:18:48', 1, 1),
    (474, '2023-06-09 20:10:57', 1, 15),
    (250, '2023-05-09 10:51:45', 6, 8),
    (897, '2023-04-30 23:15:49', 1, 18),
    (534, '2023-04-03 23:15:49', 7, 5),
    (421, '2023-04-27 07:41:46', 3, 22),
    (338, '2023-05-24 19:14:48', 7, 23),
    (569, '2023-04-03 18:25:38', 1, 3),
    (866, '2023-05-30 20:10:57', 3, 20),
    (161, '2023-06-19 18:30:16', 4, 11),
    (427, '2023-05-12 22:47:05', 1, 24),
    (794, '2023-04-18 01:45:10', 7, 4),
    (041, '2023-04-15 09:23:52', 1, 16),
    (073, '2023-05-19 17:25:52', 4, 12),
    (308, '2023-04-11 19:14:48', 6, 30),
    (987, '2023-06-27 01:45:10', 4, 17),
    (374, '2023-04-07 18:30:16', 1, 19),
    (050, '2023-06-18 06:54:56', 3, 29),
    (293, '2023-06-14 22:47:05', 3, 13);



/* CONTENUTO */
insert into Contenuto
    (Prodotto, Carrello)
values
    (99063, 798),
    (16677, 798),
    (91220, 798),
    (16677, 810),
    (25939, 810),
    (29119, 810),
    (92565, 100),
    (43228, 100),
    (25939, 486),
    (16677, 859),
    (29119, 859),
    (56758, 888),
    (56758, 813),
    (64890, 813),
    (92565, 942),
    (64890, 942),
    (43228, 407),
    (42165, 407),
    (92565, 418),
    (92565, 577),
    (82710, 293);


/* PAGAMENTO */
insert into Pagamento
    (Id, DataPagamento, Metodo, PrezzoSpedizione, Carrello)
values
    (9202, '2023-05-29 20:11:56', 'Carta', 13.62, 798),
    (3231, '2023-06-29 18:13:02', 'Bonifico', 14.96, 810),
    (5439, '2023-06-27 13:07:49', 'Bonifico', 7.27, 100),
    (8707, '2023-04-08 10:55:10', 'Carta', 11.71, 486),
    (9547, '2023-06-07 22:13:45', 'Paypal', 7.8, 859),
    (4912, '2023-04-18 03:51:47', 'Paypal', 13.16, 888),
    (1491, '2023-04-23 03:55:45', 'Carta', 11.57, 813),
    (7698, '2023-05-09 18:12:38', 'Paypal', 6.78, 942),
    (1040, '2023-05-24 02:48:08', 'Paypal', 14.22, 407),
    (2929, '2023-05-27 20:25:08', 'Carta', 11.41, 418),
    (1158, '2023-04-28 19:02:02', 'Bonifico', 7.7, 577),
    (5965, '2023-05-11 09:45:16', 'Bonifico', 14.73, 314),
    (9777, '2023-05-05 19:05:50', 'Carta', 12.23, 474),
    (1816, '2023-05-30 03:21:48', 'Bonifico', 6.53, 250),
    (5828, '2023-04-09 19:36:08', 'Bonifico', 13.62, 897);
/*
    (9844, '2023-05-18 10:13:44', 'Carta', 7.8, 534),
    (9725, '2023-05-01 08:43:20', 'Paypal', 5.32, 421),
    (3126, '2023-05-09 12:33:09', 'Paypal', 13.97, 338),
    (7851, '2023-06-28 02:19:25', 'Carta', 5.87, 569),
    (4023, '2023-05-20 22:12:52', 'Paypal', 12.52, 866),
    (8188, '2023-06-16 11:15:53', 'Paypal', 14.83, 161),
    (6677, '2023-06-22 14:45:25', 'Paypal', 7.94, 427),
    (2203, '2023-04-10 11:20:07', 'Bonifico', 14.03, 794),
    (7455, '2023-04-23 18:32:43', 'Bonifico', 8.38, 041),
    (4655, '2023-04-17 10:18:32', 'Bonifico', 8.48, 073),
    (1836, '2023-04-20 01:37:31', 'Paypal', 10.23, 308),
    (1435, '2023-06-11 03:40:20', 'Paypal', 5.76, 987),
    (1082, '2023-04-06 15:22:39', 'Paypal', 9.49, 374),
    (6681, '2023-04-29 02:27:30', 'Paypal', 5.62, 050),
    (9873, '2023-05-14 07:29:48', 'Paypal', 11.46, 293);
*/


/* SPEDIZIONE */
insert into Spedizione
    (Id, DataSpedizione, DataConsegna, Peso, Utente)
values
    (2500, '2023-06-25 20:11:56', '2023-06-26 18:13:02', 28, 1),
    (1400, '2023-06-22 10:55:10', '2023-06-23 20:11:56', 45, 1),
    (5815, '2023-06-23 02:48:08', '2023-06-22 03:40:20', 116, 1),
    (3828, '2023-06-21 18:13:02', '2023-06-19 02:48:08', 55, 2),
    (7074, '2023-06-29 18:13:02', '2023-06-26 03:40:20', 54, 5),
    (4014, '2023-06-22 02:48:08', '2023-06-28 12:33:09', 92, 28),
    (6444, '2023-06-23 03:40:20', '2023-06-23 07:29:48', 50, 16),
    (3275, '2023-06-24 18:32:43', '2023-06-22 02:48:08', 100, 16),
    (1782, '2023-06-23 03:40:20', '2023-06-21 20:11:56', 38, 11),
    (5547, '2023-06-23 10:55:10', '2023-06-26 11:15:53', 40, 29),
    (7988, '2023-05-22 18:13:02', '2023-05-24 18:13:02', 51, 29),
    (3135, '2023-04-30 18:32:43', '2023-05-01 10:32:43', 138, 6),
    (2187, '2023-05-24 07:29:48', '2023-05-27 11:15:53', 84, 7),
    (7225, '2023-02-25 10:55:10', '2023-02-28 18:13:02', 128, 9),
    (5621, '2023-03-27 18:13:02', '2023-03-28 02:19:25', 147, 1),
    (1752, '2023-01-20 02:19:25', '2023-01-23 08:30:55', 131, 2),
    (5319, '2023-02-23 20:11:56', '2023-02-26 07:29:48', 48, 5);

/*
    (7001, '2023-06-16 02:19:25', '2023-06-20 14:32:24', 76),
    (7245, '2023-06-27 12:33:09', '2023-06-23 18:32:43', 44),
    (2970, '2023-06-15 07:29:48', '2023-06-23 02:48:08', 45),
    (5010, '2023-06-16 20:11:56', '2023-06-23 23:10:03', 109),
    (8723, '2023-06-16 18:32:43', '2023-06-22 15:10:57', 52),
    (5499, '2023-06-25 12:33:09', '2023-06-26 02:48:08', 73),
    (8848, '2023-06-26 10:55:10', '2023-06-27 20:11:56', 144),
    (1570, '2023-06-28 23:52:00', '2023-06-20 15:22:39', 119),
    (2904, '2023-06-23 15:22:39', '2023-06-18 12:33:09', 137),
    (8923, '2023-06-30 20:11:56', '2023-06-17 15:10:57', 88),
    (2392, '2023-06-27 15:22:39', '2023-06-19 07:29:48', 130),
    (1495, '2023-06-18 23:52:00', '2023-06-29 15:22:39', 26);
*/


/* ORDINE */
insert into Ordine
    (Id, DataOrdine, Pagamento, Spedizione)
values
    (8982, '2023-05-25', 9202, 2500),
    (5893, '2023-04-13', 3231, 2500),
    (4545, '2023-06-19', 5439, 1400),
    (1676, '2023-04-10', 8707, 5815),
    (6071, '2023-06-15', 9547, 5815),
    (2137, '2023-05-18', 4912, 3828),
    (1161, '2023-05-06', 1491, 7074),
    (3832, '2023-04-02', 7698, 7074),
    (7323, '2023-05-16', 1040, 4014),
    (2683, '2023-04-30', 2929, 6444),
    (2277, '2023-04-18', 1158, 3275),
    (2907, '2023-04-28', 5965, 3275),
    (8551, '2023-05-11', 9777, 3275),
    (5642, '2023-05-15', 1816, 1782),
    (5108, '2023-05-27', 5828, 5547);