--T2-tsa-json.sql

/*3(a)*/
SELECT
        JSON_OBJECT(
            '_id' VALUE town_id,
                    'name' VALUE town_name
                                 || ', '
                                 || town_state,
                    'location' VALUE
                JSON_OBJECT(
                    'latitude' VALUE town_lat,
                    'longitude' VALUE town_long
                ),
                    'avg_temperature' VALUE
                JSON_OBJECT(
                    'summer' VALUE town_avg_summer_temp,
                    'winter' VALUE town_avg_winter_temp
                ),
                    'no_of_resorts' VALUE COUNT(resort_id),
                    'resorts' VALUE JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id' VALUE resort_id,
                    'name' VALUE resort_name,
                    'address' VALUE resort_street_address,
                    'phone' VALUE resort_phone,
                    'year_built' VALUE EXTRACT(YEAR FROM resort_yr_built_purch),
                            'company_name' VALUE company_name
                )
            )
        FORMAT JSON)
        || ','
FROM
         tsa.town
    NATURAL JOIN tsa.resort
    NATURAL JOIN tsa.company
GROUP BY
    town_id,
    town_name,
    town_state,
    town_lat,
    town_long,
    town_avg_summer_temp,
    town_avg_winter_temp
ORDER BY
    town_id