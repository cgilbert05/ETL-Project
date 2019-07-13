--Create table for the exact matches between Metacritic and IMDB
--Imported the csv into the table
CREATE TABLE metacritic_data(
	Title varchar,
	Year integer,
	Metacritc_Rating integer,
	Netflix boolean,
	Amazon_Prime boolean,
	Hulu boolean,
	IMDB_Rating float
);

SELECT * FROM metacritic_data;

--Creatd the table to hold data from the near matches between Metacritic and IMDB
--Imported csv into the table
CREATE TABLE near_matches(
	Title varchar,
	Year integer,
	Metacritic_Rating integer,
	Netflix boolean,
	Amazon_Prime boolean,
	Hulu boolean,
	IMDB_Rating float
);

SELECT * FROM near_matches;

--Created table and imported netflix data from csv
CREATE TABLE netflix_data(
	Index integer PRIMARY KEY,
	Title varchar,
	Year integer
);

SELECT * FROM netflix_data;

--Updated the Netflix column in the table with exact matches table to true 
--if the title and year were found in the Netflix data
UPDATE metacritic_data as m
SET netflix = TRUE
FROM netflix_data as n
WHERE m.title=n.title AND m.year=n.year;

--Updated the Netflix column in the table with near matches table to true 
--if the title and year were found in the Netflix data
UPDATE near_matches as m
SET netflix = TRUE
FROM netflix_data as n
WHERE m.title=n.title AND m.year=n.year;

--Created table and imported Amazon Prime data from csv
CREATE TABLE amazon_data(
	Index integer PRIMARY KEY,
	Title varchar,
	Year integer
);

SELECT * FROM amazon_data;

--Updated the Amazon_Prime column in the table with exact matches table to true 
--if the title and year were found in the Amazon Prime data
UPDATE metacritic_data as m
SET amazon_prime = TRUE
FROM amazon_data as a
WHERE m.title=a.title AND m.year=a.year;

--Updated the Amazon_Prime column in the table with near matches table to true 
--if the title and year were found in the Amazon Prime data
UPDATE near_matches as m
SET amazon_prime = TRUE
FROM amazon_data as a
WHERE m.title=a.title AND m.year=a.year;

SELECT * FROM metacritic_data;

--Created table and imported Hulu data from csv
CREATE TABLE hulu_data(
	Index integer PRIMARY KEY,
	Title varchar,
	Year integer
);

SELECT * FROM hulu_data;

--Updated the Hulu column in the table with exact matches table to true 
--if the title and year were found in the Hulu data
UPDATE metacritic_data as m
SET hulu = TRUE
FROM hulu_data as h
WHERE m.title=h.title AND m.year=h.year;

--Updated the Hulu column in the table with near matches table to true 
--if the title and year were found in the Hulu data
UPDATE near_matches as m
SET hulu = TRUE
FROM hulu_data as h
WHERE m.title=h.title AND m.year=h.year;

--Checked that table was complete and exported to final_table_exact.csv
SELECT * FROM metacritic_data;

--Checked that table was complete and exported to final_table_near_matches.csv
SELECT * FROM near_matches;