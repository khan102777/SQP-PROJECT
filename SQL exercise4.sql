use khan;


CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
 
 select*from movies;
 select*from movietheaters;
 
 /*q4.1*/
 select title from movies;
 
 /*q4.2*/
 select distinct ifnull(rating,"") from movies;
 
 /*q4.3*/
 select title from movies
 where rating  is null;
 
 /*q4.4*/
 select name from movietheaters
 where movie  is null;
 
 /*q4.5*/
 SELECT * from movies left join movietheaters
 on movies.code = movietheaters.movie;
 
 /*q4.6*/
SELECT * from movies left join movietheaters
 on movies.code = movietheaters.movie
 where movietheaters.movie is not null;
 
 SELECT *
   FROM MovieTheaters RIGHT JOIN Movies
   ON MovieTheaters.Movie = Movies.Code;

 
 /*q4.7*/
 select title from movies left join movietheaters
 ON MovieTheaters.Movie = Movies.Code
 where movietheaters.movie is null;
 
 
 /*q4.8*/
 INSERT INTO Movies(code,Title,Rating) VALUES(9,'one, two, three',NULL);
 
 /*q4.9*/
 update movies
 set rating = "G" 
 where rating is null;
 
 /*q4.10*/
 delete from movietheaters
 where movie = (select code from movies where rating =  "NC-17");
 