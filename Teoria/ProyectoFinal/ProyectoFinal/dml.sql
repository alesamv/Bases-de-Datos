----------------------------------------------------------------------------------------------------------------------------------------
/* dml
Autores: 
Cruz Zavala Miguel Angel
Dominguez Cisneros Alexis Saul 
Monroy Velázquez Alejandra Sarahí

Fecha de Creacion: 09/11/2019
Fecha de modificacion: 10/11/2019
Fecha de modificacion: 11/11/2019
Fecha de modificacion: 12/11/2019
Fecha de modificacion: 14/11/2019
Descripción: Creacion de funciones, triggers y vistas.
*/
----------------------------------------------------------------------------------------------------------------------------------------

use Concesionario
go

--FUNCIONES-------------------------------------------------------------------------------

--fu_mecanicosNoRegistrados--
/*La funcion nos regresa una tabla con los mecanicos existentes en la tabla EMPLEADO pero que no han sido añadidos a la tabla MECANICO.
En el caso de que todos los empleados de tipo mecanico que existen en la tabla EMPLEADO ya existan tambien en la tabla MECANICO
nos regresa una tabla con un unico registro con la cadena 'Ninguno'.
La columna de dicha tabla recibe el nombre de 'registrarNumeroDeEmpleadoEnTablaMecanico' que quiere decir que se debe introducir
en la tabla MECANICO un registro cuyo numEmpleado sea igual a el valor en cada registro de tal columna.*/
CREATE FUNCTION fu_mecanicosNoRegistrados() RETURNS @table 
TABLE (registrarNumeroDeEmpleadoEnTablaMecanico varchar(20))
AS
BEGIN
	IF EXISTS (SELECT * FROM vsMECANICO)
		AND EXISTS(
					(SELECT numEmpleado FROM vsMECANICO) 
					EXCEPT 
					(SELECT numEmpleado FROM EMPLEADO.MECANICO)
					)
		BEGIN
			INSERT @table SELECT numEmpleado
							FROM vsMECANICO
							WHERE numEmpleado NOT IN (select numEmpleado FROM EMPLEADO.MECANICO)
		END
	ELSE
		INSERT @table VALUES ('Ninguno')
	RETURN 
END
go

--fu_usadosNoRegistrados--
/*La funcion nos regresa una tabla con los coches de tipo 'usado' existentes en la tabla COCHE pero que no han sido añadidos a la tabla USADO.
En el caso de que todos los coches de tipo 'usado' que existen en la tabla COCHE ya existan tambien en la tabla USADO
nos regresa una tabla con un unico registro con la cadena 'Ninguno'.
La columna de dicha tabla recibe el nombre de 'registrarMatriculaDeCocheEnTablaUsado' que quiere decir que se debe introducir
en la tabla USADO un registro cuya matricula sea igual a el valor en cada registro de tal columna.*/
CREATE FUNCTION fu_usadosNoRegistrados() RETURNS 
@table TABLE (registrarMatriculaDeCocheEnTablaUsado char(7))
AS
BEGIN
	IF EXISTS (SELECT * FROM vsUSADO)
		AND EXISTS(
					(SELECT matricula FROM vsUSADO) 
					EXCEPT 
					(SELECT matricula FROM VENTA.USADO)
					)
		BEGIN
			INSERT @table SELECT matricula
							FROM vsUSADO
							WHERE matricula NOT IN (select matricula FROM VENTA.USADO)
		END
	ELSE
		INSERT @table VALUES ('Ninguno')
	RETURN 
END
go


--TRIGGERS--------------------------------------------------------------------------------

--TR_herenciaEmpleado--
/*El trigger hace que sea posible la insercion multiple y verifica los diferentes tipos de
empleados que son insertados, segun sea el tipo de empleado hacemos cosas diferentes.
Si el tipo de empleado es un comercial o un tecnico, se usa el numero de empleado que se uso para
insertar en la tabla EMPLEADO para insertar en las tablas respectivas de COMERCIAL o TECNICO segun sea el caso.
Si el tipo de empleado es un mecanico este no es insertado automaticamente en la tabla MECANICO.  
Gracias al uso de un cursor podemos hacer todo lo anterior incluso con insersiones multiples, ya que
usa la tabla inserted para corroborar cada uno de los pasos anteriores con cada valor insertado.
Al final nos muestra una tabla la cual nos dice cuales mecanicos debemos registrar manualmente en la tabla MECANICO.*/
CREATE TRIGGER TR_herenciaEmpleado ON EMPLEADO.EMPLEADO
AFTER INSERT 
AS
BEGIN
	DECLARE @tipoEmpleado varchar(10),@num int

	DECLARE CS_herenciaEmpleado CURSOR
	FOR SELECT tipoEmpleado,numEmpleado FROM INSERTED
	OPEN CS_herenciaEmpleado 
	FETCH CS_herenciaEmpleado INTO @tipoEmpleado,@num
	WHILE (@@FETCH_STATUS=0) 
	BEGIN
		IF @tipoEmpleado='COMERCIAL'
			INSERT EMPLEADO.COMERCIAL VALUES(@num)
		ELSE
		BEGIN
			IF @tipoEmpleado='TECNICO'
				INSERT EMPLEADO.TECNICO VALUES(@num)
		END
		FETCH CS_herenciaEmpleado INTO @tipoEmpleado,@num
	END
	CLOSE CS_herenciaEmpleado
	DEALLOCATE CS_HerenciaEmpleado
	select * from fu_mecanicosNoRegistrados()
END
go

--TR_mecanicosRestantes--
/*El trigger funciona con inserts multiples gracias al uso de un cursor y la tabla INSERTED.
Para cada dato insertado se verifica que el numEmpleado exista en la tabla EMPLEADO y que ademas sea
un empleado de tipo 'Mecanico', si cumple esas restricciones los valores se registran en la tabla MECANICO.
En el caso contrario se imprime un mensaje que especifica que el empleado no existe en la tabla*/
CREATE TRIGGER TR_mecanicosRestantes ON EMPLEADO.MECANICO
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @num int,@escol varchar(20)

	DECLARE CS_empleado CURSOR
	FOR SELECT numEmpleado, escolaridad FROM INSERTED
	OPEN CS_empleado
	FETCH CS_empleado INTO @num,@escol
	WHILE (@@FETCH_STATUS=0)
	BEGIN
		IF EXISTS(SELECT numEmpleado 
					FROM EMPLEADO.EMPLEADO
					WHERE numEmpleado=@num and tipoEmpleado='Mecanico')
			AND NOT EXISTS(SELECT numEmpleado 
							FROM EMPLEADO.MECANICO
							WHERE numEmpleado=@num)
			INSERT EMPLEADO.MECANICO VALUES(@num,@escol)
		ELSE
			PRINT CONCAT('Numero de empleado ',@num,' inexistente de tipo mecanico en la tabla EMPLEADO o ya registrado en la tabla MECANICO')
		FETCH CS_empleado INTO @num,@escol
	END
	CLOSE CS_empleado
	DEALLOCATE CS_empleado
	SELECT * FROM fu_mecanicosNoRegistrados()
END
go

--TR_confirmarReparaciones--
/*El trigger se encarga de verificar que el ajuste exista en la tabla AJUSTE y ademas
que dicho ajuste sea de tipo 'Reparacion', si lo es se inserta la reparacion, en caso contrario
se manda un mensaje para verificar la existencia del ajuste en la tabla ajuste y que sea de tipo
'Reparacion'. Este trigger no esta diseñado para inserts multiples.*/
CREATE TRIGGER	TR_confirmarReparacion ON SERVICIO.REPARACION
INSTEAD OF INSERT
AS
BEGIN
	DECLARE  @id int,@tipo int
	SET @id=(SELECT artIdAjuste 
				FROM INSERTED)
	SET @tipo=(SELECT idTipoReparacion 
				FROM INSERTED)

	IF EXISTS(SELECT artIdAjuste 
				FROM SERVICIO.AJUSTE 
				WHERE artIdAjuste=@id)
		AND (SELECT tipoAjuste 
				FROM SERVICIO.AJUSTE
				WHERE artIdAjuste=@id)='Reparacion'
		INSERT SERVICIO.REPARACION VALUES(@id,@tipo)
	ELSE
		PRINT CONCAT('Verificar existencia del ajuste ',@id,' en la tabla AJUSTES o Verificar que sea tipo Reparacion.')
END
go

--TR_confirmarRevision--
/*El trigger se encarga de verificar que el ajuste exista en la tabla AJUSTE y ademas
que dicho ajuste sea de tipo 'Revision', si lo es se inserta la revision, en caso contrario
se manda un mensaje para verificar la existencia del ajuste en la tabla ajuste y que sea de tipo
'Revision'. Este trigger no esta diseñado para inserts multiples.*/
CREATE TRIGGER	TR_confirmarRevision ON SERVICIO.REVISION
INSTEAD OF INSERT
AS
BEGIN
	DECLARE  @id int, @tipo int, @empleado int, @fechaPlan datetime, @realizada char(1), @fechaRe datetime
	SET @id=(SELECT artIdAjuste 
				FROM INSERTED)
	SET @tipo=(SELECT idTipoRevision 
				FROM INSERTED)
	SET @empleado=(SELECT numEmpleado 
				FROM INSERTED)
	SET @fechaPlan=(SELECT fechaPlanificacion 
				FROM INSERTED)
	SET @realizada=(SELECT checkPlanRealizada 
				FROM INSERTED)
	SET @fechaRe=(SELECT fechaPlanificacionRealizada 
				FROM INSERTED)

	IF EXISTS(SELECT artIdAjuste 
				FROM SERVICIO.AJUSTE 
				WHERE artIdAjuste=@id)
		AND (SELECT tipoAjuste 
				FROM SERVICIO.AJUSTE
				WHERE artIdAjuste=@id)='Revision'
		INSERT SERVICIO.REVISION VALUES(@id,@tipo,@empleado,@fechaPlan,@realizada,@fechaRe)
	ELSE
		PRINT CONCAT('Verificar existencia del ajuste ',@id,' en la tabla AJUSTES o Verificar que sea tipo Revision.')
END
go

--TR_herenciaCoche--
/*El trigger nos mostrara, en el caso de que hayamos registrado almenos un coche de tipo usado, la matricula 
de los coches usados que se deben insertar manualmente en la tabla USADO.*/
CREATE TRIGGER TR_herenciaCoche ON VENTA.COCHE
AFTER INSERT
AS
BEGIN
	IF EXISTS(SELECT matricula 
				FROM INSERTED
				WHERE tipoCoche='Usado')
		SELECT * FROM fu_usadosNoRegistrados()
END 
go

--TR_usadosRestantes
/*Trigger que despues de insertar en USADO verifica que sea de tipo usado antes de insertar yq ue exista dicha matricuala
en la tabla COCHE para finalmente checar que no falten mas coches usados que hayan sido registrados en la tabla COCHE 
sin registrar en la tabla USADO*/
CREATE TRIGGER TR_usadosRestantes ON VENTA.USADO
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @id char(7),@cliente int

	DECLARE CS_usados CURSOR
	FOR SELECT matricula,idCliente 
		FROM INSERTED
	OPEN CS_usados
	FETCH CS_usados INTO @id,@cliente
	WHILE(@@FETCH_STATUS=0)
	BEGIN
		IF EXISTS(SELECT matricula 
					FROM VENTA.COCHE
					WHERE matricula=@id and tipoCoche='Usado')
			AND NOT EXISTS(SELECT matricula 
							FROM VENTA.USADO
							WHERE matricula=@id)
			BEGIN
				IF 3> (SELECT COUNT(idCliente)
							FROM VENTA.USADO 
							WHERE idCliente=@cliente)
					INSERT VENTA.USADO VALUES(@id,@cliente)
				ELSE
					PRINT CONCAT('El cliente ',@cliente,' ha vendido el maximo de 3 coches.')
			END
		ELSE
			PRINT CONCAT('Matricula ',@id, ' inexistente para coche del tipo usado en la tabla COCHE o ya esta registrado en la tabla USADO')
		FETCH CS_usados INTO @id,@cliente
	END
	CLOSE CS_usados
	DEALLOCATE CS_usados
	SELECT * FROM fu_usadosNoRegistrados()
END
go

--TR_contactoCliente--
/* Trigger para avisar que es necesario insertar un dato de contacto para el/los clientes insertados.*/
CREATE TRIGGER TR_contactoCliente ON VENTA.CLIENTE
AFTER INSERT
AS
BEGIN
	DECLARE @id int

	DECLARE CS_clientes CURSOR
	FOR SELECT idCliente 
		FROM INSERTED
	OPEN CS_clientes
	FETCH CS_clientes INTO @id
	WHILE (@@FETCH_STATUS=0)
	BEGIN
		PRINT CONCAT('Insertar un dato de contacto para el cliente ',@id)
		FETCH CS_clientes INTO @id
	END
	CLOSE CS_clientes
	DEALLOCATE CS_clientes
END
go

--TR_iva--
/*Trigger para obtener el iva apartir del costo en la tabla AJUSTE*/
CREATE TRIGGER TR_iva ON SERVICIO.AJUSTE
AFTER INSERT
AS
BEGIN
	DECLARE @iva decimal(8,2)

	SET @iva =(SELECT costoAjuste*0.16 
				FROM INSERTED)
	UPDATE SERVICIO.AJUSTE SET iva=@iva WHERE artIdAjuste=(SELECT artIdAjuste FROM INSERTED)
END
go


--VISTAS---------------------------------------------------------------------------------

CREATE VIEW vsMECANICO
AS
SELECT numEmpleado,CONCAT(nombreEmpleado,' ' ,apPatEmpleado,' ',apMatEmpleado) AS nombreEmpleado 
FROM EMPLEADO.EMPLEADO
WHERE tipoEmpleado='Mecanico'
go
CREATE VIEW vsCOMERCIAL
AS
SELECT numEmpleado,CONCAT(nombreEmpleado,' ' ,apPatEmpleado,' ',apMatEmpleado) AS nombreEmpleado 
FROM EMPLEADO.EMPLEADO
WHERE tipoEmpleado='Comercial'	
go
CREATE VIEW vsUSADO
AS
SELECT matricula,modelo,costo 
FROM VENTA.COCHE
WHERE tipoCoche='Usado'
go