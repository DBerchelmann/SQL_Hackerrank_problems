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

# Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE city LIKE 'a%'
or city LIKE 'e%'
or city LIKE 'i%'
or city LIKE 'o%'
or city LIKE 'u%';

# Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

# Below is the loooong way to do this, don't do that'
SELECT DISTINCT city
FROM station
WHERE city LIKE 'a%e'
or city LIKE 'a%i'
or city LIKE 'a%o'
or city LIKE 'a%u'
or city LIKE 'e%a'
or city LIKE 'e%i'
or city LIKE 'e%o'
or city LIKE 'e%u'
or city LIKE 'i%a'
or city LIKE 'i%e'
or city LIKE 'i%i'
or city LIKE 'i%o'
or city LIKE 'i%u'
or city LIKE 'o%a'
or city LIKE 'o%e'
or city LIKE 'o%i'
or city LIKE 'o%o'
or city LIKE 'o%u'
or city LIKE 'u%o'
or city LIKE 'u%u'
or city LIKE 'u%a'
or city LIKE 'u%e'
or city LIKE 'u%i'
or city LIKE 'a%a'
or city LIKE 'e%e';

# Here is a faster way to avoid a long list like above

select distinct city from station 
where left(city,1) in ('a','e','i','o','u') 
and right(city, 1) in ('a','e','i','o','u')

# Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE right(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');

# Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE right(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u') OR
left(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');

# Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');

# I chose to add an additional practice problem with the vowels because I like this syntax for arranging data

# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
# Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u') AND 
      RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u') ;


# Below is another solution but Im not familiar with all of the syntax yet. Saving to research later

SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[^AEIUO].*[^AEIOU]$'

# Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
# If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT Name 
FROM STUDENTS 
WHERE Marks > 75 
ORDER BY RIGHT(Name, 3), ID;

# We define an employees total earnings to be their monthly salary x months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
# Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings.
# Then print these values as  space-separated integers.

SELECT salary * months AS total_earnings, COUNT(*)
FROM Employee
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1;

# Query the following two values from the STATION table:

# The sum of all values in LAT_N rounded to a scale of 2 decimal places.
# The sum of all values in LONG_W rounded to a scale of 2 decimal places.

SELECT ROUND(SUM(LAT_N), 2) AS lat, ROUND(SUM(LONG_W), 2) AS lon
FROM station;

# Query the average population for all cities in CITY, rounded down to the nearest integer.
# Included this because it shows how to round down using FLOOR

SELECT FLOOR(AVG(POPULATION))
FROM CITY;

# Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
# Note: CITY.CountryCode and COUNTRY.Code are matching key columns

SELECT SUM(city.population)
FROM city JOIN country ON (city.countrycode=country.code)
WHERE continent = 'Asia';