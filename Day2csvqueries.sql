---------------------------------------
-- Import CSV into an appropriate table

create table Sample1(
	id varchar(50),
    Gender varchar(25),
    Age int,
    Driving_license varchar(50),
    Region_Code float,
    Previously_Insured varchar(50),
    Vehicle_Age varchar(5),
    Vehicle_Damage varchar(50),
    Annual_Premium float, 
    Policy_Sales_Channel float,
    Vintage int,
    Response varchar(50)
);

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL infile 'C:\\Users\\payal\\Downloads\\assgn_day2_healthinsurance_crosssell\\train.csv'
INTO TABLE Sample1 

CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
-------------------------------------------

select * from csv;

-------------------------------------------
-- Queries before index

SELECT * FROM Sample1 WHERE id = 10
SELECT * FROM Sample1 WHERE Gender = 'Male'
SELECT * FROM Sample1 WHERE Age > 40;

--------------------------------------------
-- queries after indexing

CREATE INDEX generidx
ON Sample1 (gender);
SELECT * FROM Sample1 WHERE Gender = 'Male'
CREATE INDEX idx
ON Sample1 (id);
SELECT * FROM csv WHERE id = 10

-----------------------------------------
-- Write a query to fetch the count of Male whose Response = 1 and Female whose Response = 1 (using Group By)

SELECT COUNT(Response), Gender
FROM Sample1
where response=1
GROUP BY Gender;

-----------------------------------------
--  Write a query to fetch the count of Male, Female whose responses were 0/1. (using Group By)

SELECT COUNT(Response), Gender, response
FROM Sample1
where response=1 or response=0
GROUP BY Gender,Response;

-----------------------------------------
-- Write a query to fetch the break-up of rows count in all values of Vehicle_Age\

SELECT *
FROM Sample1
GROUP BY Vehicle_Age;

------------------------------------------
-- What is the average age of males who responded 1?

SELECT AVG(age),Gender,response
from Sample1 
where gender='male' and response=1;

--------------------------------------------
-- What is the average age of males who responded 1?

SELECT MAX(Annual_premium),Gender,response
from Sample1 
where gender='female' and response=1;