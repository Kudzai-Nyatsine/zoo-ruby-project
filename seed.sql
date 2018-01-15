DROP TABLE IF EXISTS zoo;

CREATE TABLE zoo (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  sea TEXT,
  forest TEXT,
  safari TEXT,
  mountains TEXT

);

INSERT INTO zoo (title, sea , forest, safari, mountains) VALUES ('Kudz Jungle Zoo','fish' , 'monkeys', 'lions', 'snakes');
