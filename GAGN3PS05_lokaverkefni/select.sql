-- ABILITIES
SELECT name, description
FROM Abilities
ORDER BY name ASC;

-- ALIGNMENTS
SELECT alignment, definition
FROM Alignments;

-- CHARACTER ABILITIES
SELECT Characters.alias, Characters.first_name AS name, Abilities.name AS ability
FROM CharacterAbilities
INNER JOIN Characters ON CharacterAbilities.character_id = Characters.id
INNER JOIN Abilities ON CharacterAbilities.ability_id = Abilities.id;

-- CHARACTER ITEMS
SELECT Items.name as item, Characters.alias, Characters.first_name as name
FROM CharacterItems
INNER JOIN Characters ON CharacterItems.character_id = Characters.id
INNER JOIN Items ON CharacterItems.item_id = Items.id
ORDER BY Items.name ASC;

-- CHARACTERS
SELECT alias, first_name, middle_name, last_name
FROM Characters;

-- GENDERS
SELECT gender, 

-- GROUP CHARACTERS
SELECT Groups.name, Characters.first_name, Characters.last_name, Characters.alias, membership
FROM GroupCharacters
INNER JOIN Groups ON GroupCharacters.group_id = Groups.id
INNER JOIN Characters ON GroupCharacters.character_id = Characters.id;

-- GROUPS


-- ITEMS


-- JOBS


-- MOVIE CHARACTERS
SELECT Movies.title AS Movie, Characters.first_name AS "Character first name",
    Characters.last_name AS "Character last name", Characters.alias AS "Alias",
    Alignments.alignment as "Alignment", Staff.first_name AS "Actor first name",
    Staff.last_name AS "Actor last name"
FROM MovieCharacters
INNER JOIN Movies ON MovieCharacters.movie_id = Movies.id
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Staff ON MovieCharacters.actor_id = Staff.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id;

-- MOVIES


-- SONGS
SELECT title, length FROM Songs
ORDER BY length;

SELECT strftime('%Y-%m-%d');
SELECT length FROM Songs;
SELECT strftime('%H-%M-%S',length) FROM Songs;

SELECT Soundtracks.title, 
    time(sum(strftime('%s', Songs.length)), 'unixepoch') AS "soundtrack length"
FROM MovieSoundtrackSongs
INNER JOIN Songs ON MovieSoundtrackSongs.song_id = Songs.id
INNER JOIN Soundtracks ON MovieSoundtrackSongs.soundtrack_id = Soundtracks.id
WHERE MovieSoundtrackSongs.movie_id = 1;

-- SOUNDTRACKS
SELECT title, releaseDate AS "release date", length,
    Staff.first_name AS "composer first name",
    Staff.last_name AS "composer last name"
FROM Soundtracks
INNER JOIN Staff ON Soundtracks.composer_id = Staff.id;

-- MOVIE SOUNDTRACK SONGS
SELECT Movies.title AS movie,
    Soundtracks.title AS soundtrack,
    Songs.title AS song
FROM MovieSoundtrackSongs
INNER JOIN Movies ON MovieSoundtrackSongs.movie_id = Movies.id
INNER JOIN Soundtracks ON MovieSoundtrackSongs.soundtrack_id = Soundtracks.id
INNER JOIN Songs ON MovieSoundtrackSongs.song_id = Songs.id;

-- SPECIES
SELECT species, origin, description
FROM Species;

-- STAFF
SELECT first_name AS "first name",
    middle_name as "middle name",
    last_name AS "last name",
    (date('now')-age) || " years old" AS age
FROM Staff
ORDER BY first_name ASC, age DESC;

-- STAFF JOBS
SELECT Staff.first_name AS "first name",
    Staff.last_name AS "last name",
    Jobs.title AS "job"
FROM StaffJobs
INNER JOIN Staff ON StaffJobs.staff_id = Staff.id
INNER JOIN Jobs ON StaffJobs.job_id = Jobs.id
ORDER BY title;