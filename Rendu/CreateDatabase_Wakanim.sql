-- Author : Gabriel Pereira & Luke Cornaz
-- Date : 08.01.2021
-- Project : Wakanim
-- Version : 1.0

-- Utilisation de la table master. 
USE master;

-- Efface la base de données.
DROP DATABASE Wakanim;

-- Crée la nouvelle base de données.
CREATE DATABASE Wakanim;

-- Utilise la nouvelle base de données.
USE Wakanim;

-- Région de toute les tables.

-- Création de la table "users".
CREATE TABLE users (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    lastname VARCHAR(45) NOT NULL,
    firstname VARCHAR(45) NOT NULL,
	email VARCHAR(60) NOT NULL UNIQUE,
	users_pages_id INT,
	subscriptions_id INT,
	catalogs_id INT,
	homes_id INT,
	faqs_id INT
);

-- Création de la table "users_pages".
CREATE TABLE users_pages (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    pseudo VARCHAR(200) NOT NULL UNIQUE,
    register_date VARCHAR(50) NOT NULL,
	series_followed VARCHAR(200),
	bio VARCHAR(200) NOT NULL
);

-- Création de la table "catalogs".
CREATE TABLE catalogs (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    reference VARCHAR(10) NOT NULL UNIQUE,
    last_episodes VARCHAR(150) NOT NULL,
	video VARCHAR(150) NOT NULL
);

-- Création de la table "homes".
CREATE TABLE homes (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	video_on_banner VARCHAR(200) NOT NULL UNIQUE
	
);

-- Création de la table "subscriptions".
CREATE TABLE subscriptions (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE,
    price VARCHAR(50) NOT NULL,
	offer VARCHAR(45) NOT NULL,
	duration VARCHAR(50) NOT NULL
);

-- Création de la table "faqs".
CREATE TABLE faqs (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    question VARCHAR(45) NOT NULL UNIQUE,
    answer VARCHAR(45) NOT NULL UNIQUE
);

-- Création de la table "planifications".
CREATE TABLE planifications (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    date DATETIME NOT NULL UNIQUE,
    episode INT,
    videos_id INT NOT NULL
);

-- Création de la table "videos".
CREATE TABLE videos (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(200) NOT NULL UNIQUE,
    genre VARCHAR(200) NOT NULL,
       release_date DATETIME NOT NULL,
       animation_studio VARCHAR(50) NOT NULL,
       status_id INT NOT NULL
);

-- Création de la table "users-watch_videos".
CREATE TABLE users_watch_videos (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
       users_id INT NOT NULL,
       videos_id INT NOT NULL,
    acquired VARCHAR(20) NOT NULL
);

-- Création de la table "status".
CREATE TABLE status (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    description VARCHAR(150)UNIQUE,
);

CREATE TABLE homes_contains_videos (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	homes_id int NOT NULL,
	videos_id int NOT NULL
);

-- Région de toutes les clées étrangères.
ALTER TABLE users
ADD CONSTRAINT FK_users_pages FOREIGN KEY (users_pages_id)
REFERENCES users_pages (id);

ALTER TABLE users
ADD CONSTRAINT FK_subscriptions FOREIGN KEY (subscriptions_id)
REFERENCES subscriptions (id);

ALTER TABLE users
ADD CONSTRAINT FK_catalogs FOREIGN KEY (catalogs_id) 
REFERENCES catalogs (id);

ALTER TABLE users
ADD CONSTRAINT FK_homes FOREIGN KEY (homes_id) 
REFERENCES homes (id);

ALTER TABLE users
ADD CONSTRAINT FK_faqs FOREIGN KEY (faqs_id) 
REFERENCES faqs (id);

ALTER TABLE planifications
ADD CONSTRAINT FK_videos FOREIGN KEY (videos_id)
REFERENCES videos (id);

ALTER TABLE videos
ADD CONSTRAINT FK_status FOREIGN KEY (status_id)
REFERENCES status (id);

ALTER TABLE users_watch_videos
ADD CONSTRAINT FK_users FOREIGN KEY (users_id)
REFERENCES users (id);

ALTER TABLE users_watch_videos
ADD CONSTRAINT FK_watch_videos FOREIGN KEY (videos_id)
REFERENCES videos (id);

ALTER TABLE homes_contains_videos
ADD CONSTRAINT FK_contains_homes FOREIGN KEY (homes_id)
REFERENCES homes (id);

ALTER TABLE homes_contains_videos
ADD CONSTRAINT FK_contains_videos FOREIGN KEY (videos_id)
REFERENCES videos (id);

