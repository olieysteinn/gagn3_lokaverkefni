-- What was the cast of Avengers: Endgame?
SELECT Movies.title AS movie,
    Staff.first_name || " " || Staff.last_name AS "actor"
FROM MovieCharacters
INNER JOIN Movies ON MovieCharacters.movie_id = Movies.id
inner JOIN Staff ON MovieCharacters.actor_id = Staff.id
WHERE Movies.title LIKE "Avengers: Endgame";

-- What was the total budget of all the movies in the MCU in $ and ISK?
SELECT printf('%,d', sum(budget)) || '$' AS "total budget of movies in $",
    printf('%,d', (sum(budget)*122)) || ' ISK' AS "total budget of movies in ISK" 
FROM Movies;

-- How long is the soundtrack of Guardians of the Galaxy?
SELECT Soundtracks.title, 
    time(sum(strftime('%s', Songs.length)), 'unixepoch') AS "soundtrack length"
FROM MovieSoundtrackSongs
INNER JOIN Songs ON MovieSoundtrackSongs.song_id = Songs.id
INNER JOIN Soundtracks ON MovieSoundtrackSongs.soundtrack_id = Soundtracks.id
INNER JOIN Movies ON MovieSoundtrackSongs.movie_id = Movies.id
WHERE Movies.title = 'Guardians of the Galaxy';

-- How long are all the songs in MCU total?
SELECT (sum(strftime('%s', length)
    - strftime('%s', '00:00:00')) / 60 / 60) || ':0' ||
    (sum(strftime('%s', length)
    - strftime('%s', '00:00:00')) / 60 % 60) || ':' ||
    (sum(strftime('%s', length)
    - strftime('%s', '00:00:00')) % 60) AS 'total length of all songs in the MCU'
FROM Songs;

-- What is the age of the staff; from youngest to oldest?
SELECT first_name || " " || last_name AS "staff",
    (date('now') - date_of_birth) || " years old" AS age
FROM Staff
ORDER BY date_of_birth DESC;

-- What abilities does the character with the most abilities have?
SELECT Characters.first_name AS character, Abilities.name AS abilities
FROM CharacterAbilities
INNER JOIN Characters ON CharacterAbilities.character_id = Characters.id
INNER JOIN Abilities ON CharacterAbilities.ability_id = Abilities.id
WHERE character_id =
    (SELECT character_id 
    FROM CharacterAbilities
    GROUP BY character_id
    HAVING count(*) = (
        SELECT max(Cnt) 
            FROM(
                SELECT count(*) as Cnt
                    FROM CharacterAbilities
                    GROUP BY character_id
                )
            )
         );

-- doctor strange's abilities
SELECT Characters.alias, Abilities.name
FROM CharacterAbilities
INNER JOIN Characters ON CharacterAbilities.character_id = Characters.id
INNER JOIN Abilities ON CharacterAbilities.ability_id = Abilities.id
WHERE Characters.alias = 'Doctor Strange';

-- Which characters are Good?
SELECT DISTINCT Characters.alias, Characters.first_name AS character
FROM MovieCharacters
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
WHERE alignment LIKE 'Good'
ORDER BY Characters.first_name;

-- Which characters are Evil?
SELECT DISTINCT Characters.alias, Characters.first_name AS character
FROM MovieCharacters
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
WHERE alignment LIKE 'Evil'
ORDER BY Characters.first_name;

-- Which characters have been both Good and Evil?
SELECT DISTINCT Characters.alias, Characters.first_name AS character
FROM MovieCharacters
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
WHERE alignment LIKE 'Good'
INTERSECT
SELECT DISTINCT Characters.alias, Characters.first_name
FROM MovieCharacters
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
WHERE alignment LIKE 'Evil'
ORDER BY Characters.first_name;
    
SELECT DISTINCT alignment, count(alignment_id)
FROM MovieCharacters
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
GROUP BY Alignments.alignment;


-- which movie was the most expensive/cheap

-- how many movies came out in [year]

-- which characters are from usa/earth

-- which composer made the most soundtracks

-- which director directed the most movies

-- who is the founder of S.H.I.E.L.D.
SELECT datetime(22311);

-- How long has it been since every MCU movie has been released?
SELECT ((julianday('now') - julianday(releaseDate)) / 365 % 365) || ' years and '
    || ((julianday('now') - julianday(releaseDate)) % 365) || ' days'
FROM Movies;

-- What items are related to the infinity stones?
SELECT name AS item, description
FROM Items
WHERE description LIKE "%infinity stone%";