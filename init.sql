CREATE DATABASE dbfp_library;
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



CREATE TABLE customer
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_no VARCHAR(25) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip INT NOT NULL,
    library_card_id INT NOT NULL UNIQUE, 
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



-- add test data



-- book
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



-- staff
INSERT INTO staff (
    name, birth_date, position,
    salary, email, phone_no,
    street, city, state, zip
    ) VALUES (
        "John Smith", "2001-02-03", "Clerk",
        50000, "johnsmith@gmail.com", "(123) 456-7890",
        "Main St.", "Metropolis", "Ohio", "43210"
);

INSERT INTO staff (
    name, birth_date, position,
    salary, email, phone_no,
    street, city, state, zip
    ) VALUES (
        "Alice Li", "1998-04-05", "Manager",
        75000, "allllice@gmail.com", "(123) 567-8901",
        "2nd St.", "Metropolis", "Ohio", "43210"
);

INSERT INTO staff (
    name, birth_date, position,
    salary, email, phone_no,
    street, city, state, zip
    ) VALUES (
        "Santiago Carson", "2003-06-07", "Clerk",
        50000, "sancarson@gmail.com", "(123) 678-9067",
        "3rd St.", "Metropolis", "Ohio", "43210"
);



--customer
INSERT INTO customer (
    name, birth_date, email, 
    phone_no, street, city, 
    state, zip, library_card_id, 
    card_issue_datetime
    ) VALUES (
        "Will Hawkins", "1997-06-07", "hawkinsw@gmail.com",
        "(123) 789-0123", "Main St.", "Metropolis", "Ohio",
        43210, 1, "2026-07-21 12:03:12.000000"
);

INSERT INTO customer (
    name, birth_date, email, 
    phone_no, street, city, 
    state, zip, library_card_id, 
    card_issue_datetime
    ) VALUES (
        "Hrishi Bhide", "2001-06-07", "hirshb@gmail.com",
        "(123) 890-1234", "2nd St.", "Metropolis", "Ohio",
        43210, 2, "2026-07-21 12:18:12.000000"
);

INSERT INTO customer (
    name, birth_date, email, 
    phone_no, street, city, 
    state, zip, library_card_id, 
    card_issue_datetime
    ) VALUES (
        "Jill Gohn", "1993-06-07", "jcg@gmail.com",
        "(123) 901-2345", "3rd St.", "Metropolis", "Ohio",
        43210, 3, "2026-07-21 12:33:12.000000"
);



--borrow

INSERT INTO borrow (
    staff_id, customer_id, book_id, 
    borrow_datetime, expiration_date
) VALUES (
    3, 2, 2, "2026-07-21 12:23:12.000000",
    "2026-08-21"
);

-- SHOW DATABASES;

-- SELECT * FROM book;
-- SELECT * FROM staff;
-- SELECT * FROM customer;
-- SELECT * FROM borrow;

-- DROP DATABASE dbfp_library;