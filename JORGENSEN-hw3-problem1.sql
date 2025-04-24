/* PART 1: SQL Problem 1
Construct an experiment to answer a hypotheis
*/

-- Create a blank temporarty table
CREATE TEMP TABLE table_experiment1 (
    my_column REAL
);

-- Put values into the table
INSERT INTO table_experiment1 (my_column) VALUES (1), (2), (3), (NULL), (4), (5);

-- Run the avg() function to see what happens with NULL values
SELECT AVG(my_column) AS average_value FROM table_experiment1;

/* Hmm, it looks like even though there is a NULL value in the dataset, 
it is not being taken into account when calculating the average...
The answer I am getting when running the code above is average_value double = 3.0
This is the answer I would expect if its ignoring the NULL value.
If it somehow factored in the NULL value, I would expect it to return a NULL, or maybe a skewed average.
*/


-- PART 2
SELECT SUM(my_column)/COUNT(*) FROM table_experiment1;
-- This returns 2.5
SELECT SUM(my_column)/COUNT(my_column) FROM table_experiment1;
-- This returns 3.0

/* 3 is the expected answer if the null value is ignored. So, given what we know, 3 is correct. 
This is, I assume, because the * feature ensures that all values are captured, including NULL values.
So, if I want to ignore NULL values entirely, I need to use COUNT(my_column) instead of COUNT(*).
*/

