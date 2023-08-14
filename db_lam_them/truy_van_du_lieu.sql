
-- câu 1:  Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào (chỉ học viên có lớp học).

select * from student 
join class on student.class_id= class_id;

-- câu 2 :Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.

select * from student left join class
on student.class_id = class_id;

--  câu 4. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.

select * from student where name like "%hai" or name like "%huynh"; 


-- câu 5. Lấy ra học viên có điểm lớn hơn 5 .

select student.name,student.point from student where `point` =5;

-- câu 6 Lấy ra học viên có họ là “nguyen”

select * from student where name like "nguyen%";


