--Monroy Velázquez Alejandra Sarahi
--Creación de la base de datos corrida
create database corrida;
go

use corrida;
go

--Creamos el esquema corrida
create schema corrida authorization dbo;
go
--Creamos el esquema principal
create schema principal authorization dbo;
go

--Creamos la tabla apoderado en el esquema principal
create table principal.apoderado
(
	nombreAp nvarchar(30) null,
	peternoAp varchar(30) null,
	maternoAp varchar(30) null,
	calleAp varchar(40) null,
	coliniaAp varchar(40) null,
	municipioAp varchar(50) null,
	estadoAp varchar(30) null,
	codigoPostalAp char(5) null,
	apoderado_id smallint IDENTITY (1,1) primary key
)
go
--Creamos la tabla telefono en el esquema principal
create table principal.telefono
(
	telefono_id tinyint IDENTITY (1,1) primary key,
	apoderado_id smallint null,
	telefonoNum varchar(18) null,
)
go
--Creamos la tabla plaza en el esquema corrida
create table corrida.plaza
(
	plaza_id tinyint IDENTITY (1,1) primary key,
	nombrePlaza varchar(50) null,
	calle varchar(40) null,
	numeroP varchar (20) null,
	colonia varchar(40) null,
	municipio varchar(50) null,
	estado varchar(30) null, 
	codigoPostal char(5) null,
	capacidad smallint
)
go
--Creamos la tabla corrida en el esquema corrida
create table corrida.corrida
(
	corrida_id tinyint IDENTITY (1,1) primary key,
	ganaderia varchar(50) null,
	plaza_id tinyint null
)
go
--Creamos la tabla torero en el esquema principal
create table principal.torero
(
	torero_id int IDENTITY (1,1) primary key,
	padrinoTorero int null,
	nombreTorero varchar(30) null,
	paternoTorero varchar(30) null,
	maternoTorero varchar(30) null,
	apodo varchar(30) null,
	fechaInicio datetime null,
	curp char(18) null,
	ciidadNacimiento varchar(30) null,
	apoderado_id smallint 
)
go
--Creamos la tabla participa en el esquema corrida
create table corrida.participa
(
	corrida_id int,
	torero_id int,
	premios char(20) null,
	pago decimal(7,2) null
)
go

/*Agregamos el constrain de la relacion entre la tabla apoderado y telefono
asignando como foreign key apoderado_id en la tabla telefono,
tambien se agrega el constraint que hace unique a los campos apoderado_id y telefonoNum*/
alter table principal.telefono
	add constraint rel_apoderadoTelefono foreign key (apoderado_id) references principal.apoderado (apoderado_id),
	constraint ak_1 unique (apoderado_id,telefonoNum)
go

/*Agregamos el constrain de la relacion entre la tabla plaza y corrida
asignando como foreign key plaza_id en la tabla corrida*/
alter table corrida.corrida
	add constraint rel_plazaCorrida foreign key (plaza_id) references corrida.plaza (plaza_id)
	on delete no action
	on update no action
go

/*Agregamos el constrain de la relacion entre la tabla torero y la misma tabla,
asignando como foreign key padrinoTorero en la tabla torero,
tambien se agrega el constrain de la relacion entre la tabla apoderado y torero
asignando como foreign key apoderado_id en la tabla torero,
por ultimo se agrega el constraint que hace unique al curp en la tabla torero*/
alter table principal.torero
	add constraint rel_toreroTorero foreign key (padrinoTorero) references principal.torero (torero_id),
	constraint rel_apoderadoTorero foreign key (apoderado_id) references principal.apoderado (apoderado_id),
	constraint Ak_curp unique (curp)
go

/*Para agregar el constraint de abajo, primero tenemos que modificar corrida_id a tinyint
para que tengan el mismo tipo de dato tanto en la tabla participa como en la tabla corrida*/
alter table corrida.participa
alter column corrida_id tinyint 
go 

/*Agregamos el constrain de la relacion entre la tabla corrida y participa
asignando como foreign key corrida_id en la tabla participa
tambien agregamos el constrain de la relacion entre la tabla */
alter table corrida.participa
	add constraint rel_corridaParticipa foreign key (corrida_id) references corrida.corrida (corrida_id),
	constraint rel_toreroParticipa foreign key (torero_id) references principal.torero (torero_id)
go

--Configuramos corrida_id, y torero_id como obligatorias
alter table corrida.participa 
alter column corrida_id tinyint not null
go

alter table corrida.participa
alter column torero_id int not null
go

--Agregamos el constraint para que corrida_id y torero_id sean nuestra primary key de la tabla participa
alter table corrida.participa
	add constraint pk_participa primary key clustered (corrida_id,torero_id)
go
