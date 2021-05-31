----------------------------------------------------------------------------------------------------------------------------------------------------
/*
Autores: 
Cruz Zavala Miguel Angel
Dominguez Cisneros Alexis Saul 
Monroy Velázquez Alejandra Sarahí

Fecha de Creacion: 6/11/2019
Fecha de modificacion 11/11/2019
Descripción: Creacion de la base de datos, incluye todas las tablas, y relaciones entre las tablas.
*/
-----------------------------------------------------------------------------------------------------------------------------------------------------

--CREACION DE LA BASE DE DATOS
create database Concesionario
go

use concesionario
go

--CREACION DE ESQUEMAS (VENTA, EMPLEADO Y SERVICIO).
create schema VENTA authorization dbo
go
create schema EMPLEADO authorization dbo
go
create schema SERVICIO authorization dbo
go


--CREACION DE TABLA SERVICIO.AJUSTE
CREATE TABLE SERVICIO.AJUSTE
( 
	artIdAjuste          integer  NOT NULL IDENTITY (1,1),
	matricula            char(7)  NOT NULL ,
	numEmpleado          integer  NOT NULL ,
	idCliente            integer  NOT NULL ,
	idAjuste             integer  NOT NULL ,
	tipoAjuste           varchar(10)  NOT NULL ,
	costoAjuste          decimal(10,2)  NOT NULL ,
	fechaAjuste          datetime  NOT NULL ,
	duracion             varchar(15)  NOT NULL ,
	iva                  decimal(8,2) NULL ,
	estatus              varchar(20)  NOT NULL ,
	CONSTRAINT PK_ajuste PRIMARY KEY CLUSTERED (artIdAjuste ASC),
	CONSTRAINT AK_ajuste UNIQUE (matricula, numEmpleado, idCliente, idAjuste)
)
go

--CREACION DE TABLA VENTA.CLIENTE
CREATE TABLE VENTA.CLIENTE
( 
	idCliente            integer  NOT NULL IDENTITY(1,1) ,
	sexo                 char(1)  NOT NULL ,
	fechaNacCliente      datetime  NOT NULL ,
	rfc                  char(18)  NOT NULL ,
	nombreCliente        varchar(30)  NOT NULL ,
	apPatCliente         varchar(30)  NOT NULL ,
	apMatCliente         varchar(30)  NULL ,
	calle                varchar(20)  NOT NULL ,
	numero               varchar(20)  NOT NULL ,
	colonia              varchar(20)  NOT NULL ,
	municipio            varchar(30)  NOT NULL ,
	estado               varchar(30)  NOT NULL ,
	CONSTRAINT PK_cliente PRIMARY KEY CLUSTERED (idCliente ASC) ,
	CONSTRAINT AK_cliente UNIQUE (rfc)
)
go

--CREACION DE TABLA VENTA.COCHE
CREATE TABLE VENTA.COCHE
( 
	matricula            char(7)  NOT NULL ,
	modelo               varchar(20)  NOT NULL ,
	costo                decimal(10,2)  NOT NULL ,
	tipoCoche            char(5)  NOT NULL ,
	CONSTRAINT PK_coche PRIMARY KEY CLUSTERED (matricula ASC) 
)
go

--CREACION DE TABLA EMPLEADO.COMERCIAL
CREATE TABLE EMPLEADO.COMERCIAL
( 
	numEmpleado          integer  NOT NULL ,
	CONSTRAINT PK_comercial PRIMARY KEY CLUSTERED (numEmpleado ASC)
)
go

--CREACION DE TABLA VENTA.COMPRA 
CREATE TABLE VENTA.COMPRA
( 
	idCompra             integer  NOT NULL IDENTITY (1,1) ,
	idCliente            integer  NOT NULL ,
	matricula            char(7)  NOT NULL ,
	fechaCompra          datetime  NOT NULL ,
	costoTotal           decimal(10,2)  NOT NULL ,
	CONSTRAINT PK_compra PRIMARY KEY CLUSTERED (idCompra ASC)
)
go


--CREACION DE TABLA EMPLEADO.CURSO 
CREATE TABLE EMPLEADO.CURSO
( 
	idCurso              integer  NOT NULL IDENTITY(1,1) ,
	numEmpleado          integer  NOT NULL ,
	curso                varchar(20)  NOT NULL ,
	CONSTRAINT PK_curso PRIMARY KEY (idCurso ASC) ,
	CONSTRAINT AK_curso UNIQUE (numEmpleado, curso)
)
go

--CREACION DE TABLA VENTA.EMAIL
CREATE TABLE VENTA.EMAIL
( 
	idEmail              integer  NOT NULL IDENTITY(1,1) ,
	idCliente            integer  NOT NULL ,
	email                varchar(30) NOT NULL ,
	CONSTRAINT PK_email PRIMARY KEY (idEmail ASC) ,
	CONSTRAINT AK_email UNIQUE (idCliente, email)
)
go

--CREACION DE TABLA EMPLEADO.EMAILEMPLEADO
CREATE TABLE EMPLEADO.EMAILEMPLEADO
( 
	idEmailEmpleado      integer  NOT NULL IDENTITY(1,1) ,
	numEmpleado          integer  NOT NULL ,
	emailEmpleado        varchar(30)  NOT NULL ,
	CONSTRAINT PK_emailEmpleado PRIMARY KEY (idEmailEmpleado ASC) ,
	CONSTRAINT AK_emailEmpleado UNIQUE (numEmpleado, emailEmpleado)
)
go

--CREACION DE TABLA EMPLEADO.EMPLEADO
CREATE TABLE EMPLEADO.EMPLEADO
( 
	numEmpleado          integer  NOT NULL IDENTITY(1,1) ,
	nombreEmpleado       varchar(30)  NOT NULL ,
	apPatEmpleado        varchar(30)  NOT NULL ,
	apMatEmpleado        varchar(30)  NULL ,
	fechaIngreso         datetime NOT NULL ,
	fechaNacEmpleado     datetime NOT NULL ,
	sueldo               decimal(10,2) NULL CONSTRAINT DF_sueldoBase DEFAULT(4000) ,
	calleEmpleado        varchar(20)  NOT NULL ,
	numeroEmpleado       varchar(20)  NOT NULL ,
	coloniaEmpleado      varchar(20)  NOT NULL ,
	municipioEmpleado    varchar(20)  NOT NULL ,
	estadoEmpleado       varchar(20)  NOT NULL ,
	tipoEmpleado         varchar(10)  NOT NULL,
	CONSTRAINT PK_empleado PRIMARY KEY CLUSTERED (numEmpleado ASC) 
)
go

--CREACION DE TABLA VENTA.EXTRASCOCHE
CREATE TABLE VENTA.EXTRASCOCHE
( 
	idExtraCoche         integer  NOT NULL IDENTITY(1,1) ,
	matricula            char(7)  NOT NULL ,
	descripcionExtra     char(20)  NOT NULL ,
	CONSTRAINT PK_extrasCoche PRIMARY KEY (idExtraCoche ASC),
	CONSTRAINT AK_extraCoche UNIQUE (matricula, descripcionExtra)
)
go

--CREACION DE TABLA EMPLEADO.MECANICO
CREATE TABLE EMPLEADO.MECANICO
(
	numEmpleado			integer NOT NULL ,
	escolaridad			varchar(20) NOT NULL ,
	CONSTRAINT PK_mecanico PRIMARY KEY CLUSTERED (numEmpleado ASC)
)
go

--CREACION DE TABLA VENTA.REGISTRACOMPRA
CREATE TABLE VENTA.REGISTRACOMPRA
( 
	idCompra             integer  NOT NULL ,
	numEmpleado          integer  NOT NULL ,
	comision             decimal(8,2)  NULL CONSTRAINT DF_comisionBase DEFAULT(1000) ,
	CONSTRAINT PK_registraCompra PRIMARY KEY (idCompra ASC, numEmpleado ASC)
)
go

--CREACIO DE TABLA SERVICIO.REPARACION
CREATE TABLE SERVICIO.REPARACION
( 
	artIdAjuste          integer  NOT NULL ,
	idTipoReparacion     integer  NOT NULL ,
	CONSTRAINT PK_reparacion PRIMARY KEY CLUSTERED(artIdAjuste ASC)
)
go

--CREACION DE TABLA SERVICIO.REVISION
CREATE TABLE SERVICIO.REVISION
(
	artIdAjuste          integer  NOT NULL ,
	idTipoRevision       integer  NOT NULL , 
	numEmpleado          integer  NOT NULL ,
	fechaPlanificacion   datetime  NOT NULL ,
	checkPlanRealizada	 char(1) NULL CONSTRAINT DF_fePlanReal DEFAULT('N')	,
	fechaPlanificacionRealizada datetime  NULL ,
	CONSTRAINT PK_revision PRIMARY KEY CLUSTERED (artIdAjuste ASC)
)
go

--CREACION DE TABLA EMPLEADO.TECNICO
CREATE TABLE EMPLEADO.TECNICO
( 
	numEmpleado          integer  NOT NULL ,
	CONSTRAINT PK_tecnico PRIMARY KEY CLUSTERED (numEmpleado ASC)
)
go

--CREACION DE TABLA VENTA.TELEFONO
CREATE TABLE VENTA.TELEFONO
( 
	idTelefono          integer  NOT NULL IDENTITY(1,1) ,
	idCliente            integer  NOT NULL ,
	telefono             char(10)  NOT NULL ,
	CONSTRAINT PK_telefono PRIMARY KEY (idTelefono ASC) ,
	CONSTRAINT AK_telefono UNIQUE (idCliente, telefono)
)
go

--CREACION DE TABLA EMPLEADO.TELEFONOEMPLEADO
CREATE TABLE EMPLEADO.TELEFONOEMPLEADO
(
	idTelefonoEmpleado   integer  NOT NULL IDENTITY(1,1) ,
	numEmpleado          integer  NOT NULL , 
	telefonoEmpleado     char(10)  NOT NULL ,
	CONSTRAINT PK_telefonoEmpleado PRIMARY KEY (idTelefonoEmpleado ASC) ,
	CONSTRAINT AK_telefonoEmpleado UNIQUE (numEmpleado, telefonoEmpleado)
)
go

--CREACION DE TABLA SERVICIO.TIPOREPARACION
CREATE TABLE SERVICIO.TIPOREPARACION
( 
	idTipoReparacion     integer  NOT NULL IDENTITY(1,1) ,
	descripcionRep       varchar(20)  NOT NULL 
	CONSTRAINT PK_tipoReparacion PRIMARY KEY (idTipoReparacion ASC)
)
go

--CREACION DE TABLA SERVICIO.TIPOREVISION
CREATE TABLE SERVICIO.TIPOREVISION
( 
	idTipoRevision       integer  NOT NULL IDENTITY(1,1), 
	descripcionRev       varchar(20)  NOT NULL ,
	CONSTRAINT PK_tipoRevision PRIMARY KEY (idTipoRevision ASC)
)
go

--CREACION DE TABLA VENTA.USADO
CREATE TABLE VENTA.USADO
( 
	matricula            char(7)  NOT NULL ,
	idCliente            integer  NOT NULL,
	CONSTRAINT PK_usado PRIMARY KEY (matricula ASC) 
)
go

--CONSTRAINT PARA RELACIONAR COCHE Y AJUSTE
ALTER TABLE SERVICIO.AJUSTE
	ADD CONSTRAINT rel_cocheAjuste FOREIGN KEY (matricula) REFERENCES VENTA.COCHE(matricula)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA RELACIONAR MECANICO Y AJUSTE
ALTER TABLE SERVICIO.AJUSTE
	ADD CONSTRAINT rel_mecanicoAjuste FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.MECANICO(numEmpleado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA RELACIONAR CLIENTE Y AJUSTE
ALTER TABLE SERVICIO.AJUSTE
	ADD CONSTRAINT rel_clienteAjuste FOREIGN KEY (idCliente) REFERENCES VENTA.CLIENTE(idCliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA DEFINIR COMO FK,PK EN COMERCIAL LA PK DE EMPLEADO
ALTER TABLE EMPLEADO.COMERCIAL
	ADD  FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA RELACIONAR CLIENTE Y COMPRA
ALTER TABLE VENTA.COMPRA
	ADD CONSTRAINT rel_clienteCompra FOREIGN KEY (idCliente) REFERENCES VENTA.CLIENTE(idCliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA RELACIONAR COCHE Y COMPRA
ALTER TABLE VENTA.COMPRA
	ADD CONSTRAINT rel_cocheCompra FOREIGN KEY (matricula) REFERENCES VENTA.COCHE(matricula)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA RELACIONAR MECANICO Y CURSO
ALTER TABLE EMPLEADO.CURSO
	ADD CONSTRAINT rel_mecanicoCurso FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.MECANICO(numEmpleado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA RELACIONAR CLIENTE Y EMAIL
ALTER TABLE VENTA.EMAIL
	ADD CONSTRAINT rel_clienteEmail FOREIGN KEY (idCliente) REFERENCES VENTA.CLIENTE(idCliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA RELACIONAR EMPLEADO Y EMAILEMPLEADO
ALTER TABLE EMPLEADO.EMAILEMPLEADO
	ADD CONSTRAINT rel_empleadoEmailEmpleado FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA RELACIONAR COCHE Y EXTRACOCHE
ALTER TABLE VENTA.EXTRASCOCHE
	ADD CONSTRAINT rel_cocheExtraCoche FOREIGN KEY (matricula) REFERENCES VENTA.COCHE(matricula)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA DEFINIR COMO FK,PK EN MECANICO LA PK DE EMPLEADO
ALTER TABLE EMPLEADO.MECANICO
	ADD  FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA RELACIONAR COMPRA Y REGISTRACOMPRA
ALTER TABLE VENTA.REGISTRACOMPRA
	ADD CONSTRAINT rel_compraRegistraCompra FOREIGN KEY (idCompra) REFERENCES VENTA.COMPRA(idCompra)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA RELACIONAR COMERCIAL Y REGISTRACOMPRA
ALTER TABLE VENTA.REGISTRACOMPRA
	ADD CONSTRAINT rel_comercialRegistraCompra FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.COMERCIAL(numEmpleado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


--CONSTRAINT PARA DEFINIR COMO FK,PK EN REPARACION LA PK DE AJUSTE
ALTER TABLE SERVICIO.REPARACION
	ADD  FOREIGN KEY (artIdAjuste) REFERENCES SERVICIO.AJUSTE(artIdAjuste)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA RELACIONAR EL CATALOGO TIPOREPARACION Y REPARACION
ALTER TABLE SERVICIO.REPARACION
	ADD CONSTRAINT rel_tipoReparacionReparacion FOREIGN KEY (idTipoReparacion) REFERENCES SERVICIO.TIPOREPARACION(idTipoReparacion)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA RELACIONAR TECNICO, MECANICO Y REVISION
ALTER TABLE SERVICIO.REVISION
	ADD CONSTRAINT rel_empleadoRevision FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA RELACIONAR EL CATALOGO TIPOREVISION Y REVISION
ALTER TABLE SERVICIO.REVISION
	ADD CONSTRAINT rel_tipoRevisionRevision FOREIGN KEY (idTipoRevision) REFERENCES SERVICIO.TIPOREVISION(idTipoRevision)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

--CONSTRAINT PARA DEFINIR COMO FK,PK EN REVISION LA PK DE AJUSTE
ALTER TABLE SERVICIO.REVISION
	ADD  FOREIGN KEY (artIdAjuste) REFERENCES SERVICIO.AJUSTE(artIdAjuste)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA DEFINIR COMO FK,PK EN TECNICO LA PK DE EMPLEADO
ALTER TABLE EMPLEADO.TECNICO
	ADD  FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA RELACIONAR CLIENTE Y TELEFONO
ALTER TABLE VENTA.TELEFONO
	ADD CONSTRAINT rel_clienteTelefono FOREIGN KEY (idCliente) REFERENCES VENTA.CLIENTE(idCliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA RELACIONAR EMPLEADO Y TELEFONOEMPLEADO
ALTER TABLE EMPLEADO.TELEFONOEMPLEADO
	ADD CONSTRAINT rel_empleadoTelefonoEmpleado FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

----CONSTRAINT PARA DEFINIR COMO FK,PK EN USADO LA PK DE COCHE
ALTER TABLE VENTA.USADO
	ADD  FOREIGN KEY (matricula) REFERENCES VENTA.COCHE(matricula)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

--CONSTRAINT PARA RELACIONAR CLIENTE Y USADO
ALTER TABLE VENTA.USADO
	ADD CONSTRAINT rel_clienteUsado FOREIGN KEY (idCliente) REFERENCES VENTA.CLIENTE(idCliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


--Agregando checks
--En AJUSTE.
ALTER TABLE SERVICIO.AJUSTE
ADD CONSTRAINT CH_estatus CHECK (estatus='enProceso' or estatus='concluido' or estatus='entregado')
go
ALTER TABLE SERVICIO.AJUSTE
ADD CONSTRAINT CH_tipoAjuste CHECK (tipoAjuste='revision' or tipoAjuste='reparacion')
go

--En CLIENTE.
ALTER TABLE VENTA.CLIENTE
ADD CONSTRAINT CH_sexo CHECK (sexo='M' or sexo='F')
go

--En COCHE
ALTER TABLE VENTA.COCHE
ADD CONSTRAINT CH_tipoCoche CHECK (tipoCoche='usado' or tipoCoche='nuevo')
go

--En EMPLEADO
ALTER TABLE EMPLEADO.EMPLEADO
ADD CONSTRAINT CH_tipoEmpleado CHECK (tipoEmpleado='Comercial' or tipoEmpleado='Mecanico' or tipoEmpleado='Tecnico')
go

--En REVISION
ALTER TABLE SERVICIO.REVISION
ADD CONSTRAINT CH_planRealizada CHECK (checkPlanRealizada='S' or checkPlanRealizada='N')
go



