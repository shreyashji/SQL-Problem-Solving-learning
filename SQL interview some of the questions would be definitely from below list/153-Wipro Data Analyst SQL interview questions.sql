#WRITE A query to create a product table with column ID,ProductName,ProductPrice,PurchaseDate and insert 1000 Dummy records
CREATE TABLE july.ProductSit( 
	ID int identity,
	ProductName varchar(1000),
	ProductPrice float,
	PurchaseDate datetime
);

DECLARE @start int, @end int, @initialPrice int
SET @start = 1 
SET @end = 1000
SET @initialPrice = 100

While @start <= @end
Begin
	INSERT INTO july.ProductSit(ProductName ,ProductPrice,PurchaseDate)
    SELECT CONCAT('Product',@start) , @initialPrice+@start,GETDATE()-@start
    SET  @start =  @start+1
END

# 1. Find the list of products which sold on last one month 
SELECT * FROM july.ProductSit WHERE PurchaseDate > DATEADD(DAY,-30.GETDATE())
#LAST TWO WEEK
SELECT * FROM july.ProductSit WHERE PurchaseDate > DATEADD(WEEK,-2.GETDATE())
#LAST TWO YEAR DATA
SELECT * FROM july.ProductSit WHERE PurchaseDate > DATEADD(YEAR,-2.GETDATE())

# 2.  Find the list of products which sold on nov 20
SELECT * FROM july.ProductSit WHERE DATEPART(MONTH,PurchaseDate)=11
AND DATEPART(YEAR,PurchaseDate)=2020

# 3.  Find the list of products which sold on monday
SELECT * FROM july.ProductSit WHERE DATENAME(DW,PurchaseDate)='Monday'

# 4.  Find the no. of days from today date to the first product sold
SELECT min(PurchaseDate) FROM july.ProductSit