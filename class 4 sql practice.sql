-- select department_id,count(*)as total_employees
-- from hr.EMPLOYEES
-- group by department_id

-- select department_id,sum(salary)as total_salary
-- from hr.EMPLOYEES
-- group by department_id

-- select department_id,avg(salary) as avg_salary
-- from hr.employees
-- group by department_id

-- select department_id,min(salary) as min_salary
-- from hr.employees
-- group by department_id

-- select department_id,max(salary) as max_salary
-- from hr.employees
-- group by department_id

-- select job_id,count(*)as total_employees
-- from hr.employees
-- group by job_id

-- select job_id,sum(salary)as total_salary
-- from hr.employees
-- group by job_id

-- select job_id,avg(salary)as avg_salary
-- from hr.employees
-- group by job_id

-- select department_id,count(*)as total_employees
-- from hr.employees
-- group by department_id
-- having count(*) >5

-- select department_id,sum(salary)as total_salary
-- from hr.employees
-- group by department_id
-- having sum(salary)>100000

-- select department_id,avg(salary)as average_salary
-- from hr.employees
-- group by department_id
-- having avg(salary)>2000

-- select department_id,max(salary)as average_salary
-- from hr.employees
-- group by department_id
-- having max(salary)>80000

-- select department_id,count(*)as employee_count
-- from hr.employees
-- group by department_id
-- having count(*)between 5 and 10

-- select department_id,variance(salary)as variance_salary
-- from hr.employees
-- group by department_id
-- having variance(salary)>50000

-- select department_id,stddev(salary)as stddev_salary
-- from hr.employees
-- group by department_id
-- having stddev_salary>2000

-- select employee_id,first_name,salary
-- from hr.employees
-- order by salary desc

-- select employee_id,first_name,department_id,salary
-- from hr.employees
-- order by department_id asc,salary desc

-- select employee_id,first_name,last_name
-- from hr.employees
-- order by last_name desc


-- select employee_id,hire_date
-- from hr.employees 
-- order by hire_date desc

-- select employee_id,commission_pct
-- from hr.employees
-- order by comission_pct,NULLS LAST

-- SELECT employee_id, first_name, commission_pct
-- FROM hr.employees
-- ORDER BY commission_pct NULLS first;

-- select employee_id,first_name
-- from hr.employees
-- order by length(first_name)asc

-- select employee_id,last_name
-- from hr.employees
-- order by substr(last_name,-2)asc

-- select employee_id,upper(first_name)as upper_name
-- from hr.employees
-- order by upper_name asc


-- select employee_id,lower(first_name)as lower_name
-- from hr.employees
-- order by lower_name asc

-- select employee_id,first_name,salary
-- from hr.employees
-- order by (salary+500)asc

-- SELECT employee_id, first_name, salary
-- FROM hr.employees
-- ORDER BY (salary + 500) DESC;

-- select employee_id,job_id,last_name
-- from hr.EMPLOYEES
-- order by job_id asc, last_name desc

-- SELECT employee_id, first_name, last_name, job_id
-- FROM hr.employees
-- ORDER BY job_id ASC, last_name ASC;

-- select employee_id,job_id
-- from hr.EMPLOYEES
-- order by case when job_id='IT_PROG' then 1.else 2.end

-- select employee_id,salary 
-- from hr.employees
-- order by case when salary>5000 then 1 else 2 end,salary desc


-- select department_id,sum(salary)as total_salary
-- from hr.employees
-- group by department_id
-- having sum(salary)between 50000 and 200000

-- select department_id,max(salary )as max_salary,min(salary)as min_salary
-- from hr.employees
-- group by department_id
-- having max(salary)>=2*min(salary)

-- select employee_id,first_name,department_id
-- from hr.employees
-- order by case  when department_id=50 then 1.else 2.end,department_id asc

-- select department_id, max(salary)/avg(salary)as salary_ratio
-- from hr.employees
-- group by department_id
-- having max(salary)/avg(salary) >1.5
-- order by salary_ratio desc

-- select employee_id,job_id,first_name,salary
-- from hr.employees
-- order by job_id asc,salary desc

-- select employee_id,first_name,commission_pct
-- from hr.employees
-- order by commission_pct desc nulls last

-- select employee_id,first_name,salary,commission_pct
-- from hr.employees
-- order by case when commission_pct is null then 1 else 2 end ,salary desc

-- select job_id,count(case when salary >20000 then 1 end) *1.0/count(*) as high_earner_ratio
-- from hr.employees
-- group by job_id
-- having count (case when salary >20000 then 1 end) > count(*)/2

-- SELECT department_id, SUM(CASE WHEN job_id IN ('IT_PROG', 'HR_REP') THEN salary ELSE 0 END) AS it_hr_salary
-- FROM hr.employees
-- GROUP BY department_id
-- HAVING SUM(CASE WHEN job_id IN ('IT_PROG', 'HR_REP') THEN salary ELSE 0 END) >= 20000;



--------BASIC AGGEREGATE FUNCTIONS

SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM HR.EMPLOYEES O/p 107

select count(distinct job_id)as unique_job from hr.employees  o/p 19

select sum(salary)as total_salary from hr.employees  o/p 691416

select avg(salary)as avg_salary from hr.employees o/p 6461.832

select min(salary)as mi_salary from hr.employees o/p 2100

select max(salary)as max_salary from hr.employees o/p 24000

select median(salary)as median_salary from hr.employees o/p 6200

SELECT MODE( ) WITHIN GROUP ( ORDER BY SALARY ) as most_common_salary from hr.employees 

select variance (salary)as variance_salary from hr.employees o/p 15284813.67

select stddev(salary) as stddev_salary from hr.employees o/p 3909.58

-----AGGREGATE FUNCTIONS WIH GROUP BY

select department_id,count(*)as total_employees from hr.employees group by department_id

select department_id,sum(salary )as total_salary from hr.employees group by department_id

select department_id,avg(salary )as avg_salary from hr.employees group by department_id

select department_id,min(salary )as min_salary from hr.employees group by department_id

select department_id,max(salary )as max_salary from hr.employees group by department_id

select job_id,count(*)as total_employees from hr.employees group by job_id

select department_id,sum(salary )as total_salary from hr.employees group by department_id having sum(salary)>100000

select department_id,avg(salary )as avg_salary from hr.employees group by department_id having avg(salary)>50000

select department_id,count(*)as total_employees from hr.employees group by department_id having count(*)>5

select job_id,count(*)as total_employees from hr.employees group by job_id having count(*)>10

