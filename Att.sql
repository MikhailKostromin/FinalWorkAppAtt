USE attestation_work_animals;

CREATE DATABASE IF NOT EXISTS human_friends;
USE human_friends;

CREATE TABLE Animal (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(40),
  birth_date DATE);

CREATE TABLE Pet (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  command VARCHAR(40),
  animal_id INT,
  FOREIGN KEY (animal_id) REFERENCES Animal(id));

CREATE TABLE PackAnimal (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  animal_id INT,
  FOREIGN KEY (animal_id) REFERENCES Animal(id));

CREATE TABLE Dog (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  pet_id INT,
  FOREIGN KEY (pet_id) REFERENCES Pet(id));
  
  
  CREATE TABLE Cat (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  pet_id INT,
  FOREIGN KEY (pet_id) REFERENCES Pet(id));
  
  CREATE TABLE Hamster (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  pet_id INT,
  FOREIGN KEY (pet_id) REFERENCES Pet(id));

CREATE TABLE Horse (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  pack_animal_id INT,
  FOREIGN KEY (pack_animal_id) REFERENCES PackAnimal(id));
  
  
  CREATE TABLE Donkey (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  pack_animal_id INT,
  FOREIGN KEY (pack_animal_id) REFERENCES PackAnimal(id));
  
  
INSERT INTO Animal (name, birth_date) VALUES ('Animal1', '2000-01-01');
INSERT INTO Animal (name, birth_date) VALUES ('Animal2', '2002-05-10');
INSERT INTO Animal (name, birth_date) VALUES ('Animal3', '2005-12-15');
INSERT INTO Pet (command, animal_id) VALUES ('Command1', 1);
INSERT INTO Pet (command, animal_id) VALUES ('Command2', 2);
INSERT INTO Pet (command, animal_id) VALUES ('Command3', 3);
INSERT INTO Dog (pet_id) VALUES (1);
INSERT INTO Cat (pet_id) VALUES (2);
INSERT INTO Hamster (pet_id) VALUES (3);
INSERT INTO PackAnimal (animal_id) VALUES (1);
INSERT INTO PackAnimal (animal_id) VALUES (2);
INSERT INTO PackAnimal (animal_id) VALUES (3);
INSERT INTO Horse (pack_animal_id) VALUES (1);
INSERT INTO Donkey (pack_animal_id) VALUES (2);

CREATE TABLE horses_and_donkeys (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  command VARCHAR(100) NOT NULL,
  birth_date DATE NOT NULL,
  animal_class_id INT UNSIGNED NOT NULL);
  
  CREATE TABLE YoungAnimals (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(40),
  age_in_months INT);
  
INSERT INTO YoungAnimals (name, age_in_months)
SELECT name, TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) AS age_in_months
FROM Animal
WHERE birth_date >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
AND birth_date <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

CREATE TABLE AllAnimals (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(40),
  birth_date DATE,
  command VARCHAR(100),
  pet_id INT,
  pack_animal_id INT);
  
INSERT INTO AllAnimals (name, birth_date, command, pet_id)
SELECT a.name, a.birth_date, p.command, p.id
FROM Animal a
JOIN Pet p ON a.id = p.animal_id;

INSERT INTO AllAnimals (name, birth_date, pack_animal_id)
SELECT a.name, a.birth_date, pa.id
FROM Animal a
JOIN PackAnimal pa ON a.id = pa.animal_id;


