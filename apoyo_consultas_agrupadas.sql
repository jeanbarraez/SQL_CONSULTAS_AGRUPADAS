CREATE DATABASE estudiantes;
\c estudiantes;
CREATE TABLE inscritos( id_estudiante SERIAL PRIMARY KEY, cantidad INT , fecha DATE, fuente VARCHAR);

INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

--REQUERIMIENTOS:
1. ¿Cuántos registros hay?
SELECT COUNT(*) FROM inscritos;

/* 2. ¿Qué es la media de los registros por día?
SELECT fecha, AVG(cantidad) as promedio_dia FROM (SELECT COUNT(*) as cantidad, fecha FROM inscritos GROUP BY fecha) GROUP BY DATE(fecha);
SELECT COUNT(*) as cantidad, fecha FROM inscritos GROUP BY fecha; */

2. ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) as total_inscritos FROM inscritos;

3. ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT DATE (fecha) AS fecha_mas_antigua, cantidad FROM inscritos WHERE fecha = (SELECT MIN(fecha)  FROM inscritos;)
--SELECT fecha, cantidad FROM inscritos ORDER BY fecha ASC LIMIT 1;

--HINT: ocupar subconsultas

4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
ahora en adelante).
 SELECT DATE(fecha), SUM(cantidad) AS inscripciones_por_dia FROM inscritos GROUP BY DATE(fecha) ORDER BY DATE(fecha) ASC;

5. ¿Cuántos inscritos hay por fuente?
SELECT fuente, SUM(cantidad) as total_inscritos FROM inscritos GROUP BY fuente;

6. ¿Qué día se inscribió la mayor cantidad de personas? Y ¿Cuántas personas se
inscribieron en ese día?
SELECT fecha, MAX(cantidad) AS mayor_cantidad FROM inscritos GROUP BY DATE(fecha) ORDER BY mayor_cantidad DESC LIMIT 1;

7. ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog? ¿Cuántas
personas fueron?
SELECT fuente, DATE(fecha), cantidad 
FROM inscritos 
WHERE fuente = 'Blog' 
AND cantidad = (SELECT MAX(cantidad) as cantidad_personas FROM inscritos WHERE fuente = 'Blog');


--HINT: si hay más de un registro, tomar el primero

8. ¿Cuál es el promedio de personas inscritas por día?
SELECT fecha, AVG(cantidad) AS inscrito_prom_diarios FROM inscritos GROUP BY fecha;
--SELECT AVG(cantidad) AS promedio_dia FROM inscritos (total)


9. ¿Qué días se inscribieron más de 50 personas?

SELECT fecha, cantidad FROM inscritos WHERE cantidad > 50;


10. ¿Cuál es el promedio diario de personas inscritas a partir del tercer día en adelante,
considerando únicamente las fechas posteriores o iguales a la indicada?

SELECT fecha, AVG(cantidad) AS promedio_inscrito_tercer_dia FROM inscritos WHERE fecha >= (SELECT distinct fecha FROM inscritos ORDER BY fecha ASC LIMIT 1 OFFSET 2) GROUP BY  fecha;

/* SELECT fecha, AVG(cantidad) AS promedio_inscrito_tercer_dia FROM inscritos GROUP BY DISTINCT fecha, WHERE fecha >= (SELECT fecha FROM inscritos ORDER BY fecha ASC LIMIT 1 OFFSET 2);
 */

