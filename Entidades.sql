USE Henry;

--Entidad Carrera
IF OBJECT_ID(N'dbo.Carrera', N'U') IS NULL
CREATE TABLE Carrera (
	carrera_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nombre VARCHAR(50) NOT NULL
);

--Entidad Instructor
IF OBJECT_ID(N'dbo.Instructor', N'U') IS NULL
CREATE TABLE Instructor(
	instructor_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	cedula VARCHAR(15) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	[fecha_Nacimiento] DATE,
	[fecha_incorporacion] DATE
);

--Entidad Cohorte
IF OBJECT_ID(N'dbo.Cohorte', N'U') IS NULL
CREATE TABLE Cohorte(
	cohorte_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	codigo VARCHAR(10),
	carrera_id INT,
	fecha_inicio DATE,
	fecha_finalizacion DATE,
	instructor_id INT,
	FOREIGN KEY (carrera_id) REFERENCES Carrera(carrera_id),
	FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

--Entidad Alumno
IF OBJECT_ID(N'dbo.Alumno', N'U') IS NULL
CREATE TABLE Alumno(
	alumno_id INT IDENTITY(1000,1) PRIMARY KEY NOT NULL,
	cedula VARCHAR(15),
	nombre VARCHAR(30),
	apellido VARCHAR(30),
	fecha_nacimiento DATE,
	fecha_ingreso DATE,
	cohorte_id INT,
	FOREIGN KEY (cohorte_id) REFERENCES Cohorte(cohorte_id)
);
