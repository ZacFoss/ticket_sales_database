/*
Zachary Foss
Project #4: SQL DML Script
DBST 651

University of Maryland Global Campus
*/

/* Populate all tables */
-- User Table

INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (1, 'Joe', 'Malone', 'Rock', 'King Krule');
INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (2, 'Bill', 'Manfred', 'Jazz', 'John Coltrane');
INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (3, 'Steve', 'Jordan', 'Metal', 'Black Sabbath');
INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (4, 'Elizabeth', 'Rose', 'Jazz', NULL);
INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (5, 'Sam', 'Smith', NULL, 'John Coltrane');
INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (6, 'Art', 'Vandeley', NULL, NULL);
INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (7, 'Elaine', 'Benes', 'Alternative', 'Third Eye Blind');
INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (8, 'Maurice', 'Red', NULL, NULL);
INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (9, 'Bob', 'Barker', 'Rap', 'MF DOOM');
INSERT INTO USER_INFO (user_id, first_name, last_name, favorite_genre, favorite_artist)
VALUES (10, 'Zac', 'Foss', 'Jazz', 'John Coltrane');

-- Artist Table
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (001, 'Steve', 'Buchanan', 'Montage', 'Rock');
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (002, 'Bill', 'Brown', 'Brown View', 'Funk');
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (003, 'Martha', 'Man', 'Martha', 'Pop');
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (004, NULL, NULL, 'Pharrel', 'Rap');
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (005, 'Steve', NULL, 'Strawberry Streams', 'Soul');
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (006, 'Emily', 'Salt', 'Saltburn', 'Pop');
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (007, NULL, NULL, 'V8 Boys', 'Metal');
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (008, 'Jerry', 'Seinfeld', 'Jerry Seinfeld', 'Comedy');
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (009, 'Rebecca', NULL, 'Book Keeper', 'Rock');
INSERT INTO ARTIST_INFO (artist_id, first_name, last_name, stage_name, genre)
VALUES (010, NULL, 'Buchanan', 'Black Sword', 'Pop');

-- Show Table
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10001, 001, TO_DATE('2024-01-02', 'YYYY-MM-DD'), TIMESTAMP '2024-01-02 20:00:00', 27);
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10002, 004, TO_DATE('2024-04-21', 'YYYY-MM-DD'), TIMESTAMP '2024-04-21 21:00:00', 103);
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10003, 004, TO_DATE('2024-04-22', 'YYYY-MM-DD'), TIMESTAMP '2024-04-22 21:00:00', 101);
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10004, 005, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TIMESTAMP '2024-02-01 20:00:00', 34);
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10005, 010, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TIMESTAMP '2024-01-10 22:00:00', 9);
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10006, 009, TO_DATE('2024-03-02', 'YYYY-MM-DD'), TIMESTAMP '2024-03-02 19:00:00', 27);
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10007, 001, TO_DATE('2023-09-17', 'YYYY-MM-DD'), TIMESTAMP '2023-09-17 20:00:00', 67);
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10008, 008, TO_DATE('2024-05-02', 'YYYY-MM-DD'), TIMESTAMP '2024-05-02 20:00:00', 115);
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10009, 008, TO_DATE('2024-05-03', 'YYYY-MM-DD'), TIMESTAMP '2024-05-03 19:00:00', 203);
INSERT INTO SHOW_INFO (show_id, artist_id_fk, date_of_show, time_of_show, total_tickets_sold)
VALUES (10010, 009, TO_DATE('2024-02-28', 'YYYY-MM-DD'), TIMESTAMP '2024-02-28 18:00:00', 55);

-- User Financial Info Table
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (01, 1, 'Joe', 'Malone', '1401 Main St', '0001400418767658');
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (02, 2, 'Bill', 'Manfred', '136 West Ave', '1098440465767578');
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (03, 3, 'Steve', 'Jordan', '1987 Columbia Rd', '1337456455557659');
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (04, 4, 'James', 'White', '176 Brim Rd', '5671879018767348');
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (05, 5, 'Steve', 'Schinella', '564 New St', '0791549816560978');
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (06, 6, 'Emily', 'Salt', '900 East St', '0980912222349087');
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (07, 7, 'Elaine', 'Benes', '123 New York Ave', '2901438412768765');
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (08, 8, 'Maurice', 'Red', '876 Park Ave', '7701777418467676');
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (09, 9, 'Bob', 'Barker', '1401 West St', '0981400412367777');
INSERT INTO USER_FINANCIAL_INFO (user_fin_id, user_id_fk, first_name, last_name, address, card_number)
VALUES (010, 10, 'Zac', 'Foss', '67 Binder Rd', '1201403217769703');

-- Transaction Table
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (101, 01, 10001, 25.0, TO_DATE('2024-01-02', 'YYYY-MM-DD'), TIMESTAMP '2024-01-02 13:04:21');
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (102, 02, 10004, 35.0, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TIMESTAMP '2024-01-12 09:03:00');
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (103, 01, 10008, 105.0, TO_DATE('2024-03-11', 'YYYY-MM-DD'), TIMESTAMP '2024-03-11 22:07:00');
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (104, 03, 10007, 15.0, TO_DATE('2023-07-04', 'YYYY-MM-DD'), TIMESTAMP '2023-07-04 19:06:00');
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (105, 05, 10010, 25.0, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TIMESTAMP '2024-01-12 18:00:00');
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (106, 04, 10008, 105.0, TO_DATE('2024-03-23', 'YYYY-MM-DD'), TIMESTAMP '2024-03-23 07:15:00');
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (107, 09, 10009, 12.0, TO_DATE('2024-05-02', 'YYYY-MM-DD'), TIMESTAMP '2024-05-02 10:10:10');
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (108, 010, 10006, 28.0, TO_DATE('2024-01-04', 'YYYY-MM-DD'), TIMESTAMP '2024-01-04 13:13:13');
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (109, 06, 10004, 35.0, TO_DATE('2024-01-11', 'YYYY-MM-DD'), TIMESTAMP '2024-01-11 19:02:00');
INSERT INTO TRANSACTION_INFO (transaction_id, user_fin_id_fk, show_id_fk, amount, date_of_transaction, time_of_transaction)
VALUES (110, 07, 10005, 35.0, TO_DATE('2023-12-25', 'YYYY-MM-DD'), TIMESTAMP '2023-12-25 11:24:25');

COMMIT;

/* 20 SQL Statements */

-- Q1. Select all columns and all rows from one table
SELECT * FROM USER_INFO;

-- Q2. Select five columns and all rows from one table
SELECT user_fin_id, first_name, last_name, address, card_number
FROM USER_FINANCIAL_INFO;

-- Q3. Select all columns from all rows from one view
SELECT * FROM UserInfo;

-- Q4. Using a join on 2 tables, select all columns and all rows
SELECT * FROM SHOW_INFO LEFT OUTER JOIN TRANSACTION_INFO ON SHOW_INFO.show_id = TRANSACTION_INFO.show_id_fk;

-- Q5. Select and order data retrieved from one table
SELECT * FROM ARTIST_INFO
ORDER BY stage_name;

-- Q6. Using a join on 3 tables, select 5 columns from the 3 tables.  Use syntax that would limit the output to 10 rows
SELECT ARTIST_INFO.stage_name, ARTIST_INFO.genre, TRANSACTION_INFO.amount, SHOW_INFO.date_of_show, SHOW_INFO.time_of_show
FROM ARTIST_INFO INNER JOIN SHOW_INFO ON ARTIST_INFO.artist_id = SHOW_INFO.artist_id_fk
            INNER JOIN TRANSACTION_INFO ON SHOW_INFO.show_id = TRANSACTION_INFO.show_id_fk
FETCH FIRST 10 ROWS ONLY;

-- Q7. Select distinct rows using joins on 3 tables
SELECT DISTINCT *
FROM ARTIST_INFO INNER JOIN SHOW_INFO ON ARTIST_INFO.artist_id = SHOW_INFO.artist_id_fk
            INNER JOIN TRANSACTION_INFO ON SHOW_INFO.show_id = TRANSACTION_INFO.show_id_fk;

-- Q8. Use GROUP BY and HAVING in a select statement using one or more tables
SELECT ARTIST_INFO.stage_name, SHOW_INFO.total_tickets_sold
FROM ARTIST_INFO INNER JOIN SHOW_INFO ON ARTIST_INFO.artist_id = SHOW_INFO.artist_id_fk
GROUP BY ARTIST_INFO.stage_name, SHOW_INFO.total_tickets_sold
HAVING SHOW_INFO.total_tickets_sold > 25;

-- Q9. Use IN clause to select data from one or more tables
SELECT * FROM USER_INFO
WHERE favorite_artist IN ('John Coltrane', 'King Krule', 'MF DOOM');

-- Q10. Select length of one column from one table (use LENGTH function)
SELECT LENGTH(genre) FROM ARTIST_INFO;

-- Q11. Delete one record from one table.  Use select statements to demonstrate the table contents before and after the DELETE statement.  Make sure you use ROLLBACK afterwards so that the data will not be physically removed
SELECT * FROM ARTIST_INFO;
DELETE FROM ARTIST_INFO
WHERE stage_name = 'Jerry Seinfeld';
SELECT * FROM ARTIST_INFO;
ROLLBACK;

-- Q12. Update one record from one table.  Use select statements to demonstrate the table contents before and after the UPDATE statement.  Make sure you use ROLLBACK afterwards so that the data will not be physically removed
SELECT * FROM USER_INFO;
UPDATE USER_INFO
SET favorite_artist = 'Kanye West'
WHERE user_id = 6;
SELECT * FROM USER_INFO;
ROLLBACK;

-- Q13. List all Users First and Last Names, their Favorite Genre, Favorite Artist, and the total amount they have spent on shows
-- This will help to see the most populat genres and entertainers and see which artist should be brought in the future
SELECT USER_INFO.first_name, USER_INFO.last_name, USER_INFO.favorite_genre, USER_INFO.favorite_artist, SUM(TRANSACTION_INFO.amount) as Total_Amount_Spent
FROM USER_INFO INNER JOIN USER_FINANCIAL_INFO ON USER_INFO.user_id = USER_FINANCIAL_INFO.user_id_fk
            INNER JOIN TRANSACTION_INFO ON USER_FINANCIAL_INFO.user_fin_id = TRANSACTION_INFO.user_fin_id_fk
GROUP BY USER_INFO.first_name, USER_INFO.last_name, USER_INFO.favorite_genre, USER_INFO.favorite_artist
ORDER BY Total_Amount_Spent DESC;

-- Q14. List All User First and Last Names, Along with the Number of Transactions they have completed where their favorite genre is Jazz
-- This query will help find what genres should be focused on in the future
SELECT USER_INFO.first_name, USER_INFO.last_name, COUNT(TRANSACTION_INFO.amount) as Total_Number_of_Transactions
FROM USER_INFO INNER JOIN USER_FINANCIAL_INFO ON USER_INFO.user_id = USER_FINANCIAL_INFO.user_id_fk
                INNER JOIN TRANSACTION_INFO ON USER_FINANCIAL_INFO.user_fin_id = TRANSACTION_INFO.user_fin_id_fk
WHERE USER_INFO.favorite_genre = 'Jazz'
GROUP BY USER_INFO.first_name, USER_INFO.last_name;

-- Q15. List all Artists stage_name, genre, and show count who have performed shows and their genre is metal, rock, or pop
-- This will help see which artists have performed in the past at the venue 
SELECT ARTIST_INFO.stage_name, ARTIST_INFO.genre, COUNT(SHOW_INFO.show_id) AS Total_Shows_Performed
FROM ARTIST_INFO INNER JOIN SHOW_INFO ON ARTIST_INFO.artist_id = SHOW_INFO.artist_id_fk
WHERE ARTIST_INFO.genre IN ('Metal', 'Rock', 'Pop')
GROUP BY ARTIST_INFO.stage_name, ARTIST_INFO.genre;

-- Q16. List the Favorite Artist and Genre of each User who lives on a St or Rd and credit card number starts with a 0 
-- This will help to understand where users who are purchasing tickets are coming from 
SELECT USER_INFO.favorite_artist, USER_INFO.favorite_genre
FROM USER_INFO INNER JOIN USER_FINANCIAL_INFO ON USER_INFO.user_id = USER_FINANCIAL_INFO.user_id_fk
WHERE USER_FINANCIAL_INFO.address LIKE '%St%' AND USER_FINANCIAL_INFO.card_number LIKE '0%';

-- Q17. List the genre of the show with the most ticket purchases 
-- This will help see the most populat kind of shows that exist at the venue
SELECT ARTIST_INFO.genre, COUNT(TRANSACTION_INFO.transaction_id) AS Number_Of_Shows
FROM ARTIST_INFO INNER JOIN SHOW_INFO ON ARTIST_INFO.artist_id = SHOW_INFO.artist_id_fk
                INNER JOIN TRANSACTION_INFO ON SHOW_INFO.show_id = TRANSACTION_INFO.show_id_fk
GROUP BY ARTIST_INFO.genre
ORDER BY Number_Of_Shows DESC
FETCH FIRST 1 ROWS ONLY;

-- Q18. List the Stage Name of all artists performing in the Month of April 2024
-- This will help to display the current schedule on the site
SELECT ARTIST_INFO.stage_name, SHOW_INFO.date_of_show
FROM ARTIST_INFO INNER JOIN SHOW_INFO ON ARTIST_INFO.artist_id = SHOW_INFO.artist_id_fk
WHERE SHOW_INFO.date_of_show >= TO_DATE('2024-04-01', 'YYYY-MM-DD') AND SHOW_INFO.date_of_show <= TO_DATE('2024-04-30', 'YYYY-MM-DD');

-- Q19. List the Stage Name and Genre of all artists who are performing at 8:00 PM
-- This will help to see what time artists are performing at the venue 
SELECT ARTIST_INFO.stage_name, ARTIST_INFO.genre
FROM ARTIST_INFO INNER JOIN SHOW_INFO ON ARTIST_INFO.artist_id = SHOW_INFO.artist_id_fk
WHERE EXTRACT(HOUR FROM SHOW_INFO.time_of_show) = '20';
