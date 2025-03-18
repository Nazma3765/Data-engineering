---- 4. Using SELECT with CASE Statement
DECLARE
    emp_status VARCHAR2(20);
BEGIN
    SELECT 
        CASE 
            WHEN salary > 50000 THEN 'High Salary'
            ELSE 'Low Salary'
        END 
    INTO emp_status 
    FROM hr.employees WHERE employee_id = 103;
    
    DBMS_OUTPUT.PUT_LINE('Employee Status: ' || emp_status);
END;


---- 5. Using COUNT() with SELECT INTO
DECLARE
    total_employees NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_employees FROM hr.employees;
    DBMS_OUTPUT.PUT_LINE('Total Employees: ' || total_employees);
END;



--  Fetching MAX Salary
DECLARE
    max_salary NUMBER;
BEGIN
    SELECT MAX(salary) INTO max_salary FROM hr.employees;
    DBMS_OUTPUT.PUT_LINE('Highest Salary: ' || max_salary);
END;

---- 7. Fetching MIN Salary
declare 
    min_salary number;
BEGIN
    select min(salary) into min_salary from hr.employees;
    dbms_output.put_line('lowest salary: ' || min_salary);
end;

--Fetching AVG Salary
DECLARE
    avg_salary number;
begin
    select avg(salary) into avg_salary from hr.employees;
    dbms_output.put_line('average salary:'||avg_salary);
end;

---- 9. Fetching Employee Name Using Subquery
DECLARE
    first_name VARCHAR2(50);
BEGIN
    SELECT first_name INTO first_name FROM hr.employees 
    WHERE employee_id = (SELECT MIN(employee_id) FROM hr.employees);
    DBMS_OUTPUT.PUT_LINE('First Employee: ' || first_name);
END;

--Fetching Data Using EXISTS
DECLARE
    emp_exists VARCHAR2(10);
BEGIN
    SELECT 
        CASE 
            WHEN EXISTS (SELECT 1 FROM hr.employees WHERE employee_id = 105) THEN 'Yes'
            ELSE 'No'
        END 
    INTO emp_exists 
    FROM dual;
    DBMS_OUTPUT.PUT_LINE('Employee Exists: ' || emp_exists);
END;


----Selecting Employee with Highest Salary
DECLARE
    first_name VARCHAR2(50);
BEGIN
    SELECT first_name INTO first_name FROM hr.employees 
    WHERE salary = (SELECT MAX(salary) FROM hr.employees);
    DBMS_OUTPUT.PUT_LINE('Highest Paid Employee: ' || first_name);
END;

--Fetching Department Name
DECLARE
    dept_name VARCHAR2(50);
BEGIN
    SELECT department_name INTO dept_name FROM hr.departments WHERE department_id = 10;
    DBMS_OUTPUT.PUT_LINE('Department: ' || dept_name);
END;

--- Fetching Employee Count in a Department
DECLARE
    emp_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO emp_count FROM hr.employees WHERE department_id = 20;
    DBMS_OUTPUT.PUT_LINE('Employees in Department 20: ' || emp_count);
END;

--Fetching Sum of All Salaries
DECLARE
    total_salary number;
begin
    select sum(salary )into total_salary from hr.Employees;
    dbms_output.put_line('total salaries: ' || total_salary);
end;

--- Fetching Employee Joining Date
DECLARE
    hire_date date;
begin
    select hire_date into hire_date from hr.employees where employee_id=107;
    dbms_output.put_line('employee hire date:' || hire_date);
end;

--Selecting Second Highest Salary
DECLARE
    second_highest_salary NUMBER;
BEGIN
    SELECT DISTINCT salary INTO second_highest_salary FROM hr.employees 
    WHERE salary < (SELECT MAX(salary) FROM hr.employees) 
    ORDER BY salary DESC FETCH FIRST 1 ROW ONLY;
    
    DBMS_OUTPUT.PUT_LINE('Second Highest Salary: ' || second_highest_salary);
END;

--- Selecting Employees with Same Salary as John
DECLARE
    emp_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO emp_count FROM hr.employees 
    WHERE salary  in (SELECT salary FROM hr.employees WHERE first_name = 'John');
    
    DBMS_OUTPUT.PUT_LINE('Employees with John''s Salary: ' || emp_count);
END;

---19. Fetching Number of Employees Who Earn Above Average Salary
DECLARE
    count_above_avg NUMBER;
BEGIN
    SELECT COUNT(*) INTO count_above_avg FROM hr.employees 
    WHERE salary > (SELECT AVG(salary) FROM hr.employees);
    
    DBMS_OUTPUT.PUT_LINE('Employees Earning Above Average: ' || count_above_avg);
END;