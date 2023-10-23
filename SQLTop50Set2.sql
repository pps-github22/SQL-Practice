use database trial_db;

--18. first_name ends with 'h' with & contains 6 alphabets
select worker_first_name from workers where worker_first_name like '%h'  and len(worker_first_name) = 6;


create or replace table worker_group1
(
    name varchar,
    age number,
    address varchar,
    salary number,
    joining_date date,
    dept varchar
);
insert into worker_group1 (name, age, address, salary, joining_date, dept)
            values('RM', 28, 'K1', 5000000, '2005-03-06', 'rap'),
                    ('Suga', 27, 'K2', 1000000, '2007-01-10', 'pop-rap'),
                    ('V', 28, 'K3', 3000000, '2009-08-05', 'jazz'),
                    ('Jin', 29, 'K4', 2000000, '2010-01-02', 'jazz'),
                    ('JK', 26, 'K5', 8000000, '2010-03-01', 'pop-jazz'),
                    ('Jimin', 27, 'K6', 5000000, '2009-03-07', 'pop-jazz'),
                    ('Jhope', 28, 'K7', 4000000, '2008-01-09', 'rap');
select * from worker_group1;
                    
--19. details of workers whose salary lies between 1000000 & 5000000
select * from worker_group1 where salary >= 1000000 and salary <= 5000000;

--20. fetch worker details who joined in Jan'2010
select * from worker_group1 where year(joining_date)= 2010 and month(joining_date) = 01;

--21. count the no of emp working in the dept 'jazz'
select count(*) from worker_group1 where dept = 'jazz';

--22. fetch name and dept in one place and whose salary > 5000000
-- Using the || operator
SELECT name || ' ' || dept AS name_dept, salary
FROM worker_group1 where salary >= 5000000;

-- Using the CONCAT function
SELECT CONCAT(name, ' ', dept) AS name_with_dept, salary from worker_group1 where salary >= 5000000;

--23. no of workers for each dept in desc order
--select count(name) no_of_worker from worker_group1;
select  dept, count(name) no_of_worker from worker_group1
group by dept
order by no_of_worker desc;

--24. print the worker's names who are also managers
create or replace database ORG;
USE ORG;

create or replace table dept(   
  deptno number(2,0),   
  dname varchar2(14),   
  loc   varchar2(13),   
  constraint pk_dept primary key (deptno)   
);

insert into DEPT (DEPTNO, DNAME, LOC) 
values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept   
values(20, 'RESEARCH', 'DALLAS');
insert into dept   
values(30, 'SALES', 'CHICAGO');
insert into dept  
values(40, 'OPERATIONS', 'BOSTON');

select * from dept;
        
create table emp(   
  empno    number(4,0),   
  ename    varchar2(10),   
  job      varchar2(9),   
  mgr      number(4,0),   
  hiredate date,   
  sal      number(7,2),   
  comm     number(7,2),   
  deptno   number(2,0),   
  constraint pk_emp primary key (empno),   
  constraint fk_deptno foreign key (deptno) references dept (deptno)   
);

insert into emp   
values(   
 7839, 'KING', 'PRESIDENT', null,   
 to_date('17-11-1981','dd-mm-yyyy'),   
 5000, null, 10   
);

insert into emp  
values(  
 7698, 'BLAKE', 'MANAGER', 7839,  
 to_date('1-5-1981','dd-mm-yyyy'),  
 2850, null, 30  
);

insert into emp  
values(  
 7782, 'CLARK', 'MANAGER', 7839,  
 to_date('9-6-1981','dd-mm-yyyy'),  
 2450, null, 10  
);

insert into emp  
values(  
 7566, 'JONES', 'MANAGER', 7839,  
 to_date('2-4-1981','dd-mm-yyyy'),  
 2975, null, 20  
);

insert into emp  
values(  
 7788, 'SCOTT', 'ANALYST', 7566,  
 to_date('3-5-1987','dd-mm-yyyy') - 85,  
 3000, null, 20  
);

insert into emp  
values(  
 7902, 'FORD', 'ANALYST', 7566,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 3000, null, 20  
);

insert into emp  
values(  
 7369, 'SMITH', 'CLERK', 7902,  
 to_date('17-12-1980','dd-mm-yyyy'),  
 800, null, 20  
);

insert into emp  
values(  
 7499, 'ALLEN', 'SALESMAN', 7698,  
 to_date('20-2-1981','dd-mm-yyyy'),  
 1600, 300, 30  
);

insert into emp  
values(  
 7521, 'WARD', 'SALESMAN', 7698,  
 to_date('22-2-1981','dd-mm-yyyy'),  
 1250, 500, 30  
);

insert into emp  
values(  
 7654, 'MARTIN', 'SALESMAN', 7698,  
 to_date('28-9-1981','dd-mm-yyyy'),  
 1250, 1400, 30  
);

insert into emp  
values(  
 7844, 'TURNER', 'SALESMAN', 7698,  
 to_date('8-9-1981','dd-mm-yyyy'),  
 1500, 0, 30  
);

insert into emp  
values(  
 7876, 'ADAMS', 'CLERK', 7788,  
 to_date('3-6-1987', 'dd-mm-yyyy') - 51,  
 1100, null, 20  
);

insert into emp  
values(  
 7900, 'JAMES', 'CLERK', 7698,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 950, null, 30  
);

insert into emp  
values(  
 7934, 'MILLER', 'CLERK', 7782,  
 to_date('23-1-1982','dd-mm-yyyy'),  
 1300, null, 10  
);

select * from emp;
select * from dept;

--print the worker's who are also managers
--select e.*, d.deptno from emp e
--left join dept d
--on e.deptno= d.deptno
--order by d.deptno;
select e.ename, d.deptno from emp e
left join dept d
on e.deptno= d.deptno;  -- all emp with their rspv dept

select ename from emp
where mgr in(select mgr from emp);  -- works answer

--suppose mgr is present in diff table, then we can perform inner join to achieve this output

--25. get the emp who worked in more than one dept
select e.ename,count(deptno) from emp e
group by e.ename
having count(deptno) >1;    -- no emp is working on more than 1 dept

-- fetch the no of emp working in each dept
select count(empno) no_of_emp, deptno dept_number from emp
group by deptno;

--26. show only odd rows from a table
select * from emp where mod(empno, 2) =0;




