/*Câu 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.*/

select * from nhan_vien where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' and length(ho_ten) <= 15;


/*Câu 3 :Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị” */
 
select* from khach_hang
where (select round (datediff(curdate(), ngay_sinh) / 365, 0))
between 18 and 50
and (dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị');
