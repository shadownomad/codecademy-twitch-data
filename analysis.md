
# Analyze Twitch Gaming Data

## Getting Started:

### 1. Start by getting a feel for the stream table and the chat table.

* Select the first 20 rows from each of the two tables.

What are the column names?

### 2. What are the unique games in the stream table?

### 3. What are the unique channels in the stream table?

## Aggregate Functions:
### 4.What are the most popular games in the stream table?
* Create a list of games and their number of viewers using GROUP BY.

### 5.These are some big numbers from the game League of Legends (also known as LoL).
Where are these LoL stream viewers located?
* Create a list of countries and their number of LoL viewers using WHERE and GROUP BY.

### 6.
The player column contains the source the user is using to view the stream (site, iphone, android, etc).
* Create a list of players and their number of streamers.

### 7.Create a new column named genre for each of the games.
* Group the games into their genres: Multiplayer Online Battle Arena (MOBA), First Person Shooter (FPS), Survival, and Other.
* Using CASE, your logic should be:

> If League of Legends → MOBA
> If Dota 2 → MOBA
> If Heroes of the Storm → MOBA
> If Counter-Strike: Global Offensive → FPS
> If DayZ → Survival
> If ARK: Survival Evolved → Survival
> Else → Other
* Use GROUP BY and ORDER BY to showcase only the unique game titles.

## How does view count change in the course of a day?
### 8.Before we get started, let’s run this query and take a look at the time column from the stream table:

```SQL
SELECT time
FROM stream
LIMIT 10;
```

The data type of the time column is DATETIME. It is for storing a date/time value in the database.

Notice that the values are formatted like:

2015-01-01 18:33:52

So the format is:

YYYY-MM-DD HH:MM:SS

### 9. SQLite comes with a strftime() function - a very powerful function that allows you to return a formatted date.
It takes two arguments:
strftime(format, column)
* Let’s test this function out:

```SQL
SELECT time,
   strftime('%S', time)
FROM stream
GROUP BY 1
LIMIT 20;
```


* What do you think this does? 
>
### 10. Okay, now we understand how strftime() works. Let’s write a query that returns two columns:
* The hours of the time column
* The view count for each hour
* Lastly, filter the result with only the users in your country using a WHERE clause.

## Joining the two tables:
### 11. The stream table and the chat table share a column: device_id.
* Let’s join the two tables on that column.

### 12. Woohoo! You have completed the the guided practice, see what else you can dig up. For example:

*What are your favorite games? Can you find some insights about its viewers and chat room users?

*Is there anything you can do after joining the two tables?
