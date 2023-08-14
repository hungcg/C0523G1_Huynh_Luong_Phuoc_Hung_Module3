-- Câu 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
-- một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select * from nhan_vien where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' and length(ho_ten) <= 15;


-- Câu 3 :Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
-- có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị” 
 
select* from khach_hang
where (select round (datediff(curdate(), ngay_sinh) / 365, 0))
between 18 and 50
and (dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị');


-- Câu 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu
-- lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của
-- khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là
-- “Diamond”.

select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_hop_dong) AS 'so_lan_dat_phong'
from loai_khach join khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang =hop_dong.ma_khach_hang
where ten_loai_khach = 'Diamond'
group by khach_hang.ma_khach_hang;



SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, 
dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc,
if (hop_dong_chi_tiet.so_luong is null, dich_vu.chi_phi_thue ,
sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia)) 
as 'tong_tien'
FROM khach_hang LEFT JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
LEFT JOIN hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong 
ORDER BY khach_hang.ma_khach_hang, hop_dong.ma_hop_dong DESC;



-- Câu 5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
-- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với
-- tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng *
-- Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
-- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những
-- khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select khach_hang.ma_khach_hang,khach_hang.ho_ten,khach_hang.ten_loai_khach,hop_dong.ma_hopdong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong_ngay_ket_thuc,
if(dich_vu.chi_phi_thue,hop_dong_chi_tiet.so_luong,
sum(dich_vu.chi_phi_thue+hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia)) AS tong_tien
from 



