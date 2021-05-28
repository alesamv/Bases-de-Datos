--Ejercicios 23-Octubre-2019

use corrida;

create procedure pa_promedio2
	@n1 decimal(4,2),
	@n2 decimal(4,2),
	@resultado decimal(4,2) output

as
begin
	select @resultado = (@n1+@n2)/2
end
go

declare @variable decimal(4,2)
execute pa_promedio2 8,2, @variable output
select @variable
print @variable;

--Ejercicio 1
/*
Crear un procedimiento almacenado que muestre nombre completo(en un solo campo), apodo y fecha de inicio de los ahijados, 
pasando como parametro de entrada al padrino, retorne el número de los toreros y el total ganado en las corridas del 
padrino enviado
*/
create procedure principal.spusuAhijado
	@pad int, 
	@nT int output,
	@total int output
as
begin
	select concat (nombreTorero,' ',paternoTorero,' ',maternoTorero,' ',apodo,' ', fechaInicio) from principal.torero where padrinoTorero = @pad
	select @nT = count(torero_id) from principal.torero where padrinoTorero = @pad
	select @total = sum(pago) from corrida.participa as p inner join principal.torero as t on p.torero_id= t.torero_id where p.torero_id = @pad
end
go

declare @numToreros int, @tot int
execute principal.spusuAhijado 9, @numToreros output, @tot output
select @numToreros
select @tot

