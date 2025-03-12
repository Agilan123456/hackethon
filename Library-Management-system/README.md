<!-- # Library Management System (LMS)

## 📌 Overview
The **Library Management System (LMS)** is a database-driven application designed to help libraries efficiently manage book lending, track borrowed books, and maintain an organized database of users and transactions.

## 🚀 Features
- **Book Management**: Add, update, and track books with details like title, author, genre, and availability.
- **User Management**: Register users and maintain their borrowing history.
- **Transaction Management**: Issue and return books while keeping records of due dates.
- **Overdue Tracking**: Identify overdue books and generate reports on late returns.
- **Search Functionality**: Retrieve books by title, author, genre, and availability.

## 🛠️ Database Schema
The LMS consists of the following main tables:

### **1️⃣ Books Table** 📚
Stores details of books available in the library.
```sql
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    isbn VARCHAR(20) UNIQUE NOT NULL,
    availability_status ENUM('Available', 'Issued') DEFAULT 'Available'
);
```

### **2️⃣ Users Table** 👥
Contains information about library members.
```sql
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    membership_date DATE DEFAULT CURDATE()
);
```

### **3️⃣ Transactions Table** 🔄
Tracks book borrowing and return transactions.
```sql
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    issue_date DATE DEFAULT CURDATE(),
    return_date DATE,
    status ENUM('Issued', 'Returned') DEFAULT 'Issued',
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
```

## 📊 Entity Relationship Diagram (ERD)
The **ERD** for the LMS shows relationships between tables.
![Library Management System ERD](sandbox:/mnt/data/library_management_erd.png)

## 🔍 Key SQL Queries
- **Add a new book**
```sql
INSERT INTO Books (title, author, genre, isbn, availability_status)
VALUES ('The Alchemist', 'Paulo Coelho', 'Fiction', '9780061122415', 'Available');
```
- **Issue a book**
```sql
INSERT INTO Transactions (user_id, book_id, issue_date, status)
VALUES (1, 10, CURDATE(), 'Issued');
UPDATE Books SET availability_status = 'Issued' WHERE book_id = 10;
```
- **Return a book**
```sql
UPDATE Transactions
SET return_date = CURDATE(), status = 'Returned'
WHERE transaction_id = 5;
UPDATE Books SET availability_status = 'Available'
WHERE book_id = (SELECT book_id FROM Transactions WHERE transaction_id = 5);
```
- **Find overdue books** (More than 14 days)
```sql
SELECT t.transaction_id, u.name, b.title, t.issue_date
FROM Transactions t
JOIN Users u ON t.user_id = u.user_id
JOIN Books b ON t.book_id = b.book_id
WHERE t.status = 'Issued' AND DATEDIFF(CURDATE(), t.issue_date) > 14;
```

## 📂 Repository Structure
```
📂 Library-Management-System
│── 📂 sql_scripts
│   │── schema.sql          # Database Schema
│   │── queries.sql         # Queries for various operations
│── 📂 docs
│   │── database_design.md  # Documentation on database structure
│   │── queries_explained.md # Explanation of key queries
│── README.md               # Project Overview
```

## 🔧 Setup & Deployment
### **Prerequisites**
- MySQL or Oracle Database
- SQL Client (MySQL Workbench, DBeaver, etc.)

### **Installation Steps**
1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/Library-Management-System.git
   ```
2. Import the database schema:
   ```sh
   mysql -u your_user -p your_database < sql_scripts/schema.sql
   ```
3. Run sample queries to test functionality.

## 🤝 Contribution
Feel free to fork and contribute to this project. Submit a pull request with improvements! 🚀

## 📜 License
This project is open-source and available under the MIT License.
 -->
