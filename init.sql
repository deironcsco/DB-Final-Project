CREATE DATABASE dbfp_library;
SHOW DATABASES;
USE dbfp_library;

CREATE TABLE book
(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    publish_date DATE,
    genre VARCHAR(50),
    status VARCHAR(25) NOT NULL,
    author VARCHAR(100),
    publisher VARCHAR(100)
);

-- DATE - YYYY-MM-DD
-- DATETIME - YYYY-MM-DD HH:MM:SS.ffffff

CREATE TABLE staff
(
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary DOUBLE NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_no VARCHAR(25) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip INT NOT NULL
);

INSERT INTO staff (
    name, birth_date, position,
    salary, email, phone_no,
    street, city, state, zip,
    ) VALUES (
        "John Smith", "2001-02-03", "Clerk",
        50000, "johnsmith@gmail.com", "(123) 456-7890",
        "Main St.", "Metropolis", "Ohio", "43210"
);


CREATE TABLE customer
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    birth_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone_no VARCHAR(25) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip INT NOT NULL,
    library_card_id INT NOT NULL, 
    card_issue_datetime DATETIME NOT NULL
);
--so i guess the application has to define the library_card_id?

CREATE TABLE borrow
(
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    customer_id INT,
    book_id INT,
    borrow_datetime DATETIME NOT NULL,
    expiration_date DATE NOT NULL,
    CONSTRAINT fk_staff_id
        FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    CONSTRAINT fk_customer_id
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_book_id
        FOREIGN KEY (book_id) REFERENCES book(book_id)
);

DROP DATABASE dbfp_library;


-- add test data
INSERT INTO book (
    title, publish_date, genre, 
    status, author, publisher
    ) VALUES (
        'The Alchemist', '1988-01-01', 'Adventure', 
        'Not Borrowed', 'Paulo Coelho', 'HarperTorch'
);

INSERT INTO book (
    title, publish_date, genre, 
    status, author, publisher
    ) VALUES (
        'The Giver', '1993-01-01', 'Dystopian', 
        'Borrowed', 'Lois Lowry', 'Houghton Mifflin Harcourt'
);

INSERT INTO book (
    title, publish_date, genre, 
    status, author, publisher
    ) VALUES (
        'The Poppy War', '2018-05-01', 'Adventure', 
        'Not Borrowed', 'R. F. Kuang', 'Harper Voyager'
);

SELECT * FROM book;