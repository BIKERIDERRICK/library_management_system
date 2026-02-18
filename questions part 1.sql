SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM issued_status;
SELECT * FROM return_status;
SELECT * FROM members;



--Project Task
-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn,book_title,category,rental_price,status,author,publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT * FROM books;

--Update an Existing Member's Address
 UPDATE members
 SET member_address = '125 Oak St'
 WHERE  member_id = 'C103';
 SELECT * FROM members;


  -- Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
  SELECT *  FROM  issued_status
  WHERE  issued_id = 'IS121'

  DELETE FROM  issued_status
  WHERE  issued_id = 'IS121'


  --Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
SELECT * FROM  issued_status
WHERE issued_emp_id = 'E101'

--Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.


SELECT
issued_emp_id
--COUNT(issued_id) as total_book_issued
FROM  issued_status
GROUP BY issued_emp_id
HAVING COUNT(issued_id) >1


--CTAS (Create Table As Select)
--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**


CREATE TABLE book_cnts
AS
SELECT 
b.isbn,
b.book_title,
COUNT(ist.issued_id) as no_issued
FROM books as b
JOIN 
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1, 2;


  -- Data Analysis & Findings

--Task 7. Retrieve All Books in a Specific Category:
SELECT * FROM books
WHERE category = 'Classic'

--8 Find Total Rental Income by Category:
SELECT 
b.category,
SUM(b.rental_price)


FROM books as b
JOIN 
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1


-- 9 List Members Who Registered in the Last 180 Days:
SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '720 days'

  SELECT CURRENT_DATE
INSERT INTO members(member_id,member_name,member_address,reg_date)
VALUES('C119','Tom','146 Main St','2026-02-01')
;

 -- 10.List Employees with Their Branch Manager's Name and their branch details:

 SELECT 
    e1.emp_id,
    e1.emp_name,
    e1.position,
    e1.salary,
    b.*,
    e2.emp_name as manager
FROM employees as e1
JOIN 
branch as b
ON e1.branch_id = b.branch_id    
JOIN
employees as e2
ON e2.emp_id = b.manager_id

 --11. Create a Table of Books with Rental Price Above a Certain Threshold:
 CREATE TABLE Expensive AS
 SELECT * FROM books
 WHERE rental_price > 7.00;

 SELECT * FROM Expensive

 --12.Retrieve the List of Books Not Yet Returned
 
   SELECT 

   DISTINCT ist.issued_book_name
   FROM issued_status as ist
   LEFT JOIN
   return_status as rs
   ON ist.issued_Id = rs.issued_id
   WHERE rs.return_id IS NULL
    SELECT * FROM return_status




   
   
   