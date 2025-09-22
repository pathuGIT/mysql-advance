-- Write a stored procedure to get all the details of all the employees.
DELIMITER //
create procedure getAllEmpss()
begin
	select * from employee;
end //
DELIMITER ;

call getAllempss();


-- Write a stored procedure to get all the details of an employee by giving employee id.
DELIMITER //
create procedure getAllEmpById(IN id char(4))
begin
	select * from employee where eid = id;
end //
DELIMITER ;

call getAllEmpById('E001');


-- Write a stored procedure to get all the details of all the departments. 
DELIMITER //
create procedure getAllDep()
begin
	select * from department;
end //
DELIMITER ;

call getAllDep();


-- Write a stored procedure to get all the details of all the roles. 
DELIMITER //
create procedure getAllRoles()
begin
	select * from role;
end //
DELIMITER ;

call getAllRoles();


-- Write a stored procedure to get all the details of all the login table. 
DELIMITER //
create procedure getAllLogin()
begin
	select * from login;
end //
DELIMITER ;

call getAllLogin();


-- Write a stored procedure to display all records of employee table whose ages are greater than 30.
DELIMITER //
create procedure getAllEmpForAgeGreadterThan(IN age_inpt int)
begin
	select * from employee where age > age_inpt;
end //
DELIMITER ;

call getAllEmpForAgeGreadterThan(30);


-- Construct a stored procedure, named usp_GetLastName, that accepts one input parameter 
-- named employee ID and returns the last name of the employee. 
DELIMITER //
create procedure usp_GetLastName(IN emp_id char(4), out lname varchar(100))
begin
	select E_lname into lname from employee where eid = emp_id;
end //
DELIMITER ;

call usp_GetLastName('e001', @lname);
select @lname;


-- Construct a stored procedure, named usp_GetFirstName that accepts one input parameter 
-- named employee ID and returns the first name of the employee. 
DELIMITER //
create procedure usp_GetFirstName(IN emp_id char(4), out fname varchar(100))
begin
	select E_fname into fname from employee where eid = emp_id;
end //
DELIMITER ;

call  usp_GetFirstName('e002', @fname);
select @fname;


-- Construct a stored procedure to get the department name of an employee belongs when the 
-- employee ID is given.
DELIMITER //
create procedure usp_empDepName(IN emp_id char(4), out dname varchar(100))
begin
	select d.name into dname 
    from employee e inner join department d 
    on e.DID = d.DID 
    where e.eid = emp_id;
end //
DELIMITER ;

call usp_empDepName('e003', @dname);
select @dname;


