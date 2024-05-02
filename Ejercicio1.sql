CREATE DATABASE smcdb1
COLLATE Modern_spanish_CI_AI;
GO
SELECT name, collation_name FROM sys.databases WHERE name = 'smcdb1';

--Define en el documento que sifnificado tienen las terminaciones ci, ai y que otras opciones existe.
    -- CI especifica que no se diferencia mayúsculas de minúsculas, CS especifica que se diferencia mayúsculas de minúsculas
    -- AI especifica que no se distinguen acentos, AS especifica que se distinguen acentos.


CREATE table Test (code char(20) PRIMARY KEY);
GO


CREATE DATABASE smcdb2 COLLATE Latin1_general_cs_as GO
SELECT name, collation_name FROM sys.databases WHERE name = 'smcdb2';
use smcdb1

ALTER TABLE Test
ADD CharType char(10),
    NcharType nchar(10),
    GuidType UNIQUEIDENTIFIER,
    IntType INT,
    MoneryType money,
    BoolType BIT,
    VarBinaryType VARBINARY,
    DecimalType DECIMAL (10,2),
    BigIntType BIGINT,
    FechaType DATETIME,
    ImageType Image,
    DateType DATE,
    TimeType Time,
    VarcharType nvarchar(20);

    --Describe las ventajas y desventajas de usar un int autonumérico s unique identifer
        -- Un int autonumérico destaca por ser más eficiente al la hora de almacenarlo puesto que ocupa menos, además los indices que se basan en este tipo de campos suelen tener mejor rendimiento. 
        -- Por otro lado, un unique identifier garantiza globalmente la unicidad, lo que puede ser útil cuando se combinan datos de múltiples fuentes, sin embargo, ocupan más y los indices presentan peor rendimiento cuando se basan en ellos 

--Crea algunos datos de prueba en la tabla Test.
INSERT INTO [dbo].[test] (Code, CharType, NcharType, GuidType, IntType, MoneryType, BoolType, VarBinaryType, DecimalType, BigIntType, FechaType, ImageType, DateType, TimeType, VarcharType)
VALUES
('AAA123', 'ABC', 'XYZ', NEWID(), 42, 123.45, 1, 0x01, 7.89, 987654321, '2024-02-20T10:30:00', 0x, '2024-02-20', '10:30:00', 'Texto1'),
('BBB456', 'DEF', 'LMN', NEWID(), 99, 678.90, 0, 0x02, 12.34, 123456789, '2024-02-21T12:45:00', 0x, '2024-02-21', '12:45:00', 'Texto2'),
('CCC789', 'GHI', 'OPQ', NEWID(), 123, 345.67, 1, 0x03, 56.78, 987654321, '2024-02-22T15:15:00', 0x, '2024-02-22', '15:15:00', 'Texto3'),
('DDD987', 'JKL', 'RST', NEWID(), 456, 789.12, 0, 0x04, 90.12, 123456789, '2024-02-23T18:00:00', 0x, '2024-02-23', '18:00:00', 'Texto4'),
('EEE654', 'MNO', 'UVW', NEWID(), 789, 234.56, 1, 0x05, 23.45, 987654321, '2024-02-24T20:30:00', 0x, '2024-02-24', '20:30:00', 'Texto5'),
('FFF321', 'PQR', 'XYZ', NEWID(), 321, 876.54, 0, 0x06, 34.56, 123456789, '2024-02-25T22:45:00', 0x, '2024-02-25', '22:45:00', 'Texto6'),
('GGG987', 'STU', 'ABC', NEWID(), 654, 567.89, 1, 0x07, 45.67, 987654321, '2024-02-26T08:15:00', 0x, '2024-02-26', '08:15:00', 'Texto7'),
('HHH654', 'VWX', 'DEF', NEWID(), 987, 123.45, 0, 0x08, 56.78, 123456789, '2024-02-27T10:30:00', 0x, '2024-02-27', '10:30:00', 'Texto8'),
('III321', 'YZA', 'GHI', NEWID(), 123, 678.90, 1, 0x09, 67.89, 987654321, '2024-02-28T12:45:00', 0x, '2024-02-28', '12:45:00', 'Texto9'),
('JJJ987', 'BCD', 'JKL', NEWID(), 456, 345.67, 0, 0x0A, 78.90, 123456789, '2024-02-29T15:15:00', 0x, '2024-02-29', '15:15:00', 'Texto10'),
('KKK654', 'EFG', 'MNO', NEWID(), 789, 789.12, 1, 0x0B, 89.01, 987654321, '2024-03-01T18:00:00', 0x, '2024-03-01', '18:00:00', 'Texto11'),
('LLL321', 'HIJ', 'PQR', NEWID(), 321, 234.56, 0, 0x0C, 90.12, 123456789, '2024-03-02T20:30:00', 0x, '2024-03-02', '20:30:00', 'Texto12'),
('MMM987', 'KLM', 'STU', NEWID(), 654, 876.54, 1, 0x0D, 21.23, 987654321, '2024-03-03T22:45:00', 0x, '2024-03-03', '22:45:00', 'Texto13'),
('NNN654', 'NOP', 'VWX', NEWID(), 987, 567.89, 0, 0x0E, 32.34, 123456789, '2024-03-04T08:15:00', 0x, '2024-03-04', '08:15:00', 'Texto14'),
('OOO321', 'QRS', 'YZA', NEWID(), 123, 123.45, 1, 0x0F, 43.45, 987654321, '2024-03-05T10:30:00', 0x, '2024-03-05', '10:30:00', 'Texto15'),
('PPP987', 'TUV', 'BCD', NEWID(), 456, 678.90, 0, 0x10, 54.56, 123456789, '2024-03-06T12:45:00', 0x, '2024-03-06', '12:45:00', 'Texto16'),
('QQQ654', 'EFG', 'HIJ', NEWID(), 789, 345.67, 1, 0x11, 65.67, 987654321, '2024-03-07T15:15:00', 0x, '2024-03-07', '15:15:00', 'Texto17'),
('RRR321', 'KLM', 'NOP', NEWID(), 321, 789.12, 0, 0x12, 76.78, 123456789, '2024-03-08T18:00:00', 0x, '2024-03-08', '18:00:00', 'Texto18'),
('SSS987', 'PQR', 'XYZ', NEWID(), 654, 234.56, 1, 0x13, 87.89, 987654321, '2024-03-09T20:30:00', 0x, '2024-03-09', '20:30:00', 'Texto19'),
('TTT654', 'ABC', 'LMN', NEWID(), 987, 876.54, 0, 0x14, 98.90, 123456789, '2024-03-10T22:45:00', 0x, '2024-03-10', '22:45:00', 'Texto20');
--Copia la tabla Test desde la base de datos smcdb1 a smcdb2
IF OBJECT_ID('smcdb2.dbo.test', 'U') IS NULL
BEGIN
    CREATE TABLE smcdb2.dbo.test (
        Code CHAR(20) PRIMARY KEY
    );
    ALTER TABLE smcdb2.dbo.test
ADD CharType char(10),
    NcharType nchar(10),
    GuidType UNIQUEIDENTIFIER,
    IntType INT,
    MoneryType money,
    BoolType BIT,
    VarBinaryType VARBINARY,
    DecimalType DECIMAL (10,2),
    BigIntType BIGINT,
    FechaType DATETIME,
    ImageType Image,
    DateType DATE,
    TimeType Time,
    VarcharType nvarchar(20);
END;

INSERT INTO smcdb2.dbo.test 
SELECT *
FROM smcdb1.dbo.test;

--Intenta hacer una query usando un join sobre la tabla smcdb1.dbo.Test hacia la otra base de datos smcdb2.dbo.Test que has creado previamente. Acuérdate de que el collation es diferente en ambas bases de datos
SELECT * FROM smcdb1.dbo.test t1 INNER JOIN smcdb2.dbo.test t2 ON t1.code = t2.Code

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Sales')
BEGIN
    EXEC('CREATE SCHEMA Sales');
END

-- Crear la tabla Countries
CREATE TABLE Countries (
    CountryId INT PRIMARY KEY IDENTITY,
    CountryName NVARCHAR(100) NOT NULL
)

-- Crear la tabla Address
CREATE TABLE Address (
    AddressId INT PRIMARY KEY IDENTITY,
    Street NVARCHAR(255) NOT NULL,
    City NVARCHAR(100) NOT NULL,
    StateProvince NVARCHAR(100),
    PostalCode NVARCHAR(20),
    CountryId INT,
    FOREIGN KEY (CountryId) REFERENCES Countries(CountryId)
)

-- Crear tabla Customers
CREATE TABLE Customers (
    CustomerId INT IDENTITY PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    AddressId INT,
    FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
)

-- Crear tabla Products
CREATE TABLE Products (
    ProductId INT IDENTITY PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
)

-- Crear tabla VatTypes
CREATE TABLE VatTypes (
    VatTypeId INT PRIMARY KEY,
    Description VARCHAR(255) NOT NULL,
    VatRate DECIMAL(5,2) NOT NULL 
)

-- Crear la tabla Sales.InvoicesHeader
CREATE TABLE Sales.InvoicesHeader (
    InvoiceId INT PRIMARY KEY IDENTITY,
    InvoiceDate DATETIME NOT NULL,
    CustomerId INT NOT NULL, 
    AddressId INT,
    TaxBase DECIMAL(10, 2) NOT NULL,
    TotalVat DECIMAL(10, 2) NOT NULL,
    Total DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
)

-- Crear la tabla Sales.InvoicesDetail
CREATE TABLE Sales.InvoicesDetail (
    InvoiceId   INT             NOT NULL,
    RowNumber   INT             IDENTITY (1, 1) NOT NULL,
    ProductId   INT             NOT NULL,
    Description VARCHAR (255)   NOT NULL,
    Quantity    DECIMAL (18, 4) NOT NULL,
    UnitPrice   DECIMAL (18, 2) NOT NULL,
    Discount    DECIMAL (5, 2)  DEFAULT ((0)) NULL,
    VatTypeId   INT             NULL,
    TotalLine   DECIMAL(18,2)   NOT NULL,

    PRIMARY KEY CLUSTERED (InvoiceId ASC, RowNumber ASC),
    FOREIGN KEY (InvoiceId) REFERENCES Sales.InvoicesHeader (InvoiceId),
    FOREIGN KEY (VatTypeId) REFERENCES dbo.VatTypes (VatTypeId),
    FOREIGN KEY (ProductId) REFERENCES dbo.Products (ProductId)
)
-- Analiza que columnas deben usar nulos y cuales no, define ventajas y desventajas usando columnas con o sin nulos.
-- Ventajas de permitir nulos:

-- 1. Flexibilidad en los Datos:
--    Permite representar la ausencia de un valor o la falta de información de manera explícita.

-- 2. Manejo de Datos Incompletos:
--    Facilita el manejo de datos incompletos o desconocidos sin recurrir a valores por defecto que podrían ser incorrectos.

-- 3. Compatibilidad con Operaciones:
--    Algunas operaciones, como UNION o LEFT JOIN, pueden requerir valores nulos para que las consultas sean más flexibles.

-- Desventajas de permitir nulos:

-- 1. Complejidad en las Consultas:
--    Las consultas pueden volverse más complejas al tener que manejar los casos de valores nulos, lo que puede aumentar la complejidad del código SQL.

-- 2. Riesgo de Errores:
--    Puede haber riesgo de errores si no se manejan adecuadamente los valores nulos en consultas y aplicaciones.

-- 3. Consumo de Espacio de Almacenamiento:
--    Algunos sistemas de gestión de bases de datos (DBMS) pueden utilizar más espacio de almacenamiento para manejar valores nulos, dependiendo de la implementación interna.

-- Usar una clave primaria compuesta:

-- 1. Identidad Conjunta:
--    Cuando la identidad de una fila está definida por la combinación de varios campos, y ninguno de ellos por sí solo garantiza la unicidad.

-- 2. Optimización de Consultas:
--    Cuando las consultas comunes requieren la búsqueda y filtrado frecuente basado en varios campos, y tener una clave primaria compuesta puede optimizar estas operaciones.

-- 3. Relaciones Específicas:
--    En situaciones donde hay relaciones específicas entre los datos que son mejor representadas mediante una clave compuesta.

-- 4. Evitar la Generación de Claves Artificiales:
--    En algunos casos, puede ser preferible evitar la generación de claves artificiales (como identificadores incrementales) y utilizar información inherente en los datos para definir la clave primaria.

-- Buenas prácticas:

-- 1. Claridad en la Definición:
--    Asegúrate de que la combinación de campos en la clave primaria compuesta tenga un significado claro y esté bien definida.

-- 2. No Exagerar:
--    No es necesario tener claves primarias compuestas en todas las tablas. Deberías considerarlas cuando realmente aporten un beneficio en términos de diseño y rendimiento.

-- 3. Mantenimiento de la Unicidad:
--    Asegúrate de que la combinación de campos en la clave primaria compuesta garantice la unicidad de cada fila.

-- 4. Indexación Cuidadosa:
--    Cuando se usan claves primarias compuestas, debes planificar cuidadosamente las indexaciones para optimizar las operaciones de búsqueda.


-- Usando triggers o campos calculados haz que los campos Total y TotalLine de las tablas se actualice cada vez 
--que un campo relacionado con estos cálculos se actualice. Razona y describe en el documento, 
--que ventajas y desventajas representa el uso de campos calculados o triggers.

CREATE TRIGGER [Sales].[trg_UpdateInvoiceTotal]
ON [Sales].[InvoicesDetail]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE h
    SET h.Total = (SELECT SUM(TotalLine) FROM Sales.InvoicesDetail WHERE InvoiceId = h.InvoiceId)
    FROM Sales.InvoicesHeader h
END;

ALTER TABLE [Sales].[InvoicesDetail] ENABLE TRIGGER [trg_UpdateInvoiceTotal]

CREATE TRIGGER trg_UpdateTotalLineWithVAT
ON Sales.InvoicesDetail
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Sales.InvoicesDetail
    SET TotalLine = inserted.Quantity * inserted.UnitPrice * (1 - inserted.Discount / 100) * (1 + VatTypes.VatRate / 100)
    FROM inserted
    INNER JOIN Sales.InvoicesDetail ON Sales.InvoicesDetail.InvoiceId = inserted.InvoiceId AND Sales.InvoicesDetail.RowNumber = inserted.RowNumber
    INNER JOIN VatTypes ON Sales.InvoicesDetail.VatTypeId = VatTypes.VatTypeId;
END;

ALTER TABLE [Sales].[InvoicesDetail] ENABLE TRIGGER [trg_UpdateTotalLineWithVAT]



ALTER TABLE [Sales].[InvoicesDetail] DROP CONSTRAINT [FK__InvoicesD__Invoi__2645B050]
GO

-- Resuelve la siguiente consulta complementando con los 12 meses, no tengas en cuenta los datos, son solo 
--para el ejemplo.


SELECT 
inh.InvoiceType as Type,
YEAR(inh.InvoiceDate) as Year,
SUM(ind.TotalLine) as TotalInvoices,
SUM(ind.TotalLine * vty.VatRate) as TotalVat,
SUM(ind.Quantity) as Quantity,
AVG(ind.TotalLine) as AvgTotalInvoice,
STDEV(ind.TotalLine) StedevTotalInvoice,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 1) then ind.TotalLine else 0 end) as January,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 2) then ind.TotalLine else 0 end) as February,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 3) then ind.TotalLine else 0 end) as March,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 4) then ind.TotalLine else 0 end) as April,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 5) then ind.TotalLine else 0 end) as May,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 6) then ind.TotalLine else 0 end) as June,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 7) then ind.TotalLine else 0 end) as July,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 8) then ind.TotalLine else 0 end) as August,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 9) then ind.TotalLine else 0 end) as September,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 10) then ind.TotalLine else 0 end) as October,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 11) then ind.TotalLine else 0 end) as November,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 12) then ind.TotalLine else 0 end) as December
FROM Sales.InvoicesHeader inh 
INNER JOIN Sales.InvoicesDetail ind ON ind.InvoiceId = inh.InvoiceId
INNER JOIN dbo.VatTypes vty ON ind.VatTypeId = vty.VatTypeId
GROUP BY  inh.InvoiceType, YEAR(inh.InvoiceDate)

-- Crea una consulta con los 5 clientes que más facturan.

SELECT top 5
    cus.CustomerId, 
    cus.CustomerName, 
    SUM(ind.TotalLine) Total
FROM sales.InvoicesDetail ind 
    INNER JOIN sales.InvoicesHeader inh 
        ON inh.InvoiceId = ind.InvoiceId 
            INNER JOIN Customers cus ON cus.CustomerId = inh.CustomerId 
        GROUP BY cus.CustomerId, cus.CustomerName
ORDER BY SUM(ind.TotalLine) desc
--Crea una consulta ordenada por los países que más facturan.
SELECT
    cou.CountryName,
    SUM(ind.TotalLine) Total
FROM sales.InvoicesDetail ind 
    INNER JOIN sales.InvoicesHeader inh 
        ON inh.InvoiceId = ind.InvoiceId 
            INNER JOIN Customers cus ON cus.CustomerId = inh.CustomerId 
            INNER JOIN Address adr ON adr.AddressId = cus.AddressId
            INNER JOIN Countries cou ON cou.CountryId = adr.CountryId
        GROUP BY cou.CountryId, cou.CountryName
ORDER BY SUM(ind.TotalLine) desc
--Crea una consulta que calcule el total de facturación de los últimos tres meses a partir del día actual.
SELECT 
    SUM(ind.totalLine) Total
FROM sales.InvoicesDetail ind 
    INNER JOIN sales.InvoicesHeader inh 
        ON inh.InvoiceId = ind.InvoiceId
WHERE inh.InvoiceDate BETWEEN DATEADD(MONTH, -3, GETDATE()) AND GETDATE()
 --Elimina la integridad referencian entre ambas tablas.
ALTER TABLE [Sales].[InvoicesDetail] DROP CONSTRAINT [FK__InvoicesD__Invoi__2645B050]
Go
--Crea un sistema de integridad referencial en ambas tablas usando solo Triggers.
CREATE TRIGGER trg_CheckInvoiceExists
ON Sales.InvoicesDetail
AFTER INSERT, UPDATE
AS
BEGIN
    -- Declara una variable para contar el número de registros coincidentes
    DECLARE @invoiceCount INT;

    -- Verifica si el InvoiceId insertado existe en Sales.InvoicesHeader
    SELECT @invoiceCount = COUNT(*)
    FROM Sales.InvoicesHeader h
    INNER JOIN INSERTED i ON h.InvoiceId = i.InvoiceId;

    -- Si el InvoiceId no existe en Sales.InvoicesHeader, lanza un error
    IF @invoiceCount = 0
    BEGIN
        -- Lanza un error para prevenir la inserción
        THROW 50000, 'No se puede insertar el registro. InvoiceId no existe en Sales.InvoicesHeader.', 16;
    END
END;

CREATE TRIGGER trg_PreventInvoiceHeaderDeletion
ON Sales.InvoicesHeader
AFTER DELETE
AS
BEGIN
    -- Declara una variable para contar el número de registros referenciados
    DECLARE @referencedCount INT;

    -- Verifica si los InvoiceId eliminados están siendo referenciados por InvoicesDetail
    SELECT @referencedCount = COUNT(*)
    FROM Sales.InvoicesDetail d
    INNER JOIN DELETED h ON d.InvoiceId = h.InvoiceId;

    -- Si hay registros en InvoicesDetail que referencian los InvoiceId eliminados, lanza un error
    IF @referencedCount > 0
    BEGIN
        -- Lanza un error para prevenir la eliminación
        THROW 50000, 'No se puede eliminar InvoiceHeader. Existen registros en InvoicesDetail que lo referencian.', 16;
    END
END;
--Añade un campo calculado a la tabla SalesInvoicesHeader en el que el total de la factura se la suma de la 
--base_imponible + iva. 

ALTER TABLE sales.InvoicesHeader ADD TotalCalculated as (TaxBase + TotalVat)