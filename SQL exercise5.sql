USE KHAN;

CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 
 
 
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);

select*FROM PROVIDERS;
select*FROM pieces;
select*from provides;

/*5.1*/
select name from pieces;

/*5.2*/
select*FROM PROVIDERS;

/*5.3*/
select piece, avg(price) from provides
group by piece; 

/*5.4*/
SELECT Providers.Name
   FROM Providers INNER JOIN Provides
          ON Providers.Code = Provides.Provider
             where Provides.Piece = 1;

/*5.5*/
select pieces.name
from pieces join provides
on pieces.code = provides.piece
where provides.provider = "HAL";


/*5.6*/
SELECT Pieces.Name, Providers.Name, Price
   FROM Pieces INNER JOIN Provides ON Pieces.Code = Piece
               INNER JOIN Providers ON Providers.Code = Provider
   WHERE Price =
   (
     SELECT MAX(Price) FROM Provides
     WHERE Piece = Pieces.Code
   );

/*5.7*/
INSERT INTO Provides VALUES (1, 'TNBC', 7);

/*5.8*/
update provides
set price = price+1;

/*5.9*/
DELETE FROM Provides
   WHERE Provider = 'RBT'
     AND Piece = 4;
     
/*5.10*/
delete FROM PROVIDES
WHERE PROVIDER = "RBT";
