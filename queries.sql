USE dbfp_library;



-- 1. For all borrowed books: title of book, what customer has them out, and their due date.
SELECT b.title, c.name, bor.expiration_date
FROM borrow AS bor
INNER JOIN book AS b
ON bor.book_id = b.book_id
INNER JOIN customer AS c
ON bor.customer_id = c.customer_id
WHERE b.status = "Borrowed"
ORDER BY bor.expiration_date ASC;



-- 2. All books that are due by the end of the week (7/26/26).
SELECT b.title, c.name, bor.expiration_date
FROM borrow AS bor
INNER JOIN book AS b
ON bor.book_id = b.book_id
INNER JOIN customer AS c
ON bor.customer_id = c.customer_id
WHERE bor.expiration_date <= "2026-07-26";


-- 3. The name of the clerk who has overseen the most book borrowings.
-- for some reason when i define a table with AS in FROM, it can't be reused in the WHERE. so. whatever ig the table gets computed three times.
SELECT s.name, COUNT(*) AS borrows
FROM staff AS s
INNER JOIN borrow as bor
ON bor.staff_id = s.staff_id
GROUP BY s.name
EXCEPT
SELECT DISTINCT sb1.name, sb1.borrows
FROM (
    SELECT s.name, COUNT(*) AS borrows
    FROM staff AS s
    INNER JOIN borrow as bor
    ON bor.staff_id = s.staff_id
    GROUP BY s.name
) AS sb1
INNER JOIN (
    SELECT s.name, COUNT(*) AS borrows
    FROM staff AS s
    INNER JOIN borrow as bor
    ON bor.staff_id = s.staff_id
    GROUP BY s.name
) AS sb2
ON sb1.borrows < sb2.borrows;



-- bonus: group by who has most books out
SELECT c.name, COUNT(*) AS num_borrowed
FROM customer AS c
INNER JOIN borrow AS bor
ON bor.customer_id = c.customer_id
GROUP BY c.name;