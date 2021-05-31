----------------------------------------------------------------------------------------------------------------------------------------
/* cargaInicial
Autores: 
Cruz Zavala Miguel Angel
Dominguez Cisneros Alexis Saul 
Monroy Velázquez Alejandra Sarahí

Fecha de Creacion: 6/11/2019
Fecha de modificacion: 11/11/2019
Fecha de modificacion: 13/11/2019
Fecha de modificacion: 14/11/2019
Descripción: Insertando clientes 
*/
----------------------------------------------------------------------------------------------------------------------------------------

use Concesionario
go

--insert de comprobacion de usuarioModifica
INSERT into venta.cliente(
sexo,fechaNacCliente,rfc,nombreCliente,apPatCliente,apMatCliente,calle,numero,colonia,municipio,estado)
values ('F','1995-11-23','MAPR960508AE0','Alejadra','Monrroy','Velazquez','vista alegre','15', 'Bilbao','Vizcaya', 'Vasco')
go

--insert de comprobacion de usuarioModifica 2
INSERT INTO VENTA.CLIENTE(
sexo,fechaNacCliente,rfc,nombreCliente,apPatCliente,apMatCliente,calle,numero,colonia,municipio,estado)
VALUES  ('M','1985-01-05','GOLM850105SG7','Luis','González', 'Méndez','Morelos','9', 'San Lazaro','Coyoacan', 'CDMX')
go

-- insertar clientes 
INSERT INTO VENTA.CLIENTE(
sexo,fechaNacCliente,rfc,nombreCliente,apPatCliente,apMatCliente,calle,numero,colonia,municipio,estado)
VALUES 	('M','1993-11-07','GOMG931107KD9','Gabriel','González','Mendoza','Hidalgo','752', 'Izcali','Ixtapaluca', 'Mexico'),
		('M','1977-03-18','OSOC770318IH7','Christian','Osorio','Osorio','Independencia','48', 'Valle','Chalco', 'Mexico'),
		('F','1990-08-26','SAMD900826OK3','Daniela','Santos','Martínez','San Antonio','630', 'Presa','San Francisco', 'Oaxaca'),
		('M','1991-02-28','FLME910228IN7','Emanuel','Flores','Martínez','vista alta','4', 'Benito Juarez','Tlateloco', 'CDMX'),
		('F','1982-11-23','CAMM960508AE7','Montserrat','Caballero','Montaño','vista alegre','15', 'Bilbao','Vizcaya', 'Vasco'),
		('F','1993-06-16','MAGM930616GU5','Maria','Martínez','Gómez','Zaragoza','530','Agricola','Iztapalapa','CDMX'),
		('M','1995-07-30','COSA950730VG8','Adrián','Cohen','Suárez','Hidalgo','121', 'Heroes','Chila', 'Puebla'),
		('M','1982-07-20','LEVI920720HV4','Iván','Leguízamo','Valdés','Rosal','3', 'Colinas','Gustavo A. Madero.', 'Mexico'),
		('M','1990-08-16','VAFC900816PI4','Carlos','Vázquez','Flores','Aldama','MZ48', 'La Colonia','Epatlán', 'Puebla'),
		('F','1997-12-23','GOHL971223IU1','Lorena','González','Hernández','Auris','687', 'Acozac','Cuautitlán', 'Mexico'),
		('M','1996-10-27','NERF961027OH7','Francisco','Negrete','Reséndiz','Aquiles','36', 'Paletera','Azcapotzalco', 'CDMX'),
		('M','1993-01-25','RAVY930125OI6','Yafte','Ramírez','Viramontes','Zapata','397','Andes','Cuauhtémoc','CDMX'),
		('M','1994-03-22','DULO940322TD1','Oscar','Durón','Luna','Hidalgo','237', 'Izcali','Ixtapaluca', 'Mexico'),
		('F','1988-06-08','ZAEL880608YU2','Lisset','Zavala','Estala','Libertad','318', 'Covarrubias','Atempan', 'Puebla'),
		('M','1990-08-26','RECS900826OK3','Sergio','Reza','Chavarria','San Angel','856', 'Iman','Actopan', 'Hidalgo'),
		('M','1991-12-28','GACG911228UT2','Gael','García','Chávez','vista alta','49', 'Benito Juarez','Tlateloco', 'CDMX'),
		('F','1992-11-23','ROCC921123IU9','Carla','Rodriguez','Colorado','Obregon','152', 'Alexa','Almoloya', 'Hidalgo'),
		('F','1993-06-16','GATD930616EW2','Damaris','Galarza','Torres','Juana','50','Andromeda','Chicoloapan','Mexico'),
		('M','1989-05-06','GOTS890506JV2','Steven','González','Tapia','Hidalgo','821', 'Herodes','Esperanza', 'Puebla'),
		('M','1996-01-28','DULK960128TD1','Kevin','Durón','Luna','Hidalgo','237', 'Izcali','Ixtapaluca', 'Mexico');
		
SELECT * FROM VENTA.CLIENTE
go

--insertar mail clientes 
INSERT INTO VENTA.EMAIL
VALUES  (1,	'xyne-9515@yopmail.com'),
		(2, 'ullixiwo1@yopmail.com'),
		(3,'ugaddallare@yopmail.com'),
		(4,'aqappy-0957@yopmail.com'),
		(5,'simmarigako@yopmail.com'),
		(6,'quxu-4054@yopmail.com'),
		(7,'eddikuqyqu@yopmail.com'),
		(8,'pammi-3200@yopmail.com'),
		(9,'onissapelle@yopmail.com'),
		(10,'tillekagomm@yopmail.com'),
		(11,'celopatin-4659@yopmail.com'),
		(12,'yzimmozett@yopmail.com'),
		(13,'kuravaxammi@yopmail.com'),
		(14,'lleqasa-8376@yopmail.com'),
		(15,'ifoqamo-4678@yopmail.com'),
		(16,'idegemec@yopmail.com'),
		(17,'elusappeb@yopmail.com'),
		(18,'raffuzikav@yopmail.com'),
		(19,'ehesutos@yopmail.com'),
		(20,'ommajexoj@yopmail.com'),
		(21,'recekemi@yopmail.com'),
		(22,'ponimixaho@yopmail.com');
select * from VENTA.EMAIL
go

--insertando numeros de telefono de clientes 
INSERT VENTA.TELEFONO
VALUES  (1,	  '545343209'),
		(2, '521971288'),
		(3,'527043452'),
		(4,'511356980'),
		(5,'501363461'),
		(6,'580432236'),
		(7,'572823068'),
		(8,'567708934'),
		(9,'581349493'),
		(10,'517374567'),
		(11,'574841512'),
		(12,'505834978'),
		(13,'518280917'),
		(14,'574261755'),
		(15,'507138721'),
		(16,'519001839'),
		(17,'521678195'),
		(18,'570861575'),
		(19,'557568579'),
		(20,'552545612'),
		(21,'522150136'),
		(22,'513650471');
select * from VENTA.TELEFONO
go

--insertar empleados 
INSERT INTO EMPLEADO.EMPLEADO
(nombreEmpleado,apPatEmpleado,apMatEmpleado,fechaIngreso,fechaNacEmpleado,sueldo,calleEmpleado,numeroEmpleado,coloniaEmpleado,municipioEmpleado,estadoEmpleado,tipoEmpleado)
				 VALUES 
				 		('Juan','Perez','Gacia','2015-06-23','1974-08-30','2500','Insurgentes','8965','NUEVA ANITA','Magdalena Contreras','CDMX','TECNICO'),
						('Alexis','Díaz','Portillo','2012-10-12','1980-11-30','3000','Eje 3 Norte','6482','PANTITLAN III','Coyoacán','CDMX','TECNICO'),
						('Ares','Jiménez','García','2008-04-03','1977-02-15','2260','Olimpia','5226','5 DE MAYO','Milpa Alta','Puebla','TECNICO'),
						('Mauricio','Aguilera','Roa','2013-08-01','1990-05-22','2900','Rafael','9858','CENTRO II','Amatepec','Hidalgo','TECNICO'),
						('Joel','Feria','Bermudez','2011-05-11','1986-04-12','2100','Blanco','4192','GOMEZ FARIAS','Tlalpan','Puebla','TECNICO'),
						('Luis','Fuentes','Bello','2010-06-03','1970-04-05','2700','La pradera','9781','Neza','Atlautla','Mexico','TECNICO'),

						('Fernando','Flores','Flores','2009-03-07','1975-11-08','2500','REP. DE BELICE','5168','RAMOS MILLAN','Xochimilco','CDMX','COMERCIAL'),
						('Eduardo','Chavez','Muñoa','2016-08-17','1993-07-14','2300','IXTLAZIHUAT','7891','GRANJAS MEXICO','Coyoacán','Hidalgo','COMERCIAL'),
						('Gabriel','Reza','Chavarria','2011-04-23','1974-08-30','1500','PASEO TOLLOCAN','6518','NICOLAS BRAVO','Atenco','Puebla','COMERCIAL'),
						('Joaquín','Valdespino','Mendieta','2009-06-27','1980-10-10','2000','República Argentina','9811','VISTAS MAUREL','Toluca','Puebla','COMERCIAL'),
						('Gerardo','Fernández','Lucero','2012-10-14','1978-10-13','1500','Circuito Interior','1417','ZAPOTLA','Magdalena Contreras','Puebla','COMERCIAL'),
						('Alonso','García','Chávez','2015-06-03','1980-10-22','2000','Río Consulado','6811','JANITZIO','Aculco','Mexico','COMERCIAL'),
						('Patricio','Jaime','Porras','2015-04-23','1976-11-21','1800','Calzada Vigas','6891','AZTECA','Iztapalapa','Mexico','COMERCIAL'),
						('Adonaí','Escudero','Fierros','2013-06-23','1977-02-13','2300','Chapultepec','7841','CUATRO ARBOLES','Iztapalapa','CDMX','COMERCIAL'),
						('Paul','Varela','García','2014-03-10','1974-05-18','1600','Manzanares','1557','OLIMPICA','Milpa Alta','Puebla','COMERCIAL'),
						('Yafte','Ramírez','Viramontes','2012-10-23','1979-10-22','1900','Río Consulado','5484','EL CARMEN','Aculco','Tlaxcala','COMERCIAL'),

						('Tomás','Rivera','Torres','2015-06-23','1984-08-30','3000','Ines 1','4961','La asuncion','Tlalpan','CDMX','MECANICO'),
						('Oscar','Durón','Luna','2015-06-23','1974-08-30','3500','Paseo de la Reforma','4521','SAN FELIPE','Milpa Alta','CDMX','MECANICO'),
						('David','Fuentes','Bello','2015-06-23','1974-08-30','4000','Tláhuac','6541','MIRADOR ','Coyoacán','Hidalgo','MECANICO'),
						('Lisset','Zavala','Estala','2015-06-23','1974-08-30','5000','Bucareli','2654','SAN MIGUEL','Iztapalapa','Puebla','MECANICO'),
						('Manuel','Negrete','Reséndiz','2015-06-23','1974-08-30','3600','Manzanares','9851','EL CARMEN','Tláhuac','Mexico','MECANICO'),
						('Emmanuel','Xolalpa','Álvarez','2015-06-23','1974-08-30','3100','Eje 10 Sur','7852','LA NORIA','Tláhuac','CDMX','MECANICO');
SELECT * FROM EMPLEADO.EMPLEADO
go

--insertando escolaridad de los mecanicos (requerido)
INSERT INTO EMPLEADO.MECANICO 
VALUES  (17,'Universidad'),
		(18,'Carrera Tecnica'),
		(19,'Universidad'),
		(20,'Maestria'),
		(21,'Carrera Tecnica'),
		(22,'Carrera Tecnica')
go

--insertando cursos
INSERT INTO EMPLEADO.CURSO
VALUES  (17,'Chapa y carroseria'),
		(18,'Mecanica Rapida'),
		(19,'Electronica'),
		(20,'Reprogramacion'),
		(21,'Dimsport'),
		(22,'Diagnostico motor')
select * from EMPLEADO.CURSO
go

--insertando correos de empleado 
INSERT EMPLEADO.EMAILEMPLEADO
VALUES  (1,'ppatton@thomas.com'),
		(2,'craighenry@hart.net'),
		(3,'thompsonjoseph@gmail.com'),
		(4,'brian80@wright-callahan.org'),
		(5,'suarezhannah@hotmail.com'),
		(6,'jlynch@nixon.com'),
		(7,'vchambers@smith.info'),
		(8,'youngjamie@mar-rick.com'),
		(9,'joshua49@gmail.com'),
		(10,'efrye@yahoo.com'),
		(11,'bellhannah@weiss.net'),
		(12,'swilliams@walters-doyle.com'),
		(13,'robert79@douglas.com'),
		(14,'christinehoover@gmail.com'),
		(15,'sandrat@taylormcdonald.org'),
		(16,'sgolden@padilla.biz'),
		(17,'dwest@silva-cruz.com'),
		(18,'michaela49@hotmail.com'),
		(19,'ylambert@chen.com'),
		(20,'fhorne@lee.org'),
		(21,'iroqeffi-9163@yopmail.com'),
		(22,'gazosati-7164@yopmail.com');
select * from EMPLEADO.EMAILEMPLEADO
go

--insertando numeros de telefono de empleados
INSERT EMPLEADO.TELEFONOEMPLEADO
VALUES  (1,'5522837804'),
		(2,'5513008825'),
		(3,'5562291797'),
		(4,'5536729013'),
		(5,'5504255565'),
		(6,'5547984204'),
		(7,'5573087750'),
		(8,'5552932358'),
		(9,'5514458256'),
		(10,'5587015423'),
		(11,'5509365568'),
		(12,'5504595041'),
		(13,'5566535246'),
		(14,'5589119146'),
		(15,'5593573033'),
		(16,'5537724477'),
		(17,'5501680602'),
		(18,'5516286544'),
		(19,'5557211993'),
		(20,'5540131300'),
		(21,'5510945503'),
		(22,'5584201811');
select * from EMPLEADO.TELEFONOEMPLEADO
go

--insertando coches
INSERT INTO VENTA.COCHE
VALUES ('9227WEL','Audi A1','191200','Nuevo'),
		('9245YSE','Audi A6','538900','Nuevo'),
		('7424WPC','Audi TT','421900','Nuevo'),
		('1527OLS','Audi Q2','233500','Nuevo'),
		('6446WFJ','BMW Serie1','288000','Nuevo'),
		('9614RYC','BMW Serie4','365650','Nuevo'),
		('0812PAU','BMW Serie8','1126000','Nuevo'),
		('1791WNP','BMW X3','413250','Nuevo'),
		('4347JAQ','Tesla Model 3','591000','Nuevo'),
		('5164CSY','Tesla Model X','962300','Nuevo'),
		('7135RZT','Lexus CT','249000','Usado'),
		('1615XMO','Lexus ES','450000','Usado'),
		('4614TBV','Lexus UX','299000','Usado'),
		('1816NHA','Mazda2','128500','Usado'),
		('6008UMD','Mazda3','207650','Usado'),
		('3666XUV','Mazda MX-5','219290','Usado'),
		('6201HLL','Infiniti Q30','271250','Usado'),
		('4091UMB','Infiniti QX30','416250','Usado'),
		('5694YAN','Volvo V40','209000','Usado'),
		('2455IOB','Volvo S90','479000','Usado'),
		('9227WIM','Audi A1','191200','Nuevo'),
		('9245YZW','Audi A6','538900','Nuevo'),
		('7424WFQ','Audi TT','421900','Nuevo'),
		('1527OKD','Audi Q2','233500','Nuevo'),
		('6446WGT','BMW Serie1','288000','Nuevo'),
		('9614RAQ','BMW Serie4','365650','Nuevo'),
		('0812PZW','BMW Serie8','1126000','Nuevo'),
		('1791WSX','BMW X3','413250','Nuevo'),
		('4347JED','Tesla Model 3','591000','Nuevo'),
		('5164CCR','Tesla Model X','962300','Nuevo'),
		('7135RFV','Lexus CT','249000','Usado'),
		('1615XTG','Lexus ES','450000','Usado'),
		('4614TBY','Lexus UX','299000','Usado'),
		('9227WKI','Audi A1','191200','Nuevo'),
		('9245YÑP','Audi A6','538900','Nuevo'),
		('6446WYF','BMW Serie1','288000','Usado'),
		('9614RHD','BMW Serie4','365650','Usado')
SELECT * FROM VENTA.COCHE
go

--insertando los id de los clientes propietarios de los coches usados
INSERT INTO VENTA.USADO
VALUES ('7135RZT',5),
		('1615XMO',6),
		('4614TBV',7),
		('1816NHA',8),
		('6008UMD',6),
		('3666XUV',9),
		('6201HLL',13),
		('4091UMB',14),
		('5694YAN',9),
		('2455IOB',9),
		('7135RFV',1),
		('1615XTG',3),
		('4614TBY',15),
		('6446WYF',7),
		('9614RHD',19)
SELECT * FROM VENTA.USADO
go

--insertando en extras de los coches
INSERT INTO VENTA.EXTRASCOCHE
VALUES ('4347JAQ','GPS'),
		('5164CSY','Conduccion Atonoma'),
		('7424WPC','SensordeAparcamiento'),
		('1527OLS','Asientos Deportivos'),
		('6446WFJ','Tapizado de Cuero'),
		('9614RYC','GPS'),
		('3666XUV','Wi-fi'),
		('6201HLL','Aire Acondicionado'),
		('4091UMB','SensordeAparcamiento'),
		('4614TBY','Asientos Deportivos'),
		('9227WKI','Tapizado de Cuero'),
		('0812PAU','Aire Acondicionado'),
		('1791WNP','Wi-fi'),
		('9245YÑP','GPS'),
		('6446WYF','Asientos Deportivos')
SELECT * FROM VENTA.EXTRASCOCHE ORDER BY idExtraCoche
go

--insertando compras
INSERT INTO VENTA.COMPRA
VALUES (1,'9227WEL','2016-12-10 13:23:44','191200'),
		(2,'9245YSE','2016-12-24 09:03:54','538900'),
		(3,'1527OLS','2016-12-01 15:28:41','233500'),
		(4,'6446WFJ','2016-12-27 13:06:04','288000'),
		(5,'9614RYC','2016-12-09 14:45:08','365650'),
		(6,'0812PAU','2015-10-06 18:05:09','1126000'),
		(7,'1791WNP','2013-10-20 15:09:54','413250'),
		(8,'4347JAQ','2013-10-14 10:00:01','591000'),
		(9,'5164CSY','2015-08-09 14:15:02','962300'),
		(10,'7135RZT','2015-05-05 18:06:16','249000'),
		(11,'4614TBV','2015-04-19 14:58:56','299000'),
		(12,'1816NHA','2014-08-05 15:19:14','128500'),
		(13,'6008UMD','2014-03-09 16:20:59','207650'),
		(14,'3666XUV','2014-07-06 09:10:30','219290'),
		(15,'6201HLL','2015-01-09 12:20:15','271250'),
		(16,'4091UMB','2015-02-28 14:50:35','416250'),
		(17,'5694YAN','2015-05-17 17:46:25','209000'),
		(18,'2455IOB','2015-09-09 15:58:47','479000'),
		(19,'9227WIM','2015-08-06 18:20:19','191200'),
		(20,'9245YZW','2015-04-04 16:38:58','538900'),
		(14,'6446WGT','2016-04-25 15:56:08','288000'),
		(10,'4347JED','2015-05-05 17:08:46','591000'),
		(4,'5164CCR','2016-08-09 16:18:02','962300'),
		(13,'1615XTG','2016-03-09 16:20:59','450000'),
		(16,'9227WKI','2015-10-28 17:49:34','191200')
SELECT * FROM VENTA.COMPRA
go

--insertando en registraCompra
INSERT INTO VENTA.REGISTRACOMPRA
VALUES (1,7,1912),
		(2,7,5389),
		(3,7,2335),
		(4,7,2880),
		(5,7,3656),
		(6,8,1126),
		(7,9,4132),
		(8,9,5910),
		(9,8,9623),
		(10,10,2490),
		(11,11,2990),
		(12,12,1285),
		(13,13,2076),
		(14,12,2192),
		(15,15,2712),
		(16,15,4132),
		(17,10,2090),
		(18,14,4790),
		(19,8,1912),
		(20,11,5389),
		(21,16,2880),
		(22,10,5910),
		(23,13,9623),
		(24,16,4500),
		(25,8,1912)
SELECT * FROM VENTA.REGISTRACOMPRA
go

--ingresar servicio.tiporeparacion
insert into SERVICIO.TIPOREPARACION
values	('pintura'),
		('ojalateria'),
		('choque'),
		('motor'),
		('suspencion'),
		('frenos'),
		('caja de velocidades'),
		('luces'),
		('comp. electricos')		
SELECT * FROM SERVICIO.TIPOREPARACION
go

--ingresar tipo revision 
insert into SERVICIO.TIPOREVISION 
values	('Tanque'),
		('bolsas de aire'),
		('balatas'),
		('motor'),
		('suspencion'),
		('frenos'),
		('caja velocidades'),
		('luces'),
		('comp. electricos')
SELECT * FROM SERVICIO.TIPOREVISION
go

--insertar ajustes
INSERT INTO SERVICIO.AJUSTE 
	VALUES  ('9227WEL',17,1,10,'revision',3000,'2018-12-15','3 dias',10,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES ('9245YSE',17,2,2,'reparacion',5500,'2018-01-06','2 semanas',12,'concluido')	
INSERT INTO SERVICIO.AJUSTE 
	VALUES ('9614RYC',18,5,13,'revision',1800,'2017-09-02','2 dias',12,'entregado')
INSERT INTO SERVICIO.AJUSTE 
	VALUES ('1527OLS',17,3,14,'revision',2000,'2018-04-17','4 dias',5,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES ('6446WFJ',19,4,5,'reparacion',2100,'2018-01-29','4 dias',11,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('1791WNP',20,7,16,'revision',5100,'2018-01-06','3 semanas',5,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9227WEL',22,1,7,'reparacion',1500,'2019-09-03','2 dias',15,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('6008UMD',21,13,18,'revision',1500,'2018-11-20','3 dias',10,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('7135RZT',20,10,11,'revision',3000,'2018-10-13','3 dias',14,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('4347JAQ',18,8,4,'reparacion',7500,'2018-02-16','2 semanas',11,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('1816NHA',19,12,14,'revision',2800,'2019-11-30','2 dias',12,'entregado')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('6008UMD',17,13,2,'reparacion',1000,'2018-05-12','4 dias',15,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('4091UMB',20,16,13,'revision',2500,'2017-09-29','4 dias',13,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('3666XUV',19,14,1,'reparacion',6000,'2018-03-07','3 semanas',10,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9227WIM',20,19,15,'revision',2000,'2017-01-25','2 dias',10,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9245YZW',22,20,6,'reparacion',1000,'2019-08-20','3 dias',12,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('2455IOB',21,18,17,'revision',1100,'2018-10-14','3 dias',11,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('5694YAN',21,17,8,'reparacion',5500,'2017-06-06','2 semanas',11,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('4347JAQ',22,8,17,'revision',1800,'2017-07-07','2 dias',11,'entregado')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9227WKI',18,16,2,'reparacion',2000,'2018-08-18','6 dias',10,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('4091UMB',17,16,11,'revision',2100,'2018-07-10','4 dias',12,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('6446WGT',20,14,1,'reparacion',6100,'2018-02-07','3 semanas',10,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('6008UMD',19,13,13,'revision',1500,'2017-09-03','2 dias',13,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9227WIM',17,19,4,'reparacion',1000,'2018-11-20','2 dias',14,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('4347JAQ',18,8,15,'revision',3500,'2018-10-13','3 dias',15,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('6201HLL',19,15,6,'reparacion',7000,'2018-02-16','2 semanas',11,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9227WIM',21,19,17,'revision',2800,'2019-11-30','2 dias',10,'entregado')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9227WIM',22,19,2,'reparacion',1200,'2018-05-12','4 dias',11,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9245YZW',21,20,12,'revision',2600,'2017-09-29','3 dias',10,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('4347JED',18,10,3,'reparacion',6000,'2018-03-07','5 semanas',10,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9227WKI',17,16,13,'revision',2100,'2017-01-25','3 dias',13,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('1615XTG',18,13,2,'reparacion',1600,'2019-08-20','4 dias',9,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9227WIM',19,19,17,'revision',3000,'2019-12-15','3 dias',11,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('5164CCR',20,4,4,'reparacion',5500,'2018-11-12','2 semanas',11,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('1615XTG',21,13,15,'revision',1800,'2019-09-11','2 dias',10,'entregado')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9245YZW',21,20,1,'reparacion',2000,'2018-04-13','4 dias',11,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('1615XTG',21,13,17,'revision',2100,'2018-01-19','4 dias',10,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('2455IOB',22,18,8,'reparacion',6500,'2017-11-06','3 semanas',12,'enProceso')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('6201HLL',18,15,9,'reparacion',1500,'2017-12-03','2 dias',12,'concluido')
INSERT INTO SERVICIO.AJUSTE 
	VALUES('9227WKI',17,16,4,'reparacion',1500,'2018-01-02','3 dias',10,'enProceso')
select * from servicio.ajuste
go

--ingresar servicio revision
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values	(1,2,17,'2017-02-05','S','2017-06-08')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(3,3,18,'2017-12-15','N','2018-01-08')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(4,4,19,'2017-11-15','S','2018-09-10')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(6,5,20,'2018-01-20','N','2018-06-18')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(8,6,21,'2017-06-25','S','2017-11-07')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(9,7,22,'2017-07-16','S','2018-01-03')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(11,8,22,'2018-09-23','N','2019-06-17')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(13,9,19,'2019-03-08','S','2019-09-15')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(15,2,20,'2018-12-06','S','2019-06-23')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(17,3,21,'2018-12-15','N','2019-01-08')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(19,4,22,'2017-01-15','S','2017-04-10')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(21,5,17,'2019-01-20','N','2019-01-24')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(23,6,19,'2017-08-25','S','2017-08-10')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(25,7,18,'2018-05-06','S','2018-05-09')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(27,8,21,'2018-08-08','N','2018-08-10')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(29,9,21,'2019-04-07','S','2019-04-10')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(31,2,17,'2018-06-07','S','2018-06-10')	
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(33,8,19,'2017-09-30','N','2017-10-3')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(35,9,21,'2018-03-28','S','2018-03-30')
insert into SERVICIO.REVISION (artIdAjuste,idTipoRevision,numEmpleado,fechaPlanificacion,checkPlanRealizada,fechaPlanificacionRealizada)
	values(37,2,21,'2018-10-13','S','2018-10-17')
SELECT * FROM SERVICIO.REVISION
go

--insertar servicio reparacion 
insert into SERVICIO.REPARACION
values	(10,1)
insert into SERVICIO.REPARACION
values	(2,2)
insert into SERVICIO.REPARACION
values	(12,3)
insert into SERVICIO.REPARACION
values	(14,4)
insert into SERVICIO.REPARACION
values	(5,5)
insert into SERVICIO.REPARACION
values	(16,6)
insert into SERVICIO.REPARACION
values	(7,7)
insert into SERVICIO.REPARACION
values	(18,8)
insert into SERVICIO.REPARACION
values	(20,9)
insert into SERVICIO.REPARACION
values	(22,1)
insert into SERVICIO.REPARACION
values	(24,4)
insert into SERVICIO.REPARACION
values	(26,3)
insert into SERVICIO.REPARACION
values	(28,7)
insert into SERVICIO.REPARACION
values	(30,9)
insert into SERVICIO.REPARACION
values	(32,8)
insert into SERVICIO.REPARACION
values	(34,2)
insert into SERVICIO.REPARACION
values	(36,5)
insert into SERVICIO.REPARACION
values	(38,6)
insert into SERVICIO.REPARACION
values	(39,7)
insert into SERVICIO.REPARACION
values	(40,9)
SELECT * FROM SERVICIO.REPARACION
go