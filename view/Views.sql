-- Create a view named staff_details that shows l_id, l_name, l_desig, and l_salary of all academic staff.
create view staff_details as
select  l_id, l_name, l_desig, l_salary from academic_staff;

select * from staff_details;

-- Write a view department_heads to display each department’s d_id, d_name, and the name of its head (join department with academic_staff).
create view department_heads as
select d.d_id, d.d_name, a.l_name 
from department d inner join academic_staff a 
on d.d_head = a.l_id; 

select * from department_heads;

-- Build a view project_summary that lists pr_id, pr_name, and pr_budget for all projects.
create view project_summary as 
select pr_id, pr_name, pr_budget from project;

select * from project_summary;

-- Create a view high_salary_staff to show the l_name and l_salary of all staff whose salary is above 45,000.
create view high_salary_staff as
select l_name, l_salary from academic_staff
where l_salary > 45000;

select * from high_salary_staff;

-- Make a view project_with_supervisors that displays pr_id, pr_name, pr_budget, and the supervisor’s name.
create view project_with_supervisors as
select p.pr_id, p.pr_name, p.pr_budget, a.l_name
from project p inner join academic_staff a 
on p.pr_supervisor = a.l_id;

select * from project_with_supervisors;

-- Write a view dept_with_projects that shows each department name and the number of projects owned by it.
create view dept_with_projects as 
select d.d_name, count(p.pr_d_id) as 'no. of projects' 
from project p inner join department d 
on d.d_id = p.pr_d_id group by pr_d_id;

select * from dept_with_projects;

-- Create a view researchers_eagleeye to list the names of all staff working on the project “Eagle Eye.”
create view researchers_eagleeye as
select a.l_name 
from work w 
inner join project p on p.pr_id = w.w_pr_id 
inner join academic_staff a on a.l_id = w.w_l_id 
where p.pr_name = "Eagle Eye";

select * from researchers_eagleeye;

-- Build a view staff_project_info that shows lecturer name, designation, project name, and project budget (use work, academic_staff, and project).
create view staff_project_info as 
select a.l_name, a.l_desig, p.pr_name, p.pr_budget from project p inner join academic_staff a on p.pr_supervisor = a.l_id;

select * from staff_project_info;

-- Create a view multi_project_staff that lists staff members who work on more than one project (show their name and total project count).
create view multi_project_staff as 
select count(w.w_l_id) as 'project count > 1', a.l_name from work w inner join academic_staff a on a.l_id = w.w_l_id group by w_l_id having count(w_l_id)>1;

select * from multi_project_staff;

-- Define a view all_projects (like in the practical) to display pr_id, pr_name, pr_budget, and the owning department name.
create view all_projects as
select p.pr_id, p.pr_name, p.pr_budget, d.d_name 
from project p inner join department d on p.pr_d_id = d.d_id;

select * from all_projects;


-- Make a view grant_details to show pr_id, pr_name, pr_budget, and calculated “university grant” (70% of budget).
create view grant_details as 
select p.pr_id, p.pr_name, p.pr_budget, (p.pr_budget * 0.70) as 'university grant' from project p;

select * from  grant_details;

-- Design a view dept_salary_summary showing each department, total salary paid to its staff, and average allowance.
create view dept_salary_summary as
 select l_d_id, sum(l_allowance) as 'total', avg(l_allowance) as 'Avg' from academic_staff group by l_d_id;
 
 select * from dept_salary_summary;
 
 
--  Write a view staff_with_allowance_rank that displays staff name, allowance, and a ranking of allowances (highest to lowest).
CREATE VIEW staff_with_allowance_rank AS
SELECT
    l_name AS staff_name,
    l_allowance AS allowance,
    RANK() OVER (ORDER BY l_allowance DESC) AS allowance_rank
FROM academic_staff;

 
 