create or replace table workers
(
    worker_id number,
    worker_first_name varchar,
    worker_last_name varchar,
    worker_age number,
    worker_email varchar,
    worker_address varchar
);
insert into workers (worker_id, worker_first_name, worker_last_name, worker_age, worker_email, worker_address, dept_name)
            values(01, 'Joy', 'Ediz', 36, 'joy@gmail.com', 'RoadJoy' , 'Pop'),
                (02, 'Peter', 'Farn', 41, 'peter@gmail.com', 'RoadPet', 'Manga'),
                (03, 'Sia', 'John', 39, 'sia@gmail.com', 'RoadSia', 'Jazz');

insert into workers (worker_id, worker_first_name, worker_last_name, worker_age, worker_email, worker_address, dept_name)
            values(04, 'Taylor', 'Swift', 33, 'taylor@gmail.com', 'NY 19', 'Soft'),
                    (05, 'Tae', 'V', 28, 'tae@gmail.com', 'Korea a1', 'Soft');

select * from workers;

--1. fetch first_name as worker_name 
select worker_first_name as worker_name from workers;
--2. fetch frirst_name as worker_name and fetch it in uppercase
select upper(worker_first_name) as worker_name_capslock from workers;
--3. fetch unique value of departments from the worker table
alter table if exists workers
    add dept_name varchar;
select * from workers;

--insert into workers dept_name
                --values('Pop');
                --Q: Is it possible to add a new column to an existing table that already has data present
                --in it, and the adding values only to the newly created columns?
select distinct(dept_name) unq_dept from workers;
--4. print 1st 3 characters of first_anme
select worker_first_name, substr(worker_first_name, 1, 3) First3letters from workers;

--5. fetch the position of the alphabet 'y' in the name 'Taylor' from the workers table
--select position(worker_first_name, 'y')
--from workers where worker_first_name = 'Taylor';   --- DOUBT

--6. after removing whitespaces from the first_name from the right side
select rtrim(worker_first_name) right_trim from workers;

--7. dept from worker table after removing whites[paces from left
select ltrim(dept_name) from workers;

--8. unique values of dept and print its length
select distinct(dept_name) as unq_dept, len(unq_dept) len_of_deptname from workers;

--9. print first_name from workers table, replacing 'y' with 'Y'
--select translate(worker_first_name, 'Y', 'Y') from workers where worker_first_name = 'Joy';  ---DOUBT

--10. first_name and last_name into a single column
select concat(worker_first_name, worker_last_name) as worker_name from workers; -- with no space in between
select concat(worker_first_name, ' ', worker_last_name) as worker_name from workers; -- with space

--11. fetch all worker details order by first_name asc
select * from workers order by worker_first_name asc;
-- and also dept desc
select * from workers order by worker_first_name asc, dept_name desc;

--12. fetch the details of first_name 'Joy' and 'Taylor'
select * from workers where worker_first_name in('Joy', 'Taylor');

--13. print details excluding first_name for worker_name 'Joy' and 'Taylor'
select * from workers where worker_first_name not in('Joy', 'Taylor');

--14. print all the details of a worker with dept_name as 'Pop'
select * from workers where dept_name = 'Pop';

--15. print the details of the workers whose first_name contains 'a'
select * from workers where worker_first_name like '%a%';

--16. first_name ends with 'a'
select * from workers where worker_first_name like '%a';

                
                

