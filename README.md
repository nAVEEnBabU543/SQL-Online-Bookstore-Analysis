# 📚 SQL Online Bookstore Analysis

## 📌 Project Overview

This project analyzes sales and customer purchasing behavior for an **Online Bookstore** using SQL. The objective is to extract meaningful insights from the dataset such as book sales performance, customer activity, and inventory management.

The project demonstrates practical SQL skills such as **joins, aggregations, grouping, and analytical queries** used in real-world data analysis.

---

## 📊 Key Insights Generated

• Total number of books sold  
• Top selling books  
• Total revenue generated  
• Customer purchase behavior  
• Cities with highest spending customers  
• Remaining stock after fulfilling orders  

---

## 🗂 Dataset Used

The project uses three datasets:

• **books.csv** – Contains book details like title, author, price, and stock  
• **customers.csv** – Contains customer information  
• **orders.csv** – Contains order transactions made by customers  

---

## 🏗 Database Structure

The project creates three tables:

• **Books**  
• **Customers**  
• **Orders**

Relationships between tables:

orders.book_id → books.book_id  
orders.customer_id → customers.customer_id  

---

## 🧾 Sample SQL Query

Example: **Calculate remaining stock after fulfilling orders**

```sql
SELECT 
    b.book_id,
    b.title,
    b.stock,
    COALESCE(SUM(o.quantity),0) AS order_quantity,
    b.stock - COALESCE(SUM(o.quantity),0) AS remaining_quantity
FROM books b
LEFT JOIN orders o 
ON b.book_id = o.book_id
GROUP BY b.book_id
ORDER BY b.book_id;
```

---

## 🛠 Tools & Skills Used

• SQL  
• MySQL  
• Data Analysis  
• Joins & Aggregations  
• GitHub  

---

## 🚀 How to Run This Project

1. Import the CSV files into your SQL database.
2. Run the **create_tables.sql** script.
3. Insert the dataset into the tables.
4. Execute **analysis_queries.sql** to generate insights.

---

## 👨‍💻 Author

**Naveen Babu Kommu**  
Data Analyst  

📧 naveenbabukommu543@gmail.com

---

⭐ If you found this project useful, consider giving it a **Star ⭐ on GitHub**
