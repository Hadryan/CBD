CREATE KEYSPACE test
CREATE KEYSPACE Keyspace test
CREATE KEYSPACE "TEST"
CREATE KEYSPACE tutorialspoint
WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};
CREATE KEYSPACE tutorialspoint WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};
DESCRIBE keyspaces;
CREATE KEYSPACE test
WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3 }
AND DURABLE_WRITES = false;
CREATE KEYSPACE test ... WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3 } ... AND DURABLE_WRITES = false;
CREATE KEYSPACE test
WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3 }
AND DURABLE_WRITES = false
;
CREATE KEYSPACE test ... WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3 } ... AND DURABLE_WRITES = false   ;
 CREATE KEYSPACE test
WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3 }
AND DURABLE_WRITES = false;
 CREATE KEYSPACE test WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3 } AND DURABLE_WRITES = false;
SELECT * FROM system.schema_keyspaces;
USE tutorialspoint;
CLEAR
ALTER KEYSPACE tutorialspoint
WITH replication = {'class':'NetworkTopologyStrategy', 'replication_factor' : 3};
ALTER KEYSPACE tutorialspoint WITH replication = {'class':'NetworkTopologyStrategy', 'replication_factor' : 3};
ALTER KEYSPACE tutorialspoint
WITH replication = {'class':'NetworkTopologyStrategy', 'replication_factor' : 3};
SELECT * FROM system.schema_keyspaces;
ALTER KEYSPACE test
WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3}
AND DURABLE_WRITES = true;
ALTER KEYSPACE test WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3} AND DURABLE_WRITES = true;
SELECT * FROM system.schema_keyspaces;
SELECT * FROM TEST;
SELECT * FROM TUTORIALSPOINT;
DROP KEYSPACE tutorialspoint;
DESCRIBE keyspaces;
 CREATE KEYSPACE test
WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3}
AND DURABLE_WRITES = true;
 CREATE KEYSPACE test WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3} AND DURABLE_WRITES = true;
USE TEST
EXIT
use test;
create table pessoa(
use tutorialspoint;
create KEYSPACE tutorialspoint
;
create KEYSPACE tutorialspoint ;
create KEYSPACE tutorialspoint;
create KEYSPACE tutorialspoint
WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3}
AND DURABLE_WRITES = true;
create KEYSPACE tutorialspoint WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3} AND DURABLE_WRITES = true;
use tutorialspoint ;
CREATE TABLE emp(
   emp_id int PRIMARY KEY,
   emp_name text,
   emp_city text,
   emp_sal varint,
   emp_phone varint
   );
CREATE TABLE emp(    emp_id int PRIMARY KEY,    emp_name text,    emp_city text,    emp_sal varint,    emp_phone varint    );
select * from emp;
ALTER TABLE emp
ADD emp_email text;
ALTER TABLE emp ADD emp_email text;
select * from emp;
ALTER TABLE emp DROP emp_email;
select * from emp;
DROP TABLE emp;
DESCRIBE COLUMNFAMILIES;
CREATE TABLE emp(
   emp_id int PRIMARY KEY,
   emp_name text,
   emp_city text,
   emp_sal varint,
   emp_phone varint
   );
CREATE TABLE emp(    emp_id int PRIMARY KEY,    emp_name text,    emp_city text,    emp_sal varint,    emp_phone varint    );
INSERT INTO emp (emp_id, emp_name, emp_city,
   emp_phone, emp_sal) VALUES(1,'ram', 'Hyderabad', 9848022338, 50000);
INSERT INTO emp (emp_id, emp_name, emp_city,    emp_phone, emp_sal) VALUES(1,'ram', 'Hyderabad', 9848022338, 50000);
INSERT INTO emp (emp_id, emp_name, emp_city,
   emp_phone, emp_sal) VALUES(2,'robin', 'Hyderabad', 9848022339, 40000);
INSERT INTO emp (emp_id, emp_name, emp_city,    emp_phone, emp_sal) VALUES(2,'robin', 'Hyderabad', 9848022339, 40000);
INSERT INTO emp (emp_id, emp_name, emp_city,
   emp_phone, emp_sal) VALUES(3,'rahman', 'Chennai', 9848022330, 45000);
INSERT INTO emp (emp_id, emp_name, emp_city,    emp_phone, emp_sal) VALUES(3,'rahman', 'Chennai', 9848022330, 45000);
SELECT * FROM emp;
