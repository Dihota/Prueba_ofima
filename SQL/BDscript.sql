USE [master]
GO
/****** Object:  Database [Emisora]    Script Date: 15/02/2022 11:33:47 p. m. ******/
CREATE DATABASE [Emisora]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Emisora', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Emisora.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Emisora_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Emisora_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Emisora] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Emisora].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Emisora] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Emisora] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Emisora] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Emisora] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Emisora] SET ARITHABORT OFF 
GO
ALTER DATABASE [Emisora] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Emisora] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Emisora] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Emisora] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Emisora] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Emisora] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Emisora] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Emisora] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Emisora] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Emisora] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Emisora] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Emisora] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Emisora] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Emisora] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Emisora] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Emisora] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Emisora] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Emisora] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Emisora] SET  MULTI_USER 
GO
ALTER DATABASE [Emisora] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Emisora] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Emisora] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Emisora] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Emisora] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Emisora]
GO
/****** Object:  Table [dbo].[Artista]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Artista](
	[IdArtista] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Pais] [varchar](50) NOT NULL,
	[CasaDisquera] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdArtista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cancion]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cancion](
	[IdCancion] [int] IDENTITY(1,1) NOT NULL,
	[IdArtista] [int] NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Duracion] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[todo]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create view [dbo].[todo]
  as
select ar.IdArtista,ar.Nombre,ar.Pais,ar.CasaDisquera,ca.IdCancion,ca.Nombre as cancion,ca.Duracion from Artista Ar
inner join Cancion Ca on ca.IdArtista = Ar.IdArtista
GO
SET IDENTITY_INSERT [dbo].[Artista] ON 

INSERT [dbo].[Artista] ([IdArtista], [Nombre], [Pais], [CasaDisquera]) VALUES (4, N'CARLOS VIVES', N'COLOMBIA', N'SONY MUSIC')
INSERT [dbo].[Artista] ([IdArtista], [Nombre], [Pais], [CasaDisquera]) VALUES (6, N'ANDRES CEPEDA', N'COLOMBIA', N'SONY MUSIC')
INSERT [dbo].[Artista] ([IdArtista], [Nombre], [Pais], [CasaDisquera]) VALUES (7, N'ANDRES CALAMARO', N'ARGENTINA', N'WARNER MUSIC SPAIN')
INSERT [dbo].[Artista] ([IdArtista], [Nombre], [Pais], [CasaDisquera]) VALUES (8, N'FITO PAEZ', N'ARGENTINA', N'SONY MUSIC')
INSERT [dbo].[Artista] ([IdArtista], [Nombre], [Pais], [CasaDisquera]) VALUES (9, N'DIOMEDES DIAZ', N'COLOMBIA', N'CODISCOS')
SET IDENTITY_INSERT [dbo].[Artista] OFF
SET IDENTITY_INSERT [dbo].[Cancion] ON 

INSERT [dbo].[Cancion] ([IdCancion], [IdArtista], [Nombre], [Duracion]) VALUES (1, 6, N'BESOS USADOS', N'3:45')
INSERT [dbo].[Cancion] ([IdCancion], [IdArtista], [Nombre], [Duracion]) VALUES (3, 4, N'CANTOR DE FONSECA', N'4:02')
INSERT [dbo].[Cancion] ([IdCancion], [IdArtista], [Nombre], [Duracion]) VALUES (4, 4, N'JAIME MOLINA', N'4:02')
INSERT [dbo].[Cancion] ([IdCancion], [IdArtista], [Nombre], [Duracion]) VALUES (6, 7, N'FLACLA', N'03:59')
SET IDENTITY_INSERT [dbo].[Cancion] OFF
ALTER TABLE [dbo].[Cancion]  WITH CHECK ADD FOREIGN KEY([IdArtista])
REFERENCES [dbo].[Artista] ([IdArtista])
GO
/****** Object:  StoredProcedure [dbo].[Sp_consulta_artista_por_nombre]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_consulta_artista_por_nombre] (@Nombre varchar(100))
	--with encryption
	As 
	begin

	select * from Artista where Nombre like '%' + LTRIM(rtrim(upper(@Nombre))) + '%'

end 

GO
/****** Object:  StoredProcedure [dbo].[Sp_consulta_cancion_por_idartista]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_consulta_cancion_por_idartista] (@Nombre varchar(100))
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

GO
/****** Object:  StoredProcedure [dbo].[Sp_consulta_cancion_por_nombre]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_consulta_cancion_por_nombre] (@Nombre varchar(200))
	--with encryption
	As 
	begin

	select c.IdCancion,a.Nombre as Artistas,c.Nombre as Cancion,c.Duracion from Cancion c
	inner join Artista a on a.IdArtista = c.IdArtista
	where c.Nombre like '%' + LTRIM(rtrim(upper(@Nombre))) + '%'
	

end 

GO
/****** Object:  StoredProcedure [dbo].[Sp_consulta_todas_canciones]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_consulta_todas_canciones]
	--with encryption
	As 
	begin

	select c.IdCancion,a.Nombre as Artistas,c.Nombre as Cancion,c.Duracion from Cancion c
	inner join Artista a on a.IdArtista = c.IdArtista

end 

GO
/****** Object:  StoredProcedure [dbo].[Sp_consulta_Todos_artistas]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_consulta_Todos_artistas]
	--with encryption
	As 
	begin

	select * from Artista

end 

GO
/****** Object:  StoredProcedure [dbo].[Sp_Delete_Artistas]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_Delete_Artistas] (
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

GO
/****** Object:  StoredProcedure [dbo].[Sp_Delete_Cancion]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_Delete_Cancion] (
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

GO
/****** Object:  StoredProcedure [dbo].[Sp_Registro_Artistas]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_Registro_Artistas] (
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

GO
/****** Object:  StoredProcedure [dbo].[Sp_Registro_Cancion]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_Registro_Cancion] (
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

GO
/****** Object:  StoredProcedure [dbo].[Sp_Update_Artistas]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_Update_Artistas] (
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

GO
/****** Object:  StoredProcedure [dbo].[Sp_Update_Cancion]    Script Date: 15/02/2022 11:33:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[Sp_Update_Cancion] (
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

GO
USE [master]
GO
ALTER DATABASE [Emisora] SET  READ_WRITE 
GO
