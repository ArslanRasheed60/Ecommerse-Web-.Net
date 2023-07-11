create database MAKAN_UL_TIJARAH

use MAKAN_UL_TIJARAH

--------------------------------------CUSTOMER---------------------------------------------
alter table CUSTOMER alter column [PASSWORD] varchar(50) not null --added
alter table CUSTOMER alter column EMAIL varchar(25) not null
alter table CUSTOMER add constraint CUSTOMER_EMAIL_UNIQUE unique (EMAIL);
alter table CUSTOMER add CITY varchar(20)
alter table CUSTOMER drop column AGE
alter table CUSTOMER add DateOfBirth date	--added

CREATE TABLE CUSTOMER(
	ID INT CONSTRAINT CUSTOMER_PK PRIMARY KEY(ID),
	FIRSTNAME VARCHAR(20) NOT NULL,
	LASTNAME VARCHAR(20) NOT NULL,
	AGE INT NOT NULL,		--removed
	GENDER CHAR CONSTRAINT CUSTOMER_GENDER_CHECK CHECK(GENDER='M'OR GENDER='F'),
	EMAIL VARCHAR(25),		--edited
	ADDRESS VARCHAR(50),
	CONTACT VARCHAR(12),
)

insert into CUSTOMER values (1,'arslan','rasheed','M','arslan@gmail.com','House 32 B','12341234','arslan123','Gujranwala','1-10-2019')

select * from CUSTOMER
----------------------------------------SELLER--------------------------------------------

alter table SELLER add [PASSWORD] varchar(50) not null --added
alter table SELLER alter column EMAIL varchar(25)  not null
alter table SELLER add constraint SELLER_EMAIL_UNIQUE unique (EMAIL);
alter table SELLER add CITY varchar(20)
alter table SELLER drop column AGE
alter table SELLER add DateOfBirth date	--added

CREATE TABLE SELLER (
	ID INT CONSTRAINT SELLER_PK PRIMARY KEY(ID),
	FIRSTNAME VARCHAR(20) NOT NULL,
	LASTNAME VARCHAR(20) NOT NULL,
	AGE INT NOT NULL,
	GENDER CHAR CONSTRAINT SELLER_GENDER_CHECK CHECK(GENDER='M'OR GENDER='F'),
	EMAIL VARCHAR(25),
	ADDRESS VARCHAR(50),
	CONTACT VARCHAR(12),
)

insert into SELLER values (1,'arslan','rasheed','M','arslan@gmail.com','House 32 B','12341234','arslan123','Gujranwala','1-10-2019')

select * from SELLER

select count(*) as number from SELLER where EMAIL = 'arslan@gmail.com'

------------------------------------------------------------------------------------
CREATE TABLE CATEGORY(
	ID INT CONSTRAINT CATEGORY_PK PRIMARY KEY(ID),
	NAME VARCHAR(20) NOT NULL,
)

insert into CATEGORY values 
(1,'Caps'),
(2,'Books'),
(3,'Tasbeeh')

insert into CATEGORY values 
(4,'Attar')

select [NAME] from CATEGORY

------------------------------------------------------------------------------------
CREATE TABLE ITEMS(
	ID INT CONSTRAINT ITEMS_PK PRIMARY KEY(ID),
	NAME VARCHAR(30) NOT NULL,
	SELLER_ID INT NOT NULL CONSTRAINT ITEMS_SELLER_ID_FK FOREIGN KEY(SELLER_ID) REFERENCES SELLER(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	CATEGORY_ID INT NOT NULL CONSTRAINT ITEMS_CATEGORY_ID_FK FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	STOCK INT DEFAULT 0,
	DISCOUNT DECIMAL(4,2) DEFAULT 0,
	PRICE INT DEFAULT 0
)

alter table ITEMS add imagePath varchar(300)
alter table ITEMS alter column imagePath varchar(1000)

select * from ITEMS

------------------------------------------------------------------------------------
CREATE TABLE [TRANSACTION](
	ID INT CONSTRAINT TRANSACTION_PK PRIMARY KEY(ID),
	CUSTOMER_ID INT NOT NULL CONSTRAINT TRANSACTION_CUSTOMER_ID_FK FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	QUANTITY INT CONSTRAINT TRANSACTION_QUANTITY_CHECK CHECK(QUANTITY>0),
	PAYMENT INT NOT NULL CONSTRAINT TRANSACTION_PAYMENT_CHECK CHECK(PAYMENT>=0),
	DATE_PURCHASE DATE,
)

alter table [TRANSACTION] add ITEM_ID INT NOT NULL CONSTRAINT TRANSACTION_ITEM_ID_FK FOREIGN KEY(ITEM_ID) REFERENCES ITEMS(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

select * from [TRANSACTION]



-------------------------------------------------------------------------------------
CREATE TABLE FEED_BACK(
	ID INT CONSTRAINT FEEDBACK PRIMARY KEY(ID),
	CUSTOMER_ID INT NOT NULL CONSTRAINT FEEDBACK_CUSTOMER_ID_FK FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	ITEM_ID INT NOT NULL CONSTRAINT FEEDBACK_ITEM_ID_FK FOREIGN KEY(ITEM_ID) REFERENCES ITEMS(ID) ON DELETE CASCADE ON UPDATE NO ACTION,
	FEEDBACK_DATE DATE,
	RATING INT
)
alter table FEED_BACK add [Description] varchar(200)

select * from FEED_BACK 

delete from FEED_BACK

--------------------------------------ADMIN Table----------------------------------------------------
create table [admin]
(
[Name] varchar(30),
Email varchar(30),
[Password] varchar(30),
constraint admin_pk_email primary key(Email)
)


insert into [admin]
values ('Arslan Rasheed','l202090@lhr.nu.edu.pk','admin123789');

select * from [admin]







---------------------------------------------------------------------------------------------------------------------
------------------------------------------------procedures------------------------------------------------------------------------
--1--procedure added
create procedure AddSellerProduct
@productname varchar(30),
@sellerEmail varchar(25),
@categoryName varchar(20),
@stock int,
@discount decimal(4,2),
@price int,
@image varchar(300),
@check int output
as begin

declare @item_count int;
select @item_count = count(*) from ITEMS
declare @sellerID int ;
select @sellerID = ID from SELLER where EMAIL = @sellerEmail
declare @categoryID int; 
select @categoryID = ID from CATEGORY where [NAME] = @categoryName

if(@item_count = 0)
	begin
		insert into ITEMS values (1,@productname,@sellerID,@categoryID,@stock,@discount,@price,@image)
		set @check = 1;
	end
else
	begin
		declare @itemIDcheck int;
		select @itemIDcheck = count(*) from ITEMS where @productname = [NAME];
		if(@itemIDcheck = 0)
			begin
				select @item_count = Max(ID) from ITEMS;
				set @item_count = @item_count + 1;
				insert into ITEMS values (@item_count,@productname,@sellerID,@categoryID,@stock,@discount,@price,@image)
				set @check = 1;
			end
		else 
			begin
				declare @itemIDcheck2 int;
				select @itemIDcheck2 = count(*) from ITEMS where @productname = [NAME] and @sellerID = SELLER_ID and @categoryID = CATEGORY_ID ;
				if(@itemIDcheck2 = 0)
					begin
						select @item_count = Max(ID) from ITEMS
						set @item_count = @item_count + 1;
						insert into ITEMS values (@item_count,@productname,@sellerID,@categoryID,@stock,@discount,@price,@image)
						set @check = 1;
					end
				else 
					begin
						set @check = 0;
					end
			end
	end
end

declare @success int execute AddSellerProduct 'SpecialCaps','arslanrasheed@gmail.com','Caps',5,22.2,1232,'~/Image_inventory/simpleCap.jpg',@success output select Max(@success) as success


-------2 procedure added-------------------------------------------------------------------------
create procedure show_current_seller_products
@Email varchar(25)
as begin

declare @seller_id int;
select @seller_id = id from SELLER where EMAIL = @Email;

select i.[NAME] as Product,c.[NAME] as Category,i.STOCK as Stock,i.DISCOUNT as Discount,i.PRICE as Price
from ITEMS i join CATEGORY c on i.CATEGORY_ID = c.ID where @seller_id = i.SELLER_ID
end


execute show_current_seller_products 'arslanrasheed@gmail.com'

---------3 procedure added-----------------
create procedure delete_item_by_admin
@product varchar(30),
@seller varchar(20),
@category varchar(20),
@flag int output
as begin

declare @iid int;

select @iid = i.ID from ITEMS i join SELLER s on i.SELLER_ID=s.ID join CATEGORY c on i.CATEGORY_ID = c.ID
where c.NAME = @category and i.NAME = @product and s.FIRSTNAME = @seller
	if(@iid > 0)
	begin
		set @flag = 1;
		delete from ITEMS where ID = @iid
	end
	else
	begin
		set @flag = 0;
	end
end


declare @flag int;
execute delete_item_by_admin 'random photo','taimor','Caps',@flag output
select @flag as flag


--4--search procedures-------added-----------------------------

create procedure return_name_while_search (@name varchar(20))
as begin
select top 10 [NAME] from ITEMS
where Name LIKE CONCAT('%',(select lower(@name)) , '%')
end

create procedure return_image_while_search (@name varchar(20))
as begin
select top 10 imagePath from ITEMS
where Name LIKE CONCAT('%',(select lower(@name)) , '%')
end

create procedure return_price_while_search (@name varchar(20))
as begin
select top 10 PRICE from ITEMS
where Name LIKE CONCAT('%',(select lower(@name)) , '%')
end

create procedure return_stock_while_search (@name varchar(20))
as begin
select top 10 STOCK from ITEMS
where Name LIKE CONCAT('%',(select lower(@name)) , '%')
end

drop procedure return_name_while_search

execute return_name_while_search 'tasbeeh'
execute return_image_while_search 'tasbeeh'
execute return_price_while_search 'tasbeeh'
execute return_stock_while_search 'tasbeeh'

select count(*) from ITEMS where Name LIKE CONCAT('%',(select lower('hello')) , '%')


------5----added---------------------------------------------------------
create procedure show_current_customer_purchases
@Email varchar(25)
as begin

declare @cus_id int;
select @cus_id = id from CUSTOMER where EMAIL = @Email;

select i.[NAME] as Product,c.[NAME] as Category,t.QUANTITY as Quantity,t.PAYMENT as Price,t.DATE_PURCHASE as Purchase_Date
from ITEMS i join CATEGORY c on i.CATEGORY_ID = c.ID join [TRANSACTION] t on t.ITEM_ID = i.ID where @cus_id = t.CUSTOMER_ID
end


execute show_current_customer_purchases 'arslanrasheed@gmail.com'


-------6 procedure added-----------------------------------------------------------------------------------------------

create procedure insert_customer_transactions
@c_email varchar(25),
@p_name varchar(30),
@quantity int,
@pay int
as begin

declare @c_id int;
select @c_id =  ID from CUSTOMER where EMAIL = @c_email;
declare @p_id int;
select @p_id = ID from ITEMS where @p_name = [NAME];
update ITEMS set STOCK = STOCK - @quantity where ID = @p_id
declare @tid int;
select @tid = MAX(ID) from [TRANSACTION];
if (@tid > 0)
begin
	set @tid = @tid + 1;
end
else
begin
	set @tid = 1;
end
declare @date date;
select @date = CAST(GETDATE() as DATE);
insert into [TRANSACTION] values (@tid,@c_id,@quantity,@pay,@date,@p_id);
end

execute insert_customer_transactions 'asdf@gmail.com','Simple Attar',1,50


-------7 procedure added----------------------------------------------------------------------------------------------------
create procedure customer_provide_feedback
@c_id int,
@i_id int,
@rate int,
@descrip varchar(200)
as begin
declare @date date;
select @date = CAST(GETDATE() as date);
declare @f_id int;
select @f_id = MAX(ID) from FEED_BACK
if(@f_id > 0)
begin
	set @f_id = @f_id + 1;
end
else 
begin
	set @f_id = 1;
end
insert into FEED_BACK values (@f_id,@c_id,@i_id,@date,@rate,@descrip);
end

execute customer_provide_feedback 4,2,3,'average'


---------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------Views-------------------------------------------------------------------------
--1--added--
create view sellers_list_show
as
select FIRSTNAME,GENDER,CONTACT,CITY,EMAIL from SELLER
--2--added--
create view Customer_list_show
as
select FIRSTNAME,GENDER,CONTACT,CITY,EMAIL from CUSTOMER

--3--added--
create view ordersDetails
as
select c.FIRSTNAME, i.NAME , t.QUANTITY,t.PAYMENT,t.DATE_PURCHASE
from [TRANSACTION] t join CUSTOMER c on c.ID = t.CUSTOMER_ID join ITEMS i on i.ID = t.ITEM_ID


-----4--added----------------------------------------


create view Item_list_show
as
select i.[NAME] as Item_Name ,s.FIRSTNAME,c.[NAME] as category_name ,i.STOCK,i.DISCOUNT,i.PRICE
from ITEMS i join SELLER s on i.SELLER_ID = s.ID join CATEGORY c on c.ID = i.CATEGORY_ID

----5---addded---------------------------------------------
create view show_feedback_details
as
select c.FIRSTNAME , i.NAME, f.RATING, f.FEEDBACK_DATE, f.Description from FEED_BACK f join CUSTOMER c on f.CUSTOMER_ID = c.ID join ITEMS i on i.ID = f.ITEM_ID

-------------------------------------------------------------------------------------------------------------------------





------------------------------------------------Triggers-------------------------------------------------------------------------
create trigger wrong_category on item
after INSERT
as BEGIN
declare @id int 
set @id= select category_id from [inserted]
select count(*) c from category where id=@id
if(c==1)--category is valid
	begin
	print('Item Inserted Successfully')
	end

else--category is invalid
	begin
	delete from items where category_id=@id
	print('You have chosen a wrong category')
	end
end
-------------------------------------------------------------
create trigger wrong_seller on seller
after INSERT
as BEGIN
declare @id int 
set @id= select seller_id from [inserted]
select count(*) c from seller where id=@id
if(c==1)--category is valid
	begin
	print('Item Inserted Successfully')
	end

else--category is invalid
	begin
	delete from items where category_id=@id
	print('Seller does not exits')
	end
end
	
--------------------------------------------------------------
create trigger duplicate_item_id on item
instead of INSERT
as BEGIN
declare @id int 
set @id=select id from [inserted]
select count(*) c from items where id=@id
if(id==1)
	BEGIN
	print('Item with this id already exits')
	end
else
	BEGIN
	insert into item values((select id from [insrted]),(select name from [insrted]),(select seller_id from [insrted]),
	(select category_id from [insrted]),(select stock from [insrted]),(select Discount from [insrted]),(select price from [insrted]))
	print('Item Inserted Successfully')
	end
end
----------------------------------------------------------------
create trigger duplicate_Customer_username on customer
instead of INSERT
as begin 
declare @uname varchar(20)
set @uname=select username from [inserted]
select count(*) c from customer where username=@uname
if(c==1)
	BEGIN
	print('Username already used')
	end
ELSE
	BEGIN
	insert into customer values ((select id from [inserted]),(select Firstname from [inserted]),(select Lastname from [inserted]),
	(select gender from [inserted]),(select email from [inserted]),(select address from [inserted]), (select contact from [inserted]),
	(select age from [inserted]),(select username from [inserted]),(select password from [inserted]))
	print('You have signed up!')
	end
end

----------------------------------------------------------------------
create trigger duplicate_seller_username on seller
instead of INSERT
as begin 
declare @uname varchar(20)
set @uname=select username from [inserted]
select count(*) c from seller where username=@uname
if(c==1)
	BEGIN
	print('Username already used')
	end
ELSE
	BEGIN
	insert into seller values ((select id from [inserted]),(select Firstname from [inserted]),(select Lastname from [inserted]),
	(select gender from [inserted]),(select email from [inserted]),(select address from [inserted]), (select contact from [inserted]),
	(select age from [inserted]),(select username from [inserted]),(select password from [inserted]))
	print('You have signed up!')
	end
end