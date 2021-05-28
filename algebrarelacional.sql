--Monroy Velázquez Alejandra Sarah
use corrida

--Ejercicio 1
--Obtenga la informacion del los toreros con apodo 'TORO LOCO'.
select * 
from principal.torero 
where apodo='TORO LOCO'

--Ejercicio 2
--Obtenga nombre completo y municipio de los apoderados que vivan en la ciudad de méxico
select nombreap, peternoap,maternoap,municipioap 
from principal.apoderado 
where estadoAp='CDMX' 

--Ejercicio 3
/*Obtenga el nombre completo , apodo y ciudad de nacimiento de los toreros sin apodo y nombre completo, apodo y
ciudad de nacimiento de los toreros que hayan nacido en la ciudad de méxico(union)*/
select nombretorero,paternoTorero,maternoTorero,apodo,ciidadNacimiento  
from principal.torero 
where apodo is null
union
select nombretorero,paternoTorero,maternoTorero,apodo, ciidadNacimiento  
from principal.torero where 
ciidadNacimiento='CDMX'

--Ejercicio 4
--Obtenga el nombre, colonia y municipio de los apoderados  que vivan en la ciudad de méxico menos los de la delegacion COYOACAN
select nombreap,coliniaap,municipioap 
from principal.apoderado 
where estadoAp='CDMX'
except
select nombreap,coliniaap,municipioap 
from principal.apoderado 
where municipioAp='Coyoacan'

--Ejercicio 5
--Obtenga toda la informacion de las tabla torero y la tabla apoderado (producto cartesiano)
select *
from principal.torero,principal.apoderado

--Ejercicio 6
--Obtenga el nombre completo de los toreros y sus apoderados (join)
select nombretorero,paternoTorero,maternoTorero, nombreap, peternoap,maternoap 
from principal.torero 
inner join principal.apoderado 
on principal.apoderado.apoderado_id = principal.torero.apoderado_id

--Ejercicio 7
--Obtenga nombre completo, apodo y clave del padrino de todos los toreros que tengan apodo y ademas tengan padrino(intersección)
select nombretorero,paternoTorero,maternoTorero,apodo, torero_id 
from principal.torero 
where apodo is not null
intersect
select nombretorero,paternoTorero,maternoTorero,apodo, torero_id 
from principal.torero 
where padrinoTorero is not null

--Ejercicio 8
--Obtenga el nombre de las ganaderias
select ganaderia 
from corrida.corrida

--Ejercicio 9
--Muestre el nombre completo y los premios, de los toreros que han ganado más de 8000
select nombretorero,paternoTorero,maternoTorero, premios 
from corrida.participa  
inner join principal.torero 
on principal.torero.torero_id=corrida.participa.torero_id 
where pago>8000

