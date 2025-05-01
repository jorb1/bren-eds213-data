.open C:/MEDS/EDS-213/bren-eds213-data/database/database.db

-- Which sites have no egg data?

-- Technique 1: Using a Code NOT IN (subquery) clause
SELECT Code FROM Site
    WHERE Code NOT IN (SELECT Site FROM bird_eggs)
    ORDER BY Code;

-- Technique 2: Using an outer join with a WHERE clause
SELECT Code FROM Site
FULL OUTER JOIN bird_eggs
    ON Site.Code = bird_eggs.SiteJ
    WHERE bird_eggs.Site IS NULL
    ORDER BY Code;

-- Technique 3: Using the set operation EXCEPT
SELECT Code FROM Site
    EXCEPT
    SELECT DISTINCT Site FROM Bird_eggs
    ORDER BY Code;

-- All three of these techniques create a Site varchar table with 
-- all 14 rows expected according to instructions.
