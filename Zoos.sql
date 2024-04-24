CREATE TABLE Zoos (
	ID_Zoo SERIAL PRIMARY KEY,
	Nombre VARCHAR(255),
	Localizacion VARCHAR(255),
	Tamanio FLOAT,
	Presupuesto_Anual FLOAT
);


CREATE TABLE Especies (
	Nombre_Cientifico VARCHAR(50) PRIMARY KEY,
	Nombre_Vulgar VARCHAR(50),
	Familia VARCHAR(50),
	Peligro_Extincion BOOLEAN
);

CREATE TABLE Animales(
	NºIdentificacion VARCHAR(20) PRIMARY KEY,
	Especie VARCHAR(50),
	Sexo VARCHAR(10),
	Anio_Nacimiento DATE,
	Pais_Origen VARCHAR(10),
	Continente VARCHAR(10),
	ID_Zoo INT,
	FOREIGN KEY(ID_Zoo) REFERENCES Zoos(ID_Zoo),
	FOREIGN KEY(Especie) REFERENCES Especies(Nombre_Cientifico)
);