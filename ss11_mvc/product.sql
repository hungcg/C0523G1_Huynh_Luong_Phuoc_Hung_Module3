create database product;

use product;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    price INT,
    `description` VARCHAR(50),
    supplier VARCHAR(50)
);


insert into products (`name`,price,`description`,supplier)
values 
('jacket',500000,'available','Cồn Market'),
('sneaker',300000,'out of order','Thượng Đình'),
('shirt',200000,'available','Gucci-Fake');
