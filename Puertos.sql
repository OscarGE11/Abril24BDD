CREATE TABLE Socios (
	DNI VARCHAR(20) PRIMARY KEY,
	Nombre VARCHAR(255),
	Barco VARCHAR(50)
);
CREATE TABLE Barcos (
	NºMatricula VARCHAR(20) PRIMARY KEY,
	NºAmarre VARCHAR(20),
	DNI_Socio VARCHAR(50),
	Cuota FLOAT,
	FOREIGN KEY (DNI_Socio) REFERENCES Socios(DNI)
);
CREATE TABLE Patrones(
	DNI VARCHAR(20) PRIMARY KEY,
	Nombre VARCHAR(100),
	Telefono VARCHAR(9),
	Direccion VARCHAR(255)
);

CREATE TABLE Salidas (
	DNI_Patron VARCHAR(255) PRIMARY KEY,
	Fecha DATE,
	Hora_Salida TIME,
	Destino VARCHAR(20),
	NºMatricula_Barco VARCHAR(20),
	FOREIGN KEY (DNI_Patron) REFERENCES Patrones(DNI),
	FOREIGN KEY (NºMatricula_Barco) References Barcos(NºMatricula)
);