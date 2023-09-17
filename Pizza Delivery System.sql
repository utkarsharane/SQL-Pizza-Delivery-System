use utkarsha;
create table customer(customerid int primary key,firstname varchar(20),lastname varchar(20),
address varchar(20),phone int,email varchar(20));
insert into customer values(1,'Asha','Negi','xyz',11,'a@gmail.com'),(2,'Ash','shah','abc',12,'b@gmail.com'),
(3,'Aarav','sharma','def',13,'c@gmail.com'),(4,'Parth','gupta','pqr',14,'d@gmail.com'),
(5,'priti','ghosh','stu',15,'e@gmail.com'),(6,'Ashvi','Narkhede','ghi',16,'f@gmail.com');
select * from customer;
create table orders(ordersid int primary key,orderdate date,customerid int, 
foreign key(customerid) references customer(customerid));
insert into orders values(111,'2023-03-01',1),(112,'2023-03-02',2),(113,'2023-03-03',3),
(114,'2023-03-01',4),(115,'2023-03-11',5),(116,'2023-03-11',6);
select * from orders;
drop table orders;
create table pizza(pizzaid int primary key,pname varchar(20),specification varchar(20),price int);
insert into pizza values(1001,'cheese','onion',150),(1002,'margherita','fenugreek',450),
(1003,'paneer','capcicum',250),(1004,'calzone','olive',650),(1005,'dominos','cheezy',350),
(1006,'greek','spicy',450),(1007,'pizzababy','cheezy',550),(1008,'fullmoon','olive',350),
(1009,'marcos','onion',150),(1010,'little','tomoto',250);
select * from pizza;
create table orderline(lineid int primary key,orderid int,pizzaid int, foreign key(orderid) references 
orders(ordersid),foreign key(pizzaid) references pizza(pizzaid),quantity int);
insert into orderline values(100,111,1002,25),(200,112,1001,250),(300,113,1003,50),(400,114,1004,75),
(500,115,1005,100),(600,116,1006,25),(700,112,1008,75),(800,113,1007,25);
select * from orderline;
create table payment(paymentid int primary key,pdate date,type varchar(20),orderid int,
foreign key(orderid) references orders(ordersid),customerid int, 
foreign key(customerid) references customer(customerid));
insert into payment values(01,'2023-03-01','online',111,1),(02,'2023-03-02','offline',112,2),
(03,'2023-03-03','offline',113,3),
(04,'2023-03-01','online',114,4),(05,'2023-03-11','offline',115,5);
select * from payment;
drop table payment;
create table delivery(deliveryid int primary key,orderid int,
foreign key(orderid) references orders(ordersid),type varchar(20),status varchar(20),arrival varchar(20));
