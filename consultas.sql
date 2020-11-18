-- Ejercicio 5

-- a)
SELECT DISTINCT nombre FROM Persona WHERE codigo IN (SELECT codigo_propietario FROM PoseeInmueble);

-- b)
SELECT DISTINCT codigo FROM Inmueble WHERE precio BETWEEN 600000 AND 700000;

-- c)

SELECT DISTINCT nombre FROM Persona
    WHERE codigo IN (SELECT codigo FROM Cliente
                     WHERE NOT EXISTS (SELECT nombre_zona FROM PrefiereZona
                                        WHERE PrefiereZona.codigo_cliente = Cliente.codigo AND
                                        NOT (PrefiereZona.nombre_poblacion = 'Santa Fe' AND PrefiereZona.nombre_zona = 'Norte')));

-- d)
SELECT DISTINCT nombre FROM Persona
    WHERE codigo IN (SELECT vendedor FROM Cliente 
                     WHERE codigo IN (SELECT codigo_cliente FROM PrefiereZona 
                                      WHERE nombre_zona = 'Centro' AND nombre_poblacion = 'Rosario'));

-- e)
SELECT nombre_zona, COUNT(*) AS cantidad_inmuebles, AVG(precio) AS precio_promedio FROM Inmueble
    WHERE nombre_poblacion = 'Rosario'
    GROUP BY nombre_zona;
    
-- f)
SELECT DISTINCT nombre FROM Persona, PrefiereZona
    WHERE nombre_poblacion = 'Santa Fe' AND Persona.codigo = PrefiereZona.codigo_cliente
    GROUP BY nombre
    HAVING COUNT(DISTINCT nombre_zona) = (SELECT COUNT(*) FROM Zona WHERE nombre_poblacion = 'Santa Fe');

