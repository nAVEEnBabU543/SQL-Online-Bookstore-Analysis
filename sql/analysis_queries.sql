-- 1) Retrieve all books in the "Fiction" genre:

SELECT * 
FROM Books 
WHERE GENRE ="Fiction";

-- 2) Find books published after the year 1950:

SELECT * 
FROM Books 
WHERE PUBLISHED_YEAR >1950;

-- 3) List all customers from the Canada:

SELECT * 
FROM Customers 
WHERE COUNTRY = "Canada";

-- 4) Show orders placed in November 2023:
-- Approach 1
SELECT * 
FROM Orders 
WHERE YEAR(ORDER_DATE) =2023 
AND MONTHNAME(ORDER_DATE)="NOVEMBER";
-- Approach 2
SELECT * 
FROM Orders 
WHERE ORDER_DATE BETWEEN "2023-11-01" AND "2023-11-30";
-- Approach 3
SELECT * 
FROM Orders 
WHERE ORDER_DATE>="2023-11-01" AND ORDER_DATE<="2023-11-30";

-- 5) Retrieve the total stock of books available:

SELECT SUM(Stock) AS Total_stock
FROM Books;

-- 6) Find the details of the most expensive book:

SELECT * 
FROM Books
ORDER By price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT * 
FROM Orders 
WHERE Quantity >1;

-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * 
FROM Orders
WHERE Total_Amount >20;

-- 9) List all genres available in the Books table:

SELECT DISTINCT genre
FROM Books;

-- 10) Find the book with the lowest stock:

SELECT * 
FROM Books 
ORDER  BY Stock ASC
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:

SELECT SUM(Total_Amount) as Total_Revenue 
FROM Orders;	

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT genre, SUM(Quantity) as Total_Books_Sold 
FROM Books join Orders using (Book_ID)
GROUP BY genre;

-- 2) Find the average price of books in the "Fantasy" genre:

SELECT  AVG(Price) AS Avg_Price 
FROM Books
WHERE Genre = "Fantasy";

-- 3) List customers who have placed at least 2 orders:

SELECT Customer_ID,Name,COUNT(Order_ID) as Order_Cnt
From Customers JOIN Orders using(Customer_ID)
GROUP BY Customer_ID,Name
Having Count(Order_id) >=2;

-- 4) Find the most frequently ordered book:

SELECT Book_id,Title,Count(Order_id) as Cnt_order
From Books JOIN Orders Using(Book_ID)
Group by Book_ID,Title
Order by Count(Order_id) DESC
Limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT * 
FROM Books
Where Genre = "Fantasy"
Order by Price Desc
Limit 3;

-- 6) Retrieve the total quantity of books sold by each author:

SELECT Author, Sum(Quantity) as Total_Quantity
FROM Books JOIN Orders Using (Book_id)
Group by Author
Order by Sum(Quantity) Desc;

-- 7) List the cities where customers who spent over $30 are located:

SELECT  city,Name,Total_Amount
From customers JOIN Orders Using (customer_id)
Where Total_Amount >30
Order by Total_Amount DESC;

-- 8) Find the customer who spent the most on orders:

SELECT Customer_ID,Name,Sum(Total_Amount) As Most_Spent
From Customers JOIN Orders Using(Customer_id)
group by Customer_ID,Name
ORDER BY Most_Spent DESC;

-- 9) Calculate the stock remaining after fulfilling all orders:

SELECT Book_ID,Title,Stock,coalesce(Sum(Quantity),0) as Order_quantity,
Stock - coalesce(Sum(Quantity),0) As Remaining_Stock
From Books Join Orders using(Book_id)
group by Book_id,Title,Stock
Order by Remaining_Stock Desc;