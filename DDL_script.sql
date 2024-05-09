/*
Zachary Foss
Project Step #3: SQL DDL Script
DBST 651
University of Maryland Global Campus
*/

/* DROP statements to clean up objects from previous run */
-- Triggers
DROP TRIGGER TRG_User;
DROP TRIGGER TRG_Artist;
DROP TRIGGER TRG_Show;
DROP TRIGGER TRG_Transaction;
DROP TRIGGER TRG_User_Financial_Info;

-- Sequences
DROP SEQUENCE SEQ_User_user_id;
DROP SEQUENCE SEQ_Artist_artist_id;
DROP SEQUENCE SEQ_Show_show_id;
DROP SEQUENCE SEQ_Transaction_transaction_id;
DROP SEQUENCE SEQ_User_Financial_Info_user_fin_id;

-- Views
DROP VIEW UserInfo;
DROP VIEW ArtistInfo;
DROP VIEW ShowInfo;

-- Indices
DROP INDEX IDX_Artist_stage_name;
DROP INDEX IDX_Show_artist_id_fk;
DROP INDEX IDX_Transaction_show_id_fk;
DROP INDEX IDX_Transaction_artist_id_fk;
DROP INDEX IDX_User_Financial_Info_user_id_fk;

-- Tables
DROP TABLE Show_Info;
DROP TABLE User_Financial_Info;
DROP TABLE Transaction_Info;
DROP TABLE User_Info;
DROP TABLE Artist_Info;

CREATE TABLE User_Info (
    user_id VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL, 
    favorite_genre VARCHAR(20),
    favorite_artist VARCHAR(20),
    CONSTRAINT PK_User_Info PRIMARY KEY (user_id)
);

CREATE TABLE Artist_Info (
    artist_id VARCHAR(20) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    genre VARCHAR(20) NOT NULL,
    stage_name VARCHAR(20) NOT NULL,
    
    CONSTRAINT PK_Artist_Info PRIMARY KEY (artist_id)
);

CREATE TABLE Show_Info (
    show_id VARCHAR(20) NOT NULL,
    total_tickets_sold INTEGER NOT NULL,
    artist_id_fk VARCHAR(20) NOT NULL,
    date_of_show DATE NOT NULL,
    time_of_show TIMESTAMP NOT NULL,
    
    CONSTRAINT PK_Show_Info PRIMARY KEY (show_id),
    CONSTRAINT FK_Show_artist_id FOREIGN KEY (artist_id_fk) REFERENCES Artist_Info
);

CREATE TABLE User_Financial_Info (
    user_fin_id VARCHAR(20) NOT NULL,
    address VARCHAR(20) NOT NULL,
    card_number VARCHAR(16) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    user_id_fk VARCHAR(20) NOT NULL,
    
    CONSTRAINT PK_User_Financial_Info PRIMARY KEY (user_fin_id),
    CONSTRAINT FK_User_Financial_Info_user_id FOREIGN KEY (user_id_fk) REFERENCES User_Info
    
);

CREATE TABLE Transaction_Info (
    transaction_id VARCHAR(20) NOT NULL,
    amount FLOAT NOT NULL,
    date_of_transaction DATE NOT NULL,
    time_of_transaction TIMESTAMP NOT NULL,
    show_id_fk VARCHAR(20) NOT NULL,
    user_fin_id_fk VARCHAR(20) NOT NULL,
    
    CONSTRAINT PK_Transaction_Info PRIMARY KEY (transaction_id),
    CONSTRAINT FK_Transaction_show_id FOREIGN KEY (show_id_fk) REFERENCES Show_Info,
    CONSTRAINT FK_Transaction_user_fin_id FOREIGN KEY (user_fin_id_fk) REFERENCES User_Financial_Info
);

/* Create indices for natural keys, foreign keys, and frequently-queried columns */
/* Foreign Keys*/
CREATE INDEX IDX_Show_artist_id_fk ON Show_Info (artist_id_fk);
CREATE INDEX IDX_Transaction_show_id_fk ON Transaction_Info (show_id_fk);
CREATE INDEX IDX_Transaction_artist_id_fk ON Transaction_Info (artist_id_fk);
CREATE INDEX IDX_User_Financial_Info_user_id_fk ON User_Financial_Info (user_id_fk);

/* Natural Keys */
CREATE UNIQUE INDEX IDX_Artist_stage_name ON Artist_Info (stage_name);

/* Alter Tables by adding Audit Columns */
ALTER TABLE User_Info ADD (
    created_by    VARCHAR2(30),
    date_created  DATE,
    modified_by   VARCHAR2(30),
    date_modified DATE
);

ALTER TABLE Artist_Info ADD (
    created_by    VARCHAR2(30),
    date_created  DATE,
    modified_by   VARCHAR2(30),
    date_modified DATE
);

ALTER TABLE Show_Info ADD (
    created_by    VARCHAR2(30),
    date_created  DATE,
    modified_by   VARCHAR2(30),
    date_modified DATE
);

ALTER TABLE Transaction_Info ADD (
    created_by    VARCHAR2(30),
    date_created  DATE,
    modified_by   VARCHAR2(30),
    date_modified DATE
);

ALTER TABLE User_Financial_Info ADD (
    created_by    VARCHAR2(30),
    date_created  DATE,
    modified_by   VARCHAR2(30),
    date_modified DATE
);

/* Create Views */
/* Business Purpose: The purpose of the UserInfo view will be to quickly grab information pertaining to the Users favorite genre and favorite artist for receommendations*/
CREATE OR REPLACE VIEW UserInfo AS
SELECT user_id, first_name, last_name, favorite_genre, favorite_artist
FROM User_Info;

/* Business Purpose: The purpose of the ArtistInfo view will be to quickly grab artist information when displaying upcoming artists that will be performing*/
CREATE OR REPLACE VIEW ArtistInfo AS
SELECT artist_id, stage_name, genre
FROM Artist_Info;

/* Business Purpose: The purspose of the ShowInfo view will be to easily view information such as date or time for posting new shows or for finding out the total number of expected attendees*/
CREATE OR REPLACE VIEW ShowInfo AS
SELECT show_id, total_tickets_sold, date_of_show, time_of_show
FROM Show_Info;


/* Create Sequences */

CREATE SEQUENCE SEQ_User_user_id
    INCREMENT BY 1
    START WITH 0
    NOMAXVALUE
    MINVALUE 0
    NOCACHE;

CREATE SEQUENCE SEQ_Artist_artist_id
    INCREMENT BY 1
    START WITH 0
    NOMAXVALUE
    MINVALUE 0
    NOCACHE;

CREATE SEQUENCE SEQ_Show_show_id
    INCREMENT BY 1
    START WITH 0
    NOMAXVALUE
    MINVALUE 0
    NOCACHE;

CREATE SEQUENCE SEQ_Transaction_transaction_id
    INCREMENT BY 1
    START WITH 0
    NOMAXVALUE
    MINVALUE 0
    NOCACHE;

CREATE SEQUENCE SEQ_User_Financial_Info_user_fin_id
    INCREMENT BY 1
    START WITH 0
    NOMAXVALUE
    MINVALUE 0
    NOCACHE;

/* Create Triggers */
/* Business Purpose: The purpose of this TRG_User trigger is to sequentially update the user id for each new user that is created. Additionally update the created by and date created fields. Lastly, this trigger will update the modified by and modified date*/ 
CREATE OR REPLACE TRIGGER TRG_User
    BEFORE INSERT OR UPDATE ON User_Info
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.user_id IS NULL THEN
                :NEW.user_id := SEQ_User_user_id.NEXTVAL;
            END IF;
            IF :NEW.created_by IS NULL THEN
                :NEW.created_by := USER;
            END IF;
            IF :NEW.date_created IS NULL THEN
                :NEW.date_created := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN
            :NEW.modified_by := USER;
            :NEW.date_modified := SYSDATE;
        END IF;
END;
/

/* Business Purpose: The purpose of this TRG_Artist trigger is to sequentially update the artist id for each new artist that is created. Additionally update the created by and date created fields. Lastly, this trigger will update the modified by and modified date*/ 
CREATE OR REPLACE TRIGGER TRG_Artist
    BEFORE INSERT OR UPDATE ON Artist_Info
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.artist_id IS NULL THEN
                :NEW.artist_id := SEQ_Artist_artist_id.NEXTVAL;
            END IF;
            IF :NEW.created_by IS NULL THEN
                :NEW.created_by := USER;
            END IF;
            IF :NEW.date_created IS NULL THEN
                :NEW.date_created := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN
            :NEW.modified_by := USER;
            :NEW.date_modified := SYSDATE;
        END IF;
END;
/

/* Business Purpose: The purpose of this TRG_Show trigger is to sequentially update the show id for each new show that is created. Additionally update the created by and date created fields. Lastly, this trigger will update the modified by and modified date*/ 
CREATE OR REPLACE TRIGGER TRG_Show
    BEFORE INSERT OR UPDATE ON Show_Info
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.show_id IS NULL THEN
                :NEW.show_id := SEQ_Show_show_id.NEXTVAL;
            END IF;
            IF :NEW.created_by IS NULL THEN
                :NEW.created_by := USER;
            END IF;
            IF :NEW.date_created IS NULL THEN
                :NEW.date_created := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN
            :NEW.modified_by := USER;
            :NEW.date_modified := SYSDATE;
        END IF;
END;
/

/* Business Purpose: The purpose of this TRG_Transaction trigger is to sequentially update the transaction id for each new transaction that is created. Additionally update the created by and date created fields. Lastly, this trigger will update the modified by and modified date*/ 
CREATE OR REPLACE TRIGGER TRG_Transaction
    BEFORE INSERT OR UPDATE ON Transaction_Info
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.transaction_id IS NULL THEN
                :NEW.transaction_id := SEQ_Transaction_transaction_id.NEXTVAL;
            END IF;
            IF :NEW.created_by IS NULL THEN
                :NEW.created_by := USER;
            END IF;
            IF :NEW.date_created IS NULL THEN
                :NEW.date_created := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN
            :NEW.modified_by := USER;
            :NEW.date_modified := SYSDATE;
        END IF;
END;
/

/* Business Purpose: The purpose of this TRG_User_Financial_Info trigger is to sequentially update the user_fin_id for each new user_financial_info that is created. Additionally update the created by and date created fields. Lastly, this trigger will update the modified by and modified date*/ 
CREATE OR REPLACE TRIGGER TRG_User_Financial_Info
    BEFORE INSERT OR UPDATE ON User_Financial_Info
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            IF :NEW.user_fin_id IS NULL THEN
                :NEW.user_fin_id := SEQ_User_Financial_Info_user_fin_id.NEXTVAL;
            END IF;
            IF :NEW.created_by IS NULL THEN
                :NEW.created_by := USER;
            END IF;
            IF :NEW.date_created IS NULL THEN
                :NEW.date_created := SYSDATE;
            END IF;
        END IF;
        IF INSERTING OR UPDATING THEN
            :NEW.modified_by := USER;
            :NEW.date_modified := SYSDATE;
        END IF;
END;
/

-- Check the DBMS data dictionary to make sure that all objects have been created successfully
SELECT * FROM USER_TABLES;
