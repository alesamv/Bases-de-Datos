----------------------------------------------------------------------------------------------------------------------------------------
/*
Autores: 
Cruz Zavala Miguel Angel
Dominguez Cisneros Alexis Saul 
Monroy Velázquez Alejandra Sarahí

Fecha de Creacion: 10/11/2019

Descripción: Procedimiento almacenado que recibe como parametro nombre de usuario, password y el tipo de usuario.
*/
----------------------------------------------------------------------------------------------------------------------------------------

use Concesionario
go

create procedure spu_creaUsuarios
@usuario	varchar(25),
@contraseña	varchar(25),
@tipo		varchar(15)
as
begin
	declare @creacionUsuario varchar(1000),@creacionLogin varchar(1000), @privilegio varchar(100),@tipo2 varchar(15) = ' ',@privilegio2 varchar(100)

	--Los siguientes if validan que tipo de usuario se quiere crear para asignarle el privilegio correspondiente
		if @tipo = 'consulta'
			set @tipo = 'db_datareader'
		else
		begin
			if @tipo = 'modificacion'
			begin
				set @tipo = 'db_datawriter'
				set @tipo2 = 'db_datareader'
			end
			else
			begin
				if @tipo = 'administrador'
					set @tipo = 'db_owner'
				else
					print '¡Tipo de usuario incorrecto!'
			end
		end

		--Creamos el login con el nombre de usuario y password recibido
		set @creacionLogin = 'CREATE LOGIN [' + @usuario + '] WITH PASSWORD = ''' + @contraseña + ''', DEFAULT_DATABASE = Concesionario , CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF'
		print @creacionLogin --Este print nos ayuda a verificar que la setencia @creacionLogin este bien escrita

		--Creamos el usuario para el login que se creo con el mismo nombre
		set @creacionUsuario = 'CREATE USER [' + @usuario + '] FOR LOGIN ['+ @usuario + ']'
		print @creacionUsuario --Este print nos ayuda a verificar que la setencia @creacionUsuario este bien escrita

		--Asignamos el privilegio del tipo que se verifico en el if para el usuario correspondiente
		set @privilegio = concat('sp_addrolemember ' ,'''', @tipo ,''',',@usuario)
		print @privilegio --Este print nos ayuda a verificar que la setencia @privilegio este bien escrita

		--Ejecutamos las sentencias
		EXEC (@creacionLogin)
		EXEC (@creacionUsuario)
		EXEC (@privilegio)

		--Para el caso de que el usuario sea de modificacion, ademas de que le asignemos el permiso de datawriter, tambien se le debe asignar
		--el privilegio de datareader
		if @tipo2 = 'db_datareader'
			set @privilegio2 = concat('sp_addrolemember ' ,'''', @tipo2 ,''',',@usuario)
			EXEC (@privilegio2)
			print @privilegio2 --Este print nos ayuda a verificar que la setencia @privilegio2 este bien escrita

end
go

--Llamando procedimientos
exec spu_creaUsuarios 'usuarioConsulta','1234zaq*', 'consulta'
SELECT * FROM sys.sql_logins WHERE name = 'usuarioConsulta';


exec spu_creaUsuarios 'usuarioConcesionario','1234zaq*', 'administrador'
SELECT * FROM sys.sql_logins WHERE name = 'usuarioConcesionario';

exec spu_creaUsuarios 'usuarioModificacion','1234zaq*', 'modificacion'
SELECT * FROM sys.sql_logins WHERE name = 'usuarioModificacion';


/*drop login usuarioConcesionario
drop login usuarioConsulta
drop login usuarioModificacion

drop user usuarioConcesionario
drop user usuarioConsulta
drop user usuarioModificacion*/

