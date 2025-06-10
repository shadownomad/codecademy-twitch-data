-- Getting Started
--1.

SELECT * 
FROM stream 
LIMIT 20;

SELECT *
FROM chat
LIMIT 20;

--2.

SELECT DISTINCT game
FROM stream;

--3. 

SELECT DISTINCT channel
FROM stream;

-- Aggregate Functions

--4.
 SELECT game,
    COUNT(*) AS 'num_streams'
FROM stream
GROUP BY game
ORDER BY 2 DESC;

--5.
SELECT country,
  COUNT(*) AS 'num_streams'
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY 2 DESC;

-- 6. 
SELECT DISTINCT player,
COUNT(*) AS 'num_streams'
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

--7.
SELECT game, 
  CASE
    WHEN game = 'League of Legends' THEN 'MOBA'
    WHEN game = 'Dota 2' THEN 'MOBA'
    WHEN game = 'Heroes of the Storm' THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
    WHEN game = 'DayZ' THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved' THEN 'Survival'
    ELSE 'Other'
  END AS 'genre',
  COUNT(*) AS 'num_streams'
FROM stream 
GROUP BY 1
ORDER BY 3 DESC;

-- How does view count change in the course of a day?
--8
SELECT time 
FROM stream
LIMIT 10;

--9 
SELECT time,
  strftime('%S',time) --displays only the seconds
FROM stream
GROUP BY 1
LIMIT 20;

--10
SELECT strftime('%H', time) AS 'hours',
COUNT(*) AS 'view_count'
FROM stream
WHERE country = 'US'
GROUP BY 1;

--Joining the two tables
--11
SELECT * 
FROM stream s
LEFT JOIN chat c
  ON s.device_id = c.device_id
LIMIT 10;

--12

--12.1 What are your favorite games? Can you find some insights about its viewers and chat room users?
-- shows what where WoT content is most watched
SELECT country,
  COUNT(*)
FROM stream
WHERE game = 'World of Tanks'
GROUP BY 1
ORDER BY 2 DESC; 

--12.2 Is there anything you can do after joining the two tables?
-- compares the numer of chatters vs watchers for each game
SELECT s.game,
  COUNT(c.device_id) AS 'chat_count',
  COUNT(s.device_id) AS 'stream_count'
FROM stream s
 JOIN chat c 
ON s.device_id = c.device_id
GROUP BY 1
ORDER BY 3 Desc;
