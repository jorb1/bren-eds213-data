.open C:/MEDS/EDS-213/bren-eds213-data/database/database.db


SELECT * FROM Camp_assignment LIMIT 10;
SELECT * FROM Personnel;
SELECT * FROM Camp_assignment JOIN Personnel
ON Observer = Abbreviation
LIMIT 10; 


-- relational algebra and nested queries and subqueries

SELECT COUNT(*) FROM Bird_nests;
SELECT COUNT(*) FROM (SELECT COUNT(*) FROM Bird_nests);
-- create temp tables
CREATE TEMP TABLE nest_count;


-- Outer joins
CREATE TEMP TABLE a (
    INSERT INTO a VALUES (1, 1), (2,2), (3,3), (4,4), (5,5);
)


INSERT INTO b VALUES (2, 2),
SELECT * FROM b;

-- The joins we've been doing so far have been inner joins
SELECT * FROM a LEFT JOIN b ON a.common = b.common;

-- method 2
SELECT * FROM Species LEFT JOIN Bird_nests
ON Code = Species
WHERE Species IS NULL; 

-- It's also possible to join a table with itself, a so-called self-join.
-- Understanding a limit of duckdb
SELECT Nest_ID, Count(*)
    FROM Bird_nests JOIN Bird_eggs
    Using (Nest_ID)
    WHERE Nest_ID LIKE '13B%'
    GROUP BY Nest_ID;

-- Let's add in observer
SSELECT Nest_ID, Observer, Count(*) AS Num_eggs
    FROM Bird_nests JOIN Bird_eggs
    USING (Nest_ID)
    WHERE Nest_ID LIKE '13B%'
    GROUP BY Nest_ID;

-- views; a virtual table
.tables
SELECT * FROM my_nests;
SELECT Nest_ID, Name, Num_eggs
    From my_nests JOIN Personnel
    ON Observer = Abbreviation; 