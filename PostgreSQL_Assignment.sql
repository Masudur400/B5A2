-- Active: 1747675694839@@localhost@5432@B5A2

CREATE  table rangers (
ranger_id SERIAL primary key, 
ranger_name VARCHAR(100),
region VARCHAR(100)
)

 select * from rangers
 
 INSERT into rangers VALUES 
(1 ,  'Alice Green', 'Northern Hills' ),
(2, 'Bob White', 'River Delta') ,
(3, 'Carol King', 'Mountain Range') 


 create table species (
species_id SERIAL primary key, 
common_name VARCHAR(100),
scientific_name VARCHAR(100),
discovery_date DATE not null, 
conservation_status VARCHAR(50)
)

select * from species

 INSERT into species VALUES 
 (1, 'Snow Leopard', 'Panthera uncia', '1775-01-01' ,'Endangered' ), 
 (2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'), 
 (3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'), 
 (4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered')

 CREATE table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER not null REFERENCES rangers(ranger_id),
    species_id INTEGER not null REFERENCES species(species_id),
    sighting_time TIMESTAMP not null ,
    location  VARCHAR(50) not null,
    note  text 
 )

 drop table sightings

 INSERT INTO sightings(sighting_id,ranger_id, species_id,sighting_time,location,note) VALUES 
 (1,1,1,'2024-05-10 07:45:00', 'Peak Ridge','Camera trap image captured'),
 (2,2,2,'2024-05-12 16:20:00', 'Bankwood Area', 'juvenile seen'),
 (3,3,3,'2024-05-15 09:10:0', 'Bamboo Grove East', 'Feeding observed'),
 (4,1,2,'2024-05-18 18:30:00','Snowfall Pass', NULL)
  

 select * from sightings