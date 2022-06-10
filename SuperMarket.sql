
create database shopping_zone


use shopping_zone

create table Customer
(
	 CustId int primary key,
	 CustName nvarchar(50) not null ,
	 CustGender  nvarchar(10) not null ,
	 CustAddress  nvarchar(50) not null ,
	 CustEmail  nvarchar (20) not null,
	 CustMobile bigint not null,
	 CustPassword nvarchar(50) not null,
	 CustConfPass  nvarchar(50) not null
) ;

create table Seller(
	SellerId int Primary Key,
	SellerName nvarchar(50) not null,
	SellerMobile bigint not null,
	SellerEmail nvarchar(50) not null,
	SellerCategory nvarchar(50) not null,
	SellerAddress nvarchar(50) not null,
	SellerPassword nvarchar(50) not null,
	SellerConfPass nvarchar(50) not null
) ;

create table Product
(
	ProdId int Primary key,
	ProdName nvarchar(50) not null,
	ProdDesc nvarchar(500) not null,
	ProdImage nvarchar(50) not null,
	ProdCategory nvarchar(50) not null ,
	ProdPrice decimal(10,2) not null,
	ProdDiscount decimal(10,2) not null,
	ProdStatus nvarchar(50) not null,
	SellerId int foreign key references Seller(SellerId) not null,
); 

CREATE TABLE Cart
(
	CartId int Primary Key,
	CustId int foreign key references Customer(CustId) not null,
	ProdId int foreign key references Product(ProdId) not null,
);

create table Payment
(
	PaymentId int primary key,
	PaymentMethod nvarchar(50) not null,
	TotalPrice decimal(10,2) not null,
	ProdId int foreign key references Product(ProdId) not null,
	CustId int foreign key references Customer(CustId) not null,
	SellerId int foreign key references Seller(SellerId) not null
);

Create table Orders
(
		 OrderId int Primary Key,
		 OrderStatus nvarchar(50) not null,
		 OrderDate Date not null,
		 ProdId int FOREIGN KEY REFERENCES Product(ProdID) not null,
         CustId int  FOREIGN KEY REFERENCES Customer(CustId) not null,
         PaymentId int FOREIGN KEY REFERENCES Payment(PaymentId) not null,
         SellerId int foreign key references Seller(SellerId) not null
	);

create table Rating
(
	RatingId int Primary Key,
	RatingValue int not null,
	Feedback nvarchar(50) not null,
	CustId int Foreign Key references Customer(CustId) not null,
	ProdId int Foreign Key references Product(ProdId) not null
);

CREATE TABLE Invoice(
InvoiceId int Primary Key,
OrderId int foreign key references Orders(OrderId) not null,  
ProdId int foreign key references Product(ProdId) not null,
CustId  int  foreign key references Customer(CustId) not null, 
SellerId int foreign key references Seller(SellerId) not null
) 