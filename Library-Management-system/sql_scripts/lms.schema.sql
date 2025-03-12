-- Database Schema Design
-- Tables
-- 1.Books Table
CREATE TABLE
    Books (
        book_id INT PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(255) NOT NULL,
        author VARCHAR(255) NOT NULL,
        genre VARCHAR(100),
        isbn VARCHAR(20) UNIQUE NOT NULL,
        availability_status ENUM ('Available', 'Issued') DEFAULT 'Available'
    );

-- 2.Users Table
CREATE TABLE
    Users (
        user_id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        phone_number VARCHAR(15) UNIQUE NOT NULL,
        membership_date DATE DEFAULT CURDATE ()
    );

-- 3.Transactions Table
CREATE TABLE
    Transactions (
        transaction_id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        book_id INT,
        issue_date DATE DEFAULT CURDATE (),
        return_date DATE,
        status ENUM ('Issued', 'Returned') DEFAULT 'Issued',
        FOREIGN KEY (user_id) REFERENCES Users (user_id),
        FOREIGN KEY (book_id) REFERENCES Books (book_id)
    );