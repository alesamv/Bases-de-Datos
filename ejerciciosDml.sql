--Monroy Velázquez Alejandra Sarahí
use corrida;
go

--Inserte 5 registros en la tabla plaza con encabezados
insert corrida.plaza (nombrePlaza, calle, numeroP, colonia, municipio, estado, codigoPostal, capacidad)
values ('plaza1',null,null,null,null,null,null,null),
		('plaza2',null,null,null,null,null,null,null),
		('plaza3',null,null,null,null,null,null,null),
		('plaza4',null,null,null,null,null,null,null),
		('plaza5',null,null,null,null,null,null,null)
select * from corrida.plaza

--Registre 10 registros en la tabla torero, 2 con el apodo que inicie con la letra 'E' y 3 con el apodo 'TORO LOCO'
insert principal.torero 
values (null,'torero1',null,null,'el torero 1',null,'curp1',null,null),
		(null,'torero2',null,null,'el torero 2',null,'curp2',null,null),
		(null,'torero3',null,null,'TORO LOCO',null,'curp3',null,null),
		(null,'torero4',null,null,'TORO LOCO',null,'curp4',null,null),
		(null,'torero5',null,null,'TORO LOCO',null,'curp5',null,null),
		(null,'torero6',null,null,'apodo6',null,'curp6',null,null),
		(null,'torero7',null,null,'apodo7',null,'curp7',null,null),
		(null,'torero8',null,null,'apodo8',null,'curp8',null,null),
		(null,'torero9',null,null,'apodo9',null,'curp9',null,null),
		(null,'torero10',null,null,'apodo10',null,'curp10',null,null)
select * from principal.torero
--No se pueden insertar 3 registros con el mismo apodo a menos que el constraint este deshabilitado
alter index ak_torero_apodo on principal.torero  disable

--Inserte 4 registros en la tabla participa, un registro debe tener pago < 5000
--Primero debemos insertar datos en la tabla corrida.corrida para que no nos marque error
insert corrida.corrida 
values (null,'1'),
		(null,'2'),
		(null,'3'),
		(null,'4')
select * from corrida.corrida

insert corrida.participa
values ('1','9','un premio', '6000'),
		('2','10','dos premios','7000'),
		('3','11','tres premios','8000'),
		('4','12','cuatro premios','3000')
select * from corrida.participa
--No se puede insertar el ultimo registro ya que tiene un pago de 3000 y el check solo nos permite meter mayor a 5000

--Muestre los datos que contiene la tabla torero ordenado por el apodo, verifique el orden
select * from principal.torero order by apodo

--Inserte 5 registros sin encabezado en la tabla apoderado, verifique el reinicio del autoincremental
insert principal.apoderado
values ('apoderado1',null,null,null,null,null,null,null,null),
		('apoderado2',null,null,null,null,null,null,null,null),
		('apoderado3',null,null,null,null,null,null,null,null),
		('apoderado4',null,null,null,null,null,null,null,null),
		('apoderado5',null,null,null,null,null,null,null,null)
select * from principal.apoderado

--Inserte para cada apoderado al menos 2 teléfonos
insert principal.telefono
values ('10','telefono11',null,'10'),
		('10','telefono12',null,'10'),
		('11','5512345678',null,'11'),
		('11','5511234567',null,'11'),
		('12','5511345678',null,'12'),
		('12','5511456789',null,'12'),
		('13','telefono31',null,'13'),
		('13','telefono32',null,'13'),
		('14','telefono41',null,'14'),
		('14','telefono42',null,'14')
select * from principal.telefono

/*update principal.telefono set telefonoNum = '5511456789' where telefono_id = 12
select * from principal.telefono*/

--Borre el apoderado número 4 y verifique el borrado en cascada
delete from principal.apoderado where apoderado_id = 13
select * from principal.apoderado

--Modifique la tabla apoderado para que el campo llave no sea autoincremental
SET IDENTITY_INSERT principal.apoderado OFF

--Modifique el id del apoderado 3 a 10
update principal.apoderado set apoderado_id = 10 where nombreAp = 'apoderado3'
--No se puede porque el apoderado1 tiene ese id 
select * from principal.apoderado
update principal.apoderado set apoderado_id = 1 where nombreAp = 'apoderado3'

--Actualizar el apellido paterno y el padrino de los toreros con apodo 'TORO LOCO'
update principal.torero set padrinoTorero = 9 where apodo = 'TORO LOCO'
update principal.torero set paternoTorero = 'apPat TORO LOCO' where apodo = 'TORO LOCO'

--Elimina los teléfonos del apoderado 1 en una transacción
begin tran
delete from principal.telefono where apoderado_id = 10
commit tran

/*Crea una transacción que haga lo siguientes
Crea una corrida con 2 toreros cada uno con un apoderado (uno con apodo ‘El guicho’)
Guarda en un punto de salvado
Modifique el torero con apodo ‘El guicho’ a ‘EL MEJOR’
Da roll back al save point
Muestra la tablas
Almacena la transacción*/
begin tran
insert corrida.participa values ('4', '14', null, null), ('4', '15', null, null)
update principal.torero set apoderado_id = 10 where torero_id = 14
update principal.torero set apoderado_id = 11 where torero_id = 15
update principal.torero set apodo = 'El guicho' where torero_id = 14

save tran punto1
update principal.torero set apodo = 'El mejor' where torero_id = 14

rollback transaction punto1

select * from corrida.participa
select * from principal.apoderado
select * from principal.torero

rollback tran


/*Cree la tabla dependiente y relacione con la tabla torero
campos: curp, paterno, materno, nombre, tipo
la llave es el curp, el índice nómbrelo de acuerdo a la nomenclatura
cree el indice unique requerido*/
create table principal.dependiente 
(	
	curp char(18) null,
	paterno varchar(30) null,
	materno varchar(30) null,
	nombre varchar(30) null,
	tipo varchar(30) null,
	torero_id int not null,
	dependiente_id int IDENTITY (1,1) primary key
)
go

alter table principal.dependiente
	add constraint rel_toreroDependiente foreign key (torero_id) references principal.torero (torero_id),
	constraint ak_uniqueCurp unique (curp)
go

--Inserte 2 registros para el torero con id 1,2,3 y 4
--(No hay id 1,2,3 y 4 por lo que usamos el 9,10,11,12)
insert principal.dependiente
values('curp1','paterno1',null,'dependiente11', null,'9'),
		('curp2','paterno2',null,'dependiente12', null,'9'),
		('curp3','paterno3',null,'dependiente21', null,'10'),
		('curp4','paterno4',null,'dependiente22', null,'10'),
		('curp5','paterno5',null,'dependiente31', null,'11'),
		('curp6','paterno6',null,'dependiente32', null,'11'),
		('curp7','paterno7',null,'dependiente41', null,'12'),
		('curp8','paterno8',null,'dependiente42', null,'12')

--Muestre los datos y verifique como esta ordenada la tabla
select * from principal.dependiente

--Muestre los datos ordenado por el apellido paterno ordene por esa columna
select * from principal.dependiente order by paterno

--Vea el plan de ejecución
exec sp_help 'principal.dependiente'

--Cree el índice NONCLUSTERED NC_paterno
create unique nonclustered index NC_paterno on principal.dependiente (paterno)

--Muestre los datos y vea el plan de ejecución
select * from principal.dependiente
exec sp_help 'principal.dependiente' 

exec sp_help 'principal.apoderado'