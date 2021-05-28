


--2
--Ahora probamos el borrado y la actualizacion en  cascada

begin tran
--set identity_insert principal.apoderado on
--delete
	select * from principal.torero order by apoderado_id
	select * from principal.apoderado order by apoderado_id
	select * from principal.telefono order by apoderado_id

	delete from principal.apoderado
	where apoderado_id = 14
	--Nota: yo no tengo 6, empiezan los id de 10 hacia arriba usamos el 14 

	--comprobar
	select * from principal.torero order by apoderado_id
	select * from principal.apoderado order by apoderado_id
	select * from principal.telefono order by apoderado_id

	select 'Haciendo el update 7 donde era 5'
	--donde era 12
	alter table principal.telefono nocheck constraint rel_apoderadoTelefono
	update principal.apoderado set apoderado_id = 7 where apoderado_id = 12

	select * from principal.torero order by apoderado_id
	select * from principal.apoderado order by apoderado_id
	select * from principal.telefono order by apoderado_id

rollback tran

insert into principal.apoderado (nombreAp, peternoAp, maternoAp, calleAp, coliniaAp, municipioAp, estadoAp,codigoPostalAp,apoderado_id, fechaNacimiento)
values ('Juan', 'Perez', 'Garcia', 'Manzanas', 'Leyes de Reforma', 'Iztapalapa', 'CDMX', '1234', '20','1988-12-05')
go