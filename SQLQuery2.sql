use powerquery
select * from Churn_Modelling

select * from Churn_Modelling where IsActiveMember=1

						------------Cursor-----------
DECLARE 
    @surname varchar(55), 
    @creditscore int
DECLARE cursor_ModelingDetails CURSOR
FOR SELECT 
        Surname, 
        CreditScore  
    FROM 
        dbo.Churn_Modelling;
		
			-----open cursor---------
open cursor_ModelingDetails
FETCH NEXT FROM cursor_ModelingDetails INTO 
    @surname,
    @creditscore;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @surname + CAST(@creditscore AS varchar);
        FETCH NEXT FROM cursor_ModelingDetails INTO 
            @surname, 
            @creditscore;
    END;

	
			-------Closed cursor---------
close cursor_ModelingDetails
			-------Deallaocate cursor---------
deallocate cursor_ModelingDetails



						------cluases-------
select Gender,count(*)as Totalgender from Churn_Modelling GROUP BY Gender

select Max(EstimatedSalary) from Churn_Modelling GROUP BY Gender

select Min(EstimatedSalary) from Churn_Modelling GROUP BY Age

select * from Churn_Modelling order by Surname desc


						-------------Subqueries--------
select * from Churn_Modelling
where CustomerId IN(select CustomerId from Churn_Modelling where Age=39)

select * from Churn_Modelling
select top 2 percent * from Churn_Modelling




		-------cursor-------
DECLARE 
    @surname varchar(50),
    @Balance float
DECLARE cursor_Modeling CURSOR
FOR SELECT 
        Surname, 
        Balance 
    FROM 
        dbo.Churn_Modelling where CAST(Balance as float)=0 or  CAST(Balance as float) >0


-----open cursor---------
open cursor_Modeling
FETCH NEXT FROM cursor_Modeling INTO 
    @surname,
    @Balance

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @Surname + CAST(@Balance AS varchar)
        FETCH NEXT FROM cursor_Modeling INTO 
            @Surname, 
            @Balance;
    END;

	
			-------Closed cursor---------
close cursor_Modeling
			-------Deallaocate cursor---------
deallocate cursor_Modeling




					---------------Search Modeling Data Using Stored procedure---------
create procedure SP_Searchdata
@surname varchar(225)
as
begin
select  * from Churn_Modelling where Surname=@surname
end

exec SP_Searchdata 'dhoni'


					---------------Views SQL----------
create view vw_summerizedata
as
select * from Churn_Modelling where CustomerId=15792365

select * from vw_summerizedata



			------------transaction------------

BEGIN TRANSACTION Modeling_Transaction
  BEGIN TRY
      INSERT INTO Churn_Modelling(Surname, Age)
      VALUES ('yadav', 24), ('sharma', 20)

      UPDATE Churn_Modelling
      SET Surname = 'dhoni' ,Age = 11
      WHERE		CustomerId = 15574012
	  DELETE FROM Churn_Modelling WHERE RowNumber = 42
	  Select @@TRANCOUNT As TransactionCount
      COMMIT TRANSACTION book_Transaction
	
  END TRY
  BEGIN CATCH
      ROLLBACK TRANSACTION Modeling_Transaction
  END CATCH  
    Select @@TRANCOUNT As TransactionCount

	select * from Churn_Modelling

	select * from sys.sysprocesses
	
	select * from sys.dm_tran_active_transactions

	select @@FETCH_STATUS from Modeling_Transaction

	





				-----------Database status----------------
	
create procedure getDBStatus
@DatabaseID int 
as
begin
declare @DBStatus varchar(20)
set @DBStatus=(select state_desc from sys.databases where database_id=@DatabaseID)
if @DBStatus='ONLINE'
Print ' Database is ONLINE'
else
Print 'Database is in ERROR state.'
End
	
exec getDBStatus 20
select * from sys.databases




					------------Audit Trigger--------
use mydatabase
SELECT name FROM master.sys.databases
create table TableAudit1
(
DatabaseName nvarchar(250),
TableName nvarchar(250),
EventType nvarchar(250),
LoginName nvarchar(250),
SQLCommand nvarchar(2500),
AuditDateTime datetime
)

alter trigger trgAuditTableChangesInAll
on ALL SERVER
FOR CREATE_table,ALTER_TABLE,DROP_TABLE
AS
BEGIN
DECLARE @EventData XML
SELECT @EventData=EVENTDATA()
insert into mydatabase.dbo.TableAudit1
(DatabaseName,TableName,EventType,LoginName,SQLCommand,AuditDateTime)
values(@EventData.value('(/EVENT_INSTANCE/DatabaseName)[1]','varchar(250)'),
@EventData.value('(/EVENT_INSTANCE/TableName)[1]','varchar(250)'),
@EventData.value('(/EVENT_INSTANCE/EventType)[1]','varchar(250)'),
@EventData.value('(/EVENT_INSTANCE/LoginName)[1]','varchar(250)'),
@EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]','varchar(2500)'),
GetDate()
)
END
			

			------------DDL trigger-----------
use powerquery
go
create trigger Trgeventgrouptable
on database
for DDL_Table_Events
As
begin
print 'Use of Event Group: You cannot create ,alter or drop a table in this database'
rollback transaction
end



					--------------Function--------------
alter function fn_customerdetails
(@Customer_ID int,
 @IsActiveMember int
 )
 returns table
 as
 return(select Surname,Gender,Age,Balance from Churn_Modelling where customerID=@Customer_ID and IsActiveMember=@IsActiveMember)


 select * from  fn_customerdetails (15634602,1)
 select * from  fn_customerdetails (15701354,0)


					---------function call in stored procedure------------

create procedure sp_getfunctiondata
(
@Customer_ID int,
@IsActiveMember int
)
as
begin
select * from fn_customerdetails  (@Customer_ID,@IsActiveMember)
end
exec sp_getfunctiondata 15619304,0


					----------------Complex function query----------------------
alter function Fn_CustomersDetail(@Customer_ID int)
 returns @table table
 (
	Surname varchar(50),
	Gender varchar(50),
	Age varchar(50)
	
	)
 as 
 begin
 declare @Active int;

	set @Active= (select IsActiveMember from Churn_Modelling where CustomerId=@Customer_ID);
	if @Active=1
	insert into @table
	select Surname,Gender,Age from Churn_Modelling where customerID=@Customer_ID and IsActiveMember=1;
	
	return
	end

	select * from Fn_CustomersDetail (15634602)
	select * from Fn_CustomersDetail (154325)
	select * from Churn_Modelling

					-------------------Complex function call in stored procedure----------
create procedure  sp_getdata(@Customer_ID int)
as
begin
declare @Active int
set @Active= (select IsActiveMember from Churn_Modelling where CustomerId=@Customer_ID)
if (@Active >0)
begin
 select * from Fn_CustomersDetail(@Customer_ID)
 end
 else
 begin
 print 'Please Active the member'
 end
 end

 exec  sp_getdata 154325




			-----------------Scaler function--------------------

alter function GetTotaldata(@Geo varchar(50))
RETURNS decimal
As
BEGIN
Declare @result decimal
select @result= sum(CAST(EstimatedSalary as decimal))  from Churn_Modelling   where  Geography=@Geo group by Geography

RETURN @result
END

select dbo.GetTotaldata('france')




create function Getdata(@Geo varchar(50),@Gender varchar(50))
RETURNS decimal
As
BEGIN
Declare @result decimal
select @result= sum(CAST(EstimatedSalary as decimal)) from Churn_Modelling   where  Geography=@Geo and Gender=@Gender group by Geography

RETURN @result
ENDyoo

select dbo.Getdata('france','Female')



create function Getcountrydata(@Geo varchar(50),@Gender varchar(50))
returns table
as
return select count(CustomerId) as Totalcustomer,Geography from Churn_Modelling where Geography=@Geo and Gender=@Gender group by Geography 

select * from Getcountrydata('spain','Female')