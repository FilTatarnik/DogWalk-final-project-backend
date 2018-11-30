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
	owner_id INTEGER REFERENCES owners(id)
);

CREATE TABLE appointments(
	id SERIAL PRIMARY KEY,
	dog_id INTEGER REFERENCES owners(id),
	walker_id INTEGER REFERENCES dogs(id),
	date TIMESTAMP
);

INSERT INTO dogs (name, breed, age, personality, owner_id) VALUES ('Kuma', 'Pomeranian', 3, 'Chill, but playful', 1)





INSERT INTO owners (name, email, password_digest, age) VALUES ('Fil', 'fil@email.com', '123', 27)
INSERT INTO walkers (name, email, password_digest, age) VALUES ('Andy', 'andy@email.com', '123', 27)
INSERT INTO appointments (dog_id, walker_id, date) VALUES (1, 1, '11/28/2018');