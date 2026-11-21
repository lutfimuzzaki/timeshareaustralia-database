--T4-tsa-alter.sql

--4(a)
DESC cabin;

ALTER TABLE cabin ADD total_cabin_booking NUMBER(5) DEFAULT 0 NOT NULL;

COMMENT ON COLUMN cabin.total_cabin_booking IS
    'Total number of bookings for this cabin';

UPDATE cabin c
SET
    total_cabin_booking = (
        SELECT
            COUNT(*)
        FROM
            booking b
        WHERE
                c.resort_id = b.resort_id
            AND c.cabin_no = b.cabin_no
    );

COMMIT;

SELECT
    *
FROM
    cabin;

DESC cabin;

--4(b)
DROP TABLE staff_role CASCADE CONSTRAINTS PURGE;

CREATE TABLE staff_role (
    staff_role_id      CHAR(1) NOT NULL,
    staff_role_name    VARCHAR2(50) NOT NULL,
    staff_role_jobdesc VARCHAR2(300) NOT NULL
);

COMMENT ON COLUMN staff_role.staff_role_id IS
    'ID of the role';

COMMENT ON COLUMN staff_role.staff_role_name IS
    'Name of the role';

COMMENT ON COLUMN staff_role.staff_role_jobdesc IS
    'Job description of the role';

DESC staff_role;

ALTER TABLE staff_role ADD CONSTRAINT staff_role_pk PRIMARY KEY ( staff_role_id );

INSERT INTO staff_role VALUES (
    'A',
    'Admin',
    'Take bookings, and reply to customer inquiries'
);

INSERT INTO staff_role VALUES (
    'C',
    'Cleaning',
    'Clean cabins and maintain resorts public area'
);

INSERT INTO staff_role VALUES (
    'M',
    'Marketing',
    'Prepare and present marketing ideas and deliverables'
);

SELECT
    *
FROM
    staff_role;

DESC staff_role;

ALTER TABLE staff ADD staff_role_id CHAR(1) DEFAULT 'A' NOT NULL;

ALTER TABLE staff
    ADD CONSTRAINT staffrole_staff FOREIGN KEY ( staff_role_id )
        REFERENCES staff_role ( staff_role_id );

COMMENT ON COLUMN staff.staff_role_id IS
    'ID of the role';

SELECT
    *
FROM
    staff;

DESC staff;

COMMIT;

--4(c)
DROP TABLE cleaning CASCADE CONSTRAINTS PURGE;

CREATE TABLE cleaning (
    cleaning_id        NUMBER(8) NOT NULL,
    booking_id         NUMBER(8) NOT NULL,
    staff_id           NUMBER(5) NOT NULL,
    cleaning_starttime DATE NOT NULL,
    cleaning_endtime   DATE NOT NULL
);

COMMENT ON COLUMN cleaning.cleaning_id IS
    'Surrogate key added to replace CLEANING composite PK';

COMMENT ON COLUMN cleaning.booking_id IS
    'Booking unique identifier for BOOKING table';

COMMENT ON COLUMN cleaning.staff_id IS
    'Staff identifier, assigned for this ckeaning';

COMMENT ON COLUMN cleaning.cleaning_starttime IS
    'Cleaning date start time';

COMMENT ON COLUMN cleaning.cleaning_endtime IS
    'Cleaning date end time';

ALTER TABLE cleaning ADD CONSTRAINT cleaning_pk PRIMARY KEY ( cleaning_id );

ALTER TABLE cleaning
    ADD CONSTRAINT cleaning_uq UNIQUE ( booking_id,
                                        staff_id,
                                        cleaning_starttime );

ALTER TABLE cleaning
    ADD CONSTRAINT booking_cleaning_fk FOREIGN KEY ( booking_id )
        REFERENCES booking ( booking_id );

ALTER TABLE cleaning
    ADD CONSTRAINT staff_cleaning_fk FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id );

SELECT
    *
FROM
    cleaning;

DESC cleaning;