-- select employee_id,first_name,salary,rank() over (order by salary)from hr.EMPLOYEES
-- -- select employee_id,first_name,salary, rank() over(order by salary ) from hr.employees

-- select employee_id,first_name,salary,rank() over (order by salary)from hr.employees
-- select employee_id,first_name,salary,dense_rank() over (order by salary)from hr.employees
select 
    employee_id,
    first_name,
    salary,
    rank() over (order by salary)as rank_salary,
    dense_rank() over (order by salary)as dense_rank_salary,
    row_number() over (order by salary)as row_number_salary,
    lag(salary) over (order by salary)as previouss_salary,
    lead(salary) over (order by salary)as next_salary 
from hr.employees

select employee_id,department_id,job_id,salary,rank()over (partition by department_id,job_id order by salary)from hr.employees

###How can you find the top 3 highest-paid employees in each job category using ROW_NUMBER()?
select employee_id,job_id,salary,row_number() over (partition by job_id order by salary desc) as row_number from hr.employees

##Write a query to rank employees within their department by hire date using RANK()
select employee_id,department_id,hire_date,rank() over(partition by department_id order by hire_date)as rank_salarywith_department from hr.employees

##Write a query to display the cumulative salary rankings for all employees using DENSE_RANK()
select employee_id,salary,dense_rank() over (order by salary desc) from hr.employees 

##How can you rank employees by salary and reset the rank after each department using DENSE_RANK()?
select employee_id,department_id,salary,dense_rank() over(partition by department_id order by salary desc)as salary_rank from hr.employees



##How can you use LAG() to find the salary difference between the current employee and the previous one within each department?
SELECT 
    Employee_ID, 
    Department_ID, 
    Salary, 
    LAG(Salary) OVER (PARTITION BY Department_ID ORDER BY Salary DESC) AS PreviousSalary, 
    Salary - LAG(Salary) OVER (PARTITION BY Department_ID ORDER BY Salary DESC) AS SalaryDifference
FROM hr.Employees;

##Write a query to retrieve each employee's salary and the next employee's salary in the same department using LEAD()
SELECT 
    Employee_ID, 
    Department_ID, 
    Salary, 
    LEAD(Salary) OVER (PARTITION BY Department_ID ORDER BY Salary DESC) AS NextSalary
FROM hr.Employees;

##How can you calculate the percentage change in salary between the current employee and the previous one using LAG()
SELECT 
    Employee_ID, 
    Department_ID, 
    Salary, 
    LAG(Salary) OVER (PARTITION BY Department_ID ORDER BY Salary DESC) AS PreviousSalary, 
    (Salary - LAG(Salary) OVER (PARTITION BY Department_ID ORDER BY Salary DESC)) * 100.0 / 
    LAG(Salary) OVER (PARTITION BY Department_ID ORDER BY Salary DESC) AS SalaryChangePercentage
FROM hr.Employees;

#Percentage Change Formula:

SalaryChangePercentage = Current Salary − Previous Salary
                        ------------------------------------×100
                             Previous Salary


##Write a query to find the hire date of the employee who was hired immediately before each employee using LAG()
SELECT 
    Employee_ID, 
    Hire_Date, 
    LAG(Hire_Date) OVER (ORDER BY Hire_Date ASC) AS PreviousHireDate
FROM hr. Employees;

##How can you identify employees whose salary is lower than the next employee’s salary in their department using LEAD()
select
    Employee_ID, 
    Department_ID, 
    Salary, 
    LEAD(Salary) OVER (PARTITION BY Department_ID ORDER BY Salary DESC) AS NextSalary
    wHERE Salary < LEAD(Salary) OVER (PARTITION BY Department_ID ORDER BY Salary DESC)
FROM hr.Employees

##Write a query to retrieve each employee’s salary along with the salary of the employee hired immediately after them using LEAD().
SELECT 
    Employee_ID, 
    Hire_Date, 
    Salary, 
    LEAD(Salary) OVER (ORDER BY Hire_Date ASC) AS NextHiredSalary
FROM hr.Employees;

##Write a query to compare each employee's salary with the salary two employees before them using LAG().
SELECT 
    Employee_ID, 
    Department_ID, 
    Salary, 
    LAG(Salary, 2) OVER (PARTITION BY Department_ID ORDER BY Salary DESC) AS TwoStepsBeforeSalary
FROM hr.Employees;

##How can you use LEAD() to predict the salary of the next employee in the same department, while handling NULLs if there's no next employee?
SELECT 
    Employee_ID, 
    Department_ID, 
    Salary, 
    COALESCE(LEAD(Salary) OVER (PARTITION BY Department_ID ORDER BY Hire_Date ASC), Salary) AS NextEmployeeSalary
FROM hr. Employees;



