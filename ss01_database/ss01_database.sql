create database ss01_database;

use ss01_database;

create table Student(
	id int primary key auto_increment,
    `name` varchar(50)
    );
    
insert into Student (`name`)
values ("Thiện"), ("Liên"), ("Lâm");
    
    select *
    from student;

    create table Teacher(
   id int primary key auto_increment,
    `name` varchar(50),
    age int,
    country varchar(50)
    );
    
    insert into teacher (`name`,age,country)
    values ("Teacher 1","40","Đà Nẵng"),("Teacher","30","Đà Nẵng");
    
    select*
    from teacher;
    
    
    