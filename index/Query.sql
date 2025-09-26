create database advance_dbms;
use advance_dbms;

-- Q1. Clustered Index
-- i. Create a table students with id, name, and class.
-- ii. Make id the primary key.
-- iii. Insert 5 rows with different id values (not in order).

create table students( -- i.
	id int primary key, -- ii.
    name varchar(100),
    class varchar(50)
);

insert into students(id, name, class) values -- iii.
(1, "kamal", "first class"),
(2, "Jagath", "Second upper"),
(4, "Namal", "Second lower"),
(3, "Navidu", "First class"),
(5, "Appu", "First class");

-- yeah I see rows are automatically stored according to id coulumn 
-- clustured key = primary key
SELECT * FROM students; 
explain SELECT * FROM students; 


-- Q2. Non-Clustered Index
-- Create the same students table without primary key.
-- Insert 5 rows again.
-- Create a non-clustered index on name:
drop table students;

create table students( -- i.
	id int, -- ii.
    name varchar(100),
    class varchar(50)
);

insert into students(id, name, class) values -- iii.
(1, "kamal", "first class"),
(2, "Jagath", "Second upper"),
(4, "Namal", "Second lower"),
(3, "Navidu", "First class"),
(5, "Appu", "First class");

desc students;
select * from students;
create index idx_name on students(name);

EXPLAIN SELECT * FROM students WHERE name = 'Appu'; -- Fast search, becaouse it dirctly know the exact row  
EXPLAIN SELECT * FROM students WHERE id = 2; -- Slow search, becaouse it search using where & it grow through all five rows


-- Q3. UNIQUE Index
-- create a contacts table:
-- Add a UNIQUE index on email:
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100)
);
CREATE UNIQUE INDEX idx_email ON contacts(email);

desc contacts;

insert into contacts(id, first_name, last_name, phone, email) values  -- can't insert same email twice, it give error (duplicate entry).
(1, 'namal', 'sena', 0745632145, 'sen@gmail.com'),
(2, 'gam', 'lek', 0741235289, 'sen@gmail.com');


-- Q4. Composite Index
-- Create an employees table:
-- Create a composite index:
-- Insert 5 sample rows with different names.

CREATE TABLE employee (
    EID char(4) PRIMARY KEY,
    E_fname VARCHAR(50),
    E_lname VARCHAR(50),
    E_phone VARCHAR(15),
    E_email VARCHAR(100),
    Age INT
);

CREATE INDEX idx_name ON employee(E_fname, E_lname);

INSERT INTO employee (EID, E_fname, E_lname, E_phone, E_email, Age) VALUES
('E001', 'Sarath', 'Weerasinghe', '0715267893', 'abcsarath@gmail.com', 22),
('E002', 'Kamal', 'Nadhun', '0778945613', 'abckamal@gmail.com', 58),
('E003', 'Amali', 'Sadamini', '0725468134', 'abcamali@gmail.com', 45),
('E004', 'Shani', 'Arosha', '0707775552', 'abcshani@gmail.com', 25),
('E005', 'Nimesha', 'Sewwandi', '0768882225', 'abcnimesha@gmail.com', 30);

desc employee; -- this hwo MUL type only for E_fname
SHOW INDEX FROM employee; -- show all index for employee

explain SELECT * FROM employee WHERE E_fname = 'Sarath';  -- Fast access, it's used index, not used where, directly found the row
explain SELECT * FROM employee WHERE E_fname = 'Sarath' and E_lname = 'Weerasinghe';  -- Fast access, it's used index, not used where, directly found the row  
explain SELECT * FROM employee WHERE E_lname = 'Sewwandi';  -- Not Fast, it's not used index search, used where, go through all rows

