-- Integrantes del Grupo:
-- Bautista Marelli - Legajo:
-- Juan Cruz de la Torre - Legajo:
-- Francisco Alcacer - Legajo:

CREATE DATABASE IF NOT EXISTS ejercicio_1;

USE ejercicio_1;

DROP TABLE IF EXISTS ESCRIBE;
DROP TABLE IF EXISTS AUTOR;
DROP TABLE IF EXISTS LIBRO;

CREATE TABLE AUTOR (
    ID              INT                 NOT NULL            AUTO_INCREMENT,
    NOMBRE          CHAR(35)            NOT NULL,
    APELLIDO        CHAR(35)            NOT NULL,
    NACIONALIDAD    CHAR(35)            NOT NULL,
    RESIDENCIA      CHAR(35)            NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE LIBRO (
    ISBN            INT                 NOT NULL,
    TITULO          CHAR(35)            NOT NULL,
    EDITORIAL       CHAR(35)            NOT NULL,
    PRECIO          INT                 NOT NULL,
    PRIMARY KEY (ISBN)
);

CREATE TABLE ESCRIBE (
    ID              INT                 NOT NULL,
    ISBN            INT                 NOT NULL,
    AÑO             DATE                NOT NULL,
    PRIMARY KEY (ID, ISBN),
    FOREIGN KEY (ID) REFERENCES AUTOR(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES LIBRO(ISBN) ON DELETE CASCADE ON UPDATE CASCADE
);


