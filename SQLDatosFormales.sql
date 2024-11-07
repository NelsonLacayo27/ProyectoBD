-- -----------------------------------------------------
-- Eliminar las tablas existentes si ya existen
-- -----------------------------------------------------
DROP TABLE IF EXISTS CriteriosEvaluados;
DROP TABLE IF EXISTS Evaluaciones;
DROP TABLE IF EXISTS Criterios;
DROP TABLE IF EXISTS Evaluadores;
DROP TABLE IF EXISTS Trabajadores;
DROP TABLE IF EXISTS Departamentos;

-- -----------------------------------------------------
-- Crear la base de datos si no existe
-- -----------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'EvaluacionDesempeno')
BEGIN
    CREATE DATABASE EvaluacionDesempeno;
END;
GO

-- Usar la base de datos EvaluacionDesempeno
USE EvaluacionDesempeno;
GO

-- -----------------------------------------------------
-- Tabla de Departamentos
-- -----------------------------------------------------
CREATE TABLE Departamentos (
    ID_Departamento INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Departamento VARCHAR(100) NOT NULL
);
GO

-- Insertar datos en la tabla de Departamentos
INSERT INTO Departamentos (Nombre_Departamento) 
VALUES
('Ventas'),
('Marketing'),
('TI'),
('Recursos Humanos'),
('Finanzas'),
('Log�stica'),
('Atenci�n al Cliente');
GO

-- -----------------------------------------------------
-- Tabla de Trabajadores
-- -----------------------------------------------------
CREATE TABLE Trabajadores (
    ID_Trabajador INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Trabajador VARCHAR(100) NOT NULL,
    ID_Departamento INT,
    Fecha_Ingreso DATE,
    Fecha_Nacimiento DATE,
    DNI VARCHAR(20) UNIQUE,
    Email VARCHAR(100),
    FOREIGN KEY (ID_Departamento) REFERENCES Departamentos(ID_Departamento)
);
GO

-- Insertar datos en la tabla de Trabajadores
INSERT INTO Trabajadores (Nombre_Trabajador, ID_Departamento, Fecha_Ingreso, Fecha_Nacimiento, DNI, Email) 
VALUES
('Juan P�rez', 1, '2019-01-15', '1990-07-05', '12345678', 'juan.perez@empresa.com'),
('Mar�a L�pez', 2, '2018-06-23', '1988-11-10', '23456789', 'maria.lopez@empresa.com'),
('Carlos G�mez', 3, '2020-02-01', '1995-03-15', '34567890', 'carlos.gomez@empresa.com'),
('Ana S�nchez', 4, '2017-12-01', '1992-08-25', '45678901', 'ana.sanchez@empresa.com'),
('Luc�a Mart�nez', 5, '2021-09-10', '1993-04-17', '56789012', 'lucia.martinez@empresa.com'),
('Luis Fern�ndez', 6, '2016-08-30', '1985-02-20', '67890123', 'luis.fernandez@empresa.com'),
('Pedro Gonz�lez', 7, '2022-01-01', '1990-06-10', '78901234', 'pedro.gonzalez@empresa.com');
GO

-- -----------------------------------------------------
-- Tabla de Evaluadores
-- -----------------------------------------------------
CREATE TABLE Evaluadores (
    ID_Evaluador INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Evaluador VARCHAR(100) NOT NULL,
    Cargo_Evaluador VARCHAR(100)
);
GO

-- Insertar datos en la tabla de Evaluadores
INSERT INTO Evaluadores (Nombre_Evaluador, Cargo_Evaluador) 
VALUES
('Laura Mart�nez', 'Gerente de Ventas'),
('Pedro Gonz�lez', 'Jefe de Marketing'),
('Sof�a Rodr�guez', 'Directora de TI'),
('Carlos Ram�rez', 'Gerente de Recursos Humanos'),
('Miguel Torres', 'Director Financiero'),
('Paola D�az', 'Jefe de Log�stica'),
('Juan P�rez', 'Coordinador de Atenci�n al Cliente');
GO

-- -----------------------------------------------------
-- Tabla de Criterios
-- -----------------------------------------------------
CREATE TABLE Criterios (
    ID_Criterio INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Criterio VARCHAR(100) NOT NULL
);
GO

-- Insertar datos en la tabla de Criterios
INSERT INTO Criterios (Nombre_Criterio) 
VALUES
('Puntualidad'),
('Calidad de Trabajo'),
('Trabajo en Equipo'),
('Iniciativa'),
('Liderazgo'),
('Comunicaci�n'),
('Responsabilidad'),
('Resoluci�n de Problemas'),
('Cumplimiento de Metas');
GO

-- -----------------------------------------------------
-- Tabla de Evaluaciones
-- -----------------------------------------------------
CREATE TABLE Evaluaciones (
    ID_Evaluacion INT PRIMARY KEY IDENTITY(1,1),
    ID_Trabajador INT,
    Fecha_Evaluacion DATE NOT NULL,
    ID_Evaluador INT,
    Tipo_Evaluacion VARCHAR(50), -- Evaluaci�n anual, trimestral, etc.
    Comentarios TEXT,
    FOREIGN KEY (ID_Trabajador) REFERENCES Trabajadores(ID_Trabajador),
    FOREIGN KEY (ID_Evaluador) REFERENCES Evaluadores(ID_Evaluador)
);
GO

-- Insertar datos en la tabla de Evaluaciones
INSERT INTO Evaluaciones (ID_Trabajador, Fecha_Evaluacion, ID_Evaluador, Tipo_Evaluacion, Comentarios) 
VALUES
(1, '2024-03-01', 1, 'Anual', 'Excelente rendimiento, pero se puede mejorar la puntualidad en algunas reuniones.'),
(2, '2024-03-02', 2, 'Anual', 'Buena calidad de trabajo, aunque puede mejorar la proactividad en el equipo.'),
(3, '2024-03-01', 3, 'Anual', 'Buen manejo de proyectos, se recomienda mejorar la comunicaci�n con el equipo.'),
(4, '2024-03-03', 4, 'Trimestral', 'Gran desempe�o, pero se deben cumplir m�s metas trimestrales.'),
(5, '2024-02-15', 5, 'Anual', 'Excelente capacidad anal�tica, le falta mayor liderazgo en el equipo.'),
(6, '2024-04-01', 6, 'Trimestral', 'Buen desempe�o log�stico, pero requiere mejorar en la resoluci�n de problemas.'),
(7, '2024-01-20', 7, 'Anual', 'Buena atenci�n al cliente, pero necesita mejorar en responsabilidad.'); 
GO

-- -----------------------------------------------------
-- Tabla de CriteriosEvaluados
-- -----------------------------------------------------
CREATE TABLE CriteriosEvaluados (
    ID_Evaluacion INT,
    ID_Criterio INT,
    Puntuacion INT, -- Puntuaci�n de 1 a 10
    PRIMARY KEY (ID_Evaluacion, ID_Criterio),
    FOREIGN KEY (ID_Evaluacion) REFERENCES Evaluaciones(ID_Evaluacion),
    FOREIGN KEY (ID_Criterio) REFERENCES Criterios(ID_Criterio)
);
GO

-- Insertar datos en la tabla de CriteriosEvaluados
-- Insertar puntuaciones para cada evaluaci�n (aseg�rate de que cada evaluaci�n y criterio sea �nico)
INSERT INTO CriteriosEvaluados (ID_Evaluacion, ID_Criterio, Puntuacion) 
VALUES
(1, 1, 8), -- Juan P�rez evaluado en Puntualidad con 8
(1, 2, 9), -- Juan P�rez evaluado en Calidad de Trabajo con 9
(1, 3, 7), -- Juan P�rez evaluado en Trabajo en Equipo con 7
(1, 4, 8), -- Juan P�rez evaluado en Iniciativa con 8
(1, 5, 9), -- Juan P�rez evaluado en Liderazgo con 9
(1, 6, 7), -- Juan P�rez evaluado en Comunicaci�n con 7
(1, 7, 9), -- Juan P�rez evaluado en Responsabilidad con 9
(1, 8, 8), -- Juan P�rez evaluado en Resoluci�n de Problemas con 8
(1, 9, 10), -- Juan P�rez evaluado en Cumplimiento de Metas con 10
-- M�s datos de evaluaci�n para los dem�s trabajadores...
(2, 1, 7), -- Mar�a L�pez evaluada en Puntualidad con 7
(2, 2, 8), -- Mar�a L�pez evaluada en Calidad de Trabajo con 8
(2, 3, 8), -- Mar�a L�pez evaluada en Trabajo en Equipo con 8
(2, 4, 7), -- Mar�a L�pez evaluada en Iniciativa con 7
(2, 5, 9), -- Mar�a L�pez evaluada en Liderazgo con 9
(2, 6, 8), -- Mar�a L�pez evaluada en Comunicaci�n con 8
(2, 7, 8), -- Mar�a L�pez evaluada en Responsabilidad con 8
(2, 8, 7), -- Mar�a L�pez evaluada en Resoluci�n de Problemas con 7
(2, 9, 9); -- Mar�a L�pez evaluada en Cumplimiento de Metas con 9
GO

-- -----------------------------------------------------
-- Consultas de prueba
-- -----------------------------------------------------
-- Ver trabajadores y sus departamentos
SELECT t.Nombre_Trabajador, d.Nombre_Departamento
FROM Trabajadores t
JOIN Departamentos d ON t.ID_Departamento = d.ID_Departamento;

-- Ver evaluaciones con criterios y puntuaciones
SELECT e.ID_Evaluacion, t.Nombre_Trabajador, c.Nombre_Criterio, ce.Puntuacion
FROM CriteriosEvaluados ce
JOIN Evaluaciones e ON ce.ID_Evaluacion = e.ID_Evaluacion
JOIN Trabajadores t ON e.ID_Trabajador = t.ID_Trabajador
JOIN Criterios c ON ce.ID_Criterio = c.ID_Criterio;

-- Ver evaluadores y las evaluaciones que han realizado
SELECT e.Nombre_Evaluador, t.Nombre_Trabajador, ev.Fecha_Evaluacion, ev.Tipo_Evaluacion
FROM Evaluadores e
JOIN Evaluaciones ev ON e.ID_Evaluador = ev.ID_Evaluador
JOIN Trabajadores t ON ev.ID_Trabajador = t.ID_Trabajador;
GO
