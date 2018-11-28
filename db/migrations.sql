DROP DATABASE IF EXISTS leash_pals;
CREATE DATABASE leash_pals;
\c leash_pals;
CREATE TABLE walker(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	email VARCHAR(64),
	password_digest VARCHAR(60),
	age INTEGER
);

CREATE TABLE owner(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	email VARCHAR(64),
	password_digest VARCHAR(60),
	age INTEGER
);

CREATE TABLE dog(
	id SERIAL PRIMARY KEY,
	name VARCHAR(64),
	breed VARCHAR(64),
	age INTEGER,
	personality VARCHAR(255),
	owner_id INTEGER REFERENCES owner(id)
);

CREATE TABLE appointment(
	id SERIAL PRIMARY KEY,
	dog_id INTEGER REFERENCES owner(id),
	walker_id INTEGER REFERENCES dog(id),
	date DATETIME
);
