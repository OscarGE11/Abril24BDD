CREATE TABLE IF NOT EXISTS Colecciones (
    ID_Coleccion SERIAL PRIMARY KEY,
    Volumen VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Libros (
    ISBN VARCHAR(50) PRIMARY KEY,
    Titulo VARCHAR(255),
    Autor VARCHAR(255),
    Editorial VARCHAR(255),
    ID_Coleccion INT,
    FOREIGN KEY (ID_Coleccion) REFERENCES Colecciones(ID_Coleccion)
);

CREATE TABLE IF NOT EXISTS Almacenes (
    ID_Almacen SERIAL PRIMARY KEY,
    Apertura DATE,
    Direccion VARCHAR(255),
    ID_Provincia VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Almacenes_Libros(
    ID_Almacen INT,
    ISBN VARCHAR(50),
    PRIMARY KEY(ID_Almacen,ISBN),
    FOREIGN KEY(ID_Almacen) REFERENCES Almacenes(ID_Almacen),
    FOREIGN KEY(ISBN) REFERENCES Libros(ISBN)
);

CREATE TABLE IF NOT EXISTS Provincias(
    ID_Provincia SERIAL PRIMARY KEY,
    Nombre VARCHAR(255),
    "Extension" INT,
    ID_Almacen INT,
    FOREIGN KEY(ID_Almacen) REFERENCES Almacenes(ID_Almacen)
);

CREATE TABLE IF NOT EXISTS Poblaciones (
    ID_Poblacion VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(255),
    Habitantes INT,
    ID_Provincia INT,
    FOREIGN KEY(ID_Provincia) REFERENCES Provincias(ID_Provincia)
);

CREATE TABLE IF NOT EXISTS Socios (
    ID_Socio SERIAL PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellidos VARCHAR(50),
    DNI VARCHAR(20) UNIQUE,
    Telefono VARCHAR(9),
    ID_Poblacion VARCHAR(20),
    ID_Socio_Avalador INT REFERENCES Socios(ID_Socio),
    FOREIGN KEY(ID_Poblacion) REFERENCES Poblaciones(ID_Poblacion)
);

CREATE TABLE IF NOT EXISTS Pedidos (
    ID_Pedido SERIAL PRIMARY KEY,
    Forma_Envio VARCHAR(50),
    Forma_Pago VARCHAR(50),
    ID_Socio INT,
    FOREIGN KEY(ID_Socio) REFERENCES Socios(ID_Socio)
);

CREATE TABLE IF NOT EXISTS Detalles_Pedidos(
    Consecutivo INT,
    PRIMARY KEY (ID_Pedido,Consecutivo),
    ID_Pedido INT,
    ISBN VARCHAR(50),
    Cantidad INT,
    FOREIGN KEY(ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY(ISBN) REFERENCES Libros(ISBN)
);
