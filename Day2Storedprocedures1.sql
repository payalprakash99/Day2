use assign_1
go
CREATE PROCEDURE USP_CreateProduct(@pname varchar(45))
AS
BEGIN
   SELECT product_id FROM ProductTab WHERE ProductTab.product_name=@pname
END
EXEC USP_CreateProduct 'Tshirt'

DROP procedure USP_CreateProduct
