
CREATE DATABASE TiendaDB;
GO

USE TiendaDB;
GO

CREATE TABLE CatPrograma_clean (
    programa VARCHAR(150) NOT NULL PRIMARY KEY
);

CREATE TABLE CatTiempo_clean (
    anio INT NOT NULL,
    mes VARCHAR(20) NOT NULL,
    PRIMARY KEY (anio, mes)
);

CREATE TABLE CatMunicipio_clean (
    departamento VARCHAR(100) NOT NULL,
    cod_divipola_depto INT NOT NULL,
    municipio VARCHAR(150) NOT NULL,
    cod_divipola_mun INT NOT NULL,
    PRIMARY KEY (cod_divipola_mun)
);

CREATE TABLE Hechos_Final_clean (
    consecutivo BIGINT,
    tipoacuerdo VARCHAR(50),
    municipio VARCHAR(150),
    cod_municipio INT,
    subregion VARCHAR(50),
    fase VARCHAR(30),
    nropobla INT,
    aportegob DECIMAL(18,2),
    aportemun DECIMAL(18,2),
    aporteotr DECIMAL(18,2),
    fechainicio DATE,
    fechafin DATE,
    cantidadtotal INT,
    departamento VARCHAR(100),
    cod_divipola_depto INT,
    municipio_subsidio VARCHAR(150),
    cod_divipola_mun INT,
    programa VARCHAR(150),
    anio_asignacion INT,
    estado_postulacion VARCHAR(100),
    hogares INT,
    valor_asignado DECIMAL(18,2),
    tiene_subsidio VARCHAR(50),

    CONSTRAINT FK_Hechos_Programa FOREIGN KEY (programa) 
        REFERENCES CatPrograma_clean(programa),
    
    CONSTRAINT FK_Hechos_Tiempo FOREIGN KEY (anio_asignacion, /* mes si existiera */) 
        REFERENCES CatTiempo_clean(anio, mes),   
    
    CONSTRAINT FK_Hechos_Municipio FOREIGN KEY (cod_divipola_mun) 
        REFERENCES CatMunicipio_clean(cod_divipola_mun)
);