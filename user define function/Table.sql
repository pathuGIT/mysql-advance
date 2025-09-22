create database advance_dbms;
use advance_dbms;

create table customer(
	customer_id int auto_increment primary key,
    first_name varchar(100),
    last_name varchar(100),
    phone char(10),
    email varchar(200),
    street varchar(250),
    city varchar(200),
    state char(2),
    zip_code varchar(5)
);

INSERT INTO customer (first_name, last_name, phone, email, street, city, state, zip_code) VALUES
('Miriam',      'Baker',     NULL,               'miriam.baker@hotmail.com',      '90 Studebaker St.',       'Uniondale',      'NY', 11553),
('Jeanie',      'Kirkland',  NULL,               'jeanie.kirkland@aol.com',      '7643 Old Theatre St.',    'Santa Clara',    'CA', 95050),
('Marquerite',  'Dawson',    NULL,               'marquerite.dawson@gmail.com',  '37 Hamilton Court',       'Garland',        'TX', 75043),
('Babara',      'Ochoa',     NULL,               'babara.ochoa@aol.com',         '872 Smith Store St.',     'Scarsdale',      'NY', 10583),
('Nova',        'Hess',      NULL,               'nova.hess@msn.com',            '773 South Lafayette St.', 'Duarte',         'CA', 91010),
('Carley',      'Reynolds',  NULL,               'carley.reynolds@gmail.com',    '2 Snake Hill Drive',      'South El Monte', 'CA', 91733),
('Carissa',     'Foreman',   NULL,               'carissa.foreman@msn.com',      '69C N. Ridge Rd.',        'Maspeth',        'NY', 11378),
('Genoveva',    'Tyler',     '071526381',   'genoveva.tyler@gmail.com',     '8121 Windfall Ave.',      'New York',       'NY', 10002),
('Deane',       'Sears',     NULL,               'deane.sears@hotmail.com',      '3 Bradford Court',        'Pittsford',      'NY', 14534),
('Karey',       'Steele',    NULL,               'karey.steele@gmail.com',       '8879 Kent Lane',          'Farmingdale',    'NY', 11735),
('Lena',        'Mills',     'NUII I',           'lena.mills@vahon.com',         '42 Homestead St',         'Woodhaven',      'NY', 11421);


create table employee(
	id int auto_increment primary key,
    name varchar(100),
    age int,
    address varchar(250),
    salary decimal(9,2)
);

INSERT INTO employee (id, name, age, address, salary) VALUES
(1, 'Ramesh',   32, 'Ahmedabad', 2000.00),
(2, 'Khilan',   25, 'Delhi',     1500.00),
(3, 'Kaushik',  23, 'Kota',      2000.00),
(4, 'Chaitali', 25, 'Mumbai',    6500.00),
(5, 'Hardik',   27, 'Bhopal',    8500.00),
(6, 'Komal',    22, 'MP',        4500.00);

-- Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100)
);

-- OrderDetails table
CREATE TABLE OrderDetails (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2),  -- discount as a percentage (e.g., 0.10 for 10%)
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Orders (order_id, order_date, customer_name) VALUES
(1, '2025-09-21', 'Miriam Baker'),
(2, '2025-09-21', 'Khilan');

INSERT INTO OrderDetails (detail_id, order_id, product_name, quantity, unit_price, discount) VALUES
(101, 1, 'Laptop',      2, 500.00, 0.10), -- 10% discount
(102, 1, 'Mouse',       5,  20.00, 0.00), -- no discount
(103, 2, 'Keyboard',    3,  45.00, 0.05); -- 5% discount



