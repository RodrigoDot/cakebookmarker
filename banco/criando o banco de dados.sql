/*CRIACAO DO BANCO*/
create database cake_bookmarker;

use cake_bookmarker;

/*TABELA DE REGISTROS DOS USUARIOS*/
CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created DATETIME,
    modified DATETIME
);

/*TABELA DE REGISTROS DAS OCORRENCIAS*/
CREATE TABLE bookmarks (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(50),
    description TEXT,
    url TEXT,
    created DATETIME,
    modified DATETIME,
    FOREIGN KEY user_id(user_id) REFERENCES users(id)
);

/*TABELA DE REGISTROS DE TAGS*/
CREATE TABLE tags (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    created DATETIME,
    modified DATETIME,
    UNIQUE KEY (title)
);

/*TABELA DE REGISTROS DE REFERENCIA BOOKMARK/TAG*/
CREATE TABLE bookmarks_tags (
	bookmark_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (bookmark_id, tag_id),
    FOREIGN KEY tag_key (tag_id) REFERENCES tags(id),
    FOREIGN KEY bookmark_key (bookmark_id) REFERENCES bookmarks(id)
);
    