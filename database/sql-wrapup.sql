.open 'C:/MEDS/EDS-213/bren-eds213-data/database/database.db'

SELECT * FROM Species LIMIT 3;

-- are there duplicate scientific names? (yes)
SELECT COUNT(*) FROM Species;
SELECT COUNT(DISTINCT Scientific_name) FROM Species;
SELECT Scientific_name, COUNT(*) AS Num_name_occurences
    FROM Species
    GROUP BY Scientific_name
    HAVING Num_name_occurences > 1;
CREATE TEMP TABLE t AS (
    SELECT Scientific_name, COUNT(*) AS Num_name_occurences
);
SELECT * FROM t;
SELECT * FROM Species s JOIN t
    ON s.Scientific_name = t.Scientific_name
    OR (s.Scientific_name IS NULL AND t.Scientific_name IS NULL);

-- inserting data
SELECT * FROM Species;
--you can explicity label columns
INSERT INTO Species
    (Common_name, Scientific_name,  Code, Relevance)
    values('thing 2', 'another scientific name', 'efgh', NULL);
SELECT * FROM Species;

-- take advantage of default values
INSERT INTO Species
    (Common_name, Code)
    VALUES
    ('thing 3', 'ijkl');
SELECT * FROM Species;

-- UPDATES AND DELETES will demolish the entire table unless limited by WHERE
DELETE FROM Bird_eggs --DANGEROUS IS EXECUTED

-- DO A SELECT FIRST
SELECT * FROM Bird_eggs WHERE Nest_id LIKE 'z%';
SELECT * FROM Bird_nests;
--try the create a copy of the table technique
CREATE TABLE nest_temp AS (SELECT * FROM Bird_nests);
DELETE FROM nest_temp WHERE Site = 'chur';
-- other ideas
xDELETE FROM ... WHERE...;