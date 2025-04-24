-- PART 1

-- First I will open the database so I can run the query and view the error message.
.open 'C:/MEDS/EDS-213/bren-eds213-data/database/database.db'

SELECT Site_name, MAX(Area) FROM Site;

/* Hmmm interesting!
Based on the other examples in the instruction descriptions, I think that MAX(Area) is also an 
aggregate function. So, it tries to collapse the dataset into one row, in order to perform
the aggregation. So, it is basically looking for a single answer, or single number, to provide
from the calculation. There must be multiple site names corresponding to the area values, so it is
confused about how to produce one answer. 
*/


-- PART 2

SELECT Site_name, Area 
FROM Site
ORDER BY Area DESC
LIMIT 1;

/* This gave me the answer that I wanted according to the instructions!
Basically, instead of summing, which is an aggregate function, I instead selected the columns 
I wanted, and then sorted them so that the largest area was first. 
Then I limited the output to just one row, which is the maximum area. 
Hooray!
*/

-- PART 3

SELECT Site_name, Area
FROM Site
WHERE Area = (SELECT MAX(Area) FROM Site);

/* Oooo cool! So, this code returns a whole row from the DB. 
I guess the best way to think about it is the INNER query, which is the one in the parentheses,
versus the OUTER query, which is the rest of the code. The inner query finds the max area from site, 
which will return a single number. The outer query will then select the rest of the row. It 
seems like a good way to get around the problem of the aggregate function, that we saw earlier.
*/
