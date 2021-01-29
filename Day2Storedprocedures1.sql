use assign_1
go
CREATE PROCEDURE USP_CreateProduct(@pname varchar(45))
AS
BEGIN
   SELECT product_id FROM ProductTab WHERE ProductTab.product_name=@pname
IF not exists(select category_id from CategoriesTab where CategoriesTab.category_name=@cname)
BEGIN
	INSERT INTO CategoriesTab(category_name) values(@cname);
	SELECT category_id from CategoriesTab where CategoriesTab.category_name=@cname
END
IF not exists(select brand_id from BrandTab where BrandTab.brand_name=@bname)
BEGIN
    INSERT INTO BrandTab(brand_name) values(@bname);
	SELECT brand_name from BrandTab where BrandTab.brand_name=@bname
END
END
EXEC USP_CreateProduct 'Tshirt','aaa','aba'

DROP procedure USP_CreateProduct
