DROP DATABASE IF EXISTS leash_pals;
CREATE DATABASE leash_pals;

\c leash_pals;

CREATE TABLE walkers(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	email VARCHAR(64),
	password_digest VARCHAR(60),
	age INTEGER
);

CREATE TABLE owners(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	email VARCHAR(64),
	password_digest VARCHAR(60),
	age INTEGER
);

CREATE TABLE dogs(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	breed VARCHAR(64),
	age INTEGER,
	personality VARCHAR(255),
	owner_id INTEGER REFERENCES owners(id) ON DELETE CASCADE
);

CREATE TABLE appointments(
	id SERIAL PRIMARY KEY,
	dog_id INTEGER REFERENCES dogs(id) ON DELETE CASCADE,
	walker_id INTEGER REFERENCES walkers(id) ON DELETE CASCADE,
	date TIMESTAMP
);



INSERT INTO dogs (name, breed, age, personality, owner_id) VALUES ('Kuma', 'Pomeranian', 3, 'Chill, but playful', 1);



INSERT INTO owners (name, email, password_digest, age) VALUES ('Fil', 'fil@email.com', '123', 27)
INSERT INTO walkers (name, email, password, age) VALUES ('Andy', 'andy@email.com', '123', 27)
INSERT INTO appointments (dog_id, walker_id, date) VALUES (1, 1, '11/28/2018');

INSERT INTO admin (name, email, password_digest, age, height, username, location) VALUES ('Fil', 'fil@email.com', '123', 27, 72,  'filiscool', 'bartlett')
INSERT INTO admin (name, email, password_digest, age, height, username, location) VALUES ('Josh', 'josh@email.com', '123', 28, 84,  'joshiscool', 'geneva')

CREATE TABLE members(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	class VARCHAR(64),
	flavortext VARCHAR(128),
	gun VARCHAR(64)
);

INSERT INTO members (name, class, flavortext, gun) VALUES ('Azel', 'Warlock', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('Lolgistics Officer', 'Titan', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('Karma', 'Warlock', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('Kelryn', 'Warlock', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('Profishional', 'Warlock', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('Infernal', 'Warlock', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('Steel Condor', 'Warlock', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('Compound', 'Warlock', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('Archon', 'Hunter', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('Leo', 'Warlock', 'this is where the flavortext is going to go', 'yes');
INSERT INTO members (name, class, flavortext, gun) VALUES ('YungCVC', 'Hunter', '... Give us the Primus ... or we blow the ship', 'Pocket Infinity');



