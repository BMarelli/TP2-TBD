-- Integrantes del Grupo:
-- Bautista Marelli - Legajo: M-6682/6
-- Juan Cruz de la Torre - Legajo:
-- Francisco Alcacer - Legajo: A-4230/7


-- Ejercicio 1.
CREATE DATABASE IF NOT EXISTS TP2;

USE TP2;

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
    PRECIO          INT UNSIGNED        NOT NULL,
    PRIMARY KEY (ISBN)
);

CREATE TABLE ESCRIBE (
    ID              INT                 NOT NULL,
    ISBN            INT                 NOT NULL,
    AÑO             INT                NOT NULL,
    PRIMARY KEY (ID, ISBN),
    FOREIGN KEY (ID) REFERENCES AUTOR(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES LIBRO(ISBN) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Ejercicio 2
CREATE INDEX IDX_APELLIDO ON AUTOR (APELLIDO);
CREATE INDEX IDX_TITULO ON LIBRO (TITULO);

-- Ejercicio 3
INSERT INTO AUTOR VALUES (DEFAULT, 'J.K.', 'R', 'Inglaterra', 'Londres');
INSERT INTO AUTOR VALUES (DEFAULT, 'Julio', 'Cortazar', 'Argentina', 'Buenos Aires');
INSERT INTO AUTOR VALUES (DEFAULT, 'Abelardo', 'Castillo', 'Argentina', 'Santa Fe');

INSERT INTO LIBRO VALUES (120, 'Rayuela', 'Logos', 200);
INSERT INTO LIBRO VALUES (121, 'Harry Potter y la Piedra Filosofal', 'Salamandra', 2800);
INSERT INTO LIBRO VALUES (1534, 'Harry Potter y el Caliz de Fuego', 'Salamandra', 3000);
INSERT INTO LIBRO VALUES (1641, 'IT', 'Debolsillo', 3000);
INSERT INTO LIBRO VALUES (1234, 'Complementos de Matematica I', 'UNR', 1055);

INSERT INTO ESCRIBE VALUES (1, 121, 1999);
INSERT INTO ESCRIBE VALUES (1, 1534, 2005);
INSERT INTO ESCRIBE VALUES (1, 120, 1998);
INSERT INTO ESCRIBE VALUES (2, 120, 1998);

-- Ejercicio 4

-- a)
UPDATE AUTOR SET RESIDENCIA = 'Buenos Aires' WHERE NOMBRE = 'Abelardo' AND APELLIDO = 'Castillo';

-- b)
UPDATE LIBRO SET PRECIO = PRECIO * 1.1 WHERE EDITORIAL = 'UNR';

-- c)
-- Consideramos a un libro 'extranjero' si al menos uno de sus autores no es argentino.
UPDATE LIBRO SET PRECIO = CASE WHEN PRECIO > 200 THEN PRECIO * 1.1 ELSE PRECIO * 1.2 END
    WHERE ISBN IN (SELECT ISBN FROM ESCRIBE
                    WHERE ID IN (SELECT ID FROM AUTOR WHERE NACIONALIDAD <> 'Argentina'));

-- d)
DELETE FROM LIBRO WHERE ISBN IN (SELECT ISBN FROM ESCRIBE WHERE AÑO = 1998);
