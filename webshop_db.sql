use webshop_db;

create table products(
	product_id int primary key auto_increment,
    product_name varchar(100) not null,
    price decimal(10,2) not null,
    stock_quantity int default 0,
    description text
);

create table customers (
	customer_id int primary key auto_increment,
    customer_name varchar(100) not null,
    address varchar(200),
    phone_number varchar(18),
    email varchar(50)
);

create table employees (
	employee_id int primary key auto_increment,
    employee_name varchar(100) not null,
    position varchar(50),
    phone_number varchar(20)
);

create table orders (
	order_id int primary key auto_increment,
    order_date date not null,
    customer_id int not null,
    employee_id int,
    total_amount int,
    foreign key (customer_id) references customers(customer_id),
    foreign key (employee_id) references employees(employee_id)
);

create table order_details(
	order_detail_id int primary key auto_increment,
    order_id int not null,
    product_id int not null,
    quantity int not null,
    unit_price int not null,
    total_price int generated always as (quantity * unit_price) stored,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

ALTER TABLE order_details DROP COLUMN total_price;

ALTER TABLE order_details ADD COLUMN total_price INT;

SET FOREIGN_KEY_CHECKS = 1;

