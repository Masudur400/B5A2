-- Active: 1747675694839@@localhost@5432@B5A2

CREATE  table rangers (
ranger_id SERIAL primary key, 
ranger_name VARCHAR(100),
region VARCHAR(100)
)

 INSERT into rangers VALUES 
(1 ,  'Alice Green', 'Northern Hills' ),
(2, 'Bob White', 'River Delta') ,
(3, 'Carol King', 'Mountain Range') 

select * from rangers

DROP table rangers

 create table species (
species_id SERIAL primary key, 
common_name VARCHAR(100),
scientific_name VARCHAR(100),
discovery_date DATE not null, 
conservation_status VARCHAR(50)
)

INSERT into species VALUES 
 (1, 'Snow Leopard', 'Panthera uncia', '1775-01-01' ,'Endangered' ), 
 (2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'), 
 (3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'), 
 (4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered')

select * from species

 DROP table species

 CREATE table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER not null REFERENCES rangers(ranger_id),
    species_id INTEGER not null REFERENCES species(species_id),
    sighting_time TIMESTAMP not null ,
    location  VARCHAR(50) not null,
    note  text 
 ) 

 INSERT INTO sightings(sighting_id,ranger_id, species_id,sighting_time,location,note) VALUES 
 (1,1,1,'2024-05-10 07:45:00', 'Peak Ridge','Camera trap image captured'),
 (2,2,2,'2024-05-12 16:20:00', 'Bankwood Area', 'juvenile seen'),
 (3,3,3,'2024-05-15 09:10:0', 'Bamboo Grove East', 'Feeding observed'),
 (4,1,2,'2024-05-18 18:30:00','Snowfall Pass', NULL)
  
select * from sightings

drop table sightings

--Problem 1: 

INSERT INTO rangers (ranger_name, region) VALUES  ('Derek Fox', 'Coastal Plains')

SELECT * FROM rangers WHERE "ranger_name" = 'Derek Fox'

--Problem 2:
SELECT COUNT(*) AS  unique_species_count FROM species

--Problem 3: 
SELECT * FROM sightings WHERE location LIKE '%Pass%'

--Problem 4: 
SELECT rangers.ranger_name, COUNT(sightings.sighting_id) 
AS total_sightings
FROM rangers
LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.ranger_name;

--Problem 5: 
SELECT species.common_name
FROM species
WHERE species_id NOT IN (SELECT DISTINCT species_id FROM sightings);

--Problem 6:


SELECT species.common_name, sightings.sighting_time, rangers.ranger_name
FROM sightings
JOIN species ON sightings.species_id = species.species_id
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sightings.sighting_time DESC LIMIT 2

--Problem 7:
UPDATE species 
SET conservation_status = 'Historic' 
WHERE discovery_date < '1800-01-01';

SELECT * FROM species


--Problem 8:

SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

--Problem 9:
DELETE FROM rangers 
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);

SELECT * FROM rangers