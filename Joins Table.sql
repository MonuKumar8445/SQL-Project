create database Mk;
use Mk;
create table EmployeeDetail(id int primary key identity not null,
FirstName varchar(max) not null,LastName varchar(max) not null,
Salary int not null,JoinDate DateTime not null,
Gender varchar(30) not null)
alter table EmployeeDetail add Department varchar(30);
alter table EmployeeDetail 
alter table EmployeeDetail alter column joinDate varchar(150) ;

insert into EmployeeDetail(FirstName,LastName,Salary,JoinDate,Gender,Department)
values
('Ajay','Kumar',50000,'24-01-2022','Male','HR'),
('Saurah','Kumar',34000,'24-03-2010','Male','IT'),
('Sani','Kumar',60000,'12-01-2002','Male','HR'),
('Kaushal','Kumar',45000,'30--01-2020','Male','FM'),
('Shivom','Kumar',50000,'24-01-2022','Male','TL'),
('Sangeeta','Kumari',50000,'24-01-2022','Female','HR'),
('Khushi','Kumari',65000,'24-04-2017','Female','IT'),
('Sunil','Kumar',35000,'27-01-2019','Male','FM'),
('Amit','Kumar',50000,'20-01-2015','Male','TL')
--------------------Q.1---------------------------
select * from EmployeeDetail where FirstName like '[^a-m]%'
--------------------Q.2---------------------------------------
SELECT Gender FROM EmployeeDetail WHERE Gender like '__le%';
--------------------Q.3-------------------------------
select * from EmployeeDetail where FirstName like '_____a%'
--------------------Q.4---------------------------------
select * from EmployeeDetail where FirstName like 'sang%eeta'
--------------------Q.5---------------------------------
select distinct (Department) from EmployeeDetail; 
--------------------Q.6---------------------------------
select * from EmployeeDetail where Salary=(select max(Salary) from EmployeeDetail);

select max(Salary)  as  highest_salary from EmployeeDetail
select max(salary) from EmployeeDetail
-------------------Q.6----------------------------
select min(salary) from EmployeeDetail
------------------Q.7--------------------------
 SELECT CONVERT(VARCHAR(20),JoinDate,106) FROM EmployeeDetail
 ------------------------------Q.11-----------------------
SELECT DATEPART(MONTH,JoinDate) FROM [EmployeeDetail]
----------------Q.12-----------------------------------------
SELECT * FROM EmployeeDetail WHERE DATEPART(YYYY,JoinDate) = '2019'

select * from EmployeeDetail;
 SELECT COUNT(*) FROM EmployeeDetail
 ---------------------Q.15-------------------------------
 select FirstName,case when  Gender='Male' then 'M' when gender='Female' then 'F'end as Gender From EmployeeDetail
 ------------------------------------------------------------------------------------------------------------------------
 create table ProjectDetail(ProjectDetailID int primary key identity, ProjectName varchar(100),
 EmployeeDetailID int foreign key references EmployeeDetail(id)) 
 select* from ProjectDetail
 insert into ProjectDetail(ProjectName,EmployeeDetailID)values
 ('Task Track',1),
 ('CLP',3),
 ('Survey Managment',2),
 ('Task Track',5),
 ('HR Managment',4),
 ('Task Track',8),
 ('GRS',2),
 ('DDS',7),
 ('GL Managment',6),
 ('HR Managment',5);
 update  ProjectDetail  set ProjectName='GRS' where ProjectDetailID =4;  
 delete from ProjectDetail where ProjectDetailID >=11;