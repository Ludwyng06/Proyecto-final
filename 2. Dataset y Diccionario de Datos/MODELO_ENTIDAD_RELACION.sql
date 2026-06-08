CREATE DATABASE TiendaDB;
GO

USE TiendaDB;
GO

CREATE TABLE dbo.Clientes
(
    idCliente INT IDENTITY(1,1) NOT NULL,
    Cliente_Nombre VARCHAR(100) NOT NULL,
    Cliente_Apellido VARCHAR(100) NOT NULL,
    Doc_Cliente VARCHAR(20) NOT NULL,
    Ciudad_Cliente VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Clientes
        PRIMARY KEY (idCliente),

    CONSTRAINT UQ_Clientes_Documento
        UNIQUE (Doc_Cliente)
);
GO

CREATE TABLE dbo.Vendedores
(
    idVendedor INT IDENTITY(1,1) NOT NULL,
    Vendedor_Nombre VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Vendedores
        PRIMARY KEY (idVendedor)
);
GO

CREATE TABLE dbo.Productos
(
    idProducto INT IDENTITY(1,1) NOT NULL,
    Nombre_Producto VARCHAR(150) NOT NULL,
    Categoria VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Productos
        PRIMARY KEY (idProducto)
);
GO

CREATE TABLE dbo.Facturas
(
    idFactura INT IDENTITY(1,1) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT GETDATE(),
    idCliente INT NOT NULL,
    idVendedor INT NOT NULL,

    CONSTRAINT PK_Facturas
        PRIMARY KEY (idFactura),

    CONSTRAINT FK_Facturas_Clientes
        FOREIGN KEY (idCliente)
        REFERENCES dbo.Clientes(idCliente),

    CONSTRAINT FK_Facturas_Vendedores
        FOREIGN KEY (idVendedor)
        REFERENCES dbo.Vendedores(idVendedor)
);
GO

CREATE TABLE dbo.DetalleFacturas
(
    idDetalle INT IDENTITY(1,1) NOT NULL,
    idFactura INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(18,2) NOT NULL,
    Subtotal DECIMAL(18,2) NOT NULL,

    CONSTRAINT PK_DetalleFacturas
        PRIMARY KEY (idDetalle),

    CONSTRAINT FK_DetalleFacturas_Facturas
        FOREIGN KEY (idFactura)
        REFERENCES dbo.Facturas(idFactura),

    CONSTRAINT FK_DetalleFacturas_Productos
        FOREIGN KEY (idProducto)
        REFERENCES dbo.Productos(idProducto)
);
GO