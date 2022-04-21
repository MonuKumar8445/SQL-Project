create database HRDB
use HRDB
create table Departments2(id int primary key identity, name varchar(max))
create table Employee1m
(id int primary key identity, 
name varchar(max),
email varchar(max),
gender varchar(10),
mobile varchar(15),
department_id int foreign key references Departments2(id)
)
select * from Departments2
exec SP_Departments2 'SELECT'
exec SP_Departments2 'CREATE' ,0,'HR'

create proc SP_Departments2
@action varchar(20),
@id int=0,
@name varchar(100)=null
as
begin
if(@action='CREATE')
begin
insert into Departments2(name)values(@name)
select 1 as result
end
else if(@action='DELETE')
BEGIN
delete from Departments2 where id=@id
select 1 as result
end
else if(@action='SELECT')
BEGIN
select * from Departments2
select 1 as result
end
else if(@action='UPDATE')
BEGIN
update Departments2 set name=@name where id=@id
select 1 as result
end
end
----------------------------------------------------------
exec SP_Employee1m 'SELECT'
exec SP_Employee1m 'CREATE',0,'Virat Kumar','virat@6476gmail.com','male','902335755',2
exec SP_Employee1m 'UPDATE'
exec SP_Employee1m 'SELECT_JOIN'


alter proc SP_Employee1m
@action varchar(20),
@id int=0,
@name varchar(100)=null,
@email varchar(100)=null,
@mobile varchar(15)=null,
@gender varchar(10)=null,
@dept_id int=0
as
begin
if(@action='CREATE')
begin
insert into Employee1m(name,email,gender,mobile,department_id)values
(@name,@email,@gender,@mobile,@dept_id)
select 1 as result
end
else if(@action='DELETE')
BEGIN
delete from Employee1m where id=@id
select 1 as result
end
else if(@action='SELECT')
begin
select * from Employee1m
end
else if(@action='SELECT_JOIN')
begin
select e.Id,e.name,e.email,e.gender,e.mobile,d.name as department 
from Employee1m e
full outer join 
Departments2 d
on e.department_id=d.id
end
else if(@action='UPDATE')
begin
update Employee1m set name=@name, email=@email, gender=@gender, mobile=@mobile,
department_id=@dept_id where id=@id
select 1 as result
end
end

