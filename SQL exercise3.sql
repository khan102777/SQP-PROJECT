use khan;

CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;
 
  INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

/*3.1*/ 
 select*from warehouses;
 select*from boxes;
 
 
 /*3.2*/ 
 select*from boxes
 where value > 150; 
 
 /*3.3*/
 select distinct contents from boxes;
 
 /*3.4*/ 
 select contents, avg(value) from boxes
 group by contents;
 
 /*3.5*/ 
 select warehouse, avg(value) from boxes
 group by warehouse
 order by warehouse asc;
 
  /*3.6*/ 
  select warehouse, avg(value) from boxes
 group by warehouse
 having avg(value) >150
 order by warehouse asc;
 
  
 /*3.7*/ 
 select boxes.code, warehouses.location 
 from boxes left join warehouses
 on boxes.warehouse = warehouses.code
 group by boxes.code;
 
 /*3.8*/ 
 select warehouses.code, count(boxes.code)
 from warehouses left join boxes
  on boxes.warehouse = warehouses.code
  group by warehouses.code;
 
 /*3.9*/ 
 SELECT Warehouses.Code
  FROM Warehouses JOIN Boxes 
  ON Warehouses.Code = Boxes.Warehouse
  GROUP BY Warehouses.code, Warehouses.Capacity
  HAVING Count(Boxes.code) > Warehouses.Capacity;
 
 /*3.10*/ 
 select boxes.code
 from boxes left join warehouses
 ON Warehouses.Code = Boxes.Warehouse
 where location = "chicago"
 group by boxes.code;
 
 /*3.11*/ 
 INSERT INTO Warehouses(code,Location,Capacity) VALUES(6,'New York', 3);
 
 /*3.12*/ 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES("H5RT",'Papers',200,2);
 
 
 /*3.13*/ 
 update boxes
 set value = (85/100*value);
 
 /*3.14*/ 
 delete from boxes
 where value < 100;
 
 /*3.15 pending*/ 
 delete from boxes 
 where warehouse = ( SELECT Warehouses.Code
  FROM Warehouses JOIN Boxes 
  ON Warehouses.Code = Boxes.Warehouse
  GROUP BY Warehouses.code, Warehouses.Capacity
  HAVING Count(Boxes.code) > Warehouses.Capacity);
  
  
 
 /*3.16 pending*/ 
 CREATE INDEX idx_warehouse ON boxes (Warehouse);


 /*3.17 pending*/ 
 SHOW INDEX FROM boxes;

 
 /*3.18 pending*/ 
 SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'boxes' AND COLUMN_NAME = 'Warehouse' AND REFERENCED_TABLE_NAME IS NOT NULL;

DROP INDEX idx_warehouse ON boxes;

ALTER TABLE boxes DROP FOREIGN KEY  constraint_name ;


 
 