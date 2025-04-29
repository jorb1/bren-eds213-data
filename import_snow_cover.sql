.open 'C:/MEDS/EDS-213/bren-eds213-data/database/database.db'

CREATE TABLE Snow_cover (
    Site VARCHAR NOT NULL,
    Year INTEGER NOT NULL CHECK (Year BETWEEN 1990 and 2018),
    DATE DATE NOT NULL,
    Plot VARCHAR NOT NULL,
    Location VARCHAR NOT NULL,
    Snow_cover REAL CHECK (Snow_cover BETWEEN 0 and 130),
    Water_cover REAL CHECK (Water_cover BETWEEN 0 and 130),
    Land_cover REAL CHECK (Land_cover BETWEEN 0 and 130),
    Total_cover REAL CHECK (Total_cover BETWEEN 0 and 130),
    Observer VARCHAR,
    Notes VARCHAR,
    PRIMARY KEY (Site, Plot, Location, Date),
    FOREIGN KEY (Site) REFERENCES Site(Code),
);

COPY Snow_cover FROM "./ASDN_csv/snow_survey_fixed.csv" (header TRUE, nullstr "NA");

SELECT * FROM Snow_cover LIMIT 10; 

-- Ask 1: What is the average snow cover for each site?
SELECT Site, AVG(Snow_cover) AS Avg_Snow_Cover
FROM Snow_cover
GROUP BY Site;

-- Ask 2: Top 5 most snowy sites
SELECT Site, AVG(Snow_cover) AS Avg_Snow_Cover
FROM Snow_cover
GROUP BY Site
ORDER BY Avg_Snow_Cover DESC
LIMIT 5;

-- Ask 3: save this as a view
CREATE VIEW Site_avg_snow_cover AS (
    SELECT Site, AVG(Snow_cover) AS Avg_Snow_Cover
    FROM Snow_cover
    GROUP BY Site
    ORDER BY Avg_Snow_Cover DESC
    LIMIT 5);

-- DANGER ZONE AKA UPDATING DATA
-- WE FOUND OUT THAT OS AS PLOT = `BRW0` WITH SNOW_COVER == 0 ARE ACTUALLY NO DATA (NULL)

CREATE TEMP TABLE Snow_cover_backup AS (SELECT * FROM Snow_cover);
UPDATE Snow_cover SET Snow_cover = NULL WHERE Plot = 'brw0' AND Snow_cover = 0;

-- It worked! now lets run the same code on the real table
UPDATE Snow_cover SET Snow_cover = NULL WHERE Plot = 'brw0' AND Snow_cover = 0;