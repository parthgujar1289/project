CREATE DATABASE BusinessDB;

USE BusinessDB;


CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    JoinDate DATE
);



CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(100),
    Amount DECIMAL(10,2),
    SaleDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


INSERT INTO Customer (CustomerID, Name, Email, Phone, City, JoinDate) VALUES
(1, 'Sneha Sharma', 'sneha@example.com', '9876543210', 'Mumbai', '2024-01-10'),
(2, 'Rohan Mehta', 'rohan@example.com', '9123456789', 'Delhi', '2024-02-15'),
(3, 'Anita Roy', 'anita@example.com', '9988776655', 'Mumbai', '2023-11-20'),
(4, 'Karan Singh', 'karan@example.com', '8877665544', 'Pune', '2025-01-05'),
(5, 'Priya Desai', 'priya@example.com', '8899776655', 'Ahmedabad', '2023-12-01');



INSERT INTO Sales (SaleID, CustomerID, Product, Amount, SaleDate, PaymentMethod) VALUES
(101, 1, 'Smartphone', 15000.00, '2025-05-01', 'Credit Card'),
(102, 2, 'Laptop', 55000.00, '2025-05-03', 'Debit Card'),
(103, 1, 'Earphones', 1500.00, '2025-05-08', 'UPI'),
(104, 4, 'Keyboard', 1200.00, '2025-05-09', 'Cash'),
(105, 3, 'Monitor', 7000.00, '2025-04-30', 'Credit Card');

SELECT * from Sales,customer;

#List all customers from the city ‘Mumbai’.

SELECT * 
FROM Customer 
WHERE City = 'Mumbai';


# Display the names and emails of all customers who joined after January 1, 2024.

SELECT name, email
FROM Customer 
WHERE JoinDate > '2024-05-25';

#Show all sales with an amount greater than ₹500.

SELECT * 
FROM Sales 
WHERE Amount > 500;

#Find the total sales amount made by each customer.

SELECT CustomerID, SUM(Amount) AS TotalSales 
FROM Sales 
GROUP BY CustomerID;







#List the customer names along with their purchase details.

SELECT C.Name, S.Product, S.Amount, S.SaleDate, S.PaymentMethod
FROM Customer C
JOIN Sales S ON C.CustomerID = S.CustomerID;


#Find the number of sales made in the month of May 2025.

SELECT COUNT(*) AS SalesInMay2025
FROM Sales
WHERE SaleDate BETWEEN '2025-05-01' AND '2025-05-31';


#Display the top 3 customers based on total sales amount.

SELECT C.Name, SUM(S.Amount) AS TotalSales
FROM Customer C
JOIN Sales S ON C.CustomerID = S.CustomerID
GROUP BY C.Name
ORDER BY TotalSales DESC
LIMIT 3;


#Show the total number of customers in each city.

SELECT City, COUNT(*) AS TotalCustomers
FROM Customer
GROUP BY City;


#Find all customers who haven’t made any purchases.

SELECT C.Name
FROM Customer C
LEFT JOIN Sales S ON C.CustomerID = S.CustomerID
WHERE S.SaleID IS NULL;


#List the different payment methods used in the sales.

SELECT DISTINCT PaymentMethod
FROM Sales;









#Display each customer’s name along with the products they purchased.

SELECT C.Name, S.Product
FROM Customer C
JOIN Sales S ON C.CustomerID = S.CustomerID;


#Display all customers and their corresponding sales, including customers who have never made a purchase.

SELECT C.Name, S.Product
FROM Customer C
LEFT JOIN Sales S ON C.CustomerID = S.CustomerID;


#Display all sales, including those made with invalid or missing customer information.

SELECT S.SaleID, C.Name, S.Product
FROM Sales S
LEFT JOIN Customer C ON S.CustomerID = C.CustomerID;


#List the names of customers who have not made any sales.

SELECT C.Name
FROM Customer C
LEFT JOIN Sales S ON C.CustomerID = S.CustomerID
WHERE S.SaleID IS NULL;


#Calculate the total sales amount for each customer.

SELECT C.Name, SUM(S.Amount) AS TotalSales
FROM Customer C
JOIN Sales S ON C.CustomerID = S.CustomerID
GROUP BY C.Name;


#Display customer name, city, product purchased, and amount spent.

SELECT C.Name, C.City, S.Product, S.Amount
FROM Customer C
JOIN Sales S ON C.CustomerID = S.CustomerID;


#Find the total amount spent by customers in the city of 'London'.


SELECT SUM(S.Amount) AS TotalSpent
FROM Customer C
JOIN Sales S ON C.CustomerID = S.CustomerID
WHERE C.City = 'London';


#Display all sales along with the customer name, sorted by sale amount in descending order.

SELECT C.Name, S.Product, S.Amount
FROM Customer C
JOIN Sales S ON C.CustomerID = S.CustomerID
ORDER BY S.Amount DESC;


#Count the number of purchases made using each payment method.

SELECT PaymentMethod, COUNT(*) AS PurchaseCount
FROM Sales
GROUP BY PaymentMethod;


#Find customers who joined before March 2022 and have made at least one purchase.

SELECT DISTINCT C.Name
FROM Customer C
JOIN Sales S ON C.CustomerID = S.CustomerID
WHERE C.JoinDate < '2022-03-01';
