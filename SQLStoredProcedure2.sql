use assign_1
go
CREATE PROCEDURE USP_CreateProduct(@pname VARCHAR(45),@cname VARCHAR(45),@bname VARCHAR(45),@myear INT,@lprice INT)
AS
BEGIN 
	IF exists(SELECT product_id FROM ProductTab WHERE ProductTab.product_name=@pname)
	BEGIN
		 SELECT product_id FROM ProductTab WHERE ProductTab.product_name=@pname 
	END
	ELSE 
	BEGIN
		IF not exists(SELECT category_id FROM CategoriesTab WHERE CategoriesTab.category_name=@cname)
		BEGIN
			INSERT INTO CategoriesTab(category_name) VALUES(@cname);
		END

		IF not exists(SELECT brand_id FROM BrandTab WHERE BrandTab.brand_name=@bname)
		BEGIN
			INSERT INTO BrandTab(brand_name) VALUES(@bname);
		END

		DECLARE @cat INT =(SELECT category_id FROM CategoriesTab WHERE CategoriesTab.category_name=@cname)
		DECLARE @br INT =(SELECT brand_id FROM BrandTab WHERE BrandTab.brand_name=@bname)
		INSERT INTO ProductTab(product_name,model_year,list_price,category_id,brand_id) 
		VALUES (@pname,@myear,@lprice,@cat,@br)
		SELECT * FROM ProductTab
	END
END
EXEC USP_CreateProduct 'english','tshirt','Macmillan','2017','750'
DROP procedure USP_CreateProduct
