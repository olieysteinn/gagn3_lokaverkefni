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
SELECT Items.name AS item, Characters.alias, Characters.first_name AS name
FROM CharacterItems
INNER JOIN Characters ON CharacterItems.character_id = Characters.id
INNER JOIN Items ON CharacterItems.item_id = Items.id
ORDER BY Items.name ASC;

-- CHARACTERS
SELECT alias, first_name, middle_name, last_name, date_of_birth, 
    place_of_origin, Species.species AS species, Genders.gender AS gender
FROM Characters
INNER JOIN Species ON Characters.species_id = Species.id
INNER JOIN Genders ON Characters.gender_id = Genders.id;

-- GENDERS
SELECT gender, definition FROM Genders;

-- GROUP CHARACTERS
SELECT Groups.name, Characters.first_name, Characters.last_name,
    Characters.alias, membership
FROM GroupCharacters
INNER JOIN Groups ON GroupCharacters.group_id = Groups.id
INNER JOIN Characters ON GroupCharacters.character_id = Characters.id;

-- GROUPS
SELECT name, founder, affiliation
FROM Groups
ORDER BY name ASC;

-- ITEMS
SELECT name, description, creator 
FROM Items
ORDER BY name ASC;

-- JOBS
SELECT title, description FROM Jobs;

-- MOVIE CHARACTERS
SELECT Movies.title AS movie,
    Characters.alias AS alias,
    Characters.first_name AS "character first name",
    Characters.last_name AS "character last name", 
    Alignments.alignment AS alignment, Staff.first_name AS "actor first name",
    Staff.last_name AS "actor last name"
FROM MovieCharacters
INNER JOIN Movies ON MovieCharacters.movie_id = Movies.id
INNER JOIN Characters ON MovieCharacters.character_id = Characters.id
INNER JOIN Staff ON MovieCharacters.actor_id = Staff.id
INNER JOIN Alignments ON MovieCharacters.alignment_id = Alignments.id;

-- MOVIE DIRECTORS
SELECT Movies.title AS movie, Staff.first_name AS "director first name",
    Staff.last_name AS "director last name"
FROM MovieDirectors
INNER JOIN Movies ON MovieDirectors.movie_id = Movies.id
INNER JOIN Staff ON MovieDirectors.director_id = Staff.id;

-- MOVIE PRODUCERS
SELECT Movies.title AS movie, Staff.first_name AS "producer first name",
    Staff.last_name AS "producer last name"
FROM MovieProducers
INNER JOIN Movies ON MovieProducers.movie_id = Movies.id
INNER JOIN Staff ON MovieProducers.producer_id = Staff.id;

-- MOVIES
SELECT Movies.title, phase, Movies.releaseDate AS "release date",
    budget, Soundtracks.title AS soundtrack, summary
FROM Movies
INNER JOIN Soundtracks ON Movies.soundtrack_id = Soundtracks.id;

-- MOVIE SCREENWRITERS
SELECT Movies.title AS movie, Staff.first_name AS "screenwriter first name",
    Staff.last_name AS "screenwriter last name"
FROM MovieScreenwriters
INNER JOIN Movies ON MovieScreenwriters.movie_id = Movies.id
INNER JOIN Staff ON MovieScreenwriters.screenwriter_id = Staff.id;

-- MOVIE SOUNDTRACK SONGS
SELECT Movies.title AS movie,
    Soundtracks.title AS soundtrack,
    Songs.title AS song
FROM MovieSoundtrackSongs
INNER JOIN Movies ON MovieSoundtrackSongs.movie_id = Movies.id
INNER JOIN Soundtracks ON MovieSoundtrackSongs.soundtrack_id = Soundtracks.id
INNER JOIN Songs ON MovieSoundtrackSongs.song_id = Songs.id;

-- SONGS
SELECT title, length FROM Songs
ORDER BY length;

-- SOUNDTRACKS
SELECT title, releaseDate AS "release date",
    Staff.first_name AS "composer first name",
    Staff.last_name AS "composer last name"
FROM Soundtracks
INNER JOIN Staff ON Soundtracks.composer_id = Staff.id;

-- SPECIES
SELECT species, origin, description
FROM Species;

-- STAFF
SELECT first_name AS "first name",
    middle_name AS "middle name",
    last_name AS "last name",
    date_of_birth as "date of birth"
FROM Staff
ORDER BY first_name ASC;

-- STAFF JOBS
SELECT Staff.first_name AS "first name",
    Staff.last_name AS "last name",
    Jobs.title AS "job"
FROM StaffJobs
INNER JOIN Staff ON StaffJobs.staff_id = Staff.id
INNER JOIN Jobs ON StaffJobs.job_id = Jobs.id
ORDER BY title;