# Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
# I like this one because it shows how to filter out for an even numbered ID

SELECT DISTINCT city
FROM station
WHERE mod(id,2)=0;

# Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT (COUNT(city) - (COUNT(DISTINCT(city))))
FROM station;

# Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
# If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

SELECT DISTINCT city, LENGTH(city)
FROM station
ORDER BY LENGTH(city) ASC
LIMIT 1;

SELECT DISTINCT city, LENGTH(city)
FROM station
ORDER BY LENGTH(city) DESC
LIMIT 1;
