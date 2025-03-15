## Assign a rank to employees based on their salary within each department.

SELECT department_id, employee_id, salary, 
RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM hr.employees;

##Find the top 3 highest-paid employees in each department.
select employee_id,department_id,salary
from (
   select employee_id,department_id,salary, 
         rank() over (partition by department_id order by salary desc)as salary_rank
   from hr.employees
)where salary_rank <=3

## Identify the second highest salary in each department using DENSE_RANK().

SELECT department_id, employee_id, salary
FROM (
    SELECT department_id, employee_id, salary, 
           DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM hr.employees
) WHERE salary_rank = 2;

## Compute the cumulative total salary of employees ordered by hire date.
SELECT employee_id, hire_date, salary, 
       SUM(salary) OVER (ORDER BY hire_date) AS cumulative_salary
FROM hr.employees;

## Assign a row number to each employee in each department.
select  department_id,employee_id,
       row_number() over (partition by department_id order by employee_id)as row_number
from hr.employees;

## Find the salary difference between each employee and the next highest-paid employee.
---lead() is used to compare the salary with next highest salary
select employee_id,salary,
      lead(salary)over(order by salary desc)-salary as salary_diff
from hr.employees

-- 12. Calculate the previous month’s salary for each employee using LAG().
select employee_id,salary,hire_date,
       lag(salary)over(partition by employee_id order by hire_date)as months_salary
from hr.employees

##Identify employees whose salaries increased over time.
---lag() is  to used for to fetch the previous salary
select employee_id,salary,hire_date,
       lag(salary)over (partition by employee_id order by hire_date)as previous_salary,
       case when salary > lag(salary)over (partition by employee_id order by hire_date)
            then 'salary increase' else  'salary decrease' end salry_trend
from hr.employees

## Find the average salary of employees who joined in each year.
select extract(year from hire_date) as hire_year,avg(salary)as average_salary
from hr.employees
group by extract(year from hire_date)
order by hire_year

##
-- 15. Count the number of employees in each job role.
select job_id,count(*)as total_employees
from hr.employees
group by job_id

 16. Find the total salary expenditure for each manager's team.
 select manager_id,sum(salary)as total_salary
 from hr.employees
 group by manager_id

 ## Find the highest-paid employee in each department.
select department_id,employee_id,salary
from (
      select department_id,employee_id,salary,
      rank() over (partition by department_id order by salary desc)as salary_rank
      from hr.employees
) where salary_rank =1 

##18. Calculate the running total of salaries for employees hired in each department
select department_id,employee_id,salary,
       sum(salary) over (partition by department_id order by hire_date)as ruuning_total
from hr.employees


-- 19. Find the employees who earn above the average salary of their department.
--To find employees who earn above the average salary of their department, you can use the AVG() function in combination with a JOIN or a subquery. here i am using sub query method
select employee_id,department_id,salary
from hr.employees e
where salary > (select avg(salary) from hr.employees where department_id = e.department_id)

-- 20. Rank employees within their department based on experience.
select employee_id,department_id,hire_date,
       rank()over (partition by department_id order by hire_date asc)as experience_rank
from hr.employees

## 21. Find the difference between each employee’s salary and the department averag
select employee_id,department_id,salary,
       salary-avg(salary)over (partition by department_id) as salary_diff
from hr.employees

## Find the department where the most employees have been hired.
select department_id,count(*)as total_hired
from hr.employees
group by department_id
order by total_hired desc
      fetch first row only


-- 23. Identify employees who were hired in the same month and year as someone else.
select employee_id,hire_date,
       count(*) over (partition by extract(year from hire_date),extract(month from hire_date))as same_month_hires
from hr.employees


-- 24. Calculate the moving average salary over the last 3 employees ordered by hire date.

--To calculate the moving average salary over the last 3 employees ordered by their hire date,
 you can use the AVG() function in combination with window functions such as OVER() 
 and ORDER BY. The window function will allow us to calculate the average salary for
  each employee considering the last 3 employees based on the hire date.

select employee_id,hire_date,salary,
         avg(salary)over( order by hire_date  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_salary
FROM hr.employees; 


ROWS BETWEEN 2 PRECEDING AND CURRENT ROW:
This part specifies the window of rows to consider for calculating the moving average.
 It means that, for each row, the average salary is calculated using the current row 
 and the two preceding rows (i.e., the last 3 employees, including the current one).

###. Find employees whose salary is greater than that of the average of their manager’s team.
---- Uses a subquery to compare employee salary with manager's team average.
select e.employee_id,e.manager_id,e.salary
from hr.employees e
where e.salary >(select avg(salary) from hr.employees where manager_id=e.manager_id)