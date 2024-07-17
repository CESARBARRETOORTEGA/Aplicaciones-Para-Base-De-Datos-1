--store procedure que visualicen los resultados de cualquier tabla 
use Northwind;

CREATE PROCEDURE Sp_cualquier_tabla
    @TableName NVARCHAR(128)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    -- Verificar si la tabla existe
    IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName)
    BEGIN
        -- Construir la consulta dinámica para seleccionar todos los datos de la tabla
        SET @SQL = 'SELECT * FROM ' + QUOTENAME(@TableName);

        -- Ejecutar la consulta dinámica
        EXEC Sp_cualquier_tabla @SQL;
    END
    ELSE
    BEGIN
        -- Si la tabla no existe, devolver un mensaje de error
        RAISERROR('La Tabla No Existe.');
    END
END
EXEC Sp_cualquier_tabla'Orders';


-- select *from [tabla]
select * from Employees;

-- resultado 
create or alter procedure  spu_mostrar_datos
@tabla varchar (50)
as 
begin
declare @query nvarchar(50)
 set @query =('select *from'+ QUOTENAME  @tabla)
 exec (@query);
 --sp_executesql
 exec spu_mostrar_datos @query;
 end;
 go
 exec spu_mostrar_datos 'Orders';