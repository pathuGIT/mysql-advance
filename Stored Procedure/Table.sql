create database advance_dbms;
use advance_dbms;

-- Create the employee table
CREATE TABLE employee (
    EID char(4) PRIMARY KEY,
    E_fname VARCHAR(50),
    E_lname VARCHAR(50),
    E_phone VARCHAR(15),
    E_email VARCHAR(100),
    Age INT
);

-- Insert records
INSERT INTO employee (EID, E_fname, E_lname, E_phone, E_email, Age) VALUES
('E001', 'Sarath', 'Weerasinghe', '0715267893', 'abcsarath@gmail.com', 22),
('E002', 'Kamal', 'Nadhun', '0778945613', 'abckamal@gmail.com', 58),
('E003', 'Amali', 'Sadamini', '0725468134', 'abcamali@gmail.com', 45),
('E004', 'Shani', 'Arosha', '0707775552', 'abcshani@gmail.com', 25),
('E005', 'Nimesha', 'Sewwandi', '0768882225', 'abcnimesha@gmail.com', 30);
