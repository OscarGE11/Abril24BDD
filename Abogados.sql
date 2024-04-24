CREATE TABLE Clientes (
	DNI VARCHAR(9) PRIMARY KEY,
	Nombre VARCHAR(100),
	Direccion VARCHAR(255)
	
);
CREATE TABLE Asuntos (
	NºExpediente SERIAL PRIMARY KEY,
	Fecha_Inicio DATE,
	Fecha_Finalizacion DATE,
	Estado VARCHAR(100),
	DNI_Cliente VARCHAR(9),
	FOREIGN KEY(DNI_Cliente) REFERENCES Clientes(DNI)
);
CREATE TABLE Procuradores (
	DNI VARCHAR(9) PRIMARY KEY,
	Nombre VARCHAR(100),
	Direccion VARCHAR(255)
);
CREATE TABLE Procuradores_Asuntos (
	DNI_Procurador VARCHAR(20),
	NºExpediente INT,
	PRIMARY KEY (DNI_Procurador,NºExpediente),
	FOREIGN KEY (DNI_Procurador) REFERENCES Procuradores(DNI),
	FOREIGN KEY (NºExpediente) REFERENCES Asuntos(NºExpediente)
);
