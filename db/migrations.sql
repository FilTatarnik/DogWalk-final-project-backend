-- go into psql shell by typing psql .. at least that's how I do it. On my system it auto logs into my psql user, you might need to input a user/pass

DROP DATABASE IF EXISTS leash_pals;
CREATE DATABASE leash_pals;

\c leash_pals;

CREATE TABLE walkers
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	email VARCHAR(64),
	password_digest VARCHAR(60),
	age INTEGER
);

CREATE TABLE owners
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	email VARCHAR(64),
	password_digest VARCHAR(60),
	age INTEGER
);

CREATE TABLE dogs
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	breed VARCHAR(64),
	age INTEGER,
	personality VARCHAR(255),
	owner_id INTEGER REFERENCES owners(id) ON DELETE CASCADE
);

CREATE TABLE appointments
(
	id SERIAL PRIMARY KEY,
	dog_id INTEGER REFERENCES dogs(id) ON DELETE CASCADE,
	walker_id INTEGER REFERENCES walkers(id) ON DELETE CASCADE,
	date TIMESTAMP
);
-- \q to disconnect from psql shell



-- INSERT INTO dogs (name, breed, age, personality, owner_id) VALUES ('Kuma', 'Pomeranian', 3, 'Chill, but playful', 1);



-- INSERT INTO owners (name, email, password_digest, age) VALUES ('Fil', 'fil@email.com', '123', 27)
-- INSERT INTO walkers (name, email, password, age) VALUES ('Andy', 'andy@email.com', '123', 27)
-- INSERT INTO appointments (dog_id, walker_id, date) VALUES (1, 1, '11/28/2018');

-- INSERT INTO admin (name, email, password_digest, age, height, username, location) VALUES ('Fil', 'fil@email.com', '123', 27, 72,  'filiscool', 'bartlett')
-- INSERT INTO admin (name, email, password_digest, age, height, username, location) VALUES ('Josh', 'josh@email.com', '123', 28, 84,  'joshiscool', 'geneva')


