create database BlogDB
use BlogDB

create Table Comments(
Id int primary key identity,
Content nvarchar(250) not null
) 

insert into Comments
values('Comments1'),('Comments2'),('Comments3')

select *from Comments



create Table Blogs(
Id int primary key identity,
Title nvarchar(50) not null,
[Description] nvarchar(60) not null,
CommentId int foreign key references Comments(Id)
) 

insert into Blogs
values('Blogs1','Des',1),('Blogs2','Des',2),('Blogs3','Des',3)

select *from Blogs



CREATE Table Categories(
Id int primary key identity,
[Name] nvarchar(20) unique not null,
BlogId int foreign key references Blogs(Id)
)

insert into Categories
values('Categories1',1),('Categories2',2),('Categories3',3)

select *from Categories


create Table Tags(
Id int primary key identity,
[Name] nvarchar(20) unique not null
) 

insert into Tags
values('Tags1'),('Tags2'),('Tags3')

select *from Tags




CREATE Table Users (
Id int primary key identity,
UserName nvarchar(20) unique not null,
FullName nvarchar(20) not null,
Age int Check(Age>0 and Age<150),
CommentId int foreign key references Comments(Id),
BlogId int foreign key references Blogs(Id)
)

insert into Users
values('Users1','UsersFull',20,1,1),
('Users2','UsersFull',22,2,2),
('Users3','UsersFull',25,3,3)

select *from Users



create Table BlogsTags
(
Id int primary key identity,
BlogId int foreign key references Blogs(Id),
TagId int foreign key references Tags(Id)
)




create view Example2 as
select Title,UserName,FullName 
from Blogs
join Users 
   on Users.BlogId=Blogs.Id


select * from Example2

create view Example1 as
select Title,[Name] 
from Blogs
join Categories
  on Categories.BlogId=Blogs.Id


select * from Example1