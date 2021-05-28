--Monroy Velázquez Alejandra Sarahí

use corrida;

--> Vistas <--

--Ejercicio 1
/* Cree una vista que muestre nombre completo en un solo campo de los toreros, apodo, nombre completo de su padrino
en caso de tenerlo padrino y nombre completo de su apoderado (en un solo campo).Nombre a la vista visToreroApoderado */
create view visToreroApoderado as
	select concat(t.nombreTorero, ' ', t.paternoTorero, ' ', t.maternoTorero) as Torero, t.apodo, 
			concat(p.nombreTorero, ' ', p.paternoTorero, ' ', p.maternoTorero) as Padrino, 
			concat(nombreAp, ' ', peternoAp, ' ', maternoAp) as Apoderado
	from principal.torero as t 
	left join principal.Torero as p 
		on t.padrinoTorero=p.torero_id
	inner join principal.apoderado as a 
		on t.apoderado_id=a.apoderado_id

select * from visToreroApoderado

--Ejercicio 2
/* Cree una vista que liste los siguientes datos: torero(nombre completo), las plazas donde ha corrido y los premios 
que ha ganado, nombre a la vista visTorerosPremios*/
create view visTorerosPremios as
	select concat(nombreTorero, ' ', paternoTorero, ' ', maternoTorero) as Torero, nombrePlaza, premios
	from principal.torero as t 
	inner join corrida.participa as p 
		on p.torero_id = t.torero_id
	inner join corrida.corrida as c 
		on c.corrida_id = p.corrida_id
	inner join corrida.plaza as pl 
		on pl.plaza_id=c.plaza_id

select * from visTorerosPremios

--> Subconsultas <--

--Ejercicio 1
/* Obtenga el nombre completo de los toreros, apodo, ciudad de Nacimiento y 
monto total de los toreros ganado en las corridas*/
select concat(nombreTorero, ' ', paternoTorero, ' ', maternoTorero) as Torero, 
		apodo, ciidadNacimiento, 
	 (select sum(p.pago)
	  from corrida.participa as p
	  where t.torero_id = p.torero_id) as montoTotal
from principal.torero as t; 

--Ejercicio 2
/* Seleccione el nombre completo del apoderado, nombre completo del torero y 
monto total de los toreros ganado en las corridas (utilice tablas derivadas)*/
select concat(nombreap, ' ', peternoAp, ' ', maternoap) as Apoderado,concat(nombretorero,' ',paternoTorero,' ',maternoTorero) as Torero,
	(select sum(p.pago) 
	from corrida.participa as p 
	where ta.torero_id=p.torero_id) as montoTotal
from 
	(select ap.nombreAp,ap.peternoAp,ap.maternoAp,t.nombreTorero,t.paternoTorero,t.maternoTorero,t.torero_id
	from principal.apoderado as ap 
		full outer join principal.torero as t
			on ap.apoderado_id=t.apoderado_id 
		) as ta
