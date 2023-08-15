-- Câu 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
--  chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from hop_dong
join dich_vu on dich_vu.ma_dich_vu =hop_dong.ma_dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ten_dich_vu not in (select dich_vu.ten_dich_vu from dich_vu join hop_dong on dich_vu.ma_dich_vu =hop_dong.ma_dich_vu
where hop_dong.ngay_lam_hop_dong
between "2021/01/01" and "2021/03/31")
group by ma_dich_vu
order by chi_phi_thue desc;



--  Câu 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
--  của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from hop_dong
join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu =loai_dich_vu.ma_loai_dich_vu
where dich_vu.ten_dich_vu not in ( select dich_vu.ten_dich_vu from dich_vu join hop_dong on dich_vu.ma_dich_vu =hop_dong.ma_dich_vu
where hop_dong.ngay_lam_hop_dong
between "2021/01/01" and "2021/12/31")
group by ma_dich_vu
order by ten_dich_vu desc;


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- cách 1
select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;

-- cách 2
select distinct khach_hang.ho_ten
from khach_hang;

-- cách 3
select khach_hang.ho_ten
from khach_hang
group by ho_ten;


-- cách 4
select ho_ten from khach_hang where ho_ten in (
select khach_hang.ho_ten from khach_hang group by ho_ten having count(*) =1);


-- Câu 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(hop_dong.ngay_lam_hop_dong) as 'Tháng' ,count(ma_khach_hang) as 'Số lượng khách đặt trong tháng'
from hop_dong
where year(hop_dong.ngay_lam_hop_dong ) =2021
group by month(hop_dong.ngay_lam_hop_dong)
order by month(hop_dong.ngay_lam_hop_dong);

--  Câu 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc,
if(hop_dong_chi_tiet.so_luong is null,0,sum( hop_dong_chi_tiet.so_luong)) as 'so_luong_dich_vu_di_kem'
from hop_dong
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong =hop_dong.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong;







