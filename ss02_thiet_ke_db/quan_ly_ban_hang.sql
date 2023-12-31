create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customers(
c_id int primary key,
c_name varchar(20),
c_age int
);
create table orders (
o_id int primary key,
c_id int,
o_date date,
o_total_price float,
foreign key (c_id) references customer(c_id)
);
create table products (
p_id int primary key,
p_name varchar(20),
p_price float
);
create table orders_detail (
o_id int,
p_id int,
od_qty int,
PRIMARY KEY(o_id, p_id),
foreign key (o_id) references orders(o_id),
foreign key (p_id) references product(p_id)
);