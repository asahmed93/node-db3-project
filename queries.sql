-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT productName, CategoryName FROM product JOIN category ON product.CategoryId = category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

Select [order].Id, shipper.companyName from [Order] Join Shipper 
ON [order].ShipVia = shipper.id
WHERE orderdate < '2012-08-09'


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.productName, od.quantity
From [order] as o
JOIN orderdetail as od
ON o.id = od.OrderID
JOIN product as p
ON od.productID = p.id
WHERE o.id = 10251
ORDER BY ProductName ASC


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.


SELECT o.id,
       c.CompanyName,
       e.lastname
  FROM [order] AS o
       JOIN
       customer AS c ON o.customerID = c.id
       JOIN
       employee AS e ON o.employeeid = e.id;


---  Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
 SELECT CategoryName, count() as count FROM [Categories] JOIN products ON products.categoryID = categories.categoryID GROUP BY categoryName 

---   Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
 SELECT [Orders].OrderID, Count() AS ItemCount FROM [Orders]
JOIN OrderDetails AS OD ON [Orders].OrderID = OD.OrderID
GROUP BY [Orders].OrderID; 