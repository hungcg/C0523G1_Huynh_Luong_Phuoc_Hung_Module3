CREATE DATABASE quan_li_sinh_vien;
USE quan_li_sinh_vien;
CREATE TABLE Class (
ID_Class INT AUTO_INCREMENT PRIMARY KEY,
Name_Class VARCHAR(20),
Start_Date DATETIME,
Status_Class INT
);
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
CREATE TABLE Student (
ID_Student INT AUTO_INCREMENT PRIMARY KEY,
Name_Student VARCHAR(20),
Address_Student VARCHAR(40),
Phone_Student VARCHAR(40),
Status_Student INT,
ID_Class INT,
FOREIGN KEY (ID_Class) REFERENCES Class(ID_Class)
);
INSERT INTO Student (Name_Student, Address_Student, Phone_Student, Status_Student, ID_Class)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (Name_Student, Address_Student, Status_Student, ID_Class)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (Name_Student, Address_Student, Phone_Student, Status_Student, ID_Class)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
CREATE TABLE Subject(
SubID_Subject INT AUTO_INCREMENT PRIMARY KEY,
SubName_Subject VARCHAR(40),
Credit_Subject INT,
Status_Subject INT
);
INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
CREATE TABLE Mark(
ID_Mark INT AUTO_INCREMENT PRIMARY KEY,
SubID_Subject INT,
ID_Student INT,
Mark INT,
ExamTimes_Mark INT,
FOREIGN KEY (SubID_Subject) REFERENCES Subject(SubID_Subject),
FOREIGN KEY (ID_Student) REFERENCES Student(ID_Student)
);
INSERT INTO Mark (SubID_Subject, ID_Student, Mark, ExamTimes_Mark)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
       
       
       
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where substring_index(name_student," ",-1) like "h%";


-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class
where Start_Date like ("%-12-%");


-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from subject
where Credit_Subject between 3 and 5;



-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
select * from student where name_student like "hung%";
set  sql_safe_updates =0;
update student 
set ID_class = 2;
set sql_safe_updates =1;


/* Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần,nếu trùng sắp theo tên tăng dần.*/


select student.ID_Student, student.Name_Student, `subject`.SubName_Subject, mark.Mark
from mark join student on student.ID_Student = mark.ID_Student 
join `subject` on `subject`.SubID_Subject = mark.SubID_Subject
order by mark DESC, Name_Student ASC;












