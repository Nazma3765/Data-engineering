##Count the number of employees in each department
 select department_id,count(*)as total_employees 
 from hr.employees 
 group by department_id

 ##Find the average salary in each department
 select department_id,avg(salary)as average_salary 
 from hr.employees 
 group by department_id

 ##Find the maximum and minimum salary in each department
select department_id,max(salary)as max_salary,min(salary)as min_salary 
from hr.employees 
group by department_id

##4. Find the total salary paid in each department
-----department wise total salary of all employees
select department_id,sum(salary)as total_salary 
from hr.employees 
group by department_id

## 5. Count the number of employees in each job role
---it count the number of employee who have same job_id
select job_id,count(*)as total_employees 
from hr.employees 
group by job_id

## 6. Find the average salary for each job role
---average salary for employees in each job_id
select job_id,avg(salary)as average_salary 
from hr.employees 
group by job_id

##Find the maximum salary for each job role
--maximum salary for employees in each job_id
select job_id,max(salary)as max_salary 
from hr.employees 
group by job_id

##. Find the minimum salary for each job role
--minimum salary for employees in each job_id
select job_id,min(salary)as min_salary 
from hr.employees 
group by job_id

## Find the total salary paid for each job role
select job_id,sum(salary)as total_salary 
from hr.employees 
group by job_id


-- 10. Count the number of employees hired in each year
select extract(year from hire_date)as hire_year ,count(*) as total_employee 
from hr.employees  
group by extract(year from hire_date) 
order by hire_year

--11. Find the total salary paid in each location
SELECT d.location_id, SUM(e.salary) AS total_salary
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.location_id;

## 12. Find the number of employees in each manager's team
select manager_id,count(*)as team_size
from hr.employees
where manager_id is not null
group by manager_id

##13. Find the highest salary for each manager
select manager_id,max(salary)as max_salary
from hr.employees
where manager_id is not null 
group by manager_id

##14. Find the average salary for each manager's team
select manager_id,avg(salary)as avg_salary
from hr.employees 
where manager_id is not null 
group by manager_id
 
## 15. Count the number of employees hired in each month of the year
select extract(month from hire_date)as hire_month,count(*)as total_hired
from hr.employees
group by extract (month from hire_date)
order by hire_month

## 16. Find the department with the highest total salary
--- department wise total salary ,sorting in descending order
select department_id,sum(salary)as total_salary
from hr.employees
group by department_id
order by total_salary desc

## 17. Find the job role with the highest average salary
select job_id,avg(salary)as avg_salary
from hr.employees
group by job_id
order by avg_salary desc

## 18. Find the number of employees in each city
select l.city ,count(*)as total_employees
from hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.locations l ON d.location_id = l.location_id
GROUP BY l.city;

## Find the number of employees who have a commission, grouped by department
select department_id,count(*)as employees_with_commission
from hr.employees
where commission_pct is not null
group by department_id

##- 20. Find the sum of salaries for employees who have a commission, grouped by department
select department_id,sum(salary)as  total_salary_with_commission
from hr.employees
where commission_pct is not null
group by department_id





sh.sales table

##- 1. Count the number of sales transactions for each product. 
SELECT prod_id, COUNT(*) AS transaction_count
FROM sh.sales
GROUP BY prod_id
ORDER BY transaction_count DESC;

## Find the average sale amount for each product. 
SELECT prod_id, AVG(amount_sold) AS avg_amount_sold
FROM sh.sales
GROUP BY prod_id
ORDER BY avg_amount_sold DESC;

## Find the maximum and minimum sale amount for each product.  
SELECT prod_id, 
       MAX(amount_sold) AS max_sale_amount, 
       MIN(amount_sold) AS min_sale_amount
FROM sh.sales
GROUP BY prod_id
ORDER BY max_sale_amount DESC;

##Find the total revenue generated by each product.
--product wise total revenue  
SELECT prod_id, SUM(amount_sold) AS total_revenue
FROM sh.sales
GROUP BY prod_id
ORDER BY total_revenue DESC;

## Count the number of sales transactions for each customer.
--customer_id wise transcation count
SELECT cust_id, COUNT(*) AS transaction_count
FROM sh.sales
GROUP BY cust_id
ORDER BY transaction_count DESC;

##  Find the average sale amount per customer.
SELECT cust_id, AVG(amount_sold) AS avg_sale_amount
FROM sh.sales
GROUP BY cust_id
ORDER BY avg_sale_amount DESC;

## Find the highest purchase amount for each customer.
SELECT cust_id, MAX(amount_sold) AS highest_purchase
FROM sh.sales
GROUP BY cust_id
ORDER BY highest_purchase DESC;

##. Find the lowest purchase amount for each customer
select cust_id,min(amount_sold)as lowest_purchase
from sh.sales
group by cust_id
order by lowest_purchase desc