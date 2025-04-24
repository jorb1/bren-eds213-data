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

