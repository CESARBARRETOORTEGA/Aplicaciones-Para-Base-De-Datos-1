--ejercicio 1
-- realiza una venta dentro de northwind
--untilizando transacciones y sp
 create or alter proc sp_nueva_venta
 @CustomerID nchar (5),
 @EmployeeID  datetime,
 @OrderDate datetime,
 @RequiredDate datetime,
 @ShippedDate datetime,
 @ShipVia int,
 @Freight money= null,
 @ShipName nvarchar(40)=null,
 @ShipAddress nvarchar(60)=null,
 @ShipCity nvarchar(15)=null,
 @ShipRegion nvarchar(15)=null,
 @ShipPostalCode nvarchar(15)=null,
 @ShipCountry nvarchar(15)=null,
 @ProductID int,
 @UnitPrice money,
 @Quantity int,
 @Discount int,
 as 
 begin 
 begin transaction

  begin try 
   -- insertar en la tabla orders
   iNSERT INTO [dbo].[Orders]
           ([CustomerID]
           ,[EmployeeID]
           ,[OrderDate]
           ,[RequiredDate]
           ,[ShippedDate]
           ,[ShipVia]
           ,[Freight]
           ,[ShipName]
           ,[ShipAddress]
           ,[ShipCity]
           ,[ShipRegion]
           ,[ShipPostalCode]
           ,[ShipCountry])
     VALUES
          (@CustomersID,
           @EmployeeID,
           @OrderDate, 
           @RequiredDate, 
           @ShippedDate, 
           @ShipVia, 
           @Freight, 
           @ShipName,
           @ShipAddress, 
           @ShipCity,
           @ShipRegion,
           @ShipPostalCode,
           @ShipCountry);

		  
--obtener el id insertado de la orden
Declare @orderid int
set @orderid = SCOPE_IDENTITY();
--insertar el detalle_orden el producto
--obtener el precio del producto a insertar
declare @precioVenta money

select produ from 
select  @precioVenta = UnitPrice from Products
where ProductID =3


  end try 
  begin catch
  end catch


 end;
 go 












USE [Northwind]
GO

SELECT [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [dbo].[Orders]

GO


