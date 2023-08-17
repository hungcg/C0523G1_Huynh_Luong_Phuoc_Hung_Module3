-- Câu 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

-- set sql_safe_updates =0;

-- alter table nhan_vien add xoa_nhan_vien bit(1) default 0;

-- update nhan_vien
-- set xoa_nhan_vien =1
-- where ma_nhan_vien not in (select hop_dong.ma_nhan_vien from hop_dong
-- where year(ngay_lam_hop_dong) in ('2020', '2021'));

-- select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten
-- from nhan_vien
-- where xoa_nhan_vien = 1

CREATE TEMPORARY TABLE temp

SELECT nhan_vien.ma_nhan_vien
FROM nhan_vien
LEFT JOIN hop_dong
ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
GROUP BY nhan_vien.ma_nhan_vien
HAVING COUNT(hop_dong.ma_nhan_vien) < 1;
SELECT * FROM temp;

DELETE FROM nhan_vien
WHERE ma_nhan_vien IN (SELECT * FROM temp);

DROP TEMPORARY TABLE temp;



-- Câu 17:	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

CREATE TEMPORARY TABLE temp

SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten,khach_hang.ma_loai_khach
FROM 
khach_hang LEFT JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
LEFT JOIN hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
WHERE loai_khach.ten_loai_khach = "Platinum"
GROUP BY hop_dong.ma_hop_dong,ma_khach_hang
HAVING SUM(dich_vu.chi_phi_thue+(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia))>10000000;

UPDATE khach_hang
SET ma_loai_khach = 1
WHERE ma_khach_hang IN (
SELECT ma_khach_hang FROM temp);

DROP TEMPORARY TABLE temp;


-- Câu 18 :Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

CREATE TEMPORARY TABLE temp 

SELECT khach_hang.ma_khach_hang FROM
khach_hang INNER JOIN hop_dong
 ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 WHERE YEAR(ngay_lam_hop_dong)<2021;
 
 SET FOREIGN_KEY_CHECKS=0;
 DELETE FROM khach_hang 
 WHERE khach_hang.ma_khach_hang IN(SELECT * FROM temp);
 SET FOREIGN_KEY_CHECKS=1;
 
 DROP TEMPORARY TABLE temp;

-- Câu 19:	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

CREATE TEMPORARY TABLE temp 

SELECT dich_vu_di_kem.ma_dich_vu_di_kem
FROM hop_dong JOIN hop_dong_chi_tiet
ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
JOIN dich_vu_di_kem 
ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2020 
AND hop_dong_chi_tiet.so_luong > 10;


UPDATE dich_vu_di_kem
SET gia = dich_vu_di_kem.gia*2
WHERE ma_dich_vu_di_kem IN (
SELECT * FROM temp);

DROP TEMPORARY TABLE temp;

-- Câu 20: Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT ma_nhan_vien AS id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM nhan_vien
UNION
SELECT ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM khach_hang;

