/*
	Procedimientos Almacenadios y vista
	Diego Tamayo 
	Prueba Ofima SAS
*/

---------------------Artista-----------------------------

---Insertar Artista
if exists(select name from sysobjects where name = 'Sp_Registro_Artistas' and type = 'P')
	drop procedure Sp_Registro_Artistas
	go
	Create procedure Sp_Registro_Artistas (
	 @Nom varchar(100),@Pais1 varchar(50),@CasaDis varchar(100)
	)
	--with encryption
	As 
	begin

	 
	declare @Cod int
	
	if exists (select top 1 1 from Artista where Nombre = upper(@Nom) and Pais = Upper(@Pais1) and CasaDisquera=upper(@CasaDis))
	begin
		
		set @Cod = 999
		select @Cod
		return
	end
	
	Insert into Artista (Nombre,Pais,CasaDisquera) values (upper(@Nom),upper(@Pais1),upper(@CasaDis))
	set @Cod = 100
	select @Cod
				
    
end
go	 	

--- Update Artista

if exists(select name from sysobjects where name = 'Sp_Update_Artistas' and type = 'P')
	drop procedure Sp_Update_Artistas
	go
	Create procedure Sp_Update_Artistas (
	@Id int, @Nom varchar(100),@Pais1 varchar(50),@CasaDis varchar(100)
	)
	--with encryption
	As 
	begin

	declare @Cod int

	Update Artista 
	set  Nombre = upper(@Nom), Pais = upper(@Pais1), CasaDisquera = upper(@CasaDis)
	where IdArtista = @Id


		
		set @Cod = 200
		select  @Cod
end	 
go

--- Delete Artista

if exists(select name from sysobjects where name = 'Sp_Delete_Artistas' and type = 'P')
	drop procedure Sp_Delete_Artistas
	go
	Create procedure Sp_Delete_Artistas (
	@Id int
	)
	--with encryption
	As 
	begin

	declare @Cod int

	delete from Cancion
	where IdArtista = @Id

	delete from Artista 
	where IdArtista = @Id

	
	set @Cod = 300
	select @Cod
end
go

-------------------------Cancion-----------------------------
/* Crear Cancion*/

if exists(select name from sysobjects where name = 'Sp_Registro_Cancion' and type = 'P')
	drop procedure Sp_Registro_Cancion
	go
	Create procedure Sp_Registro_Cancion (
	 @NomArtista varchar(100),@NomCancion varchar(200),@DuracionCancion varchar(5)
	)
	--with encryption
	As 
	begin

	declare @Cod int,
	@IdArt int
	
	select @IdArt=IdArtista from Artista
	where Nombre = upper(@NomArtista)
	
	Insert into Cancion (IdArtista,Nombre,Duracion) 
	values (upper(@IdArt),upper(@NomCancion),upper(@DuracionCancion))
	
	
	set @Cod = 100
	select  @Cod			
    
end
go

/* Update Cancion*/

if exists(select name from sysobjects where name = 'Sp_Update_Cancion' and type = 'P')
	drop procedure Sp_Update_Cancion
	go
	Create procedure Sp_Update_Cancion (
	@IdCancion int,@NomCancion varchar(200),@DuracionCancion varchar(5)
	)
	--with encryption
	As 
	begin

	declare  @Cod int
	

	update Cancion set Nombre = @NomCancion,Duracion = @DuracionCancion
	where IdCancion = @IdCancion


	set @Cod = 200
	select  @Cod
end	
go

/* Delete Artista*/

if exists(select name from sysobjects where name = 'Sp_Delete_Cancion' and type = 'P')
	drop procedure Sp_Delete_Cancion
	go
	Create procedure Sp_Delete_Cancion (
	@Id int
	)
	--with encryption
	As 
	begin

	declare @Cod int

	delete from Cancion
	where IdCancion = @Id

	set @Cod = 300
	select  @Cod
end 
go

--------------------Otras consultas
/*consulta todos los Artistas*/

if exists(select name from sysobjects where name = 'Sp_consulta_Todos_artistas' and type = 'P')
	drop procedure Sp_consulta_Todos_artistas
	go
	Create procedure Sp_consulta_Todos_artistas
	--with encryption
	As 
	begin

	select * from Artista

end 
go

/*consulta Artistas por nombre*/

if exists(select name from sysobjects where name = 'Sp_consulta_artista_por_nombre' and type = 'P')
	drop procedure Sp_consulta_artista_por_nombre
	go
	Create procedure Sp_consulta_artista_por_nombre (@Nombre varchar(100))
	--with encryption
	As 
	begin

	select * from Artista where Nombre like '%' + LTRIM(rtrim(upper(@Nombre))) + '%'

end 
go

/*consulta todas las canciones*/

if exists(select name from sysobjects where name = 'Sp_consulta_todas_canciones' and type = 'P')
	drop procedure Sp_consulta_todas_canciones
	go
	Create procedure Sp_consulta_todas_canciones
	--with encryption
	As 
	begin

	select c.IdCancion,a.Nombre as Artistas,c.Nombre as Cancion,c.Duracion from Cancion c
	inner join Artista a on a.IdArtista = c.IdArtista

end 
go

/*consulta cancion por nombre*/

if exists(select name from sysobjects where name = 'Sp_consulta_cancion_por_nombre' and type = 'P')
	drop procedure Sp_consulta_cancion_por_nombre
	go
	Create procedure Sp_consulta_cancion_por_nombre (@Nombre varchar(200))
	--with encryption
	As 
	begin

	select c.IdCancion,a.Nombre as Artistas,c.Nombre as Cancion,c.Duracion from Cancion c
	inner join Artista a on a.IdArtista = c.IdArtista
	where c.Nombre like '%' + LTRIM(rtrim(upper(@Nombre))) + '%'
	

end 
go

/*consulta canciones por idartista*/

if exists(select name from sysobjects where name = 'Sp_consulta_cancion_por_idartista' and type = 'P')
	drop procedure Sp_consulta_cancion_por_idartista
	go
	Create procedure Sp_consulta_cancion_por_idartista (@Nombre varchar(100))
	--with encryption
	As 
	begin

	declare @IdArt int

	select @IdArt=IdArtista from Artista
	where Nombre = upper(@Nombre)

	
	select c.IdCancion,a.Nombre as Artistas,c.Nombre as Cancion,c.Duracion from Cancion c
	inner join Artista a on a.IdArtista = c.IdArtista
	where C.IdArtista = @IdArt
end 
go

---Vista

create view todo
  as
	select ar.IdArtista,ar.Nombre,ar.Pais,ar.CasaDisquera,ca.IdCancion,ca.Nombre as cancion,ca.Duracion from Artista Ar
	inner join Cancion Ca on ca.IdArtista = Ar.IdArtista

select * from todo