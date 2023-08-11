create database ss01_database;

use ss01_database;

create table class_room(
	id int primary key auto_increment,
    `name` varchar(50)
    );
    
insert into class_room (`name`)
values ("Thiện"), ("Liên"), ("Lâm");
    
    select *
    from class_room;

    create table teacher(
   id int primary key auto_increment,
    `name` varchar(50),
    age int,
    country varchar(50)
    );
    
    insert into teacher (`name`,age,country)
    values ("Teacher 1","40","Đà Nẵng"),("Teacher","30","Đà Nẵng");
    
    select*
    from teacher;
    
    
    