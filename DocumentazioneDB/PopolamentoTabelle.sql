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
    (1, 'Wilhelmina Jacquemard', '88 Jenna Junction', '+249 468 510 5984', 'wjacquemard0@soundcloud.com', '', '', ''),
    (2, 'Care Galland', '634 Banding Parkway', '+420 390 610 3240', 'cgalland1@macromedia.com', '', '', ''),
    (3, 'Shandra Aikin', '19788 Orin Terrace', '+62 797 181 6151', 'saikin2@unicef.org', '', '', ''),
    (4, 'Bell Pappi', '720 Troy Pass', '+63 118 877 2980', 'bpappi3@theglobeandmail.com', '', '', ''),
    (5, 'Pearce Clissett', '31 Troy Alley', '+7 841 462 3287', 'pclissett4@deliciousdays.com', '', '', ''),
    (6, 'Odelia Swyer', '8477 Kipling Alley', '+86 460 470 1622', 'oswyer5@kickstarter.com', '', '', ''),
    (7, 'Rene Leek', '3 Forest Dale Drive', '+46 237 515 5297', 'rleek6@mayoclinic.com', '', '', ''),
    (8, 'Benoit Attwool', '1 Homewood Place', '+62 648 864 2420', 'battwool7@mail.ru', '', '', ''),
    (9, 'Nanny Midden', '2 Kedzie Circle', '+54 323 374 9278', 'nmidden8@chicagotribune.com', '', '', ''),
    (10, 'Pierette Lanyon', '66 Almo Avenue', '+60 500 286 1025', 'planyon9@123-reg.co.uk', '', '', ''),
    (11, 'Earl Bateman', '43 East Hill', '+86 739 166 0837', 'ebatemana@usatoday.com', '', '', ''),
    (12, 'Nicholle Worcester', '03 Amoth Junction', '+86 939 352 6540', 'nworcesterb@is.gd', '', '', ''),
    (13, 'Tiffanie Thrush', '4 Spenser Center', '+212 738 585 4918', 'tthrushc@zimbio.com', '', '', ''),
    (14, 'Erroll Kennifeck', '6 Iowa Alley', '+86 551 218 0295', 'ekennifeckd@barnesandnoble.com', '', '', ''),
    (15, 'Sally Woolforde', '8932 Bartelt Pass', '+86 868 896 0721', 'swoolfordee@sogou.com', '', '', ''),
    (16, 'Chance Foresight', '3 Roth Court', '+7 774 930 8376', 'cforesightf@wufoo.com', '', '', ''),
    (17, 'Cherish Thornthwaite', '30752 Lunder Trail', '+48 358 415 1560', 'cthornthwaiteg@nasa.gov', '', '', ''),
    (18, 'Tania Gabites', '20643 Southridge Road', '+63 573 504 2713', 'tgabitesh@google.it', '', '', ''),
    (19, 'Milzie Dagnall', '95 Elmside Alley', '+1 210 968 1081', 'mdagnalli@fotki.com', '', '', ''),
    (20, 'Dulcea Sapseed', '71 Montana Crossing', '+1 714 552 1248', 'dsapseedj@yelp.com', '', '', ''),
    (21, 'Adolpho Quickfall', '6 Vernon Hill', '+58 569 306 2309', 'aquickfallk@foxnews.com', '', '', ''),
    (22, 'Tris Quest', '79721 Little Fleur Point', '+46 213 994 8413', 'tquestl@adobe.com', '', '', ''),
    (23, 'Hamil Zarfati', '4 Fisk Park', '+375 576 510 9908', 'hzarfatim@mac.com', '', '', ''),
    (24, 'Nolana Aubin', '77679 Badeau Drive', '+94 891 169 8767', 'naubinn@ycombinator.com', '', '', ''),
    (25, 'Percival Brocket', '53 Buhler Center', '+62 687 889 9290', 'pbrocketo@cnn.com', '', '', ''),
    (26, 'Delmore Evensden', '6 Maple Wood Terrace', '+351 469 184 2494', 'devensdenp@technorati.com', '', '', ''),
    (27, 'Halsy Eyden', '0 Amoth Junction', '+420 787 828 1465', 'heydenq@a8.net', '', '', ''),
    (28, 'Gabriel Keaveney', '229 Canary Junction', '+93 119 259 6597', 'gkeaveneyr@google.co.jp', '', '', ''),
    (29, 'Riobard Claus', '36228 Park Meadow Point', '+61 345 792 5121', 'rclauss@xing.com', '', '', ''),
    (30, 'Faina Danaher', '92698 Mandrake Point', '+1 334 378 6687', 'fdanahert@wsj.com', '', '', '');



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
    (99063, 'justo', 2211.21, 'nunc vestibulum ante ipsum primis in faucibus orci luctus et', 'metus'),

    (16677, 'ac', 2383.26, 'viverra pede ac diam cras', 'at'),

    (91220, 'maecenas', 2130.28, 'vestibulum sit amet cursus id', 'sit'),

    (25939, 'sagittis', 1818.03, 'justo in blandit ultrices enim lorem', 'in'),

    (29119, 'dui', 457.19, 'congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin', 'viverra'),

    (92565, 'orci', 1984.8, 'habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id', 'elementum'),

    (43228, 'viverra', 1235.51, 'curabitur at ipsum ac', 'proin'),

    (74925, 'ante', 1468.2, 'orci luctus et ultrices', 'sapien'),

    (42165, 'natoque', 2270.34, 'interdum venenatis turpis enim blandit mi in porttitor', 'vel'),

    (56758, 'sem', 2138.33, 'tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis', 'maecenas'),

    (64890, 'hac', 1735.17, 'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non', 'posuere'),

    (82710, 'ut', 1544.1, 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 'quisque'),

    (11689, 'aliquam', 433.98, 'morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim', 'erat'),

    (75149, 'curae', 1929.8, 'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean', 'justo'),

    (12945, 'posuere', 694.99, 'magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes', 'orci'),

    (51307, 'donec', 2680.28, 'arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus', 'ornare'),

    (38817, 'interdum', 1142.62, 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis', 'leo'),

    (33831, 'neque', 1926.81, 'ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam', 'sapien'),

    (94970, 'sit', 1169.13, 'est risus auctor sed', 'sapien'),

    (50324, 'venenatis', 2342.26, 'nulla sed accumsan felis ut at', 'donec'),

    (24485, 'scelerisque', 2041.33, 'tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut', 'mattis'),

    (18956, 'pellentesque', 1213.2, 'blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse', 'integer'),

    (49068, 'praesent', 2262.25, 'rutrum nulla nunc purus phasellus in felis', 'lacinia'),

    (25054, 'vestibulum', 587.65, 'sodales scelerisque mauris sit amet eros suspendisse', 'ultrices'),

    (29726, 'vel', 2198.33, 'potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas', 'lacinia'),

    (20055, 'odio', 1293.79, 'volutpat quam pede lobortis ligula sit amet eleifend', 'nunc'),

    (90772, 'orci', 973.81, 'lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet', 'phasellus'),

    (64128, 'donec', 2876.08, 'hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla', 'libero'),

    (80625, 'duis', 1718.88, 'posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel', 'vestibulum'),

    (32653, 'ante', 2483.16, 'volutpat dui maecenas tristique est et tempus semper est quam', 'est');