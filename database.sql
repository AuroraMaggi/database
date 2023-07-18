-- Tabella per gli articoli
CREATE TABLE Articoli (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    PrezzoVendita SMALLINT
);

-- Tabella per i fornitori
CREATE TABLE Fornitori (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    GiorniSpedizione INT
);

-- Tabella per gli sconti dei fornitori
CREATE TABLE ScontiFornitori (
    ID INT PRIMARY KEY,
    FornitoreID INT,
    ImportoMinimo DECIMAL(10, 2),
    PercentualeSconto DECIMAL(5, 2),
    DataInizio DATE,
    DataFine DATE,
    FOREIGN KEY (FornitoreID) REFERENCES Fornitori(ID)
);

-- Tabella per il magazzino
CREATE TABLE Magazzino (
    ID INT PRIMARY KEY,
    ArticoloID INT,
    FornitoreID INT,
    Quantita INT,
    FOREIGN KEY (ArticoloID) REFERENCES Articoli(ID),
    FOREIGN KEY (FornitoreID) REFERENCES Fornitori(ID)
);

-- Tabella per gli ordini
CREATE TABLE Ordini (
    ID INT PRIMARY KEY,
    ArticoloID INT,
    FornitoreID INT,
    Quantita INT,
    ImportoTotale DECIMAL(10, 2),
    DataOrdine DATE,
    FOREIGN KEY (ArticoloID) REFERENCES Articoli(ID),
    FOREIGN KEY (FornitoreID) REFERENCES Fornitori(ID)
);

-- Inserimento dei dati relativi agli articoli, magazzino, fornitori e agli sconti dei fornitori
INSERT INTO Articoli (ID, Nome, PrezzoVendita, Quantita)
VALUES (1, 'pc', 320.00),
       (2, 'mouse', 15.90),
       (3, 'monitor', 86.00);
       
INSERT INTO Fornitori (ID, Nome, GiorniSpedizione)
VALUES (1, 'Fornitore A', 5),
       (2, 'Fornitore B', 7),
       (3, 'Fornitore C', 4);

INSERT INTO ScontiFornitori (ID, FornitoreID, ImportoMinimo, PercentualeSconto, DataInizio, DataFine)
VALUES (1, 1, 50.00, 0.1, '2023-01-01', '2023-12-31'),
       (2, 2, 100.00, 0.15, '2023-01-01', '2023-12-31'),
       (3, 2, 200.00, 0.2, '2023-01-01', '2023-12-31');

INSERT INTO Magazzino (ID, ArticoloID, FornitoreID, Quantita)
VALUES (1, 1, 1, 100),
       (2, 1, 2, 50),
       (3, 2, 1, 80),
       (4, 2, 3, 100),
       (5, 3, 2, 70),
       (6, 3, 3, 120);
