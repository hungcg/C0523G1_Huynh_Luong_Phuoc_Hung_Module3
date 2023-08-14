CREATE DATABASE quan_ly_ban_hang;
use quan_ly_ban_hang;
CREATE TABLE customer(
c_ID INT PRIMARY KEY,
name_Customer VARCHAR(25),
c_Age TINYINT
);
CREATE TABLE `order`(
o_ID INT PRIMARY KEY,
c_ID INT,
FOREIGN KEY (c_ID) REFERENCES customer(c_ID),
o_Date DATETIME,
o_Total_Price INT
);
CREATE TABLE product(
p_ID INT PRIMARY KEY,
p_name VARCHAR(25),
p_price INT
);
CREATE TABLE orderDetail(
o_ID INT,
p_ID INT,
od_QTY INT
);
INSERT INTO customer
VALUES (1, 'Minh Quan', '10');
INSERT INTO customer
VALUES (2, 'Ngoc Oanh', '20');
INSERT INTO customer
VALUES (3, 'Hong Ha', '50');

INSERT INTO `order`
VALUES (1, 1, '2006/3/21', NULL);
INSERT INTO `order`
VALUES (2, 2, '2006/3/23', NULL);
INSERT INTO `order`
VALUES (3, 1, '2006/3/16', NULL);

INSERT INTO product
VALUES (1, 'May Giat', '3');
INSERT INTO product
VALUES (2, 'Tu Lanh', '5');
INSERT INTO product
VALUES (3, 'Dieu Hoa', '7');
INSERT INTO product
VALUES (4, 'Quat', '1');
INSERT INTO product
VALUES (5, 'Bep Dien', '2');

INSERT INTO orderDetail
VALUES (1, 1, 3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);



-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select customer.name_Customer, product.p_name, orderdetail.od_QTY
from customer join `order` on customer.c_ID =  `order`.c_ID
join orderdetail on orderdetail.o_ID = `order`.o_ID 
join product on product.p_ID = orderdetail.p_ID;


-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.name_customer,product.p_name,orderdetail.od_QTY
from customer left join `order` on customer.c_ID =  `order`.c_ID
left join orderdetail on orderdetail.o_ID = `order`.o_ID 
left join product on product.p_ID = orderdetail.p_ID


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.name_customer,product.p_name,orderdetail.od_QTY
from customer left join `order` on customer.c_ID =  `order`.c_ID
left join orderdetail on orderdetail.o_ID = `order`.o_ID 
left join product on product.p_ID = orderdetail.p_ID
where orderdetail.od_QTY is null;


-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
--  (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select orderdetail.o_ID, `order`.o_Date, SUM(orderdetail.od_QTY * product.p_price) AS 'total price'
from customer join `order` on customer.c_ID =  `order`.c_ID
join orderdetail on orderdetail.o_ID = `order`.o_ID 
join product on product.p_ID = orderdetail.p_ID
group by orderdetail.o_ID;







