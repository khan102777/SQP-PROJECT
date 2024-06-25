alter table khan.`cran_logs_2015-01-01` rename TO CRAN;
select*FROM CRAN;

-- 9.1 give the total number of recordings in this table
select count(IP_ID) FROM CRAN; 

-- 9.2 the number of packages listed in this table?
select count(distinct(PACKAGE)) FROM CRAN;

-- 9.3 How many times the package "Rcpp" was downloaded?
select count(PACKAGE) FROM CRAN
WHERE PACKAGE = "RCPP";

-- 9.4 How many recordings are from China ("CN")?
select count(PACKAGE) FROM CRAN
WHERE COUNTRY = "CN";

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select PACKAGE AS "PACKEGE NAME", count(PACKAGE) AS "NUMBER_OF_DOWNLOAD" FROM CRAN
group by PACKAGE
order by NUMBER_OF_DOWNLOAD asc;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select PACKAGE, ranK() OVER (ORDER BY C DESC) AS RANKING 
FROM (select PACKAGE AS PACKAGE, count(PACKAGE) AS C FROM CRAN where TIME between '09:00:00' AND '11:00:00' group by PACKAGE) AS A;

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select count(PACKAGE) from CRAN
where COUNTRY = "CN" OR COUNTRY = "JP" OR COUNTRY = "SG";

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
select COUNTRY, COUNT(PACKAGE) FROM CRAN 
group by COUNTRY
HAVING count(package)> (select count(package) FROM CRAN WHERE COUNTRY= "CN");



-- 9.9 Print the average length of the package name of all the UNIQUE packages
select PACKAGE, avg(SIZE) FROM CRAN
group by PACKAGE;

-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count)
select package, c from (select PACKAGE, c, ranK() OVER (ORDER BY C DESC) AS RANKING 
FROM (select PACKAGE AS PACKAGE, count(PACKAGE) AS C FROM CRAN where TIME between '09:00:00' AND '11:00:00' group by PACKAGE) AS A) as b
where ranking = 2;

-- 9.11 Print the name of the package whose download count is bigger than 1000.
select package, count(package) as "count" from cran
group by package
having count > 1000;

-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
SELECT 
    main_os,
    COUNT(*) AS count,
    ROUND((COUNT(*) / @total_downloads) * 100, 2) AS proportion
FROM (
    SELECT 
        SUBSTRING_INDEX(r_os, ' ', 1) AS main_os
    FROM 
        cran
) AS os_counts
GROUP BY 
    main_os
ORDER BY 
    count DESC;



