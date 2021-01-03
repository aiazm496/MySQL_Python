create database org;
use org;

show tables;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);


INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
#drop table worker;
        
select * from Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');


select upper(First_Name) as WORKER_NAME from Worker;

select length(First_Name) from Worker;

select distinct Department from worker;

select substring(First_Name,1,3) from Worker;

select First_Name from Worker order by substring(First_Name,length(First_Name)-2, length(First_Name));

select distinct length(department) from worker;

select replace(First_Name,'a','A') from Worker;

select concat(First_Name,' ',Last_Name) as Full_Name from Worker;

select * from Worker order by First_Name;

select * from Worker order by First_Name, Department DESC;

select * from Worker where First_Name in ('Vipul','Satish');

select * from Worker where First_Name not in ('Vipul','Satish');

select * from Worker where Department = 'Admin';

select * from Worker where First_Name not in ('Vipul','Satish');

select * from Worker where First_Name like '%a%';
select * from Worker where First_Name like '%a';


select * from worker where First_Name like '______h';


select * from worker where Salary between 100000 and 500000;

select * from worker where joining_date = '2014-02-20 09:00:00';

select * from worker where year(joining_date)= 2014 and month(joining_date) = 2;

select count(worker_id) from worker where department = 'Admin';

select concat(First_Name,' ',Last_Name) as Name from worker where salary between 50000 and 100000;

select department,count(*) from worker group by department order by count(*) DESC;

select * from worker inner join title on worker.worker_id = title.WORKER_REF_ID;

select * from title;

select worker_title,affected_from ,count(*) from title group by worker_title,affected_from having count(*)>1;

create table WorkerClone like Worker;

INSERT INTO WorkerClone select * from Worker;

select * from WorkerClone;

select CURDATE();

SELECT now();

select * from worker order by salary DESC limit 10;

select * from worker order by salary DESC limit 1 offset 4;

select * from worker where salary = (select max(salary) from worker); 

select * from worker order by salary desc limit 1 offset 1;

select * from worker;

select department from worker group by department having count(*) < 5;

select department, count(*) as No_of_people from worker group by department;

select * from worker order by worker_id limit 1;

select distinct(salary) from worker order by salary desc limit 3;

select distinct salary from worker order by salary desc limit 1 offset 3;  #4th highest salary

select department, sum(salary) from worker group by department;

select concat(First_Name,' ', Last_Name) as Name from worker where salary = (select max(salary) from worker);

create table stdent( s_id int, s_name varchar(50), marks int default 50);   #added constraint default marks is 50.
select  * from stdent;
insert into stdent(s_id,s_name) values(1,'Akash');

select * from worker;

use org;

select * from worker;

select distinct(salary) from worker order by salary desc limit 1 offset 1; #2nd highest salary

#create view of worker table of only admin dept employee

create view admin_employee as select * from worker where department = 'Admin';

select * from admin_employee;

select * from worker;

select * from workerclone;

select * from worker
union 
select * from workerclone;

use org;

select * from worker;




