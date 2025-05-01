.open C:/MEDS/EDS-213/bren-eds213-data/database/database.db

SELECT 
    p.Name AS Observer_Name,
    COUNT(n.Nest_ID) AS Num_floated_nests
FROM Bird_nests n
JOIN Personnel p ON n.Observer = p.Abbreviation
WHERE n.Site = 'nome'
  AND n.Year BETWEEN 1998 AND 2008
  AND n.ageMethod = 'float'
GROUP BY p.Name
HAVING COUNT(n.Nest_ID) = 36;

-- Looks like the culprit is Emilie D'Astrous!!
-- Dunno why this person loves saltwater so much
