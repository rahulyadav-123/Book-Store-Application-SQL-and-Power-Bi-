create database bookstore 
use bookstore
select * from sys.databases

create table Book
(	
		book_id int identity(1,1) primary key,
		book_name varchar(55),
		author_name varchar(55), 
		price int,
		rating float,
		book_image varchar(225),
		quantity int,
		registered_date datetime
		)
	select * from Book
	
	insert into Book(book_name,author_name,price,rating,book_image,quantity,registered_date)values('As a man thinketh','james allen',97,'5','https://images-eu.ssl-images-amazon.com/images/I/51eyNnHQyDL._SX198_BO1,204,203,200_QL40_FMwebp_.jpg','10',GETDATE())
	insert into Book(book_name,author_name,price,rating,book_image,quantity,registered_date)values('Greatest comedies of shakespare','William Shakespare',218,'4.5','https://images-na.ssl-images-amazon.com/images/I/51nXWvfeOFS._SX460_BO1,204,203,200_.jpg','9',GETDATE())
	insert into Book(book_name,author_name,price,rating,book_image,quantity,registered_date)values('Worlds Greatest classic','Emily Bronte',118,'3.5','https://images-na.ssl-images-amazon.com/images/I/51eyNnHQyDL._SX451_BO1,204,203,200_.jpg','5',GETDATE())
	insert into Book(book_name,author_name,price,rating,book_image,quantity,registered_date)values('The best of sherlock Homes','Sherlock Homes',500,'4.8','https://images-na.ssl-images-amazon.com/images/I/41LS+soxz5L._SX258_BO1,204,203,200_.jpg','6',GETDATE())
	insert into Book(book_name,author_name,price,rating,book_image,quantity,registered_date)values('Farside','Jaishankar Krishnamurthy',455,'3.8','https://images-eu.ssl-images-amazon.com/images/I/41gIJPqpHrL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg','3',GETDATE())
	insert into Book(book_name,author_name,price,rating,book_image,quantity,registered_date)values('Nobody Likes An outsider','Fawaz Jallel',97,'2.8','https://images-eu.ssl-images-amazon.com/images/I/51VCeGp2nZL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg','4',GETDATE())

	update Book set book_name='Rich dad Poor dad' where book_id=2
	update Book set author_name='Robert kiyosaki' where book_id=2
	update Book set rating='4.9' where book_id=2
	update Book set book_image='https://images-eu.ssl-images-amazon.com/images/I/51u8ZRDCVoL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg' where book_id=2

	create table Address
	(	
		Address_id int identity(1,1) primary key,
		city_name varchar(55),
		state_name varchar(55) 
		
		)

	select * from Address
	insert into Address(city_name,state_name)values('Mumbai','Maharashtra')
	insert into Address(city_name,state_name)values('Surat','Gujarat')
	insert into Address(city_name,state_name)values('Noida','Utter pradesh')
	insert into Address(city_name,state_name)values('Indore','Madhya pradesh')
	insert into Address(city_name,state_name)values('Banglore','Karnataka')
	insert into Address(city_name,state_name)values('Ahamdabad','Gujarat')
	insert into Address(city_name,state_name)values('Pune','Maharashtra')

	delete from Address where Address_id=6 

	create table Payment
	(	
		Payment_id int  primary key,
		Account_id int,
		order_id int,
		order_placed_date date,
		order_delivered_date date
		
		)
	
	select * from Payment
	insert into Payment(Payment_id,Account_id,order_id,order_placed_date,order_delivered_date)values(1,101,400102,'05-04-2022','08-04-2022')
	insert into Payment(Payment_id,Account_id,order_id,order_placed_date,order_delivered_date)values(2,102,400103,'06-04-2022','09-04-2022')
	insert into Payment(Payment_id,Account_id,order_id,order_placed_date,order_delivered_date)values(3,103,400104,'08-04-2022','10-04-2022')
	insert into Payment(Payment_id,Account_id,order_id,order_placed_date,order_delivered_date)values(4,104,400105,'09-04-2022','11-04-2022')
	insert into Payment(Payment_id,Account_id,order_id,order_placed_date,order_delivered_date)values(5,105,400106,'01-05-2022','08-05-2022')
	insert into Payment(Payment_id,Account_id,order_id,order_placed_date,order_delivered_date)values(6,106,400107,'02-05-2022','06-05-2022')
	insert into Payment(Payment_id,Account_id,order_id,order_placed_date,order_delivered_date)values(7,107,400108,'03-05-2022','08-05-2022')

	create table customer
	(	
		customer_id int identity(1,1) primary key,
		fname varchar(225),
		lname varchar(255),
		email varchar(255) unique,
		Address_id int foreign key references Address(Address_id),
		Payment_id int foreign key references Payment(Payment_id),
		book_id int foreign key references Book(book_id),
		
		)
select * from customer

insert into customer(fname,lname,email,Address_id,Payment_id,book_id)values('Rahul','Yadav','ry219613@gmail.com','1','1','1')
insert into customer(fname,lname,email,Address_id,Payment_id,book_id)values('Rohit','sharma','rohit123@gmail.com','2','2','2')
insert into customer(fname,lname,email,Address_id,Payment_id,book_id)values('Rajesh','verma','rajesh23@gmail.com','3','3','3')
insert into customer(fname,lname,email,Address_id,Payment_id,book_id)values('sahil','khan','sahil14@gmail.com','4','4','4')
insert into customer(fname,lname,email,Address_id,Payment_id,book_id)values('Roshan','Singh','Roshan12@gmail.com','5','5','5')
insert into customer(fname,lname,email,Address_id,Payment_id,book_id)values('Rohan','Sena','Rohan112@gmail.com','7','7','7')


	