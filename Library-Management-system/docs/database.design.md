<!-- 1️. OverviewThe 
Library Management System (LMS) is designed to handle book lending, track borrowed books, and manage library users efficiently. The database consists of three primary tables:
Books: Stores information about available books.
Users: Contains details of registered library users.
Transactions: Tracks book issues and returns. -->

<!-- 2️. Entity Relationship Diagram (ERD) -->

<!-- BOOKS(Stores details about books) =>  book_id(INT,Primary)--------title(VARCHAR(225),Not Null),-----------author(VARCHAR(255,Not Null))
                                 |
                                 |
                                 |
                                 |
                                 |
                                 |
            Transactions(user-book transaction records)
                                 |
                                 |
                                 |
                                 |
                                 |
                                 |
                                 |
                                 |
                                |
USER(stores details about users)=> user_id(INT,Primary Key),--------------name(VARCHAR(255)Not Null),-----------email(VARCHAR(255)unique) -->

.
.

<!-- 3  Database Schema -->
<!-- Books Table
Column Name	            Data Type	                  Constraints	                     Description
book_id	                INT	                          PRIMARY KEY,AUTO_INCREMENT	     Unique identifier for each book
title	                VARCHAR(255)	              NOT NULL	                         Book title
author	                VARCHAR(255)	              NOT NULL	                         Author name
genre	                VARCHAR(100)	              NULLABLE	                         Book genre
isbn	                VARCHAR(20)	                  UNIQUE, NOT NULL	                 Unique ISBN for the book
availability_status     ENUM('Available', 'Issued')   DEFAULT 'Available'	             Current status of the book -->

<!-- Users Table
Column Name          	Data Type	                  Constraints	                     Description
user_id	                INT	                          PRIMARY KEY,AUTO_INCREMENT	     Unique identifier for users
name	                VARCHAR(255)	              NOT NULL	                         Full name of the user
email	                VARCHAR(255)	              UNIQUE, NOT NULL	                 Email address
phone_number	        VARCHAR(15)	                  UNIQUE, NOT NULL	                 Contact number
membership_date	        DATE	                      DEFAULT CURDATE()	                 date when the user registered -->

<!-- Transactions Table
Column Name           	 Data Type	                  Constraints	                           Description
transaction_id	        INT	                          PRIMARY KEY,AUTO_INCREMENT	           Unique transaction ID
user_id	                INT                           FOREIGN KEY REFERENCESUsers(user_id)	   User borrowing the book
book_id	                INT	                          FOREIGN KEY REFERENCES Books(book_id)	   Book being borrowed
issue_date	            DATE	                      DEFAULT CURDATE()	                       Date the book was issued
return_date	            DATE	                      NULLABLE	                               Date the book was returned
status	                ENUM('Issued', 'Returned')	  DEFAULT 'Issued'	                       Status of the book transaction -->




<!-- 4️.Relationships
One-to-Many (Users → Transactions): Each user can borrow multiple books.
One-to-Many (Books → Transactions): Each book can be borrowed multiple times but by different users over time. -->

<!-- 5️.Constraints Implemented
Primary Keys: book_id, user_id, transaction_id
Foreign Keys:
        user_id in Transactions references Users(user_id)
        book_id in Transactions references Books(book_id)
Unique Constraints: isbn in Books, email and phone_number in Users
Default Values:
        availability_status in Books defaults to 'Available'
        status in Transactions defaults to 'Issued'
        membership_date in Users defaults to the current date -->


<!-- 6️. Sample SQL Schema
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    isbn VARCHAR(20) UNIQUE NOT NULL,
    availability_status ENUM('Available', 'Issued') DEFAULT 'Available'
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    membership_date DATE DEFAULT CURDATE()
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    issue_date DATE DEFAULT CURDATE(),
    return_date DATE,
    status ENUM('Issued', 'Returned') DEFAULT 'Issued',
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
); -->
