-- Write a user defined SQL function to get the customer id and full name of the customer as the output. The output should be as follows
DELIMITER //
create function customerFullName( f_name varchar(100), l_name varchar(100))
returns varchar(200)
deterministic
begin
	declare name varchar(200);
    set name =  concat(f_name, ' ', l_name);
    return name;
end //
DELIMITER ;

select customer_id, customerFullName(first_name, last_name) from customer;

-- Write a function to get the average of the salary of employees.
DELIMITER //
create function getAvg()
returns decimal(10,2)
deterministic
begin
	declare avgv decimal(9,2);
	select avg(salary) into avgv from employee;
    return avgv;
end //
DELIMITER ;

select getAvg();


-- Write a function to get the average of the salaries of employees and find the employee ID and Name whose salary is greater than or equal average salary. 
DELIMITER //
create function compareAvgAndEmpSalary(salary decimal(9,2))
returns int
deterministic
begin
	declare val boolean;
    if salary > getAvg() then
		set val = true;
	else
		set val = false;
    end if;
    return val;
end //
DELIMITER ;

select  name, salary, getAvg() from employee where compareAvgAndEmpSalary(salary) = true;

-- Create a user defined scalar SQL function to  compute the total price for a detail line in an 
-- order based on the quantity ordered, the standard unit price for the item, and any discount 
-- applied to the standard unit price for the line item within the order. 
DELIMITER //
create function totalPrice(id int)
returns decimal(10,2)
deterministic
begin
	declare total decimal(10,2);
    declare unit_price decimal(9,2);
    declare discount decimal(9,2);
    declare qunt int;
    
    select q.unit_price, q.discount, q.quantity into unit_price, discount, qunt from OrderDetails q where q.detail_id = id;
    
    set total = (unit_price * qunt) - (unit_price * qunt) * discount;
    
    return total;
end //
DELIMITER ;

select o.detail_id, (o.unit_price * o.quantity) as 'original price', o.discount as 'discount',  totalPrice(o.detail_id) as 'total price' from OrderDetails o;

-- Create a function to get all the customers’ details where state is New York.
DELIMITER //
create function stateIs(id int, name varchar(2))
returns boolean
deterministic
begin
	declare st varchar(2);
    declare v boolean;
	select state into st from customer where customer_id = id;
    if st = name then
		set v = true;
    else 
		set v = false;
    end if;
    return v;
end //
DELIMITER ;

select * from customer where stateIs(customer_id, 'NY') is true;


-- Write table-valued function that returns a list of customers including customer first name, 
-- street, city for a specific zip code. 
DELIMITER //
create function checkZipCode(id int, zip varchar(5))
returns boolean
deterministic
begin
	declare st varchar(5);
    declare v boolean;
	select zip_code into st from customer where customer_id = id;
    if st = zip then
		set v = true;
    else 
		set v = false;
    end if;
    return v;
end //
DELIMITER ;

select first_name, street, city from customer where checkZipCode(customer_id, '11378') is true;


-- Write table-valued function that returns a list of employees including name, salary for a 
-- specific ID value.
