--T3-tsa-dm.sql

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

--3(a)
DROP SEQUENCE booking_seq;

CREATE SEQUENCE booking_seq START WITH 100 INCREMENT BY 10;

--3(b)
INSERT INTO cabin VALUES (
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
                upper(resort_name) = upper('Awesome Resort')
            AND town_id = (
                SELECT
                    town_id
                FROM
                    town
                WHERE
                        town_lat = - 17.9644
                    AND town_long = 122.2304
            )
    ),
    4,
    4,
    10,
    'I',
    220,
    'Huge and cozy family cabin with a private swimming pool and jacuzzi'
);

COMMIT;

--3(c)
INSERT INTO booking VALUES (
    booking_seq.NEXTVAL,
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
                upper(resort_name) = upper('Awesome Resort')
            AND town_id = (
                SELECT
                    town_id
                FROM
                    town
                WHERE
                        town_lat = - 17.9644
                    AND town_long = 122.2304
            )
    ),
    4,
    TO_DATE('26-May-2023', 'dd-Mon-yyyy'),
    TO_DATE('28-May-2023', 'dd-Mon-yyyy'),
    4,
    4,
    (
        SELECT
            ( TO_DATE('28-May-2023', 'dd-Mon-yyyy') - TO_DATE('26-May-2023', 'dd-Mon-yyyy'
            ) ) * (
                SELECT
                    cabin_points_cost_day
                FROM
                         cabin c
                    JOIN resort r
                    ON c.resort_id = r.resort_id
                    JOIN town   t
                    ON r.town_id = t.town_id
                WHERE
                        upper(resort_name) = upper('Awesome Resort')
                    AND town_lat = - 17.9644
                    AND town_long = 122.2304
                    AND cabin_no = 4
            )
        FROM
            dual
    ),
    (
        SELECT
            member_id
        FROM
            member
        WHERE
                member_no = 2
            AND resort_id = 9
    ),
    (
        SELECT
            staff_id
        FROM
            staff
        WHERE
            staff_phone = '0493427245'
    )
);

COMMIT;

--3(d)
UPDATE booking
SET
    booking_to = booking_to + 1,
    booking_total_points_cost = (
        SELECT
            ( TO_DATE('29-May-2023', 'dd-Mon-yyyy') - TO_DATE('26-May-2023', 'dd-Mon-yyyy'
            ) ) * (
                SELECT
                    cabin_points_cost_day
                FROM
                         cabin c
                    JOIN resort r
                    ON c.resort_id = r.resort_id
                    JOIN town   t
                    ON r.town_id = t.town_id
                WHERE
                        upper(resort_name) = upper('Awesome Resort')
                    AND town_lat = - 17.9644
                    AND town_long = 122.2304
                    AND cabin_no = 4
            )
        FROM
            dual
    )
WHERE
        resort_id = (
            SELECT
                resort_id
            FROM
                resort
            WHERE
                    upper(resort_name) = upper('Awesome Resort')
                AND town_id = (
                    SELECT
                        town_id
                    FROM
                        town
                    WHERE
                            town_lat = - 17.9644
                        AND town_long = 122.2304
                )
        )
    AND cabin_no = 4
    AND to_char(booking_from, 'dd-Mon-yyyy') = '26-May-2023';

COMMIT;

--3(e)
DELETE FROM booking
WHERE
        resort_id = (
            SELECT
                resort_id
            FROM
                resort
            WHERE
                    upper(resort_name) = upper('Awesome Resort')
                AND town_id = (
                    SELECT
                        town_id
                    FROM
                        town
                    WHERE
                            town_lat = - 17.9644
                        AND town_long = 122.2304
                )
        )
    AND cabin_no = 4
    AND booking_from >= to_date('04-May-2023', 'dd-Mon-yyyy');

DELETE FROM cabin
WHERE
        resort_id = (
            SELECT
                resort_id
            FROM
                resort
            WHERE
                    upper(resort_name) = upper('Awesome Resort')
                AND town_id = (
                    SELECT
                        town_id
                    FROM
                        town
                    WHERE
                            town_lat = - 17.9644
                        AND town_long = 122.2304
                )
        )
    AND cabin_no = 4;

COMMIT;