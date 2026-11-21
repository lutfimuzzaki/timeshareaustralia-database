--T1-tsa-select.sql

/*2(a)*/
SELECT
    t.town_id,
    t.town_name,
    pt.poi_type_id,
    pt.poi_type_descr,
    COUNT(t.town_id) AS poi_count
FROM
         tsa.town t
    JOIN tsa.point_of_interest p
    ON t.town_id = p.town_id
    JOIN tsa.poi_type          pt
    ON p.poi_type_id = pt.poi_type_id
GROUP BY
    t.town_id,
    t.town_name,
    pt.poi_type_id,
    pt.poi_type_descr
HAVING
    COUNT(t.town_id) > 1
ORDER BY
    t.town_id,
    pt.poi_type_descr;

/*2(b)*/
SELECT
    m.member_id,
    m.member_gname
    || ' '
    || m.member_fname AS member_name,
    r.resort_id,
    r.resort_name,
    COUNT(*)          AS number_of_recommendations
FROM
         tsa.member m
    JOIN tsa.resort r
    ON m.resort_id = r.resort_id
    JOIN tsa.member rc
    ON m.member_id = rc.member_id_recby
GROUP BY
    m.member_id,
    m.member_gname,
    m.member_fname,
    r.resort_id,
    r.resort_name
HAVING
    COUNT(*) = (
        SELECT
            MAX(recommendation_count)
        FROM
            (
                SELECT
                    COUNT(*) AS recommendation_count
                FROM
                    tsa.member
                WHERE
                    member_id_recby IS NOT NULL
                GROUP BY
                    member_id_recby
            )
    )
ORDER BY
    r.resort_id,
    m.member_id;

/*2(c)*/
SELECT
    p.poi_id,
    p.poi_name,
    CASE
        WHEN MAX(r.review_rating) IS NULL THEN
            'NR'
        ELSE
            to_char(MAX(r.review_rating),
                    '9')
    END AS max_rating,
    CASE
        WHEN MIN(r.review_rating) IS NULL THEN
            'NR'
        ELSE
            to_char(MIN(r.review_rating),
                    '9')
    END AS min_rating,
    CASE
        WHEN AVG(r.review_rating) IS NULL THEN
            'NR'
        ELSE
            to_char(round(AVG(r.review_rating),
                          1),
                    '9.9')
    END AS avg_rating
FROM
    tsa.point_of_interest p
    LEFT JOIN tsa.review            r
    ON p.poi_id = r.poi_id
GROUP BY
    p.poi_id,
    p.poi_name
ORDER BY
    p.poi_id;

/*2(d)*/
SELECT
    p.poi_name,
    pt.poi_type_descr,
    t.town_name,
    lpad('Lat:'
         || to_char(t.town_lat, '990.999999')
         || ' Long:'
         || to_char(t.town_long, '990.999999'),
         35)           AS town_location,
    COUNT(r.review_id) AS reviews_completed,
    CASE
        WHEN COUNT(r.review_id) = 0 THEN
            'No reviews completed'
        ELSE
            ltrim(to_char(COUNT(r.review_id) * 100 /(
                SELECT
                    COUNT(*)
                FROM
                    tsa.review
            ),
                          '990.99'))
            || '%'
    END                AS percent_of_reviews
FROM
         tsa.point_of_interest p
    JOIN tsa.town     t
    ON p.town_id = t.town_id
    JOIN tsa.poi_type pt
    ON p.poi_type_id = pt.poi_type_id
    LEFT JOIN tsa.review   r
    ON p.poi_id = r.poi_id
GROUP BY
    p.poi_id,
    p.poi_name,
    pt.poi_type_descr,
    t.town_name,
    t.town_lat,
    t.town_long
ORDER BY
    t.town_name,
    COUNT(r.review_id) DESC,
    p.poi_name;

/*2(e)*/
SELECT
    r.resort_id,
    r.resort_name,
    m.member_no,
    TRIM(nvl(concat(m.member_gname, ' '),
             '')
         || m.member_fname)                           AS member_name,
    to_char(m.member_date_joined, 'dd-Mon-yyyy') AS date_joined,
    m.member_id_recby
    || ' '
    || TRIM(nvl(concat(mr.member_gname, ' '),
                '')
            || mr.member_fname)                          AS recommended_by_details,
    lpad('$'
         || to_char(round(mc.mc_total)),
         13)                                     AS total_charges
FROM
         tsa.resort r
    JOIN tsa.member        m
    ON r.resort_id = m.resort_id
    JOIN tsa.member_charge mc
    ON m.member_id = mc.member_id
    LEFT JOIN tsa.member        mr
    ON m.member_id_recby = mr.member_id
    JOIN tsa.town          t
    ON r.town_id = t.town_id
WHERE
        t.town_id != (
            SELECT
                t.town_id
            FROM
                tsa.town t
            WHERE
                    upper(t.town_name) = upper('Byron Bay')
                AND upper(t.town_state) = upper('NSW')
        )
    AND m.member_id_recby IS NOT NULL
    AND mc.mc_total < (
        SELECT
            AVG(mc_total)
        FROM
            tsa.member_charge
    )
ORDER BY
    r.resort_id,
    m.member_no;

/*2(f)*/
SELECT
    r.resort_id,
    r.resort_name,
    p.poi_name,
    o.town_name      AS poi_town,
    o.town_state     AS poi_state,
    CASE
        WHEN p.poi_open_time IS NOT NULL THEN
            to_char(p.poi_open_time, 'hh:mi AM')
        ELSE
            'Not Applicable'
    END              AS poi_opening_time,
    to_char(geodistance(t.town_lat, t.town_long, o.town_lat, o.town_long),
            '990.9') || ' Kms' AS distance
FROM
         tsa.resort r
    JOIN tsa.town              t
    ON r.town_id = t.town_id
    JOIN tsa.point_of_interest p
    ON p.town_id IN (
        SELECT
            town_id
        FROM
            tsa.town
    )
    JOIN tsa.town       o
    ON p.town_id = o.town_id
WHERE
    geodistance(t.town_lat, t.town_long, o.town_lat, o.town_long) <= 100
ORDER BY
    r.resort_name,
    distance;