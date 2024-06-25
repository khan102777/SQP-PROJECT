use khan;
CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name) VALUES
 (1,'Sony'),
 (2,'Creative Labs'),
 (3,'Hewlett-Packard'),
 (4,'Iomega'),
 (5,'Fujitsu'),
 (6,'Winchester');
 
 INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES
 (1,'Hard drive',240,5),
 (2,'Memory',120,6),
 (3,'ZIP drive',150,4),
 (4,'Floppy disk',5,6),
 (5,'Monitor',240,1),
(6,'DVD drive',180,2),
(7,'CD drive',90,2),
(8,'Printer',270,3),
(9,'Toner cartridge',66,3),
(10,'DVD burner',180,2);
 
 
 select*from products;
 select*from manufacturers;
 
 /*q1.1*/
 select name from products;
 
  /*q1.2*/
 select name,price from products;
 
  /*q1.3*/
 select name,price from products where price<=200;
 
  /*q1.4*/
  select name,price from products where 60<=price and 120>=price;
  select name,price from products where price>=60 and price<=120;
  select name,price from products where price between 60 and 120;
  
  /*q1.5*/
  select name,price*100 as "cents" from products;
  
  /*q1.6*/
  select avg(price) from products;
  
  /*q1.7*/
  select avg(price) from products where manufacturer=2;
  
  /*q1.8*/
  select count(name) from products where price>=180;
  
  /*q1.9*/
  select*from products where price>=180 order by price desc;
  
  /*q1.10*/
  select*from products join manufacturers
 on products.manufacturer = manufacturers.code;
  
  /*q1.11*/
  select products.name, products.price, manufacturers.name 
  from products left join manufacturers
  on  products.manufacturer = manufacturers.code;
  
  /*q1.12*/
  select manufacturers.code, avg(products.price) as "average price"
  from manufacturers left join products
   on  products.manufacturer = manufacturers.code
   group by manufacturers.code
   order by manufacturers.code asc;
   
   /*q1.13*/
    select manufacturers.name, avg(products.price) as "average price"
  from manufacturers left join products
   on  products.manufacturer = manufacturers.code
   group by manufacturers.name
   order by manufacturers.name asc;
   
   /*q1.14*/
   select name, average_price from 
   (select manufacturers.name as "name", avg(products.price) as "average_price"
  from manufacturers left join products
   on  products.manufacturer = manufacturers.code
   group by manufacturers.name
   order by manufacturers.name asc) as subquery
   where average_price >=150;
   
   select manufacturers.name as "name", avg(products.price) as "average_price"
  from manufacturers left join products
   on  products.manufacturer = manufacturers.code
   group by manufacturers.name
	having average_price >=150
   order by manufacturers.name asc;
   
   /*q1.15*/
   select name, price
   from products
   order by price asc
   limit 1;
   
   /*q1.16*/
   select manufacturers.name, products.price
   from manufacturers left join products
   on products.manufacturer = manufacturers.code
   order by products.price desc
   limit 1;
   
   /*1.17*/
   INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES
   (11, "Loudspeakers", 70, 2);
   
   /*1.18*/
   update products
   set name = "laser printer"
   where code = 8;
   
   /*1.19*/
   update products
   set price = price - (price*(10/100));
   update products
   set price = (90/100)*price;
   /*return*/
   update products
   set price = (100/90)*price;
   
   /*1.20*/
   update products
   set price = (90/100)*price
   where price >=120;
   
   
   
   
   
   
  
  
  
  
  

  





 
 
 
 
 
 
 