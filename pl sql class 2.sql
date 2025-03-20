DECLARE
    variable1 number:=50;
BEGIN
    if variable1>15 then
     dbms_output.put_line('number is grater than 5');
     end if;
end;

declare 
    v_score number:=90;
BEGIN
    if v_score>=80 then
    dbms_output.put_line('pass');
    else
    dbms_output.put_line('fail');
    end if;
end;

declare
 v_marks number :=90;
 BEGIN
    if v_marks >=80 THEN
       dbms_output.put_line('grade: a');
    elsif v_marks >=70 then
        dbms_output.put_line('grade: b');
    else
    dbms_output.put_line('grade: c');
    end if;
end;

declare 
    emp_name varchar2(20);
    emp_salary number;
    grade_value varchar2(20);
begin
select first_name,salary into emp_name,emp_salary from hr.employees where employee_id=101;
if emp_salary=30000 then
grade_value:= 'grade: high';
elsif emp_salary=20000 then
grade_value:= 'grade: medium';
else
grade_value:='grade:low';
end if;
dbms_output.put_line(emp_name || emp_salary|| grade_value);
end;
 

declare 
    emp_name VARCHAR2(20);
    emp_salary number;
    grade_value varchar2(20);
BEGIN   
    IF emp_salary >= 30000 THEN
        grade_value:='Grade: High';
        if emp_salary<70000 then 
            grade_value:='grade:very high';
        else
            grade_value:='grade:high salary';
        end if;
    ELSE
        grade_value:='Grade: Low';
    END IF;
    dbms_output.put_line(emp_name || emp_salary || grade_value);
 end;



   
DECLARE
    counter number:=1;
BEGIN
    loop
        dbms_output.put_line(counter);
        counter := counter+1;
        exit  when counter>5;
        end loop;
        end;

declare
    v_counter number :=0;
 begin
    loop
        dbms_output.put_line(v_counter);
        v_counter :=  v_counter+4;
        exit when v_counter>100;
        end loop;
end;        


BEGIN
    for i in 1..5 loop
    dbms_output.put_line('iteration' || i);
    end loop;
    end;

    BEGIN
        for i in reverse 1..5 loop
        dbms_output.put_line('iteration' || i);
        end loop;
        end;

        BEGIN
            for i in reverse 1..10 loop
            if mod(i,2)=1 THEN    ---for even numbers (i,2) =0
            dbms_output.put_line(i);
            end if;
            end loop;
            end;
----square

            BEGIN
                for i in  1..10 loop
                dbms_output.put_line(i || ' '|| i*i);
                end loop;
            end;


DECLARE
a number :=0;
b number :=1;
c number;
BEGIN
    dbms_output.put_line(a);
    dbms_output.put_line(b);
    for i in 1..10 loop
     c := a+b;
    dbms_output.put_line(c);
    a:=b;
    b:=c;
    end loop;
    end;


DECLARE
table1 number:=2;
begin
    for num in 1..5 loop
    dbms_output.put_line('multiplication table of num' || num);
    for i in 2..10 loop
    dbms_output.put_line(num || '*' || i || ':' || i*num);
    end loop;
    end loop;
    end;