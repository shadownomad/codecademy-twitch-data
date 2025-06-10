
# Analyze Twitch Gaming Data

## Getting Started:

### 1. Start by getting a feel for the stream table and the chat table.

* Select the first 20 rows from each of the two tables.

```SQL
SELECT * 
FROM stream 
LIMIT 20;

SELECT *
FROM chat
LIMIT 20;
```
| time           | device_id                                | login                                    | channel | country | player   | game                             | stream_format | subscriber |
|----------------|------------------------------------------|------------------------------------------|---------|---------|----------|----------------------------------|---------------|------------|
| 1/1/2015 18:33 | 40ffc2fa6534cf760becbdbf5311e31ad069e46e | 085c1eb7b587bfe654f0df7b4ba7f4fc4013636c | frank   | US      | iphone_t | League of Legends                | _null_        | _null_     |
| 1/1/2015 23:35 | 9a8cc2b7162b99c0a0f501dc9a5ec4f68586a760 | 5ad49a7b408ce452140b180dd6efb57a9f4d22c7 | george  | US      | site     | DayZ                             | chunked       | FALSE      |
| 1/1/2015 4:39  | 2f9c3f9ee1033b71a3819564243f20ef3bec0183 | 5b9a43e68f019185f55615d0b83019dee4b5d06f | frank   | US      | site     | League of Legends                | chunked       | FALSE      |
| 1/1/2015 11:15 | 0cda8226ba2583424c80c3c1c22c1256b080ad17 | 02c7797faa4d8a3ff4b0c14ee1764b6817b53d0b | estelle | CH      | site     | Dota 2                           | high          | FALSE      |
| 1/1/2015 11:28 | e3288ca5e3153aa85e32f64cdd994b7666968dcf | b920c228acbcbebee26d9c79f6eb73b73a9480c7 | morty   | FR      | site     | Heroes of the Storm              | medium        | FALSE      |
| 1/1/2015 23:27 | 343fe2bfd58595d5c18602d420ecf6f9d694d5a8 | 7814f661a54349ff5eee84f9d6f476918c9b7270 | george  | US      | iphone_t | DayZ                             | _null_        | _null_     |
| 1/1/2015 21:09 | 80a0c7d1abb6a5a0060e18202b77bef831e08ca5 | eb158cab3f606d3894a32e20bddbfd2d589095a9 | frank   | US      | site     | League of Legends                | high          | TRUE       |
| 1/1/2015 19:14 | 1e342e5e4e228f617449029054b3bb19c5224528 | 2aaf6a414bc3dc923b04f986de7ba1b8101c6698 | frank   | CA      | site     | League of Legends                | high          | FALSE      |
| 1/1/2015 13:51 | 272cffbb1a9a33ad3bb48a2ee9ae5cbcac5ca22e | 401716920e3435b5e3eec9fc4ccd6a44c7af38f5 | kramer  | TR      | site     | Counter-Strike: Global Offensive | chunked       | FALSE      |
| 1/1/2015 22:00 | 593ed161c456eeeb9e18b8005786d42abc1a7373 | ef24dc49ceb4bcd3cccb0fa862d8a150ecf935e1 | frank   | US      | site     | League of Legends                | medium        | FALSE      |
| 1/1/2015 19:10 | 16679ceba8bf5fb10f253e51f9a286c11b011e02 | 3b8deb77fb36b6147c27cbdb82a925aaf26b629b | jerry   | RU      | embed    | Dota 2                           | chunked       | FALSE      |
| 1/1/2015 22:59 | 1a247324beabdb85b2b8a97472f28f6cf9026fe1 | c485d2914068876ebd6cf3ee6812dc939abae8d7 | frank   | US      | android  | League of Legends                | _null_        | _null_     |
| 1/1/2015 22:10 | 20bde4b4418df3ce2701869233e12b1b4a30da88 | 7abc32d6617b4a13b78dd2710f22fe8a2305f0fd | george  | US      | ipad_t   | DayZ                             | _null_        | _null_     |
| 1/1/2015 13:46 | 21d94696c9b0f4f9eafc785a2d9d1be1982244b1 | c2de0a4d1258e2fc093017d5a793a625af9a0d44 | estelle | US      | embed    | Dota 2                           | high          | FALSE      |
| 1/1/2015 10:07 | 5e3a498f6c671a42edfa3772c87c1c3dc918a511 | ffec857d76dcf8cfee7f3a96028365f33964c823 | morty   | _null_  | ipad_t   | Heroes of the Storm              | _null_        | _null_     |
| 1/1/2015 21:04 | 2e7bcee08428c8ba8c5ce7d44a930dfee7f34db2 | 4fac13dc5b1cc9d3b18ad0ff62da2adb635375fd | frank   | US      | site     | League of Legends                | high          | FALSE      |
| 1/1/2015 12:41 | 88b8d83a7ac64d30f2b3f54cc9d9c2a15bb2f666 | 9f2d3dcb56169dcdc0933d21004ce0f2e40b0df0 | estelle | TR      | site     | Dota 2                           | high          | FALSE      |
| 1/1/2015 21:30 | 53fc815c5fb6e8641dc8a60cf2cc480198a2ba17 | 122ab65809db2c8057c998d0664b2f54f5f6aa10 | frank   | US      | android  | League of Legends                | _null_        | _null_     |
| 1/1/2015 22:03 | f74aae10baab29ab434519adb4ad4f64f6d90727 | 3b954baa601d4cb22610dc4727543c697acbd4d6 | frank   | US      | iphone_t | League of Legends                | _null_        | _null_     |
| 1/1/2015 14:47 | 47d380927c426e589be566d4ae967cbb6f9d2d13 | 40b89a7097d30ecf1fe4591442f541ed500c5b8b | helen   | CA      | iphone_t | Hearthstone: Heroes of Warcraft  | _null_        | _null_     |

| time           | device_id                                | login                                    | channel | country | player   | game                             |  |
|----------------|------------------------------------------|------------------------------------------|---------|---------|----------|----------------------------------|--|
| 1/1/2015 18:45 | 70e2b95b5ac0d4c227e46966658d16b3e044996e | 5c2f5c1f19a7738e16ed0be551d865e8a8fce71d | jerry   | BY      | _null_   | Dota 2                           |  |
| 1/1/2015 1:16  | f2b9065b55fd80d6aa653ce989b489f4ec5198be | 0d77740e4fb5ce77d94f9f6c8ef1f762990d0344 | elaine  | HK      | _null_   | Devil May Cry 4: Special Edition |  |
| 1/1/2015 16:22 | d448ba963d7e1023dd1b0a40b95d4f6611750692 | 77ab14c1fb815e1c369ba0cf7d4c56b4fe489997 | frank   | GB      | iphone_t | League of Legends                |  |
| 1/1/2015 3:58  | 8d6823dc52b400b50aebf269bf1f03a36d19eeaa | 91cb88c0743761589273fc5e800e7743ece46494 | frank   | US      | iphone_t | League of Legends                |  |
| 1/1/2015 11:47 | 16c1e39594d62358d27ae604ad43a071f0d86bc4 | 51a9234f83d656607cfd7f26690c12d2ffbce353 | estelle | DE      | _null_   | Dota 2                           |  |
| 1/1/2015 17:59 | 6fcc75522de37833a0fb21fba4965aad3b63ea57 | f628d1cb946ea2e8cffc0b327bc9d77775b8d3c0 | jerry   | RU      | _null_   | Dota 2                           |  |
| 1/1/2015 2:24  | dea94b3030025d837dd841fbfd479e775987f65d | 9dbbcf6c7792074771c4c7284807041eac467ad5 | elaine  | TW      | _null_   | Gaming Talk Shows                |  |
| 1/1/2015 18:26 | 671bee0f3d66077876d9bc231990597292392cc2 | 51c286a41daa8e060275f622f2b8436bee9fab91 | jerry   | UA      | _null_   | Dota 2                           |  |
| 1/1/2015 13:13 | 8b31d5ebd1f4f41d4365ae4a471c1686dd256745 | 06decad1d9565150791e183da017f47123433a4c | estelle | GB      | ipad_t   | Dota 2                           |  |
| 1/1/2015 20:20 | f2ebb129e6930e608f2ed3f5fb52bc4d533c4891 | 4679f8113aa157ba76fc6db5878d7ee625e88d55 | frank   | CA      | _null_   | League of Legends                |  |
| 1/1/2015 22:47 | faf5c126f52f52f4b23c057c31f35fb0cdfbcdf3 | cf2c292a9cc31cc398428ec82a872e620d3237df | george  | _null_  | _null_   | DayZ                             |  |
| 1/1/2015 17:26 | 536bacfa1cd0b39f77eb167689f64d144464ca12 | c7f232fb8ab54e78cff1e953d38d09f40b01ce81 | frank   | _null_  | _null_   | League of Legends                |  |
| 1/1/2015 17:38 | c9ba7595a583e5964fb74a9fb95f07790362cc35 | 9b4d863c2b0ab0c4d1e8d33665dab469f15e87b0 | newman  | US      | _null_   | The Binding of Isaac: Rebirth    |  |
| 1/1/2015 11:53 | dcffedc3f5a46a895d70d70d5c9c9abfdcb7c33d | 8464a5359d8df9d6636355b391b8748d856bc61b | elaine  | TW      | _null_   | Gaming Talk Shows                |  |
| 1/1/2015 11:23 | c480007a2b82f6fb0cb94c2b9b445ef99d8d68e7 | e17102753876688a04b17142128a16259eaf8374 | estelle | US      | _null_   | Dota 2                           |  |
| 1/1/2015 6:01  | 698db5a0e9c4025fe2a1cd094d0cdda647831339 | 770a8dc070d9db7ab582bc8a27e436fa8aadeb0a | susan   | UA      | _null_   | World of Tanks                   |  |
| 1/1/2015 21:51 | dcd963bb1f416e843781bd5e350c23ffc757201d | eb05316cffb53b70eb5cb8c185557d23a31d2b93 | newman  | US      | _null_   | The Binding of Isaac: Rebirth    |  |
| 1/1/2015 13:52 | 7361fc61d20d509e14d1bceb095e950a4a53be8d | 62c856bc9a1965df787fefa56ff46c8f2316e3a0 | kramer  | DE      | _null_   | Counter-Strike: Global Offensive |  |
| 1/1/2015 1:20  | a8f2b43217deffd17fc5589f0933f90224a9f59e | 75e990cf18fc10e69d6d765c555cf07543689f4c | frank   | US      | ipad_t   | League of Legends                |  |

What are the column names?

> The colums names for chat are
> time,	
> device_id,	
> login,	
> channel,	
> country,	
> player, and	
> game

> The column names for stream are
> time,
> device_id,
> login,
> channel,
> country,
> player,
> game,
> stream_format, and
> subscriber


### 2. What are the unique games in the stream table?

```SQL
SELECT DISTINCT game
FROM stream;
```

| game                             |
|----------------------------------|
| League of Legends                |
| DayZ                             |
| Dota 2                           |
| Heroes of the Storm              |
| Counter-Strike: Global Offensive |
| Hearthstone: Heroes of Warcraft  |
| The Binding of Isaac: Rebirth    |
| Agar.io                          |
| Gaming Talk Shows                |
| Rocket League                    |
| World of Tanks                   |
| ARK: Survival Evolved            |
| SpeedRunners                     |
| Breaking Point                   |
| Duck Game                        |
| Devil May Cry 4: Special Edition |
| Block N Load                     |
| Fallout 3                        |
| Batman: Arkham Knight            |

### 3. What are the unique channels in the stream table?

```SQL
SELECT DISTINCT channel
FROM stream;
```

| channel |
|---------|
| frank   |
| george  |
| estelle |
| morty   |
| kramer  |
| jerry   |
| helen   |
| newman  |
| elaine  |
| susan   |

## Aggregate Functions:
### 4.What are the most popular games in the stream table?
* Create a list of games and their number of viewers using GROUP BY.

```SQL
SELECT game,
    COUNT(*) AS 'num_streams'
FROM stream
GROUP BY game
ORDER BY 2 DESC;
```
| game                             | num_streams |
|----------------------------------|-------------|
| League of Legends                | 1070        |
| Dota 2                           | 472         |
| Counter-Strike: Global Offensive | 302         |
| DayZ                             | 239         |
| Heroes of the Storm              | 210         |
| The Binding of Isaac: Rebirth    | 171         |
| Gaming Talk Shows                | 170         |
| Hearthstone: Heroes of Warcraft  | 90          |
| World of Tanks                   | 86          |
| Agar.io                          | 71          |
| Rocket League                    | 49          |
| SpeedRunners                     | 20          |
| ARK: Survival Evolved            | 19          |
| _null_                           | 15          |
| Duck Game                        | 5           |
| Fallout 3                        | 3           |
| Batman: Arkham Knight            | 3           |
| Breaking Point                   | 2           |
| Block N Load                     | 2           |
| Devil May Cry 4: Special Edition | 1           |
### 5.These are some big numbers from the game League of Legends (also known as LoL).
Where are these LoL stream viewers located?
* Create a list of countries and their number of LoL viewers using WHERE and GROUP BY.

```SQL
SELECT country,
  COUNT(*) AS 'num_streams'
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY 2 DESC;
```

| coun+A1:B63try | num_streams |
|----------------|-------------|
| US             | 447         |
| DE             | 66          |
| CA             | 64          |
| _null_           | 49          |
| GB             | 45          |
| TR             | 28          |
| BR             | 25          |
| DK             | 20          |
| PL             | 19          |
| NL             | 17          |
| BE             | 17          |
| SE             | 16          |
| RO             | 16          |
| MX             | 16          |
| PT             | 15          |
| FR             | 15          |
| AU             | 15          |
| NO             | 13          |
| IT             | 13          |
| GR             | 10          |
| ES             | 10          |
| TW             | 9           |
| RS             | 7           |
| LT             | 7           |
| RU             | 6           |
| NZ             | 6           |
| HR             | 6           |
| HK             | 6           |
| CZ             | 6           |
| SG             | 5           |
| FI             | 5           |
| BG             | 5           |
| AR             | 5           |
| PR             | 4           |
| IE             | 4           |
| HU             | 4           |
| AT             | 4           |
| SK             | 3           |
| JP             | 3           |
| AE             | 3           |
| VE             | 2           |
| MA             | 2           |
| EE             | 2           |
| CN             | 2           |
| BA             | 2           |
| UA             | 1           |
| TN             | 1           |
| SI             | 1           |
| PS             | 1           |
| PH             | 1           |
| PE             | 1           |
| OM             | 1           |
| NG             | 1           |
| MY             | 1           |
| MT             | 1           |
| MO             | 1           |
| MK             | 1           |
| KW             | 1           |
| KR             | 1           |
| JM             | 1           |
| ID             | 1           |
| GY             | 1           |
| GP             | 1           |
| GE             | 1           |
| EG             | 1           |
| DO             | 1           |
| CY             | 1           |
| CR             | 1           |
| CL             | 1           |
| BB             | 1           |
| AL             | 1           |

### 6. The player column contains the source the user is using to view the stream (site, iphone, android, etc).
* Create a list of players and their number of streamers.

 ```SQL
SELECT DISTINCT player,
COUNT(*) AS 'num_streams'
FROM stream
GROUP BY 1
ORDER BY 2 DESC;
 ```
| player     | num_streams |
|------------|-------------|
| site       | 1365        |
| iphone_t   | 622         |
| android    | 547         |
| ipad_t     | 290         |
| embed      | 125         |
| xbox_one   | 22          |
| home       | 16          |
| amazon     | 6           |
| frontpage  | 4           |
| xbox360    | 1           |
| roku       | 1           |
| chromecast | 1           |


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

```SQL
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
```
| League of Legends                | MOBA     | 1070 |
|----------------------------------|----------|------|
| Dota 2                           | MOBA     | 472  |
| Counter-Strike: Global Offensive | FPS      | 302  |
| DayZ                             | Survival | 239  |
| Heroes of the Storm              | MOBA     | 210  |
| The Binding of Isaac: Rebirth    | Other    | 171  |
| Gaming Talk Shows                | Other    | 170  |
| Hearthstone: Heroes of Warcraft  | Other    | 90   |
| World of Tanks                   | Other    | 86   |
| Agar.io                          | Other    | 71   |
| Rocket League                    | Other    | 49   |
| SpeedRunners                     | Other    | 20   |
| ARK: Survival Evolved            | Survival | 19   |
| _null_                            | Other    | 15   |
| Duck Game                        | Other    | 5    |
| Fallout 3                        | Other    | 3    |
| Batman: Arkham Knight            | Other    | 3    |
| Breaking Point                   | Other    | 2    |
| Block N Load                     | Other    | 2    |
| Devil May Cry 4: Special Edition | Other    | 1    |


## How does view count change in the course of a day?
### 8.Before we get started, let’s run this query and take a look at the time column from the stream table:

```SQL
SELECT time
FROM stream
LIMIT 10;
```
| time                |
|---------------------|
| 2015-01-01 18:33:52 |
| 2015-01-01 23:35:33 |
| 2015-01-01 04:39:38 |
| 2015-01-01 11:15:30 |
| 2015-01-01 11:28:19 |
| 2015-01-01 23:27:36 |
| 2015-01-01 21:09:23 |
| 2015-01-01 19:14:27 |
| 2015-01-01 13:51:04 |
| 2015-01-01 22:00:14 |

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
| time                | strftime('%S',time) |
|---------------------|---------------------|
| 2015-01-01 00:00:46 | 46                  |
| 2015-01-01 00:01:11 | 11                  |
| 2015-01-01 00:01:39 | 39                  |
| 2015-01-01 00:03:17 | 17                  |
| 2015-01-01 00:03:20 | 20                  |
| 2015-01-01 00:06:21 | 21                  |
| 2015-01-01 00:07:48 | 48                  |
| 2015-01-01 00:09:47 | 47                  |
| 2015-01-01 00:09:57 | 57                  |
| 2015-01-01 00:10:13 | 13                  |
| 2015-01-01 00:10:47 | 47                  |
| 2015-01-01 00:11:10 | 10                  |
| 2015-01-01 00:11:24 | 24                  |
| 2015-01-01 00:12:16 | 16                  |
| 2015-01-01 00:12:27 | 27                  |
| 2015-01-01 00:13:08 | 08                  |
| 2015-01-01 00:13:52 | 52                  |
| 2015-01-01 00:14:50 | 50                  |
| 2015-01-01 00:14:55 | 55                  |
| 2015-01-01 00:16:50 | 50                  |

* What do you think this does? 
> strftime '%S' will only display the seconds


### 10. Okay, now we understand how strftime() works. Let’s write a query that returns two columns:
* The hours of the time column
* The view count for each hour
* Lastly, filter the result with only the users in your country using a WHERE clause.

```SQL
SELECT strftime('%H', time) AS 'hours',
COUNT(*) AS 'view_count'
FROM stream
WHERE country = 'US'
GROUP BY 1;
```

| hours | view_count |
|-------|------------|
| 00    | 30         |
| 01    | 17         |
| 02    | 34         |
| 03    | 29         |
| 04    | 19         |
| 05    | 14         |
| 06    | 3          |
| 07    | 2          |
| 08    | 4          |
| 09    | 9          |
| 10    | 5          |
| 11    | 48         |
| 12    | 62         |
| 13    | 58         |
| 14    | 40         |
| 15    | 51         |
| 16    | 69         |
| 17    | 55         |
| 18    | 76         |
| 19    | 81         |
| 20    | 102        |
| 21    | 120        |
| 22    | 71         |
| 23    | 63         |

## Joining the two tables:
### 11. The stream table and the chat table share a column: device_id.
* Let’s join the two tables on that column.

```SQL
SELECT * 
FROM stream s
JOIN chat c
  ON s.device_id = c.device_id
LIMIT 10;
```

| time           | device_id                                | login                                    | channel | country | player   | game                            | stream_format | subscriber | time           | device_id                                | login                                    | channel | country | player   | game                            |
|----------------|------------------------------------------|------------------------------------------|---------|---------|----------|---------------------------------|---------------|------------|----------------|------------------------------------------|------------------------------------------|---------|---------|----------|---------------------------------|
| 1/1/2015 15:48 | 97144e4bab2163d35dd88e6ec804436e8cdddd3d | 4bbf4aa9f0abb1902d16555202f7ce61fc607305 | frank   | _null_  | iphone_t | League of Legends               |               | _null_     | 1/1/2015 22:37 | 97144e4bab2163d35dd88e6ec804436e8cdddd3d | 4bbf4aa9f0abb1902d16555202f7ce61fc607305 | frank   |         | iphone_t | League of Legends               |
| 1/1/2015 13:42 | 0c0f18b28971fa084091fbc052a2c8bd8b52d45c | 139700a8682c81be4e5c0e6eebc6f95f371dae88 | helen   | US      | site     | Hearthstone: Heroes of Warcraft | medium        | TRUE       | 1/1/2015 12:43 | 0c0f18b28971fa084091fbc052a2c8bd8b52d45c | 139700a8682c81be4e5c0e6eebc6f95f371dae88 | helen   | US      |          | Hearthstone: Heroes of Warcraft |
| 1/1/2015 14:47 | 0b55e56d60d8ebfb5dc343f601b880ad1cfb9b4e | bc9f7aebecaee6d1ba50a467f2e92e65e600e71a | morty   | TW      | android  | Heroes of the Storm             |               | _null_     | 1/1/2015 13:26 | 0b55e56d60d8ebfb5dc343f601b880ad1cfb9b4e | bc9f7aebecaee6d1ba50a467f2e92e65e600e71a | morty   | TW      | android  | Heroes of the Storm             |
| 1/1/2015 2:08  | bc2410453dd66d5be0167ad9b56223c2e6da66ac | 9dd24b6098a57c84e5063500898f21c28cb7eed9 | susan   | RU      | ipad_t   | World of Tanks                  |               | _null_     | 1/1/2015 0:17  | bc2410453dd66d5be0167ad9b56223c2e6da66ac | 9dd24b6098a57c84e5063500898f21c28cb7eed9 | susan   | RU      | ipad_t   | World of Tanks                  |
| 1/1/2015 3:16  | 04776eb4135dd9393e3d357b0a80b0c36b206543 | bb577ad24dd3aa517e3bfac508bb090e756857e0 | frank   | _null_  | iphone_t | League of Legends               |               | _null_     | 1/1/2015 4:04  | 04776eb4135dd9393e3d357b0a80b0c36b206543 | bb577ad24dd3aa517e3bfac508bb090e756857e0 | frank   | _null_  | iphone_t | League of Legends               |
| 1/1/2015 11:51 | 8db592832a353ad618ed642aeb5bf1d52191c115 | bcbfb276445ee25d7274679fda545291fc22c56e | susan   | RU      | android  | World of Tanks                  |               | _null_     | 1/1/2015 7:12  | 8db592832a353ad618ed642aeb5bf1d52191c115 | bcbfb276445ee25d7274679fda545291fc22c56e | susan   | RU      | android  | World of Tanks                  |
| 1/1/2015 11:51 | 8db592832a353ad618ed642aeb5bf1d52191c115 | bcbfb276445ee25d7274679fda545291fc22c56e | susan   | RU      | android  | World of Tanks                  |               | _null_     | 1/1/2015 7:44  | 8db592832a353ad618ed642aeb5bf1d52191c115 | bcbfb276445ee25d7274679fda545291fc22c56e | susan   | RU      | android  | World of Tanks                  |
| 1/1/2015 11:51 | 8db592832a353ad618ed642aeb5bf1d52191c115 | bcbfb276445ee25d7274679fda545291fc22c56e | susan   | RU      | android  | World of Tanks                  |               | _null_     | 1/1/2015 9:01  | 8db592832a353ad618ed642aeb5bf1d52191c115 | bcbfb276445ee25d7274679fda545291fc22c56e | susan   | RU      | android  | World of Tanks                  |
| 1/1/2015 11:40 | 197b897028cdd9707b14bfe8091fd48725b7fea3 | d80669ed70d6dd22a0e41e5051434fc811cad03a | estelle | ID      | iphone_t | Dota 2                          |               | _null_     | 1/1/2015 13:00 | 197b897028cdd9707b14bfe8091fd48725b7fea3 | d80669ed70d6dd22a0e41e5051434fc811cad03a | estelle | ID      | iphone_t | Dota 2                          |
| 1/1/2015 2:15  | 3e6db5a384fdda05d62831df8208c96d5194fa26 | 6016d402340ccd86367deefb8de3f4516482827d | frank   | US      | iphone_t | League of Legends               |               | _null_     | 1/1/2015 3:58  | 3e6db5a384fdda05d62831df8208c96d5194fa26 | 6016d402340ccd86367deefb8de3f4516482827d | frank   | US      | iphone_t | League of Legends               |

### 12. Woohoo! You have completed the the guided practice, see what else you can dig up. For example:

* What are your favorite games? Can you find some insights about its viewers and chat room users?
> I wrote this to see where World of Tanks is most streamed

```SQL
SELECT country,
  COUNT(*)
FROM stream
WHERE game = 'World of Tanks'
GROUP BY 1
ORDER BY 2 DESC; 
```

| country | stream_count |
|---------|--------------|
| RU      | 54           |
| UA      | 15           |
| FR      | 3            |
| BY      | 3            |
| NL      | 2            |
| DE      | 2            |
| US      | 1            |
| TW      | 1            |
| MD      | 1            |
| LT      | 1            |
| KZ      | 1            |
| GR      | 1            |
| _null_  | 1            |

* Is there anything you can do after joining the two tables?
> I wrote this to compare how active chat is compared to the stream count for each game

```SQL
SELECT s.game,
  COUNT(c.device_id) AS 'chat_count',
  COUNT(s.device_id) AS 'stream_count'
FROM stream s
LEFT JOIN chat c 
ON s.device_id = c.device_id
GROUP BY 1
ORDER BY 3 Desc;
```

| game                             | chat_count | stream_count |
|----------------------------------|------------|--------------|
| League of Legends                | 32         | 1079         |
| Dota 2                           | 15         | 479          |
| Counter-Strike: Global Offensive | 9          | 305          |
| DayZ                             | 4          | 241          |
| Heroes of the Storm              | 4          | 210          |
| The Binding of Isaac: Rebirth    | 2          | 172          |
| Gaming Talk Shows                | 4          | 171          |
| Hearthstone: Heroes of Warcraft  | 3          | 90           |
| World of Tanks                   | 8          | 89           |
| Agar.io                          | 0          | 71           |
| Rocket League                    | 0          | 49           |
| ARK: Survival Evolved            | 3          | 21           |
| SpeedRunners                     | 0          | 20           |
| _null_                           | 0          | 15           |
| Duck Game                        | 0          | 5            |
| Fallout 3                        | 0          | 3            |
| Batman: Arkham Knight            | 0          | 3            |
| Breaking Point                   | 0          | 2            |
| Block N Load                     | 0          | 2            |
| Devil May Cry 4: Special Edition | 0          | 1            |


