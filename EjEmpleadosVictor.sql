DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  id_departamento INT UNSIGNED,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

/* Ejercicio 1 */
SELECT 
    nombre, 
    apellido1, 
    apellido2 
FROM 
    empleado;

/* Ejercicio 2 */    
SELECT DISTINCT 
    apellido1 
FROM 
    empleado;

/* Ejercicio 3 */    
SELECT * 
FROM empleado;

/* Ejercicio 4 */
SELECT DISTINCT 
    id_departamento 
FROM 
    empleado
WHERE 
    id_departamento IS NOT NULL;

/* Ejercicio 5 */    
SELECT DISTINCT 
    id_departamento 
FROM 
    empleado;

/* Ejercicio 6 */    
SELECT 
    CONCAT(nombre, ' ', apellido1, ' ', COALESCE(apellido2, '')) AS "Nombre Completo"
FROM 
    empleado;

/* Ejercicio 7 */    
SELECT 
    LOWER(CONCAT(nombre, ' ', apellido1, ' ', COALESCE(apellido2, ''))) AS "Nombre Completo en Minúscula"
FROM 
    empleado;

/* Ejercicio 8 */    
SELECT 
    id AS "ID Empleado",
    LEFT(nif, LENGTH(nif) - 1) AS "Dígitos NIF",
    RIGHT(nif, 1) AS "Letra NIF"
FROM 
    empleado;

/* Ejercicio 9 */    
SELECT 
    nombre AS "Nombre Departamento", 
    (presupuesto - gastos) AS "Presupuesto Actual"
FROM 
    departamento;

/* Ejercicio 10 */    
SELECT 
    nombre AS "Nombre Departamento", 
    (presupuesto - gastos) AS "Presupuesto Actual"
FROM 
    departamento
ORDER BY 
    "Presupuesto Actual" ASC;

/* Ejercicio 11*/
SELECT 
    nombre AS "Nombre Departamento"
FROM 
    departamento
ORDER BY 
    nombre DESC;

/* Ejercicio 12*/    
SELECT 
    apellido1, 
    apellido2, 
    nombre 
FROM 
    empleado
ORDER BY 
    apellido1 ASC, 
    apellido2 ASC, 
    nombre ASC;

/* Ejercicio 13*/    
SELECT 
    nombre AS "Nombre Departamento", 
    presupuesto AS "Presupuesto"
FROM 
    departamento
ORDER BY 
    presupuesto DESC
LIMIT 3;

/* Ejercicio 14*/
SELECT 
    nombre AS "Nombre Departamento", 
    presupuesto AS "Presupuesto"
FROM 
    departamento
ORDER BY 
    presupuesto ASC
LIMIT 3;

/* Ejercicio 15*/
SELECT 
    nombre AS "Nombre Departamento", 
    gastos AS "Gasto"
FROM 
    departamento
ORDER BY 
    gastos DESC
LIMIT 2;

/* Ejercicio 16*/
SELECT 
    nombre AS "Nombre Departamento", 
    gastos AS "Gasto"
FROM 
    departamento
ORDER BY 
    gastos ASC
LIMIT 2;

/* Ejercicio 17*/
SELECT * 
FROM empleado
LIMIT 5 OFFSET 2;

/* Ejercicio 18*/
SELECT 
    nombre AS "Nombre Departamento", 
    presupuesto AS "Presupuesto"
FROM 
    departamento
WHERE 
    presupuesto >= 150000;

/* Ejercicio 19*/
SELECT 
    nombre AS "Nombre Departamento", 
    presupuesto AS "Presupuesto"
FROM 
    departamento
WHERE 
    presupuesto >= 100000 AND presupuesto <= 200000;

/* Ejercicio 20*/
SELECT 
    nombre AS "Nombre Departamento"
FROM 
    departamento
WHERE 
    presupuesto NOT BETWEEN 100000 AND 200000;

/* Ejercicio 21*/    
SELECT 
    nombre AS "Nombre Departamento", 
    gastos AS "Gastos", 
    presupuesto AS "Presupuesto"
FROM 
    departamento
WHERE 
    gastos > presupuesto;

/* Ejercicio 22*/
SELECT 
    nombre AS "Nombre Departamento", 
    gastos AS "Gastos", 
    presupuesto AS "Presupuesto"
FROM 
    departamento
WHERE 
    gastos < presupuesto;

/* Ejercicio 23*/
SELECT 
    nombre AS "Nombre Departamento", 
    gastos AS "Gastos", 
    presupuesto AS "Presupuesto"
FROM 
    departamento
WHERE 
    gastos = presupuesto;

/* Ejercicio 24*/
SELECT *
FROM empleado
WHERE apellido2 IS NULL;

/* Ejercicio 25*/
SELECT *
FROM empleado
WHERE apellido2 IS NOT NULL;

/* Ejercicio 26*/
SELECT *
FROM empleado
WHERE apellido2 = 'López';

/* Ejercicio 27*/
SELECT *
FROM empleado
WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';

/* Ejercicio 28*/
SELECT *
FROM empleado
WHERE apellido2 IN ('Díaz', 'Moreno');

/* Ejercicio 29*/
SELECT 
    nombre, 
    apellido1, 
    apellido2, 
    nif
FROM 
    empleado
WHERE 
    id_departamento = 3;

/* Ejercicio 30*/
SELECT 
    nombre, 
    apellido1, 
    apellido2, 
    nif
FROM 
    empleado
WHERE 
    id_departamento IN (2, 4, 5);

/* Ejercicio 31*/    
SELECT SUM(presupuesto) AS "Suma del Presupuesto"
FROM departamento;

/* Ejercicio 32*/
SELECT AVG(presupuesto) AS "Media del Presupuesto"
FROM departamento;

/* Ejercicio 33*/
SELECT MIN(presupuesto) AS "Presupuesto Mínimo"
FROM departamento;

/* Ejercicio 34*/
SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto ASC
LIMIT 1;

/* Ejercicio 35*/
SELECT MAX(presupuesto) AS "Presupuesto Máximo"
FROM departamento;

/* Ejercicio 36*/
SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto DESC
LIMIT 1;

/* Ejercicio 37*/
SELECT COUNT(*) AS "Número Total de Empleados"
FROM empleado;

/* Ejercicio 38*/
SELECT COUNT(*) AS "Número de Empleados sin NULL en Segundo Apellido"
FROM empleado
WHERE apellido2 IS NOT NULL;

/* Ejercicio 39*/
SELECT 
    d.nombre AS "Nombre Departamento", 
    COUNT(e.id) AS "Número de Empleados"
FROM 
    departamento d
LEFT JOIN 
    empleado e ON d.id = e.id_departamento
GROUP BY 
    d.id;

/* Ejercicio 40*/
SELECT 
    d.nombre AS "Nombre Departamento", 
    COUNT(e.id) AS "Número de Empleados"
FROM 
    departamento d
LEFT JOIN 
    empleado e ON d.id = e.id_departamento
WHERE 
    d.presupuesto > 200000
GROUP BY 
    d.id;
