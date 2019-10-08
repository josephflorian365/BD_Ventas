
CREATE TABLE Cliente (
    idClient int NOT NULL COMMENT 'Este campo es el identificador de cada cliente registrado.',
    nomClient varchar(70) NULL COMMENT 'Contiene los nombres del cliente',
    ApeClient varchar(100) NULL COMMENT 'Contiene los apellidos del cliente',
    dniClient char(8) NULL COMMENT 'Contiene el número de DNI del cliente.',
    dirClient varchar(100) NOT NULL COMMENT 'Contiene la dirección del domicilio del cliente.',
    telfClient varchar(9) NOT NULL COMMENT 'Contiene el teléfono del cliente.',
    correClient varchar(50) NOT NULL COMMENT 'Contiene el e-mail del cliente.',
    CONSTRAINT Cliente_pk PRIMARY KEY (idClient)
) COMMENT 'Esta tabla contiene toda la información de los clientes.';

CREATE TABLE Producto (
    idProd int NOT NULL COMMENT 'Contiene el identificador de cada producto.',
    desProd varchar(150) NULL COMMENT 'Contiene la descripción del producto.',
    precuniProd decimal(6,2) NULL COMMENT 'Contiene el precio unitario en soles peruanos.',
    CONSTRAINT Producto_pk PRIMARY KEY (idProd)
) COMMENT 'Contiene toada la información de los productos que se va a vender.';

CREATE TABLE Venta (
    codVent char(4) NOT NULL COMMENT 'Contiene el identificador de cada venta teniendo en cuenta que el código esta conformado ',
    fecVent date NULL COMMENT 'Contiene la fecha en que se realizó la venta.',
    idClient int NOT NULL COMMENT 'Identificador del cliente al que voy a vender el producto.',
    CONSTRAINT Venta_pk PRIMARY KEY (codVent)
) COMMENT 'Contiene los datos referentes al cliente y fecha de venta.';

CREATE TABLE Venta_Detalle (
    idVentDet int NOT NULL COMMENT 'Contiene el identificador de cada producto vendido.',
    idProd int NOT NULL COMMENT 'Identificador del producto que se esta vendiendo.',
    Venta_codVent char(4) NOT NULL,
    CONSTRAINT Venta_Detalle_pk PRIMARY KEY (idVentDet)
) COMMENT 'Contiene de productos vendidos a los clientes.';

ALTER TABLE Venta ADD CONSTRAINT Venta_Cliente FOREIGN KEY Venta_Cliente (idClient)
    REFERENCES Cliente (idClient);

ALTER TABLE Venta_Detalle ADD CONSTRAINT Venta_Detalle_Producto FOREIGN KEY Venta_Detalle_Producto (idProd)
    REFERENCES Producto (idProd);

ALTER TABLE Venta_Detalle ADD CONSTRAINT Venta_Detalle_Venta FOREIGN KEY Venta_Detalle_Venta (Venta_codVent)
    REFERENCES Venta (codVent);



