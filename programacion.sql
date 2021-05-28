--Monroy Velázquez Alejandra Sarahí

use corrida

--Ejercicio 1
/* Verifique si algun torero ha ganado mas de 5 mil pesos, en caso afirmativo
obtenga el nombre del torero, plaza, ganaderia y el pago obtenido. 
En caso ontrario muestre los mismos datos para el torero con mayor pago en la corridas (IF)*/

if exists(select pago from corrida.participa)
begin
	select nombreTorero, paternoTorero, maternoTorero, nombrePlaza, ganaderia, sum(pago) as pago
	from principal.torero as t 
	inner join corrida.participa as p 
		on t.torero_id = p.torero_id
	inner join corrida.corrida as c
		on p.corrida_id = c.corrida_id
	inner join corrida.plaza as pl
		on pl.plaza_id = c.plaza_id
	group by nombreTorero, paternoTorero, maternoTorero, nombrePlaza, ganaderia
	having sum(pago) > 5000
end
else
begin
	select nombreTorero, paternoTorero, maternoTorero, nombrePlaza, ganaderia, pago
	from principal.torero as t
	inner join corrida.participa as p 
		on t.torero_id = p.torero_id
	inner join corrida.corrida as c
		on p.corrida_id = c.corrida_id
	inner join corrida.plaza as pl
		on pl.plaza_id = c.plaza_id
	where pago = (select max(pago) from corrida.participa)
end 


--Ejercicio 2
/* Revise si cada plaza tiene al menos 1 corrida, en caso firmativo envie el siguiente mensaje
'Todas las plazas tienen al menos una corrida' en caso contrario saque el listado de las plazas 
que no tienen registrada una corrida (IF)*/

if NULL IN (select c.corrida_id
			from corrida.plaza  as p 
				left join corrida.corrida as c 
					on p.plaza_id=c.plaza_id)
	print'Todas las plazas tienen al menos una corrida'
else	
begin
	select nombreplaza as PlazaSinCorrida
	from corrida.plaza  as p 
		left join corrida.corrida as c 
			on p.plaza_id=c.plaza_id
	where c.corrida_id is null
end	


--Ejercicio 3
/*Implementar un Script que aumente en 10% el pago de las corridas solo si el
promedio de estas no supera los 20,000 o hasta que el pago más alto sea 10,000
cuando se termine de actualizar dichos valores mostrar el mensaje “YA NO HAY
MÁS REGISTROS QUE ACTUALIZAR”. (WHILE)*/

begin tran
	/*Este update es porque en mis tablas esta corrida tiene un valor muy alto, para observar mejor 
	el funcionamiento del while le pongo otro valor más bajo*/
	update corrida.participa set pago = 6000 where corrida_id = 4 

	--Observamos la tabla inicial "participa"
	select * from corrida.participa 
	declare @promedio decimal, @mayor decimal
	set @promedio=(select avg(pago) from corrida.participa)
	set @mayor=(select max(pago) from corrida.participa)

	while (@mayor < 10000) and (@promedio < 20000)
	begin
		update corrida.participa set pago=pago * 1.1
		set @promedio=(select avg(pago) from corrida.participa)
		set @mayor=(select max(pago) from corrida.participa)
		print @promedio
		print @mayor
	end 
	print 'Ya no hay más registros que actualizar'

	--Observamos la tabla con los cambios hechos
	select * from corrida.participa 
rollback tran


--Ejercicio 4
/*Para cada torero registre por lo menor 1 dependiente, si ya tiene, envié mensaje ‘El
torero ya tiene dependientes’ (WHILE)*/

begin tran
	--Observamos el torero_id, el dependiente_id, y los datos del dependiente antes de hacer cambios
	select  t.torero_id, dependiente_id, nombre, paterno, materno, d.curp
	from principal.torero as t
		left join principal.dependiente as d
			on t.torero_id=d.torero_id

	/*Para insertar los dependientes en caso de que un torero no tenga, deben de ser diferentes en cada torero, 
	por lo que obtenemos el id delultmo dependiente de la tabla para ir incrementando a partir de este*/
	declare @contador int, @contadorDep int
	set @contadorDep = (select max(dependiente_id) from principal.dependiente)
	--Inicializamos el contador en el id menor de los toreros.
	set @contador=(select min(torero_id) from principal.torero)
	--Se ejecuta mientras no se llegue al ultimo torero_id
	while @contador <= (select max(torero_id) from principal.torero)
	begin
		print @contador
		if exists(select torero_id from principal.torero where torero_id=@contador)
		begin
			/*Si al hacer el left join encontramos que no hay un dependitente en el torero con el id_torero 
			igual al @contador entramos al if*/
			--Se selecciona solo el dependiente con el id mayor ya que existen toreros que tienen más de 1 dependiente
			if (select max(dependiente_id)
				from principal.torero as t
					left join principal.dependiente as d
						on t.torero_id=d.torero_id
				where t.torero_id=@contador) is null
			begin
				set @contadorDep=@contadorDep + 1
				/*Insertamos los datos del dependiente de forma automatica, concatenando el numero del contador a cada campo
				para que sean dependientes diferentes en cada torero*/
				insert principal.dependiente values (concat('curp',@contadorDep),concat('paterno',@contadorDep),null,concat('dependiente',@contadorDep),
				null, @contador)
			end
			else
				print'El torero ya tiene dependiente'
		end
		set @contador=@contador+1
	end

	--Observamos los mismos datos de al inicio pero ya con los cambios hechos
	select  t.torero_id, dependiente_id, nombre, paterno, materno, d.curp
	from principal.torero as t
		left join principal.dependiente as d
			on t.torero_id=d.torero_id
rollback tran


--Ejercicio 5
/*Muestre nombre completo de los toreros en un solo campo, su padrino, apodo y si el torero
no tiene apodo coloque ‘No tiene apodo’, si el apodo es toro loco coloque ‘Apodo por
default’, de lo contrario coloque ‘Apodo propio’ (CASE)*/

select t.torero_id, concat(t.nombretorero,' ',t.paternotorero,' ',t.maternotorero) as Torero, p.nombretorero as Padrino, t.apodo,
	(case 
		when t.apodo is null then 'No tiene apodo'
		when t.apodo = 'TORO LOCO' then 'Apodo por default'
		else 'Apodo Propio' end) as Apodo
from principal.torero as t
	left join principal.torero as p
		on t.padrinoTorero=p.torero_id


--Ejercicio 6
/*Liste nombre completo del torero, plaza en la que ha corrido, pago y si el pago es menor o
igual que 2000 regrese ‘Pago mínimo’, si el pago es mayor que 2000 y menor que 4000
coloque ‘Pago medio’, si el pago es mayor que 4000 y menor que 6000 coloque ‘Pago normal’
para cualquier otro pago coloque ‘Buen pago’ (CASE)*/

select concat(nombretorero,' ',paternotorero,' ',maternotorero) as Torero, nombrePlaza as Plaza,
	(case
		when pago <=2000  then 'Pago Minimo'
		when pago >2000 and pago <= 4000 then 'Pago Medio'
		when pago >4000 and pago <=600 then 'Pago Normal'
		else 'Buen Pago' end) as Pago
from principal.torero as t
	inner join corrida.participa as p
		on t.torero_id=p.torero_id
	inner join corrida.corrida as c
		on p.corrida_id=c.corrida_id
	inner join corrida.plaza as pl
		on c.plaza_id= pl.plaza_id


--Ejercicio 7
/*Defina una función donde ingrese el id del torero y retorne la cantidad de corridas que en las
que ha participado*/

create function principal.Participaciones(@torero int)  returns tinyint
as
begin
	declare @numCorridas tinyint

	set @numCorridas =(select count(corrida_id) 
						from corrida.participa
						where torero_id=@torero)
	return @numCorridas
end


print principal.Participaciones(14)


--Ejercicio 8
/*Defina una función que liste las corridas de un determinado año (agregue año a la tabla
corrida) incluya el nombre del torero, nombre de la plaza, nombre de la ganadería, el premio
obtenido y la fecha.*/

--Agregamos la columna año a la tabla corrida y hacemos update, agregando varios años
alter table corrida.corrida
add año int
update corrida.corrida set año=2017 where corrida_id=1 
update corrida.corrida set año=2018 where corrida_id=2 
update corrida.corrida set año=2018 where corrida_id=3 
update corrida.corrida set año=2019 where corrida_id=4

create function corrida.añoCorrida(@año int) returns table 
as
	return (select nombretorero+' '+paternotorero+' '+maternotorero as Torero, nombrePlaza as Plaza,
		ganaderia, premios, año
	from principal.torero as t
		inner join corrida.participa as p
			on t.torero_id=p.torero_id
		inner join corrida.corrida as c
			on p.corrida_id=c.corrida_id
		inner join corrida.plaza as pl
			on c.plaza_id= pl.plaza_id
	where año=@año)


select * from corrida.añoCorrida(2019)


--Ejercicio 9
/*Realice una función que obtenga mediante una tabla, la información de los apoderados y sus
teléfonos (nombre completo de los apoderados, estado fecha de nacimiento, y sus teléfonos)*/

create function principal.apoderadoTels() 
returns @table table(Apoderado nvarchar(30) , estado varchar(30), fechaNacimiento datetime, telefono varchar(18))
as
begin
	insert @table select nombreap+' '+peternoap+' '+maternoap,estadoap,fechanacimiento,telefononum
	from principal.apoderado as ap 
		full outer join principal.telefono as te
			on ap.apoderado_id=te.apoderado_id
	return
end


select * from principal.apoderadoTels()


--Ejercicio 10
/*Realice una función (de tabla) que obtenga los datos de la plaza (nombre, capacidad),
corridas (ganadería, premios) y toreros (nombre completo y fecha de inicio) que han
participado en las corridas, pasando como parámetro el id de la plaza.*/

create function plazaCompleta(@Plaza tinyint ) 
returns @table table(Plaza varchar(50),Capacidad smallint, Ganaderia varchar(50),Premios char(20),
	Torero varchar(70),fechaInicioTorero datetime)
as
begin
	insert @table 
		select nombrePlaza , capacidad, ganaderia, premios, nombretorero+' '+paternotorero+' '+maternotorero, 
			fechaInicio
		from principal.torero as t
			inner join corrida.participa as p
				on t.torero_id=p.torero_id
			inner join corrida.corrida as c
				on p.corrida_id=c.corrida_id
			inner join corrida.plaza as pl
				on c.plaza_id= pl.plaza_id
		where pl.plaza_id=@plaza 
	return
end


select * from plazaCompleta(1)