show databases;
create database advance_dbms;
use advance_dbms;

CREATE TABLE academic_staff(
	l_id char(3) primary key,
    l_d_id char(3),
    l_name varchar(30),
    l_desig varchar(20),
    l_salary decimal(9,2),
    l_allowance decimal(9,2)
);

insert into academic_staff(l_id, l_d_id, l_name, l_desig, l_salary, l_allowance) values
('101', 'd01', "Kasun", "Lecturer", 35000, 15000),
('102', 'd02', "Mahesh", "Senior Lecturer", 45000, 18000),
('103', 'd03', "Udaya", "Proffesor", 62000, 28000),
('104', 'd01', "Nadun", "Senior Lecturer", 45000, 20000);


CREATE TABLE department(
	d_id char(3) primary key,
    d_name varchar(5),
    d_head char(3),
    FOREIGN KEY (d_head) REFERENCES academic_staff(l_id)
);

insert into department(d_id, d_name, d_head) values
('d01', 'ICT', '104'),
('d02', 'ENT', '102'),
('d03', 'BT', '103'),
('d04', 'PQT', '101');


CREATE TABLE project(
	pr_id char(4) primary key,
    pr_d_id char(3),
    pr_name varchar(20),
    pr_supervisor char(3),
    pr_budget decimal(9,2),
    FOREIGN KEY (pr_d_id) references department(d_id),
    foreign key (pr_supervisor) references academic_staff(l_id)
);

insert into project(pr_id, pr_d_id, pr_name, pr_supervisor, pr_budget) values
('pr01', 'd01', "Eagle Eye", '101', 300000),
('pr02', 'd02', "Hill Climber", '102', 250000),
('pr03', 'd03', "Glowing Fish", '103', 400000);

create table work(
	w_pr_id char(4),
    w_l_id char(3),
    foreign key (w_pr_id) references project(pr_id),
    foreign key (w_l_id) references academic_staff(l_id)
);

insert into work(w_pr_id, w_l_id) values
('pr01', '101'),
('pr02', '101'),
('pr01', '104'),
('pr01', '104'),
('pr02', '103'),
('pr01', '103'),
('pr03', '103');



