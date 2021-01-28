-- use database
USE HarryPotter;  
GO  
-- create two logins
CREATE LOGIN login1 WITH PASSWORD = 'password$1';  
CREATE LOGIN login2 WITH PASSWORD = 'password$2';  
GO  
-- create two users
CREATE USER user1 FOR LOGIN login1;  
CREATE USER user2 FOR LOGIN login2;  
GO  
-- create a table 
CREATE TABLE brands (
  brand_id int NOT NULL,
  brand_name varchar(45) NOT NULL,
  PRIMARY KEY (brand_id)
)
-- grant priviliges for user1
GRANT INSERT ON brands TO user1
-- ouput the login and user
SELECT SUSER_NAME(), USER_NAME(); 
-- change the login or user to 1
EXECUTE AS LOGIN = 'login1';
-- insert values in a table
INSERT INTO brands(brand_id,brand_name)
VALUES 
(1, 'HandM'),
(2,'attire'),
(3,'mascot'),
(4,'benniton'),
(5,'Gap');
--try deleting
DELETE FROM brands
-- output the current login and user
SELECT SUSER_NAME(), USER_NAME();  
--revert the login credentials
REVERT
-- change the login or user to 2
EXECUTE AS USER = 'user2';  
-- insert values in a table
INSERT INTO brands(brand_id,brand_name)
VALUES 
(1, 'HandM'),
(2,'attire'),
(3,'mascot'),
(4,'benniton'),
(5,'Gap');
-- output the login and user
SELECT SUSER_NAME(), USER_NAME();
--revert the login credentials
REVERT;    
-- output the login and user
SELECT SUSER_NAME(), USER_NAME();  
-- drop all the logins and users
DROP LOGIN login1;  
DROP LOGIN login2;  
DROP USER user1;  
DROP USER user2;  
GO