CREATE DATABASE ViviendaDW;
GO

USE ViviendaDW;
GO

CREATE TABLE DimPrograma (
    programa VARCHAR(150) NOT NULL,
    CONSTRAINT PK_DimPrograma PRIMARY KEY (programa)
);
GO

CREATE TABLE DimTiempo (
    anio INT NOT NULL,
    mes VARCHAR(20) NOT NULL,
    CONSTRAINT PK_DimTiempo PRIMARY KEY (anio, mes)
);
GO

CREATE TABLE DimMunicipio (
    cod_divipola_mun INT NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    cod_divipola_depto INT NOT NULL,
    municipio VARCHAR(150) NOT NULL,
    CONSTRAINT PK_DimMunicipio PRIMARY KEY (cod_divipola_mun)
);
GO

CREATE TABLE HechosVivienda (
    id_hecho BIGINT IDENTITY(1,1) NOT NULL,

    consecutivo BIGINT NULL,
    tipoacuerdo VARCHAR(50) NULL,
    municipio VARCHAR(150) NULL,
    cod_municipio INT NULL,
    subregion VARCHAR(50) NULL,
    fase VARCHAR(30) NULL,
    nropobla INT NULL,
    aportegob DECIMAL(18,2) NULL,
    aportemun DECIMAL(18,2) NULL,
    aporteotr DECIMAL(18,2) NULL,
    fechainicio DATE NULL,
    fechafin DATE NULL,
    cantidadtotal INT NULL,

    departamento VARCHAR(100) NULL,
    cod_divipola_depto INT NULL,

    municipio_subsidio VARCHAR(150) NULL,
    cod_divipola_mun INT NOT NULL,

    programa VARCHAR(150) NOT NULL,

    anio_asignacion INT NOT NULL,
    mes VARCHAR(20) NOT NULL,

    estado_postulacion VARCHAR(100) NULL,
    hogares INT NULL,
    valor_asignado DECIMAL(18,2) NULL,
    tiene_subsidio VARCHAR(50) NULL,

    CONSTRAINT PK_HechosVivienda PRIMARY KEY (id_hecho),

    CONSTRAINT FK_HechosVivienda_Programa
        FOREIGN KEY (programa)
        REFERENCES DimPrograma(programa),

    CONSTRAINT FK_HechosVivienda_Tiempo
        FOREIGN KEY (anio_asignacion, mes)
        REFERENCES DimTiempo(anio, mes),

    CONSTRAINT FK_HechosVivienda_Municipio
        FOREIGN KEY (cod_divipola_mun)
        REFERENCES DimMunicipio(cod_divipola_mun)
);
GO