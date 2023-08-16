CREATE DATABASE demo;
USE demo;
create table products(
id int primary key,
product_code varchar(50) not null,
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status BIT
);
insert into products 
values(1,"M765","water",10000,2,"for students",b'1'),
(2,"N998","food",75000,4,"for teacher",b'1'),
(3,"B123","cup",10000,3,"for teacher",b'0'),
(4,"C345","pen",9000,1,"for students",b'0');
explain select * from products where product_code = "N998";
explain select * from products 
where product_name = "pen" and product_price = "9000" ;


-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index code_index on products(product_code);
​
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index name_price_index on products(product_name,product_price);


-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

explain select * from products where product_code = "c123";
explain select * from products 
where product_name = "pen" and product_price = "2000" ;

drop index code_index  on products;
drop index name_price_index  on products;


-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_view as
select  product_code, product_name, product_price, product_status 
from products;


-- Tiến hành sửa đổi view
update products_view 
set product_price = 20000 
where product_code = "b123";

-- Tiến hành xoá view
drop view products_view;


-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure display_products_ps()
begin
select * from products;
end //
delimiter //
CALL display_products_ps();

-- Tạo store procedure thêm một sản phẩm mới

delimite//
create procedure add_product_ps(
id int,
product_code varchar(50),
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status BIT)
begin
insert into products values(
id,product_code,product_name,product_price,product_amount,product_description,product_status);
end//
delimiter //
call add_product_ps(7,"I123","ice-cream",6000,4,"for student",b'1');
SELECT * From products;

-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
create procedure update_product_ps(
search_id int,
new_code varchar(50),
new_name varchar(50),
new_price int,
new_amount int,
new_escription varchar(50),
new_status BIT)
begin
update products
set      
product_code=new_code,
product_name = new_name,
product_price =new_price,
product_amount =new_amount,
product_description =new_escription,
product_status =new_status
where id = search_id;
end //
delimiter ;

call update_product_ps(7,"I143","ice-ceam",5000,4,"for student",b'1');



-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_byid_ps(product_id int)
begin
delete from products where id = product_id;
end //
delimiter //
call delete_product_byid_ps(4);