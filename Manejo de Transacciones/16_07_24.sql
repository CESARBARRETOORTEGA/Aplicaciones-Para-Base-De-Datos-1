CREATE PROCEDURE EliminarOrden1
    @order_id INT
AS
BEGIN
    -- Declaración de variables
    DECLARE @error_message NVARCHAR(4000);

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Actualizar el stock de los productos basados en los detalles de la orden
        UPDATE Products
        SET UnitsInStock = UnitsInStock + od.Quantity
        FROM Products p
        INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
        WHERE od.OrderID = @order_id;

        -- Eliminar los detalles de la orden en order details
        DELETE FROM [Order Details]
        WHERE OrderID = @order_id;

        -- Aqui eliminamos la orden 
        DELETE FROM Orders
        WHERE OrderID = @order_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
       
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END;

     
        SET @error_message = ERROR_MESSAGE();
        RAISERROR (@error_message, 16, 1);
    END CATCH
END;
GO

EXEC EliminarOrden1 @order_id = 10258;


SELECT * FROM [Order Details];
select *from Orders;
