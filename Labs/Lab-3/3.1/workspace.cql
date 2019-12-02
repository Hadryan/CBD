DROP KEYSPACE tutorialspoint;

CREATE KEYSPACE tutorialspoint
WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};

USE  tutorialspoint;

ALTER KEYSPACE tutorialspoint
WITH replication = {'class':'NetworkTopologyStrategy', 'replication_factor' : 3};

CREATE TABLE emp(
   emp_id int PRIMARY KEY,
   emp_name text,
   emp_city text,
   emp_sal varint,
   emp_phone varint
   );
ALTER TABLE emp ADD emp_email text;
ALTER TABLE emp DROP emp_email;

TRUNCATE emp;

CREATE INDEX name ON emp (emp_name);

drop index name;

BEGIN BATCH
INSERT INTO emp (emp_id, emp_city, emp_name, emp_phone, emp_sal) values(  4,'Pune','rajeev',9848022331, 30000);
UPDATE emp SET emp_sal = 50000 WHERE emp_id =3;
DELETE emp_city FROM emp WHERE emp_id = 2;
APPLY BATCH;

INSERT INTO emp (emp_id, emp_name, emp_city,
   emp_phone, emp_sal) VALUES(1,'ram', 'Hyderabad', 9848022338, 50000);
INSERT INTO emp (emp_id, emp_name, emp_city,
   emp_phone, emp_sal) VALUES(2,'robin', 'Hyderabad', 9848022339, 40000);
INSERT INTO emp (emp_id, emp_name, emp_city,
   emp_phone, emp_sal) VALUES(3,'rahman', 'Chennai', 9848022330, 45000);

UPDATE emp SET emp_city='Delhi',emp_sal=50000
   WHERE emp_id=2;

select * from emp;

SELECT emp_name, emp_sal from emp;

CREATE INDEX ON emp(emp_sal);
SELECT * FROM emp WHERE emp_sal=50000;

DELETE emp_sal FROM emp WHERE emp_id=3;
DELETE FROM emp WHERE emp_id=3;

CREATE TABLE data(name text PRIMARY KEY, email list<text>);

INSERT INTO data(name, email) VALUES ('ramu',
['abc@gmail.com','cba@yahoo.com']);

UPDATE data
SET email = email +['xyz@tutorialspoint.com']
where name = 'ramu';

CREATE TABLE data2 (name text PRIMARY KEY, phone set<varint>);
INSERT INTO data2(name, phone)VALUES ('rahman',    {9848022338,9848022339});

UPDATE data2 SET phone = phone + {9848022330} where name = 'rahman';

CREATE TABLE data3 (name text PRIMARY KEY, address
map<timestamp, text>);

 INSERT INTO data3 (name, address)
   VALUES ('robin', {'home' : 'hyderabad' , 'office' : 'Delhi' } );

UPDATE data3
SET address = address+{'office':'mumbai'}
WHERE name = 'robin';

select * from data3;

CREATE TYPE tutorialspoint.card_details (
   num int,
   pin int,
   name text,
   cvv int,
   phone set<int>
   );

ALTER TYPE card_details ADD email text;

ALTER TYPE card_details RENAME email TO mail;
