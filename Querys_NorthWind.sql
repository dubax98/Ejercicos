/*1.	Obtener la lista de los productos no descatalogados incluyendo el nombre de la categoría ordenado por nombre de producto.*/
SELECT p.ProductName, 
	   c.CategoryName
FROM Products p, 
	 Categories c
WHERE p.Discontinued = 0
AND p.CategoryID = c.CategoryID
ORDER BY ProductName ASC;

/*2.	Mostrar el nombre de los clientes de Nancy Davolio.*/
SELECT c.ContactName
FROM Employees e, 
	 Orders o, 
	 Customers c
where CONCAT(e.FirstName, ' ', e.LastName) = 'Nancy Davolio'
AND o.CustomerID = c.CustomerID
AND e.EmployeeID = o.EmployeeID;

/*3.	Mostrar el total facturado por año del empleado Steven Buchanan.*/
SELECT SUM(p.UnitPrice * p.UnitsOnOrder) AS 'TOTAL FACTURADO'
FROM Employees e, Orders o, [Order Details] od, Products p
WHERE CONCAT(e.FirstName, ' ', e.LastName) = 'Steven Buchanan'
AND e.EmployeeID = o.EmployeeID
AND o.OrderID = od.OrderID
AND od.ProductID = p.CategoryID;

/*4.	Mostrar el nombre de los empleados que dependan directa o indirectamente de Andrew Fuller.*/
SELECT CONCAT(e.FirstName, ' ', e.LastName) AS 'NOMBRE EMPLEADO'
FROM Employees e 
WHERE e.ReportsTo in (SELECT EmployeeID
				      FROM Employees
				      WHERE ReportsTo IN (SELECT EmployeeID
				      FROM Employees
				      WHERE CONCAT(FirstName, ' ', LastName) = 'Andrew Fuller'))
OR e.ReportsTo IN (SELECT EmployeeID
				   FROM Employees
				   WHERE CONCAT(FirstName, ' ', LastName) = 'Andrew Fuller');