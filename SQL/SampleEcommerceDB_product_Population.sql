INSERT INTO Users (Name, Email, Password, Seller, Iva, TradingName)
VALUES ('Utente compratore', 'compratore', 'compratore', 0, '', '');

DECLARE @Seller UNIQUEIDENTIFIER = NEWID(); 
INSERT INTO Users (Id, Name, Email, Password, Seller, Iva, TradingName)
VALUES (@Seller, 'venditore', 'venditore', 'venditore', 1, '12345678901', 'Venditore');

DECLARE @P UNIQUEIDENTIFIER;
-----------------------------------------------------------
-- CATEGORIA: ABBIGLIAMENTO (10 PRODUTI)
-----------------------------------------------------------
SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Camicia in Lino Azure', 'ModaItalia', 'Camicia estiva traspirante in lino 100% toscano.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 45.00, 20, '{"Colore": "Azzurro", "Taglia": "M"}'), (@P, 42.00, 10, '{"Colore": "Azzurro", "Taglia": "S"}'), (@P, 48.00, 5, '{"Colore": "Azzurro", "Taglia": "XL"}'),
(@P, 45.00, 15, '{"Colore": "Bianco", "Taglia": "L"}'), (@P, 45.00, 12, '{"Colore": "Nero", "Taglia": "L"}'), (@P, 45.00, 8, '{"Colore": "Verde", "Taglia": "L"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Abito da Sera Elegance', 'LussoMilano', 'Vestito lungo in seta per occasioni speciali.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 250.00, 5, '{"Colore": "Nero", "Taglia": "S"}'), (@P, 250.00, 2, '{"Colore": "Nero", "Taglia": "XS"}'), (@P, 270.00, 4, '{"Colore": "Nero", "Taglia": "XL"}'),
(@P, 260.00, 3, '{"Colore": "Rosso", "Taglia": "M"}'), (@P, 260.00, 6, '{"Colore": "Rosso", "Taglia": "S"}'), (@P, 280.00, 2, '{"Colore": "Oro", "Taglia": "M"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Giacca di Pelle Vintage', 'ArtigianiRoma', 'Vera pelle conciata al vegetale, stile anni 70.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 320.00, 8, '{"Stile": "Vintage", "Colore": "Marrone"}'), (@P, 310.00, 10, '{"Stile": "Moderno", "Colore": "Nero"}'), (@P, 350.00, 5, '{"Stile": "Vintage", "Colore": "Testa di Moro"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Pantaloni Chino Slim', 'VenetoStyle', 'Pantaloni in cotone elasticizzato per ufficio.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 55.90, 40, '{"Taglia": "42", "Colore": "Beige"}'), (@P, 55.90, 20, '{"Taglia": "40", "Colore": "Beige"}'), (@P, 55.90, 15, '{"Taglia": "46", "Colore": "Beige"}'),
(@P, 55.90, 35, '{"Taglia": "44", "Colore": "Blu"}'), (@P, 55.90, 12, '{"Taglia": "42", "Colore": "Blu"}'), (@P, 55.90, 20, '{"Taglia": "48", "Colore": "Blu"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Maglione in Cashmere', 'LussoMilano', 'Massimo calore e morbidezza per l''inverno.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 180.00, 12, '{"Materiale": "Cashmere", "Colore": "Grigio"}'), (@P, 180.00, 5, '{"Materiale": "Cashmere", "Colore": "Blu"}'), (@P, 195.00, 3, '{"Materiale": "Cashmere", "Colore": "Crema"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Cravatta in Seta', 'ModaItalia', 'Cravatta feita a mano con motivi classici.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 35.00, 50, '{"Pattern": "Pois", "Colore": "Bordeaux"}'), (@P, 35.00, 20, '{"Pattern": "Linee", "Colore": "Blu"}'), (@P, 40.00, 15, '{"Pattern": "Liscio", "Colore": "Nero"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Gonna a Pieghe Flora', 'BellaDonna', 'Gonna leggera con stampa floreale primaverile.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 65.00, 22, '{"Taglia": "M", "Stampa": "Fiori"}'), (@P, 65.00, 10, '{"Taglia": "S", "Stampa": "Fiori"}'), (@P, 65.00, 5, '{"Taglia": "L", "Stampa": "Fiori"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Cappotto in Lana', 'VenetoStyle', 'Cappotto sartoriale per temperature rigide.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 210.00, 10, '{"Taglia": "L", "Colore": "Cammello"}'), (@P, 210.00, 5, '{"Taglia": "M", "Colore": "Cammello"}'), (@P, 230.00, 3, '{"Taglia": "XL", "Colore": "Nero"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'T-shirt Grafica Roma', 'StreetArt', 'Maglietta in cotone con stampa Colosseo.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 25.00, 100, '{"Taglia": "L", "Colore": "Bianco"}'), (@P, 25.00, 50, '{"Taglia": "M", "Colore": "Bianco"}'), (@P, 25.00, 30, '{"Taglia": "S", "Colore": "Nero"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Jeans Denim Raw', 'VenetoStyle', 'Denim robusto che si adatta alla tua forma.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 85.00, 45, '{"Taglia": "34", "Lavaggio": "Scuro"}'), (@P, 85.00, 20, '{"Taglia": "32", "Lavaggio": "Scuro"}'), (@P, 85.00, 15, '{"Taglia": "36", "Lavaggio": "Chiaro"}');

-----------------------------------------------------------
-- CATEGORIA: SCARPE (10 PRODUTOS)
-----------------------------------------------------------
SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Sneakers Urbane', 'SportVeneto', 'Scarpe comode per camminare tutto il giorno.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 70.00, 60, '{"Taglia": "41", "Colore": "Grigio"}'), (@P, 70.00, 20, '{"Taglia": "40", "Colore": "Grigio"}'), (@P, 70.00, 10, '{"Taglia": "43", "Colore": "Grigio"}'),
(@P, 70.00, 50, '{"Taglia": "42", "Colore": "Bianco"}'), (@P, 70.00, 15, '{"Taglia": "44", "Colore": "Bianco"}'), (@P, 75.00, 5, '{"Taglia": "45", "Colore": "Nero"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Mocassini in Pelle', 'LussoMilano', 'Classici mocassini italiani per look formale.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 140.00, 15, '{"Pelle": "Vitello", "Colore": "Nero"}'), (@P, 145.00, 5, '{"Pelle": "Vitello", "Colore": "Marrone"}'), (@P, 160.00, 3, '{"Pelle": "Camoscio", "Colore": "Blu"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Scarponi da Trekking', 'SportVeneto', 'Suola Vibram per massima aderenza in montagna.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 190.00, 25, '{"Taglia": "43", "Impermeabile": "Sì"}'), (@P, 190.00, 10, '{"Taglia": "42", "Impermeabile": "Sì"}'), (@P, 210.00, 5, '{"Taglia": "45", "Impermeabile": "Sì"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Sandali Riviera', 'BellaDonna', 'Sandali eleganti con dettagli in oro.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 85.00, 30, '{"Taglia": "38", "Dettaglio": "Oro"}'), (@P, 85.00, 10, '{"Taglia": "37", "Dettaglio": "Oro"}'), (@P, 90.00, 5, '{"Taglia": "39", "Dettaglio": "Argento"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Stivali da Pioggia', 'OutdoorIT', 'Protezione totale con stile sotto la pioggia.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 45.00, 40, '{"Taglia": "39", "Colore": "Giallo"}'), (@P, 45.00, 20, '{"Taglia": "38", "Colore": "Giallo"}'), (@P, 45.00, 15, '{"Taglia": "40", "Colore": "Rosso"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Scarpe Running Pro', 'Velocità', 'Ammortizzazione reattiva per maratona.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 130.00, 20, '{"Taglia": "42", "Peso": "Leggero"}'), (@P, 130.00, 15, '{"Taglia": "41", "Peso": "Leggero"}'), (@P, 140.00, 10, '{"Taglia": "43", "Peso": "Ultra-Leggero"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Pantofole di Lana', 'CasaBella', 'Comfort caldo per le giornate casalinghe.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 30.00, 80, '{"Taglia": "L", "Colore": "Blu"}'), (@P, 30.00, 40, '{"Taglia": "M", "Colore": "Blu"}'), (@P, 30.00, 20, '{"Taglia": "S", "Colore": "Grigio"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Scarpe stringate Derby', 'ArtigianiRoma', 'Eleganza senza tempo in cuoio marrone.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 160.00, 12, '{"Pelle": "Cuoio", "Taglia": "41"}'), (@P, 160.00, 5, '{"Pelle": "Cuoio", "Taglia": "42"}'), (@P, 180.00, 3, '{"Pelle": "Vitello", "Taglia": "43"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Ballerine Soft Step', 'BellaDonna', 'Massima flessibilità e praticità.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 50.00, 50, '{"Taglia": "37", "Colore": "Rosa"}'), (@P, 50.00, 20, '{"Taglia": "38", "Colore": "Rosa"}'), (@P, 55.00, 15, '{"Taglia": "36", "Colore": "Nero"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Tacchi Stiletto Lux', 'LussoMilano', 'Altezza e classe per le tue serate.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 220.00, 10, '{"Altezza": "12cm", "Colore": "Rosso"}'), (@P, 220.00, 5, '{"Altezza": "12cm", "Colore": "Nero"}'), (@P, 240.00, 2, '{"Altezza": "14cm", "Colore": "Oro"}');

-----------------------------------------------------------
-- CATEGORIA: ELETTRONICA (10 PRODUTOS)
-----------------------------------------------------------
SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Cuffie Noise Cancelling', 'TecnoRoma', 'Audio ad alta fedeltà con isolamento acustico.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 299.00, 25, '{"Connettività": "Bluetooth", "Colore": "Nero"}'), (@P, 270.00, 10, '{"Connettività": "Cablato", "Colore": "Nero"}'), (@P, 320.00, 5, '{"Connettività": "Bluetooth", "Colore": "Argento"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Smartphone Vision X', 'TecnoRoma', 'Schermo OLED 6.7 pollici e tripla camera.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 899.00, 15, '{"Memoria": "256GB", "RAM": "12GB"}'), (@P, 950.00, 10, '{"Memoria": "256GB", "Colore": "Verde"}'), (@P, 999.00, 5, '{"Memoria": "256GB", "RAM": "16GB"}'),
(@P, 1050.00, 10, '{"Memoria": "512GB", "RAM": "16GB"}'), (@P, 1100.00, 5, '{"Memoria": "512GB", "Colore": "Oro"}'), (@P, 1250.00, 2, '{"Memoria": "1TB", "RAM": "16GB"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Macchina Espresso Auto', 'CaffèElite', 'Caffè perfetto premendo un solo tasto.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 450.00, 18, '{"Pressione": "19 bar", "Serbatoio": "2L"}'), (@P, 420.00, 5, '{"Pressione": "15 bar", "Serbatoio": "1.5L"}'), (@P, 499.00, 3, '{"Pressione": "20 bar", "Colore": "Cromo"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Tablet Graphix 12', 'TecnoRoma', 'Ideale per artisti digitali e designer.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 600.00, 30, '{"Schermo": "12 pollici", "Stilo": "Incluso"}'), (@P, 550.00, 10, '{"Schermo": "10 pollici", "Stilo": "Incluso"}'), (@P, 750.00, 5, '{"Schermo": "12 pollici", "Memoria": "512GB"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Smartwatch Active', 'VibraTech', 'Monitoraggio battito cardiaco e GPS integrato.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 199.00, 45, '{"Cinturino": "Gomma", "Colore": "Verde"}'), (@P, 199.00, 20, '{"Cinturino": "Gomma", "Colore": "Nero"}'), (@P, 220.00, 10, '{"Cinturino": "Pelle", "Colore": "Marrone"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Altoparlante Vintage BT', 'SuonoPuro', 'Design retrò con tecnologia moderna Bluetooth.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 120.00, 22, '{"Materiale": "Legno", "Watt": "40W"}'), (@P, 100.00, 15, '{"Materiale": "Plastica", "Watt": "20W"}'), (@P, 150.00, 8, '{"Materiale": "Legno", "Watt": "60W"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Laptop Workstation P1', 'TecnoRoma', 'Potenza pura per montaggio video e 3D.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 2500.00, 5, '{"CPU": "i9", "GPU": "RTX 4080"}'), (@P, 2200.00, 3, '{"CPU": "i7", "GPU": "RTX 4070"}'), (@P, 2999.00, 2, '{"CPU": "i9", "GPU": "RTX 4090"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Robot Aspirapolvere Z1', 'CasaFutura', 'Mappatura laser e pulizia automatica.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 350.00, 20, '{"Autonomia": "120min", "App": "Sì"}'), (@P, 320.00, 10, '{"Autonomia": "90min", "App": "No"}'), (@P, 450.00, 5, '{"Autonomia": "180min", "Moppa": "Sì"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Fotocamera Mirrorless S3', 'OtticaRoma', 'Cattura ogni dettaglio con il sensore full frame.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 1800.00, 7, '{"Megapixel": "42", "Video": "4K"}'), (@P, 1600.00, 3, '{"Megapixel": "24", "Video": "4K"}'), (@P, 2100.00, 2, '{"Megapixel": "42", "Obiettivo": "50mm"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Powerbank Solar Max', 'VibraTech', 'Ricarica i tuoi dispositivi ovunque con il sole.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 45.00, 150, '{"Capacità": "20000mAh", "Pannello": "Sì"}'), (@P, 35.00, 80, '{"Capacità": "10000mAh", "Pannello": "Sì"}'), (@P, 55.00, 40, '{"Capacità": "20000mAh", "Colore": "Arancio"}');

-----------------------------------------------------------
-- CATEGORIA: CASA E CUCINA (10 PRODUTOS)
-----------------------------------------------------------
SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Set Coltelli Chef', 'AcciaioPuro', 'Lame giapponesi per tagli millimetrici.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 125.00, 30, '{"Pezzi": "5", "Acciaio": "VG10"}'), (@P, 100.00, 15, '{"Pezzi": "3", "Acciaio": "VG10"}'), (@P, 180.00, 10, '{"Pezzi": "7", "Manico": "Legno"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Lampada da Terra Minimal', 'LuceDesign', 'Illuminazione LED soffusa per il soggiorno.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 89.00, 20, '{"Altezza": "160cm", "Dimmer": "Sì"}'), (@P, 79.00, 10, '{"Altezza": "140cm", "Dimmer": "No"}'), (@P, 110.00, 5, '{"Altezza": "180cm", "Colore": "Nero"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Padella Antiaderente 28cm', 'CucinaForte', 'Rivestimento in pietra per cucina senza grassi.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 40.00, 55, '{"Diametro": "28cm", "Induzione": "Sì"}'), (@P, 35.00, 30, '{"Diametro": "24cm", "Induzione": "Sì"}'), (@P, 45.00, 15, '{"Diametro": "32cm", "Induzione": "No"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Vaso in Ceramica Blu', 'ArteTerra', 'Fatto a mano da artigiani siciliani.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 75.00, 10, '{"Altezza": "30cm", "Stile": "Siciliano"}'), (@P, 60.00, 5, '{"Altezza": "20cm", "Stile": "Siciliano"}'), (@P, 90.00, 3, '{"Altezza": "40cm", "Colore": "Giallo"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Specchio Cornice Oro', 'LussoMilano', 'Aggiungi un tocco regale alla tua camera.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 150.00, 5, '{"Dimensione": "80x120cm", "Cornice": "Barocca"}'), (@P, 130.00, 3, '{"Dimensione": "60x90cm", "Cornice": "Barocca"}'), (@P, 180.00, 2, '{"Dimensione": "100x150cm", "Cornice": "Moderna"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Diffusore di Aromi Zen', 'CasaBella', 'Umidificatore con luci cromoterapia.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 35.00, 60, '{"Capacità": "500ml", "Timer": "Sì"}'), (@P, 25.00, 30, '{"Capacità": "300ml", "Timer": "No"}'), (@P, 45.00, 15, '{"Capacità": "1L", "Colore": "Legno"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Coperta in Pile Morbida', 'CasaBella', 'Ideale per le serate davanti alla TV.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 25.00, 100, '{"Misura": "Matrimoniale", "Colore": "Grigio"}'), (@P, 20.00, 50, '{"Misura": "Singolo", "Colore": "Grigio"}'), (@P, 25.00, 30, '{"Misura": "Matrimoniale", "Colore": "Blu"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Orologio da Parete Loft', 'LuceDesign', 'Stile industriale con ingranaggi a vista.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 60.00, 15, '{"Diametro": "50cm", "Stile": "Industrial"}'), (@P, 45.00, 10, '{"Diametro": "30cm", "Stile": "Industrial"}'), (@P, 75.00, 5, '{"Diametro": "60cm", "Colore": "Rame"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Set 6 Calici Vino', 'SuonoPuro', 'Cristallo sottile per degustazione professionale.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 48.00, 40, '{"Materiale": "Cristallo", "Volume": "450ml"}'), (@P, 40.00, 20, '{"Materiale": "Vetro", "Volume": "400ml"}'), (@P, 60.00, 15, '{"Materiale": "Cristallo", "Volume": "600ml"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Sedia Scrivania Ergonomica', 'CasaFutura', 'Supporto lombare regolabile per smart working.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 185.00, 12, '{"Colore": "Nero", "Materiale": "Mesh"}'), (@P, 210.00, 5, '{"Colore": "Grigio", "Materiale": "Tessuto"}'), (@P, 170.00, 8, '{"Colore": "Nero", "Materiale": "Plastica"}');

-----------------------------------------------------------
-- CATEGORIA: ACCESSORI E ALTRO (10 PRODUTOS)
-----------------------------------------------------------
SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Occhiali Aviator Classic', 'OtticaRoma', 'Lenti polarizzate con montatura ultraleggera.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 110.00, 30, '{"Lente": "Polarizzata", "Montatura": "Metallo"}'), (@P, 90.00, 15, '{"Lente": "Standard", "Montatura": "Metallo"}'), (@P, 130.00, 10, '{"Lente": "Specchio", "Montatura": "Oro"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Portafoglio in Vera Pelle', 'ArtigianiRoma', 'Sottile ma capiente, con protezione RFID.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 55.00, 45, '{"Colore": "Nero", "Scomparti": "8"}'), (@P, 55.00, 20, '{"Colore": "Marrone", "Scomparti": "8"}'), (@P, 45.00, 15, '{"Colore": "Nero", "Scomparti": "4"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Valigia Rigida Grande', 'OutdoorIT', 'Ruote multidirezionali e chiusura TSA.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 130.00, 20, '{"Capacità": "90L", "Colore": "Argento"}'), (@P, 110.00, 10, '{"Capacità": "60L", "Colore": "Argento"}'), (@P, 150.00, 5, '{"Capacità": "110L", "Colore": "Blu"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Cintura Cuoio Marrone', 'ModaItalia', 'Cintura classica con fibbia in ottone.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 40.00, 60, '{"Lunghezza": "115cm", "Materiale": "Cuoio"}'), (@P, 40.00, 30, '{"Lunghezza": "100cm", "Materiale": "Cuoio"}'), (@P, 45.00, 20, '{"Lunghezza": "125cm", "Materiale": "Cuoio"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Ombrello Antivento Pro', 'OutdoorIT', 'Apertura automatica e estrutura rinforzata.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 30.00, 70, '{"Diametro": "120cm", "Colore": "Blu"}'), (@P, 25.00, 30, '{"Diametro": "100cm", "Colore": "Nero"}'), (@P, 35.00, 20, '{"Diametro": "130cm", "Colore": "Verde"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Profumo "Notte Mediterranea"', 'BellaDonna', 'Fragranza fresca con note di agrumi e mare.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 95.00, 25, '{"Formato": "100ml", "Tipo": "Eau de Parfum"}'), (@P, 60.00, 15, '{"Formato": "50ml", "Tipo": "Eau de Parfum"}'), (@P, 120.00, 5, '{"Formato": "150ml", "Tipo": "Eau de Parfum"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Guanti in Pelle Guida', 'Velocità', 'Presa perfetta per a guida sportiva.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 65.00, 15, '{"Taglia": "XL", "Colore": "Nero"}'), (@P, 65.00, 10, '{"Taglia": "L", "Colore": "Nero"}'), (@P, 70.00, 5, '{"Taglia": "M", "Colore": "Marrone"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Borsa Messaggero Tela', 'StreetArt', 'Pratica e resistente para studenti.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 45.00, 50, '{"Materiale": "Canvas", "Colore": "Kaki"}'), (@P, 45.00, 25, '{"Materiale": "Canvas", "Colore": "Nero"}'), (@P, 50.00, 15, '{"Materiale": "Pelle", "Colore": "Marrone"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Portachiavi in Argento', 'LussoMilano', 'Dettaglio di lusso per as tue chiavi.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 80.00, 10, '{"Materiale": "Argento 925", "Peso": "20g"}'), (@P, 70.00, 5, '{"Materiale": "Argento 925", "Peso": "15g"}'), (@P, 100.00, 3, '{"Materiale": "Oro 18k", "Peso": "10g"}');

SET @P = NEWID();
INSERT INTO Products (Id, Name, Brand, Description, SellerId) VALUES (@P, 'Cappello di Feltro', 'ModaItalia', 'Stile fedora classico per l''autunno.', @Seller);
INSERT INTO StockKeepingUnits (ProductId, Price, Stock, Features) VALUES 
(@P, 75.00, 18, '{"Colore": "Antracite", "Taglia": "58"}'), (@P, 75.00, 10, '{"Colore": "Nero", "Taglia": "56"}'), (@P, 85.00, 5, '{"Colore": "Marrone", "Taglia": "60"}');