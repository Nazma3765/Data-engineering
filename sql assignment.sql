--   select *from  SH.SALES
-- select sysdate from sh.sales
-- select systimestamp from sh.sales
-- select dbtimezone from sh.sales
-- select sysdate,sysdate+7 from sh.sales
-- select sysdate,sysdate-17 from sh.sales
-- select time_id,time_id+7 from sh.sales
-- select systimestamp,systimestamp+interval '2' hour from sh.sales
--  select systimestamp,systimestamp+interval '2' minute from sh.sales
--  select systimestamp,systimestamp+interval '2' second from sh.sales
--  select systimestamp,systimestamp+interval '2' month from sh.sales
--  select systimestamp,systimestamp+interval '2' year from sh.sales
--  select systimestamp,systimestamp+interval '2'day+interval '4'hour from sh.sales
-- select TIME_ID,extract (year from TIME_ID)year,extract (month from time_id)month,extract (day from time_id)day from sh.sales
-- select time_id,last_day(time_id)from sh.sales
 


--  select *from sh.sales
--   SELECT  prod_id FROM sh.sales
--  SELECT *  FROM sh.sales  WHERE quantity_sold > 5
-- select *from sh.sales where prod_id =(P1001)
select *from sh.sales where prod_id =(40)
select *from prod_id count(*) sh.sales





###Retrieve all records from the sales.sh table.
SELECT * 
FROM sh.sales
WHERE time_id>= sysdate - INTERVAL '30' DAY;

##Extract the year from the sales date column.
select time_id,extract(year from time_id)year from sh.sales
 
##Extract the month from the sales date column. 
select time_id,extract(month from time_id)month from sh.sales
 
##Retrieve sales records for transactions that occurred on weekends.
SELECT * 
FROM sh.sales
WHERE TO_CHAR(time_id, 'D') IN ('1', '7');

##Find the first and last recorded sales transaction dates.
 SELECT 
    MIN(time_id) AS first_time_id,
   MAX(time_id) AS last_time_id
 FROM sh.sales;

##Count the number of sales transactions that happened in the last 7 days.
SELECT COUNT(*) AS count
FROM sh.sales
WHERE time_id = SYSDATE - 7;

##Retrieve sales transactions that happened on a specific date ('2024-03-01')
SELECT * 
FROM sh.sales
WHERE time_id = '3/1/2024';  ---invalid month 

SELECT * 
FROM sh.sales
WHERE time_id = TO_DATE('01-MAR-2024', 'DD-MON-YYYY');

##Retrieve sales that occurred during a specific time range (09:00 AM - 12:00 PM)
SELECT * 
FROM sh.sales
WHERE TIME(time_id)) BETWEEN '09:00:00' AND '11:59:59';
