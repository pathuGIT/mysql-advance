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



