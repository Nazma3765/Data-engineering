DECLARE
    counter number:=1;
begin 
    while counter <=5 loop
    dbms_output.put_line('counter value ' || counter);
    counter := counter + 1;
    end loop;
    end;

---- for even numbers
DECLARE
    counter number:=0;
begin 
    while counter <=10 loop
    dbms_output.put_line('counter value ' || counter);
    counter := counter + 2;
    end loop;
    end;

---- for odd numbers
DECLARE
    counter number:=1;
begin 
    while counter <=10 loop
    dbms_output.put_line('counter value ' || counter);
    counter := counter + 2;
    end loop;
    end;

---- reverse the numbers but not using reverse
declare 
counter number:=10;
BEGIN
    while counter >= 1 LOOP
    dbms_output.put_line('counter value' || counter);
    counter:= counter-1;
    end loop;
    end;

----continue and exit
---it skip the value 3 and print numbers 1,2,4,5
declare
i number :=1;
BEGIN
    while i<=5 LOOP
    if i =3 THEN
    i:=i+1;
    continue;
    end if;
 dbms_output.put_line('number:' || i);
    i:=i+1;
    end loop;
    end;


    DECLARE
    i number:=1;
    BEGIN
        while i<=5 LOOP
        if i=3 THEN
        i:=i+1;
        exit;
        end if;
        dbms_output.put_line('number:' || i);
        i:=i+1;
        end loop;
        end;


DECLARE
i number:=2;
begin
    while i<=10 loop
    if mod(i,2)=1 THEN
    exit;
    end if;
    dbms_output.put_line('even:' || i);
    i:=i+1;
    end loop;
    end;

    DECLARE
    i number:=1;
    BEGIN
        while i<=6 LOOP
        if mod(i,3)=0 THEN
        i:=i+1;
        continue;
        end if;
        dbms_output.put_line('not divisible by 3:' ||i);
        i:=i+1;
        end loop;
        end;


DECLARE
i number :=1;
sum number:=0;
begin
while i<=10 LOOP
sum:= sum+i;
if sum >10 THEN
exit;
end if;
dbms_output.put_line('sum:' || sum);
i:=i+1;
end loop;
end;

DECLARE 
i number:=1;
BEGIN
    while i<=5 loop 
    if  i in (2,4)then
    i:=i+1;
    continue;
    end if;
dbms_output.put_line('i:' || i);
i:=i+1;
end loop;
end;



create or replace function pf_calc(salary number)
return NUMBER
is
bonus number;
BEGIN
    if salary >5000 THEN
    bonus:=salary*0.10;
    ELSE
    bonus:=salary*0.15;
    end if;
    return bonus;
    end;

select pf_calc(10000) from  dual



create or replace function age_check (age number)
return varchar2
is
BEGIN
    if age>=18 THEN
    return 'yes';
    ELSE
    return 'no';
    end if;
    end;


    select age_check(20)from dual

    ----factorial
create or replace function fact (n number)
return number
is
output number :=1;
BEGIN
    for i in 1..n loop
    output:=output*i;
    end loop;
    return output;
    end;
  
 ---vowels

 create or replace function count_vowels(str varchar2)
 return number
 is
 counter number:=0;
 BEGIN
    for i in l..length (str) loop
    if substr(str,i,l) in ('a','e','i','o','u') THEN
    counter:=counter+1;
    end if;

