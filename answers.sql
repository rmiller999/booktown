-----ORDER
SELECT * FROM subjects ORDER BY subject;
SELECT subject, location FROM subjects ORDER BY location;
-----WHERE
SELECT * FROM books WHERE title='Little Women';
SELECT * FROM books WHERE title LIKE '%Python%';
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
-----JOINS
--Find all books about Computers and list ONLY the book titles
SELECT title FROM books INNER JOIN subjects ON books.subject_id = subjects.id WHERE subjects.id=4;
--Find all books and display a result table with ONLY the following columns
SELECT books.title, authors.last_name, authors.first_name, subjects.subject                                                         
FROM books INNER JOIN authors                                                                                                                  
ON authors.id=books.author_id 
INNER JOIN subjects ON subjects.id=books.subject_id;
--Find all books that are listed in the stock table
SELECT books.title, stock.retail 
FROM books INNER JOIN editions ON books.id= editions.book_id 
INNER JOIN stock ON editions.isbn=stock.isbn ORDER BY stock.retail desc;
--Find the book "Dune" and display ONLY the following columns
SELECT books.title, publishers.name, stock.isbn, stock.retail 
FROM books INNER JOIN editions ON books.id = editions.book_id 
INNER JOIN stock ON editions.isbn = stock.isbn 
INNER JOIN publishers ON editions.publisher_id = publishers.id 
WHERE books.title = 'Dune';
--Find all shipments sorted by ship date display a result table with ONLY the following columns:
SELECT first_name, last_name, ship_date, title
FROM shipments JOIN editions ON shipments.isbn = editions.isbn
JOIN customers ON shipments.customer_id = customers.id
JOIN books ON editions.book_id = books.id
ORDER BY ship_date;
-----Grouping and Counting
SELECT COUNT(*) FROM books;
--------------
SELECT count(location) FROM subjects;
--------------
SELECT location, count(location) FROM subjects GROUP BY location;
--------------
SELECT books.id, title, count(editions.edition)
FROM books JOIN editions ON books.id = editions.book_id
GROUP BY books.id;