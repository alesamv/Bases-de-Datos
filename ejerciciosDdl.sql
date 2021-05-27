--Monroy Velázquez Alejandra Sarahí
use corrida;
go

/*2)Creamos un valor de dominio para el campo sueldo, creando un check para que
el pago sea mayor que 5000.*/
alter table corrida.participa
add constraint CH_PagoPermitido check (pago >= 5000)
go

/*3)Creamos el índice no cluster descendiente para el campo apodo de la tabla torero*/
create unique nonclustered index ak_torero_apodo on principal.torero (apodo desc)
go

/*4)Revisamos la estructura de la tabla torero*/
exec sp_help 'principal.torero'

/*5)Cambiamos el tamaño de la columna coloniaAp de la tabla apoderado a 50*/
alter table principal.apoderado
alter column coliniaAp varchar(50)
go

/*6)Modificamos el campo pago a varchar conservando la misma longitud*/
alter table corrida.participa
drop constraint CH_PagoPermitido

alter table corrida.participa
alter column pago varchar(9) null

/*7)Modificamos el campo pago a decimal de 6 dígitos y 3 decimales*/
alter table corrida.participa
alter column pago decimal (9,3)
go

alter table corrida.participa
add constraint CH_PagoPermitido check (pago >= 5000)
go

/*8)Modificamos la columna apodo de la tabla torero a obligatoria.*/
--Tampoco se puede, porque apodo tiene un constraint que depende de apodo
alter table principal.torero
alter column apodo varchar(30) not null 
go

--Pero cambiamos el nombreTorero a not null
alter table principal.torero
alter column nombreTorero varchar (30) not null
go

/*9)Reiniciamos el autoincremental de la tabla apoderado a 10*/
dbcc checkident ('principal.apoderado', reseed, 10)
go

/*10)Agregamos la columna tipoTelefono a la tabla telefono con tipo de dato varchar(15)
null.*/
alter table principal.telefono
add tipoTelefono varchar(15) null
go

/*11)Agregamos la columna fecha de nacimiento y edad a la tabla apoderado con tipo de
dato datetime y char de 2 , null respectivamente*/
alter table principal.apoderado
add fechaNacimiento datetime null,
edad char(2) null
go

/*12) y 13) Eliminamos la columna edad de la tabla apoderado*/
alter table principal.apoderado
drop column edad
go

/*14)Agregamos la clave foránea FK_apoderado_CASCADA (teléfono-apoderado) a la
tabla teléfono con la condición cascade para actualizar y borrar*/
alter table principal.telefono
	add telefono_apoderado smallint not null,
	constraint FK_apoderado_CASCADA foreign key (telefono_apoderado) references principal.apoderado (apoderado_id)
	on delete cascade
	on update cascade
go

/*15)Verificamos los cambios a las tablas de ser posible con sp_help*/
exec sp_help 'corrida.participa'
exec sp_help 'principal.apoderado'
exec sp_help 'principal.torero'
exec sp_help 'principal.telefono'