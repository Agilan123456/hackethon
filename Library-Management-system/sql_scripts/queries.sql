-- 1. Add a New Book
INSERT INTO
    Books (title, author, genre, isbn, availability_status)
VALUES
    (
        'The Great Gatsby',
        'F. Scott Fitzgerald',
        'Fiction',
        '9780743273565',
        'Available'
    );










-- 2. Issue a Book
INSERT INTO
    Transactions (user_id, book_id, issue_date, status)
VALUES
    (1, 10, CURDATE (), 'Issued');

UPDATE Books
SET
    availability_status = 'Issued'
WHERE
    book_id = 10;

















-- 3. Return a Book
UPDATE Transactions
SET
    return_date = CURDATE (),
    status = 'Returned'
WHERE
    transaction_id = 5;

UPDATE Books
SET
    availability_status = 'Available'
WHERE
    book_id = (
        SELECT
            book_id
        FROM
            Transactions
        WHERE
            transaction_id = 5
    );















-- 4. Fetch Available Books
UPDATE Transactions
SET
    return_date = CURDATE (),
    status = 'Returned'
WHERE
    transaction_id = 5;

UPDATE Books
SET
    availability_status = 'Available'
WHERE
    book_id = (
        SELECT
            book_id
        FROM
            Transactions
        WHERE
            transaction_id = 5
    );













-- 5. Fetch Overdue Books  
SELECT
    t.transaction_id,
    u.name,
    b.title,
    t.issue_date
FROM
    Transactions t
    JOIN Users u ON t.user_id = u.user_id
    JOIN Books b ON t.book_id = b.book_id
WHERE
    t.status = 'Issued'
    AND DATEDIFF (CURDATE (), t.issue_date) > 14;


















-- 6.✅ User Borrowing History
SELECT
    t.transaction_id,
    b.title,
    t.issue_date,
    t.return_date
FROM
    Transactions t
    JOIN Books b ON t.book_id = b.book_id
WHERE
    t.user_id = 3;