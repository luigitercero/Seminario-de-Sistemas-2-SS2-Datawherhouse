-- Generado por Oracle SQL Developer Data Modeler 18.4.0.339.1532
--   en:        2019-02-20 17:43:09 CST
--   sitio:      SQL Server 2000
--   tipo:      SQL Server 2000

Use Seminario201408606

-- Generado por Oracle SQL Developer Data Modeler 18.4.0.339.1532
--   en:        2019-02-21 08:50:14 CST
--   sitio:      SQL Server 2008
--   tipo:      SQL Server 2008



ALTER TABLE tabladehechos DROP CONSTRAINT tabladehechos_articulo_fk 


ALTER TABLE TABLADEHECHOSv1 
    DROP CONSTRAINT TABLADEHECHOSv1_Articulo_FK 
 drop TABLE articulo 

--ALTER TABLE tabladehechos DROP CONSTRAINT tabladehechos_cliente_fk 


ALTER TABLE TABLADEHECHOSv1 
    DROP CONSTRAINT TABLADEHECHOSv1_Cliente_FK 
 drop TABLE cliente 

ALTER TABLE tabladehechos DROP CONSTRAINT tabladehechos_fecha_fk 


ALTER TABLE TABLADEHECHOSv1 
    DROP CONSTRAINT TABLADEHECHOSv1_Fecha_FK 
 drop TABLE fecha 

ALTER TABLE tabladehechos DROP CONSTRAINT tabladehechos_proveedor_fk 


--ALTER TABLE TABLADEHECHOSv1 
--    DROP CONSTRAINT TABLADEHECHOSv1_proveedor_FK 
 drop TABLE proveedor 

ALTER TABLE tabladehechos DROP CONSTRAINT tabladehechos_region_fk 


ALTER TABLE TABLADEHECHOSv1 
    DROP CONSTRAINT TABLADEHECHOSv1_Region_FK 
 drop TABLE region 

ALTER TABLE tabladehechos DROP CONSTRAINT tabladehechos_sucursal_fk 


ALTER TABLE TABLADEHECHOSv1 
    DROP CONSTRAINT TABLADEHECHOSv1_Sucursal_FK 
 drop TABLE sucursal 

drop TABLE tabladehechos 

drop TABLE tabladehechosv1 

CREATE TABLE articulo 
    ( codiarticulo INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     Descripcion VARCHAR (100) , 
     Departamento VARCHAR (20) NOT NULL , 
     Articulo VARCHAR (8) unique NOT NULL ) 

ALTER TABLE Articulo ADD constraint articulo_pk PRIMARY KEY CLUSTERED (CodiArticulo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 

CREATE TABLE cliente 
    ( codicliente INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     ClienteProveedor VARCHAR(1)not null,
	 TipoCliente VARCHAR (100) NOT NULL , 
     nombreCliente VARCHAR (100) NOT NULL , 
     Cliente VARCHAR (8) unique NOT NULL ) 

ALTER TABLE Cliente ADD constraint cliente_pk PRIMARY KEY CLUSTERED (CodiCliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 

CREATE TABLE fecha 
    ( fecha INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     year INTEGER NOT NULL , 
     month INTEGER NOT NULL , 
     day INTEGER NOT NULL,
	 fechaComplete date NOT NULL ) 

ALTER TABLE Fecha ADD constraint fecha_pk PRIMARY KEY CLUSTERED (Fecha)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 

CREATE TABLE proveedor 
    ( codicliente INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     ClienteProveedor VARCHAR(1)not null,
	 TipoCliente VARCHAR (100) NOT NULL , 
     nombreCliente VARCHAR (100) NOT NULL , 
     Cliente VARCHAR (8) unique NOT NULL ) 

ALTER TABLE proveedor ADD constraint clientev1_pk PRIMARY KEY CLUSTERED (CodiCliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 

CREATE TABLE region 
    ( codiregion INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     Departamento VARCHAR (20) NOT NULL , 
     zona VARCHAR (100) NOT NULL , 
     Region VARCHAR (100)  NOT NULL ) 

ALTER TABLE Region ADD constraint region_pk PRIMARY KEY CLUSTERED (CodiRegion)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 

CREATE TABLE sucursal 
    ( codisucursal INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     NombreSucursal VARCHAR (100) NOT NULL , 
     Direccion VARCHAR (100) NOT NULL , 
     sucursal varCHAR (6) unique NOT NULL ) 

ALTER TABLE Sucursal ADD constraint sucursal_pk PRIMARY KEY CLUSTERED (CodiSucursal)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 

CREATE TABLE tabladehechos (
    cantidad                  INTEGER NOT NULL,
    preciounitario            bigint NOT NULL,
    costo                     bigint NOT NULL,
    tipocliente               varCHAR(100) NOT NULL,
    articulo_codiarticulo   INTEGER NOT NULL,
    fecha_fecha               INTEGER NOT NULL,
    --cliente_codicliente     INTEGER NOT NULL,
    sucursal_codisucursal   INTEGER NOT NULL,
    region_region             INTEGER NOT NULL,
    total                     INTEGER  NULL,
    proveedor_codicliente   INTEGER NOT NULL
)



CREATE TABLE tabladehechosv1 (
    cantidad                  INTEGER NOT NULL,
    preciounitario            bigint NOT NULL,
    costo                     bigint NOT NULL,
    tipocliente               varCHAR(100) NOT NULL,
    articulo_codiarticulo   INTEGER NOT NULL,
    fecha_fecha               INTEGER NOT NULL,
    cliente_codicliente     INTEGER NOT NULL,
    sucursal_codisucursal   INTEGER NOT NULL,
    region_region             INTEGER NOT NULL,
    total                     INTEGER ,
    --proveedor_codicliente   INTEGER NOT NULL
)



ALTER TABLE TABLADEHECHOS
    ADD CONSTRAINT tabladehechos_articulo_fk FOREIGN KEY ( articulo_codiarticulo )
        REFERENCES articulo ( codiarticulo )
ON DELETE NO ACTION 
    ON UPDATE no action 



ALTER TABLE TABLADEHECHOS
    ADD CONSTRAINT tabladehechos_fecha_fk FOREIGN KEY ( fecha_fecha )
        REFERENCES fecha ( fecha )
ON DELETE NO ACTION 
    ON UPDATE no action 

ALTER TABLE TABLADEHECHOS
    ADD CONSTRAINT tabladehechos_proveedor_fk FOREIGN KEY ( proveedor_codicliente )
        REFERENCES proveedor ( codicliente )
ON DELETE NO ACTION 
    ON UPDATE no action 

ALTER TABLE TABLADEHECHOS
    ADD CONSTRAINT tabladehechos_region_fk FOREIGN KEY ( region_region )
        REFERENCES region ( codiregion )
ON DELETE NO ACTION 
    ON UPDATE no action 

ALTER TABLE TABLADEHECHOS
    ADD CONSTRAINT tabladehechos_sucursal_fk FOREIGN KEY ( sucursal_codisucursal )
        REFERENCES sucursal ( codisucursal )
ON DELETE NO ACTION 
    ON UPDATE no action 

ALTER TABLE TABLADEHECHOSv1
    ADD CONSTRAINT tabladehechosv1_articulo_fk FOREIGN KEY ( articulo_codiarticulo )
        REFERENCES articulo ( codiarticulo )
ON DELETE NO ACTION 
    ON UPDATE no action 

ALTER TABLE TABLADEHECHOSv1
    ADD CONSTRAINT tabladehechosv1_cliente_fk FOREIGN KEY ( cliente_codicliente )
        REFERENCES cliente ( codicliente )
ON DELETE NO ACTION 
    ON UPDATE no action 

ALTER TABLE TABLADEHECHOSv1
    ADD CONSTRAINT tabladehechosv1_fecha_fk FOREIGN KEY ( fecha_fecha )
        REFERENCES fecha ( fecha )
ON DELETE NO ACTION 
    ON UPDATE no action 



ALTER TABLE TABLADEHECHOSv1
    ADD CONSTRAINT tabladehechosv1_region_fk FOREIGN KEY ( region_region )
        REFERENCES region ( codiregion )
ON DELETE NO ACTION 
    ON UPDATE no action 

ALTER TABLE TABLADEHECHOSv1
    ADD CONSTRAINT tabladehechosv1_sucursal_fk FOREIGN KEY ( sucursal_codisucursal )
        REFERENCES sucursal ( codisucursal )
ON DELETE NO ACTION 
    ON UPDATE no action 



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             30
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0




-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             30
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0



