create database MD4_Project;
use MD4_Project;

create table Role(
id int primary key auto_increment,
role_name varchar(50)
);
create table User(
id int primary key auto_increment,
username varchar(255),
avatar_url varchar(255),
email varchar(255),
password varchar(255),
phone varchar(11),
address varchar(255),
role_id int,
status bit default 1, 
foreign key(role_id) references Role(id)
);

create table Catalog(
id int primary key auto_increment,
catalog_name varchar(255)
); 

create table Products(
id int primary key auto_increment,
product_name varchar(255),
image_url varchar(255),
description text,
stock int check(stock >= 0),
catalog_id int,
import_date datetime ,
import_price double,
export_price double,
status bit default 1,
foreign key(catalog_id) references Catalog(id)
);

create table Orders(
id int primary key auto_increment,
product_id int,
export_date datetime,
foreign key (product_id)references Products(id) 
);

create table orders_detail(
id int primary key auto_increment,
order_id int,
user_id int,
quantity int,
total double,
status bit,
foreign key(order_id) references Orders(id),
foreign key(user_id) references User(id)
);



