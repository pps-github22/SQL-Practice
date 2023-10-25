--27. show only even rows from a table
select * from  emp where mod(empno, 2) != 0;

--28. clone a new table from another table
--create or replace table tab1(id number);
create or replace table clone_tab1 (id number);
insert into clone_tab1 (id) values(1),(2);
create or replace table tab1 as (select * from clone_tab1);

--29. intersecting records of two table 
select * from emp e 
inner join dept d
on e.deptno = d.deptno--;
where d.deptno in(select deptno from emp);


--30. show records from a table that another table does not have
select * from emp e 
inner join dept d
on e.deptno = d.deptno--;
where d.deptno not in(select deptno from emp);

-- 30 Current date and time
select current_date();
select current_time();

-- 31. top 5 records from a table with salary in descending order
CREATE or replace TABLE EMPLOYEE(
emp_name varchar(20) Not null,
emp_id number,
salary float default(50000),
bonus varchar(10),
dept_id number
);

insert into EMPLOYEE values('Harvey Specter','1111111111','50000','not null','101');
insert into EMPLOYEE values('Monica Geller','1111111112','75000','null','102');
insert into EMPLOYEE values('Ross Geller','1111111113','60000','not null','103');
insert into EMPLOYEE values('Rachel Green','1111111114','50000','null','104');
insert into EMPLOYEE values('Phoebe Buffay','1111111115','50000','not null','101');
insert into EMPLOYEE values('Joey Tribbiani','1111111116','100000','null','102');
insert into EMPLOYEE values('Mike Ross','1111111117','50000','not null','103');
insert into EMPLOYEE values('Rachel Zane','1111111118','75000','null','104');
insert into EMPLOYEE values('Monica Bing','1111111119','20000','not null','101');
insert into EMPLOYEE values('Chandler Bing','1111111110','30000','null','102');
select * from employee;

select top 5 emp_name, salary from employee order by salary desc;

--32. fetch 4th highest salary from a table
select  top 3 salary from employee order by salary desc;
select emp_name, salary from
(
    select top 3 salary, emp_name from emp
    order by emp,salary desc
) as emp order by salary asc;


select distinct(salary), emp_name from EMPLOYEE where salary >
(select top 3 salary from employee order by salary desc);
