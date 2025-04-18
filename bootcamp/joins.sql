---Retrieve employee names and their department names using INNER JOIN
select e.employee_id, e.first_name, d.department_name
from hr.EMPLOYEES e
INNER JOIN hr.DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

- 2. Retrieve all employees and their respective department names (including those without a department) using LEFT JOIN
select e.employee_id,e.first_name,d.department_name
from hr.employees e
left join hr.departments d on e.department_id = d.department_id

-- 3. Retrieve all departments and employees (including departments without employees) using RIGHT JOIN
select e.employee_id,e.first_name,d.department_name
from hr.employees e
right join hr.departments d on e.department_id = d.department_id


-- 4. Retrieve all employees and their department names using FULL OUTER JOIN
select e.employee_id,e.first_name,d.department_name
from hr.employees e
full outer join hr.departments d on e.department_id=d.department_id

-- 5. Retrieve employees who do not belong to any department using LEFT JOIN with NULL check
select e.employee_id,e.first_name
from hr.employees e
left join hr.departments d on e.department_id=d.department_id
where d.department_id is null

-- 6. Retrieve departments that have no employees using RIGHT JOIN with NULL check
select d.department_id,d.department_name
from hr.employees e
right join hr.departments d on e.department_id=d.department_id
where e.employee_id is null

--Retrieve employees along with their job title using INNER JOIN
select e.employee_id,e.first_name,j.job_id
from hr.employees e
inner join hr.jobs j on e.job_id=j.job_id

9. Retrieve employees along with the location of their department using INNER JOIn
select e.employee_id,e.first_name,d.department_name,l.city
from hr.employees e
inner join hr.departments d on e.department_id=d.department_id
inner join hr.locations l on d.location_id=l.location_id