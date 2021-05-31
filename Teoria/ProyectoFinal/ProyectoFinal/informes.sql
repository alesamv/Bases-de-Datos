----------------------------------------------------------------------------------------------------------------------------------------
/* informesS
Autores: 
Cruz Zavala Miguel Angel
Dominguez Cisneros Alexis Saul 
Monroy Velázquez Alejandra Sarahí

Fecha de Creacion: 12/11/2019
Fecha de modificacion: 13/11/2019
Fecha de modificacion: 14/11/2019
Descripción: Haciendo los procedimientos para las estadisticas solicitadas.
			y mostrandolas al final del codigo.
*/
----------------------------------------------------------------------------------------------------------------------------------------

use Concesionario
go

--spu_mejorComercial--
/*Procedimiento que recibe dos parámetros correspondientes a un periodo de tiempo, regresa el top 5 de los comerciales que 
han hecho más ventas en ese periodo, las enumera y las ordena de forma descendente.*/
CREATE PROCEDURE spu_mejorComercial 
@inicio datetime,
@fin datetime
AS
BEGIN
	SELECT TOP 5 nombreEmpleado AS Comercial, COUNT(r.numEmpleado) AS numVentas
	FROM vsCOMERCIAL AS c
		RIGHT JOIN VENTA.REGISTRACOMPRA AS r
			ON c.numEmpleado = r.numEmpleado
		INNER JOIN venta.COMPRA AS cp
			ON r.idCompra = cp.idCliente
	WHERE fechaCompra BETWEEN @inicio AND @fin
	GROUP BY nombreEmpleado
	ORDER BY numVentas desc
END
go

--spu_epocaVentas--
/*Procedimiento que regresa las estaciones y cuantas ventas se registraron en cada estación. */
CREATE PROCEDURE spu_epocaVentas
AS
BEGIN
	DECLARE @primavera int, @verano int, @otoño int, @invierno int
	DECLARE @EPOCA TABLE(epoca varchar(10), ventas int)

	SET @primavera= (SELECT COUNT(*) 
						FROM VENTA.COMPRA
						WHERE MONTH(fechaCompra) BETWEEN 3 AND 5)
	SET @verano= (SELECT COUNT(*) 
						FROM VENTA.COMPRA
						WHERE MONTH(fechaCompra) BETWEEN 6 AND 8)
	SET @otoño= (SELECT COUNT(*) 
						FROM VENTA.COMPRA
						WHERE MONTH(fechaCompra) BETWEEN 9 AND 11)
	SET @invierno= (SELECT COUNT(*) 
						FROM VENTA.COMPRA
						WHERE MONTH(fechaCompra) in (12,1,2) )
	INSERT @EPOCA VALUES('Primavera',@primavera),('Verano',@verano),('Otoño',@otoño),('Invierno',@verano)
	SELECT epoca as 'Mejor Epoca',max(ventas) AS numVentas
	FROM @EPOCA
	GROUP BY epoca
	ORDER BY numVentas desc
END
go

--spu_chocesMasVendidos--
/*Procedimiento que regresa el top 5 de los vehículos que más se han vendido, mostrando modelo y cantidad 
y los ordena de forma descendente.*/
CREATE PROCEDURE spu_cochesMasVendidos
AS
BEGIN
	SELECT TOP 5 modelo,COUNT(modelo)cochesVendidos
	FROM VENTA.COCHE AS c
		INNER JOIN VENTA.COMPRA AS cp
			ON c.matricula=cp.matricula
	GROUP BY modelo
	ORDER BY COUNT(modelo) desc
END
go

--spu_mejorMecanico--
/*Procedimiento que regresa el top 5 de los mecánicos que más revisiones/reparaciones han hecho y los ordena de forma descendente.*/
CREATE PROCEDURE spu_mejorMecanico 
AS
BEGIN
	SELECT TOP 5 nombreEmpleado as Mecanico, COUNT( a.numEmpleado) as 'Reparaciones y Revisiones'
	FROM vsMECANICO AS m
		INNER JOIN SERVICIO.AJUSTE AS a
			ON	m.numEmpleado=a.numEmpleado
	GROUP BY nombreEmpleado
	ORDER BY COUNT(a.numEmpleado) desc
END
go

--Ejecucion de los procedimientos.
exec spu_mejorComercial '2013-11-1', '2016-12-31'
exec spu_epocaVentas
exec spu_cochesMasVendidos 
exec spu_mejorMecanico