create database case_study_web;

use case_study_web;

create table tai_khoan(
ma_tai_khoan int primary key auto_increment,
ten_tai_khoan varchar(100),
mat_khau varchar(100)
);


create table khu_vuc(
ma_khu_vuc int primary key auto_increment,
ten_khu_vuc varchar(100)
);


create table so_dien_thoai(
ma_so_dien_thoai int primary key auto_increment,
so_dien_thoai varchar (20)
);

create table nguoi_nuoi(
ma_nguoi_nuoi int primary key auto_increment,
ten_nguoi_nuoi varchar(100),
gioi_tinh int,
ma_tai_khoan int,
ma_so_dien_thoai int,
foreign key (ma_so_dien_thoai) references so_dien_thoai (ma_so_dien_thoai),
foreign key (ma_tai_khoan) references tai_khoan (ma_tai_khoan)
);

create table nguoi_giam_ho(
ma_nguoi_giam_ho int primary key auto_increment,
ten_nguoi_giam_ho varchar (100),
gioi_tinh int,
ma_khu_vuc int,
ma_so_dien_thoai int,
foreign key (ma_so_dien_thoai) references so_dien_thoai (ma_so_dien_thoai),
foreign key (ma_khu_vuc) references khu_vuc (ma_khu_vuc)
);

create table tre_em (
ma_tre_em int primary key auto_increment,
ten_tre_em varchar (100),
gioi_tinh int,
ngay_sinh date,
trang_thai_nhan_nuoi int,
mo_ta varchar(250),
ma_khu_vuc int,
ma_nguoi_giam_ho int,
foreign key (ma_khu_vuc) references khu_vuc (ma_khu_vuc),
foreign key (ma_nguoi_giam_ho) references nguoi_giam_ho (ma_nguoi_giam_ho)
);

create table hinh_anh(
ma_hinh_anh int primary key auto_increment,
ma_tre_em int,
foreign key (ma_tre_em) references tre_em (ma_tre_em)
);

create table cam_ket(
ma_cam_ket int primary key auto_increment,
so_tien int,
ngay_nhan_nuoi date,
trang_thai int,
ma_tre_em int,
ma_nguoi_nuoi int,
foreign key (ma_tre_em) references tre_em (ma_tre_em),
foreign key (ma_nguoi_nuoi) references nguoi_nuoi (ma_nguoi_nuoi)
);

