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
insert into customer(fname,lname,email,Address_id,Payment_id,book_id,account_id)values('Rohan','Sena','Rohan112@gmail.com','7','7','7','400105')

alter table customer add account_id int

select * from customer
update customer set account_id=400100 where customer_id=1
update customer set account_id=400101 where customer_id=2
update customer set account_id=400102 where customer_id=3
update customer set account_id=400103 where customer_id=4
update customer set account_id=400104 where customer_id=5



create table orders
(
	order_id int identity(1,1) primary key,
	order_placed_date date default cast(getdate() as date),
	order_Delivered_date datetime default DateAdd(Day,7,sysdatetime()),
	book_id int foreign key references Book(book_id),
	customer_id int foreign key references customer(customer_id),
	)
	drop table orders
	 select * from orders
	 insert into orders (order_placed_date) values('2022/03/01')
	 insert into orders (order_placed_date) values('2022/04/02')
	 insert into orders (order_placed_date) values('2022/05/03')
	 insert into orders (order_placed_date) values('2022/06/04')
	 insert into orders (order_placed_date,order_Delivered_date)values('2022/07/02','2022/08/03')
	 insert into orders (book_id,customer_id) values(1,1)
	 insert into orders (book_id,customer_id) values(2,2)
	 insert into orders (book_id,customer_id) values(3,3)
	 select * from orders




--------------------Multiple join---------
select fname,lname,book_name,author_name,city_name ,state_name,order_id
from customer
join Book on customer.book_id = Book.book_id
join  Address on customer.Address_id = Address.Address_id
join Payment on customer.Payment_id=Payment.Payment_id

select fname,lname,book_name,author_name,city_name ,state_name,order_id
from customer
join Book on customer.book_id = Book.book_id
join  Address on customer.Address_id = Address.Address_id
join Payment on customer.Payment_id=Payment.Payment_id
order by fname asc




            

				------------Book store (Stored procedure)----------------
				------------- Add Book using Stored  Procedure-----------------
alter procedure SP_AddBook
(
@Book_Name varchar(225),
@Book_Image varchar(225),
@Book_Author_Name varchar(225),
@Book_Price int,
@Book_Rating float,
@Book_Quentity int,
@Book_Register_Date datetime
)
as
begin
insert into Book(book_name,book_image,author_name,price,rating,quantity,registered_date)
values (@Book_Name,@Book_Image,@Book_Author_Name,@Book_Price,@Book_Rating,@Book_Quentity,@Book_Register_Date)
end

exec SP_AddBook 'Life is what you make it','https://images-na.ssl-images-amazon.com/images/I/41bV+EHHeAL._SY344_BO1,204,203,200_.jpg','Preeti shenoy',164,4.5,10,'2022/04/15'


					-----------------Display Book Using stored Procedure-------------
alter procedure SP_DisplayBook
as
begin
select * from Book
end

exec SP_DisplayBook 


				--------------------Update Book Using Stored Procedure-----------
create procedure SP_UpdateBook
(
@Book_id int,
@price int
)
as
begin
update Book set price=@price where book_id=@Book_id
end

exec SP_UpdateBook 11,163

				------------------Delete Book using stored procedure--------------				
create procedure SP_DeleteBook
@Book_id int
as
begin
delete from Book where book_id=@Book_id
end

exec SP_DeleteBook 11

					---------------Search Book Using Stored procedure---------
alter procedure SP_SearchBook
@Book_name varchar(225)
as
begin
select  * from Book where book_name=@Book_name 
end

exec SP_SearchBook 'As a man thinketh'

create procedure SPsearchbookbuAuthorname
@Author_name varchar(225)
as
begin
select * from Book where author_name=@Author_name 
end

exec SPsearchbookbuAuthorname 'james allen'

				---------------Add customer stored procedure---------------

create procedure SP_Addcustomer
(
@Customer_fName varchar(225),
@Customer_lName varchar(225),
@email varchar(225),
@Address_id int,
@Payment_id int,
@Book_id int,
@Account_id int
)
as
begin
insert into customer(fname,lname,email,Address_id,Payment_id,book_id,account_id)
values (@Customer_fName,@Customer_lName,@email,@Address_id,@Payment_id,@Book_id,@Account_id)
end

exec SP_Addcustomer 'Sagar','Patil','sagar123@gmail.com',7,7,7,400107


		----------------view customer using stored procedure-----------
create procedure SP_viewcustomer
as
begin
select * from customer
end

exec SP_viewcustomer 

			-----------------update  customer using stored procedure-----------
alter procedure SP_Updatecustomer
(
@Fname varchar(225),
@Customer_id int
)
as
begin
update customer set fname=@Fname where customer_id=@Customer_id
end

exec SP_Updatecustomer 'shona',17

			------------------Delete customer using stored procedure------------
create procedure SP_Deletecustomer
@Fname varchar(225)
as
begin
delete from customer where fname=@Fname
end

exec SP_Deletecustomer 'shona'


					------------Add Address using stored procedure ----------------

create procedure SP_AddAddress
(
@City_Name varchar(225),
@State_Name varchar(225)

)
as
begin
insert into Address(city_name,state_name)
values (@City_Name,@State_Name)
end

exec SP_AddAddress 'nagpur','Maharashtra'
select * from Address


			-------------orders using Stored Procedure----------

create procedure SP_orderplaced
(
	@Book_id int,
	@Customer_id int,
	@Orderplaced_date date
	)
as
begin
insert into orders(book_id,customer_id,order_placed_date,order_Delivered_date)
values(@Book_id,@Customer_id,@Orderplaced_date,dateadd(day,7,@Orderplaced_date))
end

exec  SP_orderplaced 1,1,'2022/02/03'
select * from orders





alter procedure sp_getdataorder
as
begin
declare @sales int
select 
	@sales = sum (price * quantity )
	from book
	inner join orders on orders.book_id=book.book_id
	where
	year(order_placed_date) = 2022;
	select @sales as TotalAmountperyear ;
	if @sales <1000
	begin 
	print 'Great sale amount in 2020 IS GREATER THAN 1000'
	end
	else
	begin 
	print 'The sale amount in 2020 is less than 1000'
	end
	end

exec sp_getdataorder

select * from Book
select * from orders


create procedure sp_getbookdata
as
begin
select fname,lname,book_name,author_name,city_name ,state_name,order_id
from customer
join Book on customer.book_id = Book.book_id
join  Address on customer.Address_id = Address.Address_id
join Payment on customer.Payment_id=Payment.Payment_id
end
exec sp_getbookdata

				