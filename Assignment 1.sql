/* Kudakwashe Changa
   IS362 Assignment 1
*/
   
-- 1. My code below displays number of airplanes with listed speeds, and their minimum listed speed and their maximum listed speed

SELECT COUNT(speed) AS 'Airlines with Listed Speed', MIN(speed), MAX(speed)
FROM planes;

-- 2. My code below displays the total distance flown by all of the planes in January 2013, as well as the total distance flown by planes in January 2013 that had no tailnum

SELECT sum(distance) AS 'Total Distance' 
FROM flights 
WHERE (year = '2013') 
AND (month = '1'); 

SELECT sum(distance) AS 'Total Distance (No Tailnum)'
FROM flights
WHERE (year = '2013')
AND (month = '1')
AND tailnum IS NULL;

-- 3. My code below displays the total distance flown by all planes on July 5, 2013 grouped by aircraft manufacturer. Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?

SELECT p.manufacturer, SUM(f.distance) AS 'Total Distance'
FROM flights f
INNER JOIN planes p
ON p.tailnum = f.tailnum
WHERE f.year = '2013' AND f.month ='7' AND f.day ='5' 
GROUP BY p.manufacturer;

SELECT p.manufacturer, SUM(f.distance) 'Total Distance'
FROM flights f
LEFT JOIN planes p
ON p.tailnum = f.tailnum
WHERE f.year = '2013' AND f.month = '7' AND f.day ='5'
GROUP BY p.manufacturer;

-- using left join includes null results

-- 4. List the names and number of airlines that flew on New Years Eve 2013 and their destinations

SELECT COUNT(f.tailnum) AS 'Number Of Flights', p.model, a.name, dest
FROM flights f
LEFT JOIN planes p
ON f.tailnum = p.tailnum
LEFT JOIN airlines a
ON f.carrier = a.carrier
WHERE f.year = 2013
AND f.month = 12
AND f.day = 31
GROUP BY f.dest, a.name, p.model
