-- Which character has the most abilities and what abilities does he have?
SELECT CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS character, Abilities.name AS abilities
FROM CharacterAbilities
INNER JOIN Characters ON CharacterAbilities.character_id = Characters.id
INNER JOIN Abilities ON CharacterAbilities.ability_id = Abilities.id
WHERE character_id = (
    SELECT character_id 
    FROM CharacterAbilities
    GROUP BY character_id
    HAVING count(*) = (
        SELECT max(count) 
        FROM (
            SELECT count(*) as count
            FROM CharacterAbilities
            GROUP BY character_id
        )
    )
);

-- Which characters are good?
SELECT DISTINCT 
CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS goodies
FROM MovieCharacters
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
WHERE alignment LIKE 'Good'
ORDER BY goodies;

-- Which characters are evil?
SELECT DISTINCT
CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS baddies
FROM MovieCharacters
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
WHERE alignment LIKE 'Evil'
ORDER BY baddies;

-- Which characters have been both good and evil?
SELECT DISTINCT
CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS converters
FROM MovieCharacters
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
WHERE alignment LIKE 'Good'
INTERSECT
SELECT DISTINCT
CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
END AS converters
FROM MovieCharacters
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
WHERE alignment LIKE 'Evil';

-- How many characters are good and how many are evil?
SELECT alignment, count(DISTINCT Characters.id) AS 'amount of characters'
FROM MovieCharacters
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id
GROUP BY alignment
ORDER BY alignment DESC;

-- Which characters used infinity stone related items?
SELECT CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS character, Items.name AS item
FROM CharacterItems
INNER JOIN Characters ON CharacterItems.character_id = Characters.id
INNER JOIN Items ON CharacterItems.item_id = Items.id
WHERE Items.description LIKE '%infinity%'
ORDER BY character;

-- Which items are created by Starks?
SELECT name AS item, creator
FROM Items
WHERE creator LIKE '%Stark%'
ORDER BY creator DESC;

-- Which characters are human and where are they from?
SELECT CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS character, species, place_of_origin
FROM Characters
INNER JOIN Species ON Characters.species_id = Species.id
WHERE species LIKE 'Human'
ORDER BY place_of_origin;

-- Which characters are not human and where are they from?
SELECT CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS character, species,
    CASE
        WHEN place_of_origin IS NULL THEN 'Unknown'
        ELSE place_of_origin
    END AS homeplanet
FROM Characters
INNER JOIN Species ON Characters.species_id = Species.id
WHERE species NOT LIKE 'Human%'
ORDER BY species;

-- How many male- and female characters are there in the MCU?
SELECT gender, count(DISTINCT Characters.id) AS 'amount of characters'
FROM Characters
INNER JOIN Genders ON Characters.gender_id = Genders.id
GROUP BY gender
ORDER BY gender DESC;

-- Which characters have been in multiple groups (and which groups are they)?
SELECT CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS character, name AS 'group', alignment
FROM GroupCharacters
INNER JOIN Groups ON GroupCharacters.group_id = Groups.id
INNER JOIN Characters ON GroupCharacters.character_id = Characters.id
INNER JOIN Alignments ON Groups.alignment_id = Alignments.id
EXCEPT
SELECT CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS character, name AS 'group', alignment
FROM GroupCharacters
INNER JOIN Groups ON GroupCharacters.group_id = Groups.id
INNER JOIN Characters ON GroupCharacters.character_id = Characters.id
INNER JOIN Alignments ON Groups.alignment_id = Alignments.id
GROUP BY character
HAVING count(character) = 1;

-- Which director(s) directed the most movies?
SELECT Staff.first_name || ' ' || Staff.last_name AS director,
    count() || ' films' AS 'directed films'
FROM MovieDirectors
INNER JOIN Staff ON MovieDirectors.director_id = Staff.id
INNER JOIN Movies ON MovieDirectors.movie_id = Movies.id
GROUP BY director_id
HAVING count(*) = (
    SELECT max(count) 
    FROM (
        SELECT count(*) as count
        FROM MovieDirectors
        GROUP BY director_id
    )
);

-- Which composer(s) composed the most soundtracks and which soundtracks where they?
SELECT Staff.first_name || ' ' || Staff.last_name AS composer,
    Soundtracks.title AS soundtrack
FROM Soundtracks
INNER JOIN Staff ON Soundtracks.composer_id = Staff.id
WHERE composer_id = (
    SELECT composer_id 
    FROM Soundtracks
    GROUP BY composer_id
    HAVING count(*) = (
        SELECT max(count) 
        FROM (
            SELECT count(*) as count
            FROM Soundtracks
            GROUP BY composer_id
        )
    )
);

-- How many screenwriters were on average working on each movie?
SELECT (SELECT count(screenwriter_id) FROM MovieScreenwriters)
    || ' screenwritings / ' || (SELECT count(id) FROM Movies) || ' movies = ' ||
    round((SELECT CAST (count(screenwriter_id) AS float) FROM MovieScreenwriters)
    / (SELECT count(id) FROM Movies),1) || ' screenwriters'
    AS 'screenwriters per movie'
FROM MovieScreenwriters
LIMIT 1;

-- What was the budget of each movie, from most expensive to cheapest?
SELECT title, printf('%,d', budget) || '$' AS budget
FROM Movies
ORDER BY budget DESC, releaseDate DESC;

-- What was the total budget of all the movies in the MCU in $ and ISK?
SELECT printf('%,d', sum(budget)) || '$' AS 'total budget of movies in $',
    printf('%,d', (sum(budget)*122)) || ' ISK' AS 'total budget of movies in ISK',
    printf('%,d', ((sum(budget)*122))/399)
    || ' bottles' AS 'total budget of movies in 2L Coca Cola® bottles from Hagkaup'
FROM Movies;

-- How long is the soundtrack of Guardians of the Galaxy?
SELECT Soundtracks.title, 
    time(sum(strftime('%s', Songs.length)), 'unixepoch') AS 'soundtrack length'
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
SELECT CASE 
    WHEN middle_name IS NULL THEN first_name || ' ' || last_name
    ELSE first_name || ' ' || middle_name || ' ' || last_name
    END AS staff,
    (date('now') - date_of_birth) || ' years old' AS age,
    title AS job
FROM StaffJobs
INNER JOIN Staff ON StaffJobs.staff_id = Staff.id
INNER JOIN Jobs ON StaffJobs.job_id = Jobs.id
ORDER BY date_of_birth DESC;

-- What was the cast of Avengers: Endgame?
SELECT Movies.title AS movie,
    Staff.first_name || ' ' || Staff.last_name AS 'actor',
    CASE
    WHEN Characters.alias IS NOT NULL THEN Characters.alias
    WHEN Characters.last_name IS NOT NULL THEN Characters.first_name ||' '|| Characters.last_name
    ELSE Characters.first_name
    END AS character
FROM MovieCharacters
INNER JOIN Movies ON MovieCharacters.movie_id = Movies.id
INNER JOIN Staff ON MovieCharacters.actor_id = Staff.id
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
WHERE Movies.title LIKE 'Avengers: Endgame'
ORDER BY actor;

-- How many movies came out each year from 2008-2019?
SELECT strftime('%Y', releaseDate) AS year, count(*) || ' movies' AS movies
FROM Movies
GROUP BY strftime('%Y', releaseDate);

-- How much time has passed since each MCU movie has been released?
-- ( það þarf að highlighta þetta query til þess að runna það. ¯\_(ツ)_/¯ )
SELECT title AS movie, REPLACE(
    CASE
        WHEN ((julianday('now') - julianday(releaseDate)) / 365 % 365) = 0
        THEN ((julianday('now') - julianday(releaseDate)) % 365) || ' days'
        ELSE ((julianday('now') - julianday(releaseDate)) / 365 % 365) || ' years and '
            || ((julianday('now') - julianday(releaseDate)) % 365) || ' days'
    END, '.0','') AS 'time passed'
FROM Movies;