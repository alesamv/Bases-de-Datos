----------------------------------------------------------------------------------------------------------------------------------------
/* validaTriggers
Autores: 
Cruz Zavala Miguel Angel
Dominguez Cisneros Alexis Saul 
Monroy Velázquez Alejandra Sarahí

Fecha de Creacion: 12/11/2019
Fecha de modificacion: 13/11/2019
Fecha de modificacion: 14/11/2019
Descripción: Script que muestra pruebas que confirman el funcionamiento de los triggers.
*/
----------------------------------------------------------------------------------------------------------------------------------------

use Concesionario
go

-------------------------------------------------------------------------------
BEGIN TRAN
go
--Antes de insertar empleados observamos cómo se encuentran las tablas EMPLEADO,COMERCIAL,TECNICO Y MECANICO.
--La columna vacia con un alias es para identificar la tabla consultada.
SELECT * FROM EMPLEADO.EMPLEADO
SELECT ' ' as Comerciales, * FROM EMPLEADO.COMERCIAL
SELECT ' ' as Tecnicos,* FROM EMPLEADO.TECNICO
SELECT ' ' as Mecanicos,* FROM EMPLEADO.MECANICO



/*Insertamos diferentes empleados tanto, comerciales, tecnicos y mecanicos para comprobar el

--TRIGGER " TR_herenciaEmpleado "--

Nos debe llenar automaticamente la tabla COMERCIAL y TECNICO, a la vez nos debe mostrar una consulta donde
se vean los numEmpleado que se deben agregar a la tabla MECANICO*/
INSERT INTO EMPLEADO.EMPLEADO
(nombreEmpleado,apPatEmpleado,apMatEmpleado,fechaIngreso,fechaNacEmpleado,sueldo,calleEmpleado,numeroEmpleado,coloniaEmpleado,municipioEmpleado,estadoEmpleado,tipoEmpleado)
				 VALUES 
				 		('Juan','Perez','Gacia','2015-06-23','1974-08-30','2500','Insurgentes','8965','NUEVA ANITA','Magdalena Contreras','CDMX','MECANICO'),
						('Alexis','Díaz','Portillo','2012-10-12','1980-11-30','3000','Eje 3 Norte','6482','PANTITLAN III','Coyoacán','CDMX','TECNICO'),
						('Ares','Jiménez','García','2008-04-03','1977-02-15','2260','Olimpia','5226','5 DE MAYO','Milpa Alta','Puebla','TECNICO'),
						('Mauricio','Aguilera','Roa','2013-08-01','1990-05-22','2900','Rafael','9858','CENTRO II','Amatepec','Hidalgo','COMERCIAL'),
						('Joel','Feria','Bermudez','2011-05-11','1986-04-12','2100','Blanco','4192','GOMEZ FARIAS','Tlalpan','Puebla','MECANICO'),
						('Luis','Fuentes','Bello','2010-06-03','1970-04-05','2700','La pradera','9781','Neza','Atlautla','Mexico','MECANICO')
--Verificamos nuevamente las tablas EMPLEADO,COMERCIAL,TECNICO Y MECANICO para verificar que se introdujerons los datos que deberian.
--Debemos observar que las tablas EMPLEADO,COMERCIAL y TECNICO se agregaron datos, mientras que en la tabla MECANICO no.
SELECT * FROM EMPLEADO.EMPLEADO
SELECT ' ' as Comerciales, * FROM EMPLEADO.COMERCIAL
SELECT ' ' as Tecnicos,* FROM EMPLEADO.TECNICO
SELECT ' ' as Mecanicos,* FROM EMPLEADO.MECANICO
go


/*Insertaremos dos mecanicos para corroborar el funcionamiento del

--TRIGGER " TR_herenciaEmpleado "--

Se debe mostrar como consulta los numeros de empleado que falta agregar en mecanico,
y un mensaje que nos diga que el numEmpleado no existe como tipo 'Mecanico' o que ya se ha agregado en la tabla
MECANICO.*/
INSERT EMPLEADO.MECANICO VALUES (5,'Universidad'),(2,'Universidad')

--Agregamos otro valor y nuevamente nos regresa una consulta con los mecanicos que falta agregar en la tabla MECANICO
insert EMPLEADO.MECANICO values(1,'CarreraTecnica')

/*En este insert nos debera regresar el mensaje de que ya existe el empleado en la tabla mecanico, ya que
en el insert anterior insertamos el 1, ademas que como agregamos el ultimo mecanico restante nos regresara
una consulta con una cadena que diga 'Ninguno' ya que no hace falta agregar mas mecanicos a la tabla MECANICO*/
insert EMPLEADO.MECANICO values(1,'CarreraTecnica'),(6,'Maestria'),(5,'MAESTRIA')

--Verificamos las insersiones en tabla empleado. y hacemos el rollback. Para finalmente resetear el auto incremental.
SELECT ' ' as MECANICO,* FROM EMPLEADO.MECANICO
go


/*Insertamos dos cliente para comprobar el funcionamiento del 

--TRIGGER TR_contactoCliente--

Esto nos debe regresara dos mensaje diciendonos que debemos insertar datos de contacto para los cliente insertados.*/
INSERT into venta.cliente(
sexo,fechaNacCliente,rfc,nombreCliente,apPatCliente,apMatCliente,calle,numero,colonia,municipio,estado)
values ('F','1995-11-23','MAPR960508AE0','Alejadra','Monrroy','Velazquez','vista alegre','15', 'Bilbao','Vizcaya', 'Vasco'),
		('M','1985-01-05','GOLM850105SG7','Luis','González', 'Méndez','Morelos','9', 'San Lazaro','Coyoacan', 'CDMX')
go


/*Insertamos varios coches para comprobar el funcionamiento del 

--TRIGGER TR_herenciaCoche--

Al insertar los choches como insertamos almenos uno de tipo usado se nos debe mostrar una consulta diciendonos cuales matriculas
deben ser registradas en la tabla VENTA.USADO */
INSERT INTO VENTA.COCHE
VALUES ('9227WEL','Audi A1','191200','Nuevo'),
		('9245YSE','Audi A6','538900','Usado'),
		('7424WPC','Audi TT','421900','Usado'),
		('1527OLS','Audi Q2','233500','Usado'),
		('6446WFJ','BMW Serie1','288000','Usado')
go

--En el caso de que solo insertemos coches de tipo nuevo, no se nos mandara ningun mensaje.
INSERT INTO VENTA.COCHE
VALUES ('9614RYC','BMW Serie4','365650','Nuevo'),
		('0812PAU','BMW Serie8','1126000','Nuevo')
go


/*Insertamos registros en la tabla VENTA.USADO para comprobar el funcionamiento del

--TRIGGER TR_usadosRestantes--

Insertaremos los cuatro coches usados que tenemos registrados en la tabla VENTA.COCHE, los cuatro
con el cliente 1, el trigger nos regresara un mensaje de que son maximo 3 coches usados por cliente, solo 
se registraran los 3 primeros registros y el ultimo no debido a esa restriccion, al final nos mostrara una
consulta de qué matriculas aun se deben registrar en la tabla VENTA.USADO */
INSERT INTO VENTA.USADO
VALUES ('9245YSE',1),
		('7424WPC',1),
		('1527OLS',1),
		('6446WFJ',1)
go

/*Ahora si insertamos nuevamente la ultima matricula del insert anterior pero en otro cliente no nos mandara el
mensaje ya que el cliente 2 no tiene ni un coche usado registrado, tambien al tratar de insertar la matricula '9614RYC'
que pertenece a un coche registrado como nuevo, se nos regresara un mensaje de que la matricula no pertenece a un
coche usado y omitiendo dicho insert.*/
INSERT INTO VENTA.USADO
VALUES ('6446WFJ',2),
		('9614RYC',2)
go

/*Insertamos registros en la tabla SERVICIO.AJUSTE para comprobar el funcionamiento del

--TRIGGER TR_iva--

Despues de hacer una consulta de los ajustes insertados podemos observar que el valor del iva es igual al 16% del costo
apesar de haber introducido el valor como nulo, eso gracias al trigger.*/
INSERT INTO SERVICIO.AJUSTE 
	VALUES  ('7424WPC',1,1,1,'revision',3000,'2018-12-15','3 dias',null,'enProceso')
	INSERT INTO SERVICIO.AJUSTE 
	VALUES ('9614RYC',5,1,2,'reparacion',5500,'2018-01-06','2 semanas',null,'concluido')	
INSERT INTO SERVICIO.AJUSTE 
	VALUES ('6446WFJ',6,2,3,'revision',1800,'2017-09-02','2 dias',null,'entregado')
SELECT * FROM SERVICIO.AJUSTE
go

--Se requiere insertar los catalogos de tipo revision y tipo reparacion.
INSERT INTO SERVICIO.TIPOREVISION 
VALUES	('Tanque'),
		('bolsas de aire'),
		('balatas')
INSERT INTO SERVICIO.TIPOREPARACION
VALUES	('pintura'),
		('ojalateria'),
		('choque')


/*Insertamos registros en la tabla SERVICIO.REVISION para corroborar el funcionamiento del  

--TRIGGER TR_confirmarRevision--

Despues de insertar estos registros y hacer una consulta observaremos que en la consulta solo se inserto el primer registro, con el id 1
esto debido a que el id 1 si esta en la tabla AJUSTE y es del tipo reparacion, por otro lado el id del segundo registro si existe en la tabla AJUSTE
pero es de tipo reparacion, por lo tanto no es insertado. Finalmente el id del tercer registro no existe en la tabla AJUSTE y 
por lo tanto tampoco se toma en cuenta.*/
INSERT INTO SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	VALUES	(1,1,5,'2017-02-05','S','2017-06-08')
INSERT INTO SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	VALUES(2,2,5,'2017-12-15','N','2018-01-08')
INSERT INTO SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	VALUES(4,3,6,'2017-11-15','S','2018-09-10')
SELECT * FROM servicio.revision


/*Insertamos registros en la tabla SERVICIO.REPARACION para corroborar el funcionamiento del  

--TRIGGER TR_confirmarReparaciones--

Despues de insertar estos registros y hacer una consulta observaremos que en la consulta solo se inserto el segundo registro, con el id 2
esto debido a que el id 2 si esta en la tabla AJUSTE y es del tipo reparacion, por otro lado el id  del primer registro si existe en la tabla AJUSTE
pero es de tipo reparacion, por lo tanto no es insertado. Finalmente el id del tercer registro no existe en la tabla AJUSTE y 
por lo tanto tampoco se toma en cuenta.*/
INSERT SERVICIO.REPARACION
	VALUES	(3,1)
INSERT SERVICIO.REPARACION
	VALUES	(2,3)
INSERT INTO SERVICIO.REPARACION
	VALUES	(4,2)
select * FROM SERVICIO.REPARACION
go


ROLLBACK TRAN
DBCC checkident('empleado.empleado',reseed,0)
DBCC CHECKIDENT('VENTA.CLIENTE',RESEED,0)
DBCC CHECKIDENT('SERVICIO.AJUSTE',RESEED,0)
DBCC CHECKIDENT('SERVICIO.TIPOREPARACION',RESEED,0)
DBCC CHECKIDENT('SERVICIO.TIPOREVISION',RESEED,0) 
go