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


-- Construct a stored procedure to get the name of the role of an employee when employee ID is given.
 DELIMITER //
create procedure usp_empRole(IN emp_id char(4), out rname varchar(100))
begin
	select r.name into rname 
    from employee e inner join role r 
    on e.RID = r.RID 
    where e.eid = emp_id;
end //
DELIMITER ;

call usp_empRole('e002', @rname);
select @rname;


-- Create a stored procedure given a department ID, counts the number of employeed for that 
-- department that appear in the employee table. 
DELIMITER //
create procedure usp_ecountEmpForDep(IN dep_id int, out outs int)
begin
	select count(EID) into outs from employee where did = dep_id;
end //
DELIMITER ;

call usp_ecountEmpForDep(1, @outs);
select @outs;


-- Create a stored procedure to get the login details of a specific employee by giving employee ID. 
DELIMITER //
create procedure usp_empLogsById(IN emp_id char(4))
begin
	select l.* from login l inner join employee e on l.EID = e.eid where e.EID = emp_id; 
end //
DELIMITER ;

call usp_empLogsById('e001');


-- Get all the data given in the ‘studentMarks’ table
DELIMITER //
create procedure getAllStdntMrk()
begin
	select * from studentmarks;
end //
DELIMITER ;

call getAllStdntMrk();


-- Fetch student details by given student ID.
DELIMITER //
create procedure getStudntById(IN st_id int)
begin
	select * from studentmarks where stud_id = st_id;
end //
DELIMITER ;

call getStudntById(1);


--  Calculate the average marks of all the students from the ‘studentMarks’ table and return the
--  average as an OUT field.
DELIMITER //
CREATE PROCEDURE stdAvg(OUT avgm DECIMAL(9,2))
BEGIN
    SELECT AVG(total_marks) INTO avgm 
    FROM studentMarks;  -- make sure table name matches exactly
END //
DELIMITER ;

-- Call the procedure
CALL stdAvg(@outs);
SELECT @outs;


 -- Find the count of students who is having marks below the average marks of all the students
DELIMITER //
create procedure getCountMarkLessThanAvg(OUT s_count int)
begin
	CALL stdAvg(@outs);
	select count(stud_id) into s_count from studentmarks where total_marks < @outs;
end //
DELIMITER ;

call getCountMarkLessThanAvg(@mn);
select @mn;


-- Write a stored procedure function that takes an initial value of the counter and increment it
-- with a given number.
DELIMITER //
create procedure getCounterOfValue(IN c int, OUT s_count int)
begin
	declare n int;
    declare a int default 0;
    set n = c;
    
	count_loop: loop
		if c < 1 then
			leave count_loop;
        end if;
        
        set a = a + n;
		set c = c - 1;
    end loop count_loop;
    
    set s_count = a;
end //
DELIMITER ;

call getCounterOfValue(3,@mn);
select @mn;


-- Write a stored procedure named spGetIsAboveAverage would return a Boolean value if the student marks are above average or not.
--    Calculate the AVERAGE using the AVG function and store results in a local variable. 
--    Fetch marks for the student ID passed in the function call.
--    Compare the studentMarks with average marks and return the result as 0 or 1
DELIMITER //
create procedure spGetIsAboveAverage(IN sid int, OUT v boolean)
begin

    declare k int;
	call stdAvg(@avgm);
    select total_marks into k from studentmarks where stud_id = sid;
    
    if k > @avgm then
		set v = true;
    else	
		set v = false;
    end if;    
end //
DELIMITER ;

call spGetIsAboveAverage(11, @u);
select @u;


-- Write a stored procedurenamed spGetStudentResult – It will pass studentId as input (IN) and expect result as output (OUT) parameter.
--  Calls the first procedure spGetIsAboveAverage
--  Use the result returned from step 1) and set the result to PASS or FAIL depending on
--  the value from step 1) being 1 or 0 respectively.
DELIMITER //
create procedure spGetStudentResult(IN studentId int, OUT result varchar(10))
begin
	call spGetIsAboveAverage(studentId, @u);
    if @u is true then
		set result = "Pass";
    else 
		set result = "Fail";
   end if;
end //
DELIMITER ;

call spGetStudentResult(1, @res);
select @res;


-- write a procedure to take studentId and depending on the studentMarks we need to return the class according to the below criteria.
--  Marks >= 400 : Class – First Class
--  Marks >= 300 and Marks < 400 – Second Class
--  Marks < 300 – Failed
DELIMITER //
create procedure spGetStudentClsst(IN studentId int, OUT result varchar(15))
begin
	declare mark int;
    select total_marks into mark from studentmarks where stud_id = studentId;
    
    if mark >= 400 then
		set result = "First Class";
    elseif mark >= 300 then
		set result = "Second Class";
    else 
		set result = "Failed";
    end if;
end //
DELIMITER ;

call spGetStudentClsst(1, @res);
select @res;


-- Create a procedure spInsertStudentDataExit that would insert a record in the
-- student_marks table and have IN parameters as studentId, total_marks, and grade. 
-- Add an OUT parameter named rowCount which would return the  total count of records in the studentMarks table.
	--  A. Add the Error Handler for Duplicate Key record with Exit action i.e. if
	--  someone invokes it for inserting a record with an existing studentID, then
	--  the Error handler would be invoked and will return an appropriate error.
	--  B.  Call this Procedure with an existing student id fetch the value of rowCount
	--  (Copy and paste the output (screenshot) to your answer script.)
DELIMITER //
create procedure spInsertStudentDataExit(IN std_id int, IN total_marks int, IN grade varchar(5),  OUT rowCount int)
begin
	DECLARE EXIT HANDLER FOR 1062
    BEGIN
        -- If duplicate key occurs, set rowCount = -1 as indicator
        SET rowCount = -1;
    END;
    
	insert into studentmarks(stud_id, total_marks, grade) values (std_id, total_marks, grade);
    
    select count(stud_id) into rowCount from studentmarks;
end //
DELIMITER ;

call spInsertStudentDataExit(12, 350, "C", @res);
select @res;

-- Re-create the procedure and named it as spInsertStudentDataContinue with CON
--      TINUE action instead of EXIT for the error handler.call this procedure with an
--       existing student ID and fetch the value of the row  Count OUT parameter. (Copy
--       and paste the output (screenshot) to your answer script.)    
    
DELIMITER $$
CREATE PROCEDURE spInsertStudentData(IN studentId INT, 
IN total_marks INT, 
IN grade VARCHAR(20),
OUT rowCount INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
        SELECT 'DUPLICATE KEY ERROR' AS errorMessage;
    END;
    INSERT INTO studentmarks(stud_id, total_marks, grade) VALUES(studentId,total_marks,grade);
    SELECT COUNT(*) FROM studentmarks INTO rowCount;
END$$
DELIMITER ;

call spInsertStudentData(1,450,'A',@rowCount);
SELECT @rowCount
    