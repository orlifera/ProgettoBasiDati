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



/*

 ____   __  ____   __   __     __   _  _  ____  __ _  ____  __        
(  _ \ /  \(  _ \ /  \ (  )   / _\ ( \/ )(  __)(  ( \(_  _)/  \       
 ) __/(  O )) __/(  O )/ (_/\/    \/ \/ \ ) _) /    /  )( (  O )      
(__)   \__/(__)   \__/ \____/\_/\_/\_)(_/(____)\_)__) (__) \__/   

*/

/* UTENTE DA FINIRE CON I VARI DATI MANCANTI*/
insert into Utente
    (Id, Nome, Indirizzo, Telefono, Email, Azienda, pIva, CF)
values()
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


/* MAGAZZINO */
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


/* SITUTATO */
CREATE TABLE Situato
(
    Magazzino INT NOT NULL,
    Prodotto INT NOT NULL,
    PRIMARY KEY(Magazzino, Prodotto),
    FOREIGN KEY(Magazzino) REFERENCES Magazzino(Id) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY (Prodotto) REFERENCES Prodotto (SKU) ON DELETE CASCADE ON UPDATE SET NULL
);


/* CARRELLO */
insert into Carrello 
    (Id, DataAggiunta, Quantita, Utente) 
values 
    (798, '2023-06-27', 2, 27),
    (810, '2023-05-11', 1, 26),
    (100, '2023-06-17', 7, 9),
    (486, '2023-05-20', 1, 6),
    (859, '2023-06-27', 3, 28),
    (888, '2023-04-25', 3, 21),
    (813, '2023-05-03', 6, 27),
    (942, '2023-04-26', 6, 25),
    (407, '2023-04-18', 5, 9),
    (418, '2023-05-11', 2, 26),
    (577, '2023-04-06', 2, 6),
    (314, '2023-06-02', 1, 1),
    (474, '2023-06-09', 1, 15),
    (250, '2023-05-09', 6, 8),
    (897, '2023-04-30', 1, 18),
    (534, '2023-04-03', 7, 5),
    (421, '2023-04-27', 3, 22),
    (338, '2023-05-24', 7, 23),
    (569, '2023-04-03', 1, 3),
    (866, '2023-05-30', 3, 18),
    (161, '2023-06-19', 4, 11),
    (427, '2023-05-12', 1, 24),
    (794, '2023-04-18', 7, 4),
    (041, '2023-04-15', 1, 6),
    (073, '2023-05-19', 4, 12),
    (308, '2023-04-11', 6, 4),
    (987, '2023-06-27', 4, 17),
    (374, '2023-04-07', 1, 8),
    (050, '2023-06-18', 3, 11),
    (293, '2023-06-14', 3, 9);


/* CONTENUTO */
CREATE TABLE Contenuto
(
    Prodotto INT NOT NULL,
    Carrello INT NOT NULL,
    PRIMARY KEY(Prodotto, Carrello),
    FOREIGN KEY(Prodotto) REFERENCES Prodotto(SKU) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY(Carrello) REFERENCES Carrello(Id) ON DELETE CASCADE ON UPDATE SET NULL,
);


/* PAGAMNETO MANCA DA METTERE L'ID DEL CARRELLO*/
insert into Pagamento 
    (Id, DataPagamento, Metodo, PrezzoSpedizione, Carrello)
values 
    (9202, '2023-06-06', 'pellentesque', 13.62, ),
    (3231, '2023-05-14', 'sit', 14.96, ),
    (5439, '2023-04-21', 'ligula', 7.27, ),
    (8707, '2023-04-13', 'pulvinar', 11.71, ),
    (9547, '2023-04-22', 'ante', 7.8, ),
    (4912, '2023-04-16', 'quam', 13.16, ),
    (1491, '2023-06-18', 'ut', 11.57, ),
    (7698, '2023-06-18', 'enim', 6.78, ),
    (1040, '2023-06-16', 'justo', 14.22, ),
    (2929, '2023-06-14', 'sed', 11.41, ),
    (1158, '2023-06-17', 'dapibus', 7.7, ),
    (5965, '2023-04-07', 'ante', 14.73, ),
    (9777, '2023-05-11', 'neque', 12.23, ),
    (1816, '2023-06-23', 'leo', 6.53, ),
    (5828, '2023-06-06', 'est', 13.62, ),
    (9844, '2023-04-01', 'pellentesque', 7.8, ),
    (9725, '2023-04-05', 'nunc', 5.32, ),
    (3126, '2023-04-04', 'non', 13.97, ),
    (7851, '2023-04-10', 'tristique', 5.87, ),
    (4023, '2023-04-06', 'molestie', 12.52, ),
    (8188, '2023-06-13', 'felis', 14.83, ),
    (6677, '2023-04-18', 'nibh', 7.94, ),
    (2203, '2023-05-28', 'sapien', 14.03, ),
    (7455, '2023-06-27', 'enim', 8.38, ),
    (4655, '2023-04-10', 'convallis', 8.48, ),
    (1836, '2023-05-24', 'natoque', 10.23, ),
    (1435, '2023-06-20', 'luctus', 5.76, ),
    (1082, '2023-06-18', 'ac', 9.49, ),
    (6681, '2023-05-06', 'sapien', 5.62, ),
    (9873, '2023-06-07', 'mauris', 11.46, );


/* SPEDIZIONE */
insert into Spedizione 
    (Id, DataSpedizione, DataConsegna, Peso) 
values 
    (2500, '2023-07-25', '2023-07-26', 28),
    (1400, '2023-07-22', '2023-07-23', 45),
    (5815, '2023-07-23', '2023-07-22', 116),
    (3828, '2023-07-21', '2023-07-19', 55),
    (7074, '2023-07-29', '2023-07-26', 54),
    (4014, '2023-07-22', '2023-07-28', 92),
    (6444, '2023-07-23', '2023-07-23', 50),
    (3275, '2023-07-24', '2023-07-22', 100),
    (1782, '2023-07-23', '2023-07-21', 38),
    (5547, '2023-07-23', '2023-07-26', 40),
    (7988, '2023-07-24', '2023-07-24', 51),
    (3135, '2023-07-30', '2023-07-22', 138),
    (2187, '2023-07-24', '2023-07-27', 84),
    (7225, '2023-07-25', '2023-07-25', 128),
    (5621, '2023-07-27', '2023-07-23', 147),
    (1752, '2023-07-20', '2023-07-23', 131),
    (5319, '2023-07-23', '2023-07-18', 48),
    (7954, '2023-07-20', '2023-07-19', 129),
    (7001, '2023-07-16', '2023-07-20', 76),
    (7245, '2023-07-27', '2023-07-23', 44),
    (2970, '2023-07-15', '2023-07-23', 45),
    (5010, '2023-07-16', '2023-07-23', 109),
    (8723, '2023-07-16', '2023-07-22', 52),
    (5499, '2023-07-25', '2023-07-26', 73),
    (8848, '2023-07-26', '2023-07-27', 144),
    (1570, '2023-07-28', '2023-07-20', 119),
    (2904, '2023-07-23', '2023-07-18', 137),
    (8923, '2023-07-30', '2023-07-17', 88),
    (2392, '2023-07-27', '2023-07-19', 130),
    (1495, '2023-07-18', '2023-07-29', 26);


/* ORDINE MANCANO GLI ID DI PAGAMENTO E DI SPEDIZIONE*/
insert into Ordine 
    (Id, DataOrdine, Pagamento, Spedizione) 
values 
    (8982, '2023-05-25', , ),
    (5893, '2023-04-13', , ),
    (4545, '2023-06-19', , ),
    (1676, '2023-04-10', , ),
    (6071, '2023-06-15', , ),
    (2137, '2023-05-18', , ),
    (1161, '2023-05-06', , ),
    (3832, '2023-04-02', , ),
    (7323, '2023-05-16', , ),
    (2683, '2023-04-30', , ),
    (2277, '2023-04-18', , ),
    (2907, '2023-04-28', , ),
    (8551, '2023-05-11', , ),
    (5642, '2023-05-15', , ),
    (5108, '2023-05-27', , );

CREATE TABLE Destinatario
(
    Utente INT NOT NULL,
    Spedizione INT NOT NULL,
    PRIMARY KEY(Utente, Tracking),
    FOREIGN KEY(Utente) REFERENCES Utente(Id_Utente) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY(Spedizione) REFERENCES Spedizione(Id_Spedizione) ON DELETE CASCADE ON UPDATE SET NULL
);