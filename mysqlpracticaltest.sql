show databases;

#1 
create database CollegeDB;
select CollegeDB;
use CollegeDB;

#2 
create table Students(
student_id int primary key,
student_name varchar(50),
department varchar(30),
age int,
city varchar(40)
);

#3 
create table courses(
course_id int primary key,
course_name varchar(50) not null
);

#4 
insert into Students(student_id, student_name, department, age, city)
values(1, "Alice", "IT", 22, "Pune"),
(2, "Bob", "IT", 23, "Nashik"),
(3, "Charlie", "HR", 23, "Nagpur"),
(4, "David", "Sales", 27, "Mumbai"),
(5, "Eve", "Marketing", 27, "Nagpur"); 

#5 
select * from Students;
select student_name, department from Students;

#6 
select student_name
from Students
where department = "IT" and age > 20;

#7 
select *
from Students
limit 3;

#8 
select count(*) as total_students
from Students;
select avg(age) as average_age 
from Students;


#9 
update Students
set city = "Pune"
where student_id = 3;
select * from Students;

#10
update Students
set age = age + 1
where department = "IT";
select * from Students;

#11
delete from Students
where student_id = 4;
select * from Students;

#12
alter table Students
add column email varchar(100);

update Students
set email = "alice@gmail.com"
where student_id = 1;
select * from Students;

update Students
set email = "bob@gmail.com"
where student_id = 2;
select * from Students;

update Students
set email = "charlie@gmail.com"
where student_id = 3;
select * from Students;

update Students
set email = "eve@gmail.com"
where student_id = 5;
select * from Students;

update Students
set email = "frank@gmail.com"
where student_id = 6;
select * from Students;

update Students
set email = "grace@gmail.com"
where student_id = 7;
select * from Students;

#13
create table Enrollments(
student_id int primary key,
course_id int,
foreign key (student_id) references Students(Student_id),
foreign key (course_id) references courses(course_id)
);
select * from Enrollments;


#14
insert into courses(course_id, course_name)
values(101, "English"),
(102, "MAths"),
(103, "Science"),
(104, "History");
select * from courses;

insert into Enrollments(student_id, course_id)
values(1, 101),
(2, 102),
(3, 103),
(5, 104);
select * from Enrollments;

#inner join query....
select s.student_name, c.course_name
from Students s
inner join courses c
	on s.student_id = c.student_id;
    
    
#15
insert into Students(student_id, student_name, department, age, city)
values(6, "Frank", "Pathology", 19, "Pune"),
(7,  "Grace", "Botany", 18, "Nagpur");
select * from Students;

select s.student_name, c.course_name
from Students s
left join courses c
	on s.student_id = c.student_id;
    
    
#16
insert into courses(course_id, course_name, student_id)
values(105, "Mythology", null),
(106, "Physics", null);
select * from courses;

select s.student_name, c.course_name
from Students s
right join courses c
	on s.student_id = c.student_id;
    
#17
create view ITStudentsView as
select student_name, city
from Students
where department = "IT";
select * from ITStudentsView;


#18
create or replace view studentsintel as
select student_name, city
from Students
where age > 20;
select * from studentsintel;

#19
select student_name, avg(age) as average_age
from Students
where age > average_age;









