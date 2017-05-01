CREATE DATABASE BUGTRACKER /*Crear la base de datos*/
USE BUGTRACKER

--------------------------------------------------------------------------------------
/*Crear Entidades */
CREATE TABLE ROL(/*Tabla Rol*/
	idRol	int identity Primary Key,
	Nombre	varchar(60) NOT NULL 
)

CREATE TABLE USUARIO(/*Tabla Usuario*/
	idUsuario	int identity Primary Key,
	Nombre		varchar(60) NOT NULL, 
	Apellido	varchar(60) NOT NULL,
	Rol			int NOT NULL,
	Email		varchar(60) NOT NULL,
	Contraseña	varbinary(128) NOT NULL,
	Nacimiento	date NULL,
	Direccion	varchar(80) NULL,
	Telefono	varchar(8) NULL,
	CONSTRAINT fk_rol FOREIGN KEY(Rol) REFERENCES ROL(idRol)
)

CREATE TABLE PROYECTO(/*Tabla Proyecto*/
	idProyecto	int identity Primary Key,
	Nombre		varchar(60) NOT NULL,
	Costo		Numeric(12,2) NOT NULL,
	FechaInicio date NOT NULL,
	FechaFinal	date NOT NULL
)