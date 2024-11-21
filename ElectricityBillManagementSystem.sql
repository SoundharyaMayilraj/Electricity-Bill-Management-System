CREATE database ElectricityBillMnagementSystem;
USE ElectricityBillManagementSystem;
CREATE TABLE Customers(
CustomerID INT primary key,
FirstName varchar(30),
LastName varchar(40),
Address text,
pincode varchar(10),
City varchar(20),
State varchar(20),
PhoneNumber varchar(15),
Email varchar(50));

CREATE TABLE Meters(
meter_id int primary key,
CustomerID int,
meter_number varchar(30),
installation_date date,
foreign key(CustomerID) references Customers(CustomerID));

CREATE TABLE Readings(
reading_id int primary key,
meter_id int,
reading_date date,
previous_reading int,
current_reading int,
consumption int, 
foreign key(meter_id) references Meters(meter_id));

CREATE TABLE Tariff(
tariff_id int primary key auto_increment,
lower_limit int,
upper_limit int,
rate_per_unit decimal(10,2));

CREATE TABLE Bills(
bill_id int primary key auto_increment,
CustomerID int,
meter_id int,
reading_id int,
billing_date date,
due_date date,
amount_due decimal(10, 2),
status_status varchar(20) default "Pending",
foreign key(CustomerID) references Customers(CustomerID),
foreign key(meter_id) references Meters(meter_id),
foreign key(reading_id) references Readings(reading_id));

CREATE TABLE Payments(
payment_id int primary key,
bill_id int,
payment_date date,
amount_paid decimal(10,2),
payment_method varchar(30),
foreign key(bill_id) references Bills(bill_id));

INSERT into Customers values(111, "Kishore", "Thiruvalluvar", "13, 2nd Main Rd, Jai Nagar, Arumbakkam",600108,"Chennai", "Tamil Nadu","+91-7155464212", "Kishorethiruvalluvar@gmail.com"),
(112, "Hemanth", "Easwaran", "33, M G Road, Sastri Nagar, Ii Nd Avenueadyar",600047,"Chennai", "Tamil Nadu","+91-7261557254", "hemanth@gmail.com"),
(113, "Sudhakar", "Annadurai", "No.13, Nageswara Rao Rd, 2nd Extension, Panagal Park, T. Nagar",600017,"Chennai", "Tamil Nadu", "+91-6753622525", "Sudhakar@gmail.com"),
(221, "Tharani", "Dhandapani", "118,New #240, Badri Veeraswamy Lane, 600 079, NSC Bose Rd, Sowcarpet",600006,"Chennai", "Tamil Nadu","+91-6352349178", "Tharani@gmail.com"),
(225, "Vasanth", "Durai", "No,7, Station Border Rd, Sri Ram Colony, Tambaram Sanatoruim",600086,"Chennai", "Tamil Nadu", "+91-4574411724", "Vasanth@gmail.com"),
(321, "Anirudh", "Ravi", "VDS House, New No.41, Cathedral Rd",600020,"Chennai", "Tamil Nadu","+91-4366653471", "Anirudh@gmail.com"),
(341, "Aadhya", "Duraisamy", "Plot No. 58, N Mada St, Vinayaka Nagar Colony, Mylapore",600004,"Chennai", "Tamil Nadu","+91-6414258687", "Aadhya@gmail.com"),
(441, "Thiru", "Thiruvengadam", "72, N Mada St, Vinayaka Nagar Colony, Mylapore",600004,"Chennai", "Tamil Nadu","+91-7603759013", "Thiru@gmail.com"),
(565, "Akash", "Palani", "21, Coats Road, N Usman Rd, T. Nagar",600017,"Chennai", "Tamil Nadu", "+91-9000866764", "Akash@gmail.com"),
(580,"Balaji", "Krishnan", "149, AA Block 3rd Main Rd, AB Block, Shanthi Colony, Anna Nagar",600040,"Chennai", "Tamil Nadu","+91-7461609491", "Balaji@gmail.com");

INSERT into Meters values(100, 111, "MTR100", "2019-01-01"),
(101, 112, "MTR101", "2019-05-01"),
(102, 113, "MTR102", "2019-11-01"),
(103, 221, "MTR103", "2019-12-03"),
(104, 225, "MTR104", "2019-01-02"),
(105, 321, "MTR105", "2019-11-01"),
(106, 341, "MTR106", "2019-02-02"),
(107, 441, "MTR107", "2019-03-04"),
(108, 565, "MTR108", "2019-04-05"),
(109, 580, "MTR109", "2019-09-06");

INSERT into Readings values(10, 100, "2024-09-01", 400, 500, 100),
(20, 101, "2024-09-01", 300, 500, 200),
(30, 102, "2024-09-02", 400, 600, 200),
(40, 103, "2024-09-02", 300, 600, 300),
(50, 104, "2024-09-03", 400, 500, 100),
(60, 105, "2024-09-03", 200, 500, 300),
(70, 106, "2024-09-01", 100, 200, 100),
(80, 107, "2024-09-02", 400, 500, 100),
(90, 108, "2024-09-03", 200, 400, 200),
(100, 109, "2024-09-02", 400, 600, 200);

INSERT into Tariff(lower_limit, upper_limit, rate_per_unit) values(0, 100, 0.10),
(100, 200, 0.15),
(200, 300, 0.20),
(300, 400, 0.25),
(400, 500, 0.30),
(500, 600, 0.35),
(600, 700, 0.40),
(700, 800, 0.45),
(800, 900, 0.50),
(900, 1000, 0.55);

Insert into Bills(CustomerID, meter_id,reading_id,billing_date,due_date,amount_due,status_status) values(111, 100, 10, "2024-09-10", "2024-10-08", 550, "Pending"),
(112, 101, 20, "2024-09-10", "2024-10-08", 800, "Pending"),
(113, 102, 30, "2024-09-10", "2024-10-08", 800, "Pending"),
(221, 103, 40, "2024-09-10", "2024-10-08", 1200, "Pending"),
(225, 104, 50, "2024-09-10", "2024-10-08", 550, "Pending"),
(321, 105, 60, "2024-09-10", "2024-10-08", 1200, "Pending"),
(341, 106, 70, "2024-09-10", "2024-10-08", 550, "Pending"),
(441, 107, 80, "2024-09-10", "2024-10-08", 550, "Pending"),
(565, 108, 90, "2024-09-10", "2024-10-08", 800, "Pending"),
(580, 109, 100, "2024-09-10", "2024-10-08", 800, "Pending");

Insert into Payments values(11, 1, "2024-10-08", 550, "NetBanking"),
(12, 2, "2024-10-05", 800, "Debitcard"),
(13, 3, "2024-10-05", 800, "NetBanking"),
(14, 4, "2024-10-01", 1200, "Debitcard"),
(15, 5, "2024-10-01", 550, "NetBanking"),
(16, 6, "2024-10-02", 1200, "Debitcard"),
(17, 7, "2024-10-03", 550, "NetBanking"),
(18, 8, "2024-10-01", 550, "NetBanking"),
(19, 9, "2024-10-08", 800, "NetBanking"),
(20, 10, "2024-10-08", 800, "Debitcard");

Select * from customers;
Select * from meters;
Select * from readings;
Select * from tariff;
Select * from bills;
Select * from payments;
show tables;
alter table customers add column Gender varchar(10);
insert into Customers(Gender) values("Male");
update Customers set Gender= "Male" where customerID=111;
update Customers set Gender= "Male" where customerID=112;
update Customers set Gender= "Male" where customerID=113;
update Customers set Gender= "Female" where customerID=221;
update Customers set Gender= "Female" where customerID=221;
update Customers set Gender= "Male" where customerID=225;
update Customers set Gender= "Male" where customerID=225;
update Customers set Gender= "Male" where customerID=321;
update Customers set Gender= "Female" where customerID=341;
update Customers set Gender= "Male" where customerID=565;
update Customers set Gender= "Male" where customerID=580;
Select * from customers where gender="Male" and FirstName like 'A%';
Select * from payments where payment_method in ("Debitcard");
Select customerID, max(amount_due) as total
from bills
group by customerID
having max(amount_due)
order by CustomerID;
update payments set payment_method="Pending" where payment_id=18;
Select FirstName,gender,PhoneNumber from customers where CustomerID=any(select CustomerID from customers where gender in ("Female"));
create view customer_bill AS 
Select c.firstname, c.city, c.phonenumber, b.due_date, b.amount_due from customers c
inner join bills b
on b.CustomerID=c.CustomerID;
Select * from customer_bill;










