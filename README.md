# TimeShare Australia Database

Relational and non-relational database project: building, populating, querying and extending a database for a fictional holiday timeshare network, using Oracle SQL and MongoDB.

Built as coursework for the Master of Data Science at Monash University (Introduction to Databases).

## The case

TimeShare Australia (TSA) is a network of companies that operate holiday resorts. Members buy points at their home resort and spend them on cabin stays at any resort in the network. TSA also records towns, nearby points of interest (POIs), member reviews of those POIs, member recommendations, and the annual charges members pay.

## What is in this repo

| Folder | Contents |
|---|---|
| `part1-implementation/` | Oracle SQL scripts to create tables, load test data, change data and change the live schema |
| `part2-querying/` | Analytical SQL queries, SQL that generates JSON documents, and MongoDB scripts |

## Part 1: Building and changing the database (Oracle SQL)

| Script | What it does |
|---|---|
| `T1-tsa-schema.sql` | Creates the `BOOKING` and `CABIN` tables with primary, unique, check and foreign key constraints and column comments (check rules: 1 to 4 bedrooms, bathroom type `I` or `C`) |
| `T2-tsa-insert.sql` | Loads 20 cabins across 10 resorts and 20 bookings. Test data follows the business rules: guests within cabin capacity, dates inside the allowed range, and booking cost equal to nights multiplied by the cabin's daily points cost |
| `T3-tsa-dm.sql` | Creates a sequence for booking IDs, then adds a new cabin, makes a booking, extends the stay and recalculates points, and cancels the cabin with its bookings. Lookups use subqueries rather than hardcoded IDs, and each change ends with an explicit `COMMIT` |
| `T4-tsa-alter.sql` | Changes the live database without losing data: adds a per-cabin booking count and back-fills it with a correlated subquery, adds a `STAFF_ROLE` lookup table linked to staff (existing staff default to Admin), and adds a `CLEANING` table |

## Part 2: Querying (SQL, JSON, MongoDB)

**Oracle SQL: `T2-tsa-select.sql`**

| Query | Question answered |
|---|---|
| 2(a) | Which towns have more than one POI of the same type, and how many? |
| 2(b) | Which members made the most recommendations that led to new members? |
| 2(c) | For every POI, what are the highest, lowest and average review ratings (`NR` where unrated)? |
| 2(d) | What share of all completed reviews does each POI account for? Includes formatted town location output |
| 2(e) | Which members who joined through a recommendation, and whose home resort is outside Byron Bay, have below-average total charges? |
| 2(f) | Which POIs are within 100 km of each resort, using a great-circle distance function? |

**JSON and MongoDB**

- `T3-tsa-json.sql` generates one nested JSON document per town (location, average temperatures, and an array of its resorts) using `JSON_OBJECT` and `JSON_ARRAYAGG`.
- `T3-tsa-mongo.mongodb.js` creates the collection, inserts those documents, queries them with nested and array conditions, renames a company across the collection, and adds a new resort to an existing town document with `$push` and `$inc`.

## Skills shown

- Relational design concepts: keys, constraints, normalisation, lookup and junction tables
- Oracle SQL: DDL, DML, sequences, transaction control, joins (inner and outer), grouping and `HAVING`, scalar and correlated subqueries, `CASE`, date and string formatting
- Generating JSON from relational data and working with nested documents in MongoDB

## Notes

- The base tables and data come from the university case study and are not included, so the scripts cannot be run on their own.
- The trigger in `T1-tsa-schema.sql` was supplied with the case study.
