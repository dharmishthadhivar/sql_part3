
use ifadharmi1;
ALTER TABLE persons ADD COLUMN start_date date;
ALTER TABLE persons ADD COLUMN end_date date;
ALTER TABLE persons ADD COLUMN date_of_birth date;

INSERT INTO persons 
   VALUES (6,3,'dharmi','dhimmar','nvs','nvs','2021-06-16','2021-09-16','1991-09-16');

/*calculate age(task 2)*/
SELECT FLOOR((CURDATE() -date_of_birth ) / 10000) FROM persons;
SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(date_of_birth)
- (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(date_of_birth, 5)) as YourAge
    from persons;
    Select Date_format( From_Days( To_Days(Curdate()) - To_Days(date_of_birth) ), '%Y' ) + 0 AS 'Age in year' from persons;
    
    SELECT 
   date_of_birth
    ,TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) AS personAge 
FROM persons;


/*date functions(task 3)*/
select CURDATE();
select CURDATE()+10;
SELECT ADDDATE(CURDATE(), INTERVAL 10 DAY);
SELECT DATE_FORMAT(date_of_birth, '%W %M %Y') from persons;
select day(date_of_birth) from persons;
select month(date_of_birth) from persons;
select monthname(date_of_birth) from persons;
select week(date_of_birth) from persons;
select weekday(date_of_birth) from persons;
select weekofyear(date_of_birth) from persons;
select yearweek(date_of_birth) from persons;
select dayofweek(date_of_birth) from persons;
select quarter(date_of_birth) from persons;
select dayofmonth(date_of_birth) from persons;
select dayofyear(date_of_birth) from persons;
select to_days(date_of_birth)from persons;
select last_day(date_of_birth)from persons;
SELECT SUBDATE(date_of_birth, INTERVAL 14 YEAR) from persons;

/*check running process(task 4)*/
 SHOW FULL PROCESSLIST;
 
 /*update unique constraint column values--task no 5*/
 alter table department add unique dept_name_unique (deptname);
 INSERT INTO persons(PID,deptId,Lastname,FirstName) 
VALUES (56,3,'manan','shah') 
ON DUPLICATE KEY UPDATE LastName = 'manan';
 
select * from persons;

/*joins with subquery(task 6)*/
SELECT persons.*
FROM (
   SELECT a.*
   FROM persons AS a
   INNER JOIN department AS b ON a.deptId = b.deptId
  
) AS persons
INNER JOIN task AS c
ON persons.PID = c.PersonID;

 select persons.PID, persons.deptId, FirstName,deptname,task_name from persons inner join department on persons.deptId=department.deptId inner join task on task.personID=persons.PID;
 
 /*deadlock task8*/
 set global innodb_print_all_deadlocks=1;
show engine innodb status;
 SELECT * FROM INFORMATION_SCHEMA.ENGINES;
 show engines;
 SELECT table_name, table_schema, engine
 FROM information_schema.tables
 WHERE engine = 'InnoDB';


