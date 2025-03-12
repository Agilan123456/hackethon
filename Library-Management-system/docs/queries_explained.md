<!-- 1️. Adding a New Book
 Query:
 INSERT INTO Books (title, author, genre, isbn, availability_status) 
VALUES ('The Alchemist', 'Paulo Coelho', 'Fiction', '9780061122415', 'Available'); -->

 <!-- Explanation:
Inserts a new book into the Books table.
title, author, genre, and isbn are provided by the user.
The book is marked as 'Available' by default. -->

 <!-- 2.Issuing a Book
Query:
INSERT INTO Transactions (user_id, book_id, issue_date, status) 
VALUES (1, 10, CURDATE(), 'Issued');

UPDATE Books SET availability_status = 'Issued' WHERE book_id = 10;


 Explanation:
A record is inserted into the Transactions table with the user_id, book_id, and issue_date (current date).
The book’s availability_status is updated to 'Issued' to indicate it's currently borrowed. -->



<!-- 
3.Returning a Book
Query:
 
UPDATE Transactions 
SET return_date = CURDATE(), status = 'Returned' 
WHERE transaction_id = 5;

UPDATE Books SET availability_status = 'Available' 
WHERE book_id = (SELECT book_id FROM Transactions WHERE transaction_id = 5);
   Explanation:
Updates the return_date and changes status to 'Returned' in the Transactions table.
The Books table is updated to mark the book as 'Available' again. -->


<!-- 4. Fetching Available Books
Query:
SELECT * FROM Books WHERE availability_status = 'Available';#

Explanation:
Retrieves all books that are available for borrowing. -->

<!-- 
5️ Fetching Books by Genre
 Query:

SELECT * FROM Books WHERE genre = 'Science Fiction';

 Explanation:
Returns all books that belong to a specific genre. -->




<!-- 6️. Checking Overdue Books (More than 14 Days)
 Query:
SELECT t.transaction_id, u.name, b.title, t.issue_date
FROM Transactions t
JOIN Users u ON t.user_id = u.user_id
JOIN Books b ON t.book_id = b.book_id
WHERE t.status = 'Issued' AND DATEDIFF(CURDATE(), t.issue_date) > 14;

 Explanation:
Finds books that were issued more than 14 days ago and have not been returned.
Uses DATEDIFF(CURDATE(), t.issue_date) > 14 to calculate overdue books. -->



<!-- 7️ User Borrowing History
 Query:

SELECT t.transaction_id, b.title, t.issue_date, t.return_date
FROM Transactions t
JOIN Books b ON t.book_id = b.book_id
WHERE t.user_id = 3;
Explanation:
Retrieves the borrowing history of a specific user.
Displays the book title, issue date, and return date. -->