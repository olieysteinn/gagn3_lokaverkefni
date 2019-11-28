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


-- SOUNDTRACKS


-- SOUNDTRACK SONGS
SELECT Soundtracks.title, Songs.title
FROM SoundtrackSongs
INNER JOIN Soundtracks ON SoundtrackSongs.soundtrack_id = Soundtracks.id
INNER JOIN Songs ON SoundtrackSongs.song_id = Songs.id;

-- SPECIES


-- STAFF


-- STAFF JOBS
SELECT Staff.first_name, Staff.last_name, Jobs.title
FROM StaffJobs
INNER JOIN Staff ON StaffJobs.staff_id = Staff.id
INNER JOIN Jobs ON StaffJobs.job_id = Jobs.id;