--Crear la BD

Create database Emisora
go

use Emisora
--Crear Tablas
go
	create table Artista (
	IdArtista int identity(1,1) primary key,
	Nombre varchar(100) not null,
	Pais varchar (50) not null,
	CasaDisquera varchar(100) not null
	)

go

if exists(select id from sysobjects where name = 'Cancion' and xtype = 'U')
begin
	drop table Cancion
end
	create table Cancion (
	 IdCancion int identity(1,1) primary key,
	 IdArtista int,
	 Nombre varchar(200) not null,
	 Duracion varchar(5) not null,
	 Foreign key (IdArtista) references Artista(IdArtista) 
	)
go