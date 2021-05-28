--Monroy Velázquez Alejandra Sarahí
use corrida

/*update corrida.plaza set calle='Churubusco',numeroP='156', colonia='Comunidad', municipio = 'Iztacalco', estado = 'CDMX', codigopostal='09826',
capacidad=400 where plaza_id=3

select * from principal.apoderado

update principal.apoderado set nombreAp = 'Miguel', peternoAp = 'Hernandez', maternoAp = 'Garcia', calleAp = 'Fresas', ColiniaAp = 'Benito Juarez', 
estadoAp = 'CDMX', codigoPostalAp = '3456', fechaNacimiento = '1998-08-15' where nombreAp = 'apoderado3' */

--Ejercicio 1
/* Obtenga a todos los apoderados con fecha de nacimiento mayor a
01/01/1985 y vivan en la ciudad de México, ordenados por la fecha de
nacimiento descendente */
select * 
from principal.apoderado
where fechaNacimiento >= '1985-01-01' and estadoAp = 'CDMX'
order by fechaNacimiento desc

--Ejercicio 2
/* Obtenga los nombres y premios de los toreros a los que les hayan
pagado entre 3000 y 10000 */
select nombreTorero, paternoTorero, maternoTorero, premios 
from principal.torero as t inner join corrida.participa as p 
on t.torero_id = p.torero_id
where p.pago between 3000 and 10000

--Ejercicio 3 
/* Muestre los datos de las plazas con capacidad de 2000, 500 y 800
personas (IN) */
select * 
from corrida.plaza
where capacidad  in (2000,500,800)

--select * from corrida.plaza
--update corrida.plaza set capacidad = '2000' where plaza_id = '5'

--Ejercicio 4
/* Obtenga los datos de los toreros cuyo apodo contenga las letras ‘LO’ */
select * 
from principal.torero
where apodo like '%LO%'

--Ejercicio 5
/* Muestre los datos de los toreros que no tengan apodo (utilice NULL),
ordenados por el apellido paterno. */
select * 
from principal.torero
where apodo is null 
order by paternoTorero asc

--update principal.torero set apodo = null where torero_id = 17

--Ejercicio 6
/* Liste los toreros (nombre completo), que tengan padrino y no tengan
apodo. */
select nombreTorero, paternoTorero, maternoTorero 
from principal.torero 
where padrinoTorero is not null and apodo is null

--update principal.torero set padrinoTorero = 14 where torero_id = 17
--select * from principal.torero

--Ejercicio 7
/* Cuente los toreros que tienen padrino */
select count(padrinoTorero)
from principal.torero 

--Ejercicio 8
/* Obtenga el total de los pagos realizados a los toreros */
select sum(pago)
from corrida.participa

--Ejercicio 9
/* Obtenga el nombre y el total de los pagos que ha recibido cada torero,
ordene de mayor a menor pago (group by) */
select nombreTorero, sum(pago) 
from principal.torero as t inner join corrida.participa as p 
on t.torero_id = p.torero_id 
group by nombreTorero

--Ejercicio 10
/* Obtenga nombre del torero y suma de sus pagos, considerando solo los
pagos mayores a 5000 ( Having) */
select nombreTorero, sum(pago)
from principal.torero as t inner join corrida.participa as p 
on t.torero_id = p.torero_id
group by nombreTorero
having sum(pago) > 5000

--Ejercicio 11
/* Muestre los estados donde hay plazas de toros (distinct) */
select distinct estado
from corrida.plaza

--Ejercicio 12
/* Obtenga nombre completo de los toreros, la ganadería y los premios
que ha obtenido en las diferentes corridas */
select nombreTorero, paternoTorero, maternoTorero, ganaderia, premios
from corrida.participa as p inner join principal.torero as t
on p.torero_id = t.torero_id inner join corrida.corrida as c
on p.corrida_id = c.corrida_id

--Ejercicio 13
/* Muestre los datos de los apoderados y en su caso de sus teléfonos */
select * 
from principal.apoderado as a
left join principal.telefono as t 
on a.apoderado_id = t.apoderado_id

--Ejercicio 14
/* Liste los toreros, apodo y nombre de su padrino */
select t.nombretorero, t.paternoTorero, t.maternoTorero, t.apodo, 
t2.nombreTorero as nombrePadrino, t2.paternoTorero as paternoPadrino, t2.maternoTorero as maternoPadrino, t.padrinotorero as id_Padrino
from principal.torero as t 
left join principal.torero as t2 on t.padrinoTorero=t2.torero_id

