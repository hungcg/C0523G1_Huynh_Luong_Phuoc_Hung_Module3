create database ss2;
use ss2;

create table class(
  id int primary key auto_increment, 
  name varchar(20)
);
create table room(
  id int primary key auto_increment, 
  name varchar(20), 
  class_id int, 
  foreign key(class_id) references class(id)
);
create table jame(
  `account` varchar(50) primary key, 
  `password` varchar(50)
);
create table student(
  id int primary key auto_increment, 
  name varchar(50), 
  birthday date, 
  gender boolean, 
  email varchar(50), 
  `point` float, 
  class_id int, 
  `account` varchar(50) unique, 
  foreign key (class_id) references class(id), 
  foreign key (`account`) references jame(`account`)
);
create table instructor(
  id int primary key auto_increment, 
  name varchar(50), 
  birthday date, 
  salary double
);
create table instructor_class(
  class_id int, 
  instructor_id int, 
  start_time date, 
  end_time date, 
  primary key (class_id, instructor_id), 
  foreign key(class_id) references class(id), 
  foreign key(instructor_id) references instructor(id)
);

insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into room(name,class_id) values ('Ken',1), ('Jame',1),('Ada',2),('Andy',2);

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
 
 
 
 
 
 -- 1. Hiện thị danh sách các lớp có học viên theo học 
-- và số lượng học viên của mỗi lớp.

select c.name, count(*) as "số lượng học viên"
from class c
join student s 
on c.id = s.class_id
group by c.id;

-- 2. Tính điểm lớn nhất của mỗi các lớp
select c.name, max(s.point) as "điểm lớn nhất"
from class c
join student s 
on c.id = s.class_id
group by c.id;

-- 3. Tính điểm trung bình của từng lớp.
set sql_mode = 1;
select c.name, avg(s.point) as "điểm trung bình"
from class c
join student s 
on c.id = s.class_id;

-- 4. Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. 
-- Lưu ý: sử dụng union
select name, birthday
from instructor
union
select name, birthday
from student;

-- 5. Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
select name, point
from student
order by point desc
limit 3 offset 1;

-- 6. Lấy ra các học viên có điểm số là cao nhất của trung tâm.
-- điểm cao nhất ?
-- số lượng hv có điểm = điểm cao nhất ?
select name, point
from student s
where exists (
				select *
                from student
                having s.point = max(student.point));

select name, point
from student s
where point in (
			select max(point)
                from student
);

select quarter("1991-02-09");


-- Đánh, xóa index cho cột name trong bảng student.

create unique index student_name on student(`name`);
alter table student drop index student_name;

--  Tạo view chứa thông tin id và name của student.

create view student_views as
select name,id
from student
 
 
