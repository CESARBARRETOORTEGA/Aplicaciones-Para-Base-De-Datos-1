--Begin transaccion: inicia una nueva transaccion 
--Commit transaction: confirma todos los ambios realizados durante la transaccion 
--RollBack transaction: revierte todos los cambio realizados durante la transaccion
use Northwind;
select *from Categories;

begin transaction 
insert into Categories(CategoryName,Description)
values ('Categoria11','Los Remediales')

rollback transaction 

commit transaction