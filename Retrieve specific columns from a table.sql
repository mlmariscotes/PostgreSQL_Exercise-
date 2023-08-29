-- Retrieve everything from a table
SELECT * FROM cd.facilities

-- Retrieve specific columns from a table
SELECT name, membercost FROM cd.facilities

-- Control which rows are retrieved
SELECT * FROM cd.facilities
WHERE membercost > 0;

-- Control which rows are retrieved - part 2
WITH fee AS (
  SELECT facid, name, membercost, monthlymaintenance, membercost / monthlymaintenance AS calculated_fee
  FROM cd.facilities
)
SELECT facid, name, membercost, monthlymaintenance
FROM fee
WHERE calculated_fee <= 0.02 AND membercost != 0;

-- Basic string searches
SELECT * FROM cd.facilities
WHERE name ILIKE '%Tennis%'

-- Matching against multiple possible values
SELECT * FROM cd.facilities
WHERE facid IN (1, 5);

-- Classify results into buckets
SELECT name,
	CASE
	  WHEN monthlymaintenance > 100 then 'expensive'
	  ELSE 'cheap'
	END AS cost
FROM cd.facilities;

-- Working with dates
SELECT memid, surname, firstname, joindate FROM cd.members
WHERE joindate > '2012-09-01';

-- Removing duplicates, and ordering results
SELECT DISTINCT surname FROM cd.members
ORDER BY surname ASC
LIMIT 10;

-- Combining results from multiple queries
SELECT surname FROM cd.members
  UNION
  SELECT name FROM cd.facilities
ORDER BY surname DESC;

-- Simple aggregation
SELECT joindate AS latest FROM  cd.members
  ORDER BY joindate DESC
LIMIT 1;

-- Simple aggregation
SELECT joindate AS latest FROM  cd.members
ORDER BY joindate DESC
LIMIT 1;

-- More aggregation
SELECT firstname, surname, joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;












