USE [master]
GO
/****** Object:  Database [Hosting_System]    Script Date: 3/9/2023 12:56:23 ******/
CREATE DATABASE [Hosting_System]
GO
ALTER DATABASE [Hosting_System] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hosting_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hosting_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hosting_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hosting_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hosting_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hosting_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hosting_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hosting_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hosting_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hosting_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hosting_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hosting_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hosting_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hosting_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hosting_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hosting_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hosting_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hosting_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hosting_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hosting_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hosting_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hosting_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hosting_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hosting_System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hosting_System] SET  MULTI_USER 
GO
ALTER DATABASE [Hosting_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hosting_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hosting_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hosting_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hosting_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hosting_System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hosting_System] SET QUERY_STORE = OFF
GO
USE [Hosting_System]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[idHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[idHotel] [int] NOT NULL,
	[numeroHabitacion] [varchar](10) NOT NULL,
	[capacidadMaxima] [int] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[idHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservacion](
	[idReservacion] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idHabitacion] [int] NOT NULL,
	[fechaEntrada] [datetime] NOT NULL,
	[fechaSalida] [datetime] NOT NULL,
	[numeroAdultos] [int] NOT NULL,
	[numeroNinhos] [int] NOT NULL,
	[totalDiasReservacion] [int] NOT NULL,
	[costoPorCadaAdulto] [numeric](10, 2) NOT NULL,
	[costoPorCadaNinho] [numeric](10, 2) NOT NULL,
	[costoTotal] [numeric](14, 2) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Reservacion] PRIMARY KEY CLUSTERED 
(
	[idReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vReservacionesPorHabitacionActiva]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vReservacionesPorHabitacionActiva]
as
select
ha.idHotel,
ha.idHabitacion,
ha.capacidadMaxima,
(select count(*) from dbo.Reservacion rsv where rsv.idHabitacion = ha.idHabitacion) cantidadResevacion
from dbo.Habitacion as ha
where ha.estado = 'A'
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[idBitacora] [int] IDENTITY(1,1) NOT NULL,
	[idReservacion] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[accionRealizada] [varchar](25) NOT NULL,
	[fechaDeLaAccion] [datetime] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[idBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[idHotel] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[direccion] [varchar](500) NULL,
	[costoPorCadaAdulto] [numeric](10, 2) NOT NULL,
	[costoPorCadaNinho] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[nombreCompleto] [varchar](250) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[clave] [varchar](15) NOT NULL,
	[esEmpleado] [bit] NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Habitacion_hotel_numeroHabitacion]    Script Date: 3/9/2023 12:56:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Habitacion_hotel_numeroHabitacion] ON [dbo].[Habitacion]
(
	[idHotel] ASC,
	[numeroHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Persona_email]    Script Date: 3/9/2023 12:56:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Persona_email] ON [dbo].[Persona]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_clave]  DEFAULT ((12345)) FOR [clave]
GO
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_esEmpleado]  DEFAULT ((0)) FOR [esEmpleado]
GO
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_estado]  DEFAULT ('A') FOR [estado]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Persona]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Reservacion] FOREIGN KEY([idReservacion])
REFERENCES [dbo].[Reservacion] ([idReservacion])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Reservacion]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_Hotel] FOREIGN KEY([idHotel])
REFERENCES [dbo].[Hotel] ([idHotel])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_Hotel]
GO
ALTER TABLE [dbo].[Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Reservacion_Habitacion] FOREIGN KEY([idHabitacion])
REFERENCES [dbo].[Habitacion] ([idHabitacion])
GO
ALTER TABLE [dbo].[Reservacion] CHECK CONSTRAINT [FK_Reservacion_Habitacion]
GO
ALTER TABLE [dbo].[Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Reservacion_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Reservacion] CHECK CONSTRAINT [FK_Reservacion_Persona]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDatosParaCancelar]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarDatosParaCancelar]
AS
BEGIN
	SELECT
	    r.idReservacion,
		ha.idHabitacion,
		p.idPersona

	FROM Reservacion AS r
	INNER JOIN Habitacion AS ha ON r.idHabitacion = ha.idHabitacion
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
	INNER JOIN Persona AS p ON r.idPersona = p.idPersona
	WHERE p.estado LIKE 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarHabitacionMenor]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,joe>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarHabitacionMenor]
@idHabitacion INT
AS
BEGIN
select count (idHabitacion) from Reservacion where idHabitacion = @idHabitacion
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarHabitacionPorHotel]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,joe>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarHabitacionPorHotel] --Aqui Jalamos los datos de habitacion por medio del hotel
@idHotel int
AS
BEGIN
select  idHabitacion,idHotel,numeroHabitacion,capacidadMaxima,descripcion,estado

from Habitacion
where idHotel = @idHotel
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarHabitacionPorID]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, joe>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarHabitacionPorID] --Consulta la lista de habitaciones por id
@idHabitacion INT
AS
BEGIN
	SELECT
	ha.idHabitacion,
	ha.numeroHabitacion,
	ha.capacidadMaxima,
	ha.estado,
		ho.idHotel,
		ho.nombre,
		ha.descripcion

	FROM Habitacion AS ha
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel

	WHERE ha.idHabitacion = @idHabitacion

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarHotelPorID]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ConsultarHotelPorID]
	
	@idHotel INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SELECT * FROM HOTEL WHERE idHotel = @idHotel
END
GO
/****** Object:  StoredProcedure [dbo].[spCancelarReservacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCancelarReservacion] 

@idReservacion INT,
@idHabitacion INT,
@idPersona INT,
@fechaModificacion DATETIME
AS
BEGIN
	
	UPDATE Reservacion
	SET
	estado = 'I',
	fechaModificacion = @fechaModificacion

	WHERE idReservacion = @idReservacion

	UPDATE Habitacion
	SET
	estado = 'A'
	WHERE idHabitacion = @idHabitacion

	INSERT INTO Bitacora(idPersona,idReservacion,fechaDeLaAccion,accionRealizada)
	VALUES (@idPersona,@idReservacion,@fechaModificacion,'CANCELADA')
		

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCreacionHabitaciones]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaCreacionHabitaciones]
AS
BEGIN

	SELECT  
	idHabitacion,
	ho.idHotel,
	ho.nombre,
	numeroHabitacion,
	capacidadMaxima,
	estado
	
	FROM Habitacion AS ha
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
	ORDER BY nombre,estado,numeroHabitacion ASC
	
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultadeHabitacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, joe>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultadeHabitacion] --Este proc muestra la consulta a las habitaciones
@idHotel int,
@cantidadPersonas int
AS
BEGIN

	SELECT  
	idHabitacion,
	ho.idHotel,
	ho.nombre,
	direccion,
	estado,
	capacidadMaxima

	FROM Habitacion AS ha
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel

	where (ho.idHotel = @idHotel) AND (capacidadMaxima = @cantidadPersonas OR capacidadMaxima > @cantidadPersonas) AND (estado = 'A')
	
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaHabitaciones]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spConsultaHabitaciones]
AS
BEGIN
	SELECT
	h.idHabitacion, h.numeroHabitacion, h.capacidadMaxima,
	h.estado, ho.idHotel, ho.nombre, h.descripcion,
		ho.idHotel,
		ho.nombre,
		ho.costoPorCadaAdulto,
		ho.costoPorCadaNinho

	FROM Habitacion AS h 
	INNER JOIN Hotel AS ho ON h.idHotel = ho.idHotel
	end
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMisReservaciones]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[spConsultaMisReservaciones]
@idPersona int
AS
BEGIN
SELECT 
r.idReservacion, 
ht.nombre as Hotel, 
r.fechaEntrada, 
r.fechaSalida,
r.costoTotal,
p.idPersona,
p.nombreCompleto as NombreP, 
 (case when r.estado = 'I'  then 'Cancelada' when r.estado = 'A' and r.fechaEntrada <= Getdate() or r.estado = 'A' and r.fechaEntrada = Getdate() then 'En proceso' when r.estado = 'A' and r.fechaEntrada > getdate() and r.fechaSalida > getdate() then 'En espera' when r.estado = 'A' and r.fechaSalida < GETDATE() THEN 'Finalizada' end) as estado
 FROM Reservacion as r
inner join Persona as p on p.idPersona = r.idPersona
Inner join Habitacion as hb on r.idHabitacion = hb.idHabitacion
inner join Hotel as ht on ht.idHotel = hb.idHotel
where @idPersona = p.idPersona
order by r.idReservacion desc 

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarBitacora]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarBitacora]

--Este procedimiento lo usaremos para ver todos los movimientos
--realizados por la cuenta seleccionada
@IdReservacion INT
AS
BEGIN
	SELECT
		b.idReservacion,
		b.idPersona,
		p.nombreCompleto,
		b.fechaDeLaAccion,
		b.accionRealizada

	FROM Bitacora AS b
	INNER JOIN Reservacion AS r ON b.idReservacion = r.idReservacion
	LEFT JOIN Persona AS p ON b.idPersona = p.idPersona
	WHERE b.idReservacion = @IdReservacion
	ORDER BY b.idBitacora DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarClientePorId]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarClientePorId] 
--Aqui se consulta la info del cliente
@ID INT
AS
BEGIN
	SELECT
	idPersona,
	nombreCompleto,
      email,
      clave,
      esEmpleado,
      estado 
	FROM dbo.Persona
	WHERE (idPersona = @ID) and (estado like 'A')
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReservacionPorCliente]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReservacionPorCliente]
AS
BEGIN
	SELECT
p.idPersona, p.nombreCompleto
		
		FROM Persona as p
	WHERE p.estado = 'A'
ORDER BY P.nombreCompleto ASC
END

GO
/****** Object:  StoredProcedure [dbo].[spConsultarHabitacionPorId]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarHabitacionPorId]
@idHabitacion INT
AS
BEGIN
	SELECT
	h.idHabitacion, h.numeroHabitacion, h.capacidadMaxima,
	h.estado, ho.idHotel, ho.nombre, h.descripcion

	FROM Habitacion AS h
	INNER JOIN Hotel AS ho ON h.idHotel = ho.idHotel

	WHERE h.idHabitacion = @idHabitacion

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarHotel]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultarHotel]

AS
BEGIN
select idHotel, nombre, direccion , costoPorCadaAdulto, costoPorCadaNinho from Hotel as ho

order by nombre ASC


END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarReservacionPorId]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, joe>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[spConsultarReservacionPorId] --este sp consulta las reservaciones por id en donde muestra todas las columnas
@ID int
AS
BEGIN
	SELECT
		r.idReservacion,
		p.idPersona,
		r.idHabitacion,
		r.fechaEntrada,
		r.fechaSalida,
		r.numeroAdultos,
		r.numeroNinhos,
		r.totalDiasReservacion,
		p.nombreCompleto,
		ha.numeroHabitacion,
		ho.idHotel,
		ho.nombre,
		ho.costoPorCadaAdulto,
		ho.costoPorCadaNinho,
		r.costoTotal,
		r.estado
		

	FROM Reservacion AS r
	INNER JOIN Habitacion AS ha ON r.idHabitacion = ha.idHabitacion
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
	LEFT JOIN Persona AS p ON r.idPersona = p.idPersona
	WHERE r.idReservacion = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTodasLasReservacionesParaDatos]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarTodasLasReservacionesParaDatos] --este procedimiento
--se usa para agregar datos a una clase para usarlo luego en otro procedimiento de creacion o modificacion
AS
BEGIN
	SELECT
		r.idReservacion,
		r.costoPorCadaAdulto,
		r.costoPorCadaNinho,
		r.costoTotal,
		r.totalDiasReservacion,
		ha.numeroHabitacion,
		p.idPersona,
		p.nombreCompleto,
		r.idHabitacion,
		ho.idHotel,
		ho.nombre,
		r.fechaEntrada,
		r.fechaSalida,
		r.estado

	FROM Reservacion AS r
	INNER JOIN Habitacion AS ha ON r.idHabitacion = ha.idHabitacion
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
	INNER JOIN Persona AS p ON r.idPersona = p.idPersona
	ORDER BY r.idReservacion DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTodosClientes]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarTodosClientes]
AS
BEGIN
	SELECT
		p.idPersona,
		p.nombreCompleto
	FROM dbo.Persona p
	WHERE p.estado LIKE 'A'
	ORDER BY p.nombreCompleto ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTodosHoteles]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarTodosHoteles]
AS
BEGIN
	SELECT
		h.idHotel,
		h.nombre
	FROM dbo.Hotel h
	ORDER BY h.nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spcreacionreservacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spcreacionreservacion]--Procedimiento para la creacion de una nueva reservacion donde agarra todos los datos
@idPersona int,
@idHabitacion int,
@diasReservados int,
@fechaEntrada DATETIME,
@fechaSalida DATETIME,
@costoPorAdulto numeric (10,2),
@costoPorNinho numeric (10,2),
@numeroAdultos int,
@numeroNinhos int,
@costoTotal numeric(14,2),
@fechaCreacion DATETIME,
@fechaModificacion DATETIME,
@estado varchar(1)
AS
BEGIN
	INSERT INTO Reservacion (idPersona, idHabitacion,fechaEntrada,fechaSalida,numeroAdultos,numeroNinhos,
	totalDiasReservacion,costoPorCadaAdulto,Hotel.costoPorCadaNinho,costoTotal,fechaCreacion,fechaModificacion,estado)

	VALUES (@idPersona, 
	@idHabitacion, 
	@fechaEntrada,
	@fechaSalida,
	@numeroAdultos,
	@numeroNinhos,
	@diasReservados,
	@costoPorAdulto,
	@costoPorNinho,
	@costoTotal,
	@fechaCreacion,
	@fechaModificacion,
	@estado) 
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearBitacora]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCrearBitacora]
--Insertcion de una nueva Bitacora
@idReservacion int,
@idPersona int,
@accion VARCHAR(25)

AS
BEGIN

	insert into Bitacora(idReservacion,idPersona,accionRealizada, fechaDeLaAccion)
	 select idReservacion,@idPersona, @accion, GETDATE()
	 from Reservacion          
	 where idReservacion = @idReservacion
	 

END
GO
/****** Object:  StoredProcedure [dbo].[spCrearHabitacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[spCrearHabitacion] --Para crear Habitacion

@idHotel int,
@numeroHabitacion VARCHAR(10),
@capacidadMaxima INT,
@descripcion VARCHAR(500)
AS
BEGIN
	
	INSERT INTO Habitacion(idHotel,numeroHabitacion,capacidadMaxima,descripcion, estado)
	VALUES( @idHotel,@numeroHabitacion, @capacidadMaxima, @descripcion,'A')
END


GO
/****** Object:  StoredProcedure [dbo].[spEditarHabitacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEditarHabitacion] --Este procedimiento edita solo numhabitacion, cantidad maima y descripcion
@idHabitacion int,
@NumHabitacion VARCHAR(10),
@cantidadMaxima int,
@descripcion VARCHAR(500)
AS
BEGIN
	
	UPDATE Habitacion
	SET
	numeroHabitacion = @NumHabitacion,
	capacidadMaxima = @cantidadMaxima,
	descripcion = @descripcion,
	estado = 'A'

	where idHabitacion = @idHabitacion
END
GO
/****** Object:  StoredProcedure [dbo].[spEditarReservacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEditarReservacion] --este procedimienro edita la reservacion y en la bitacora aparece como corregida

@idReservacion int,
@numAdultos int,
@numNinhos int,
@fechaEntrada DATETIME,
@fechaSalida DATETIME,
@fechaModificacion DATETIME,
@costoTotal numeric(14,2),
@idPersona INT
AS
BEGIN
	
	UPDATE Reservacion
	SET
	fechaEntrada = @fechaEntrada,
	fechaSalida = @fechaSalida,
	fechaModificacion = @fechaModificacion,
	numeroAdultos = @numAdultos,
	numeroNinhos = @numNinhos,
	costoTotal = @costoTotal

	WHERE idReservacion = @idReservacion	

	INSERT INTO Bitacora
	VALUES (@idReservacion,@idPersona,'CORREGIDA',@fechaModificacion)

	
		
END
GO
/****** Object:  StoredProcedure [dbo].[spFiltrarReservaciones]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
Create PROCEDURE [dbo].[spFiltrarReservaciones]
 
@idCliente as int = null,
@fechaEntrada as datetime = null ,
@fechaSalida as datetime= null 
AS

begin 

(SELECT r.idReservacion, ht.nombre, r.fechaEntrada, r.fechaSalida, r.costoTotal,
 case  
 when r.estado = 'A' and r.fechaSalida < GETDATE() THEN 'Finalizada'
 when r.estado = 'A' and r.fechaEntrada <= Getdate() then 'En proceso' 
  when r.estado = 'A' and r.fechaEntrada > getdate()and r.fechaSalida > getdate() then 'En espera'
 when r.estado = 'I'  then 'Cancelada' 
 else 'Inespecificada' 
 end as estado,
 p.nombreCompleto as cliente, 
 p.idPersona as id_cliente
FROM Reservacion as r
 Inner join Habitacion as hb on r.idHabitacion = hb.idHabitacion
inner join Hotel as ht on ht.idHotel = hb.idHotel
inner join Persona as p on p.idPersona = r.idPersona
where p.idPersona= @idcliente or r.fechaEntrada between @fechaEntrada and @fechaSalida
)

order by r.idReservacion desc 
end
GO
/****** Object:  StoredProcedure [dbo].[spFiltrosFechas]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spFiltrosFechas] --procedimiento para buscar por filtros

	@fechaEntrada DATETIME,
	@fechaSalida DATETIME
AS
BEGIN
SELECT
		r.idReservacion,
		p.idPersona,
		p.nombreCompleto,
		r.idHabitacion,
		ho.idHotel,
		ho.nombre,
		r.fechaEntrada,
		r.fechaSalida,
		r.costoTotal,
		r.estado

	FROM Reservacion AS r
	INNER JOIN Habitacion AS ha ON r.idHabitacion = ha.idHabitacion
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
	INNER JOIN Persona AS p ON r.idPersona = p.idPersona

	WHERE r.fechaEntrada >= IIF(@fechaEntrada IS NOT NULL, @fechaEntrada, r.fechaEntrada)
	AND r.fechaSalida <= IIF(@fechaSalida IS NOT NULL, @fechaSalida,r.fechaSalida)
	ORDER BY r.idReservacion DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spGesReservacionFechas]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGesReservacionFechas]
	-- Add the parameters for the stored procedure here
	@fechaEntrada DATETIME,
	@fechaSalida DATETIME
AS
BEGIN
SELECT
		r.idReservacion,
		p.idPersona,
		p.nombreCompleto,
		r.idHabitacion,
		ho.idHotel,
		ho.nombre as hotel,
		r.fechaEntrada,
		r.fechaSalida,
		r.costoTotal,
		(case when r.estado = 'I'  then 'Cancelada' when r.estado = 'A' 
		and r.fechaEntrada <= Getdate() then 'En proceso' 
		when r.estado = 'A' and r.fechaEntrada > getdate()and r.fechaSalida > getdate() then 'En espera' 
		when r.estado = 'A' and r.fechaSalida < GETDATE() THEN 'Finalizada' end) As estado
 FROM Reservacion as r 
	INNER JOIN Habitacion AS ha ON r.idHabitacion = ha.idHabitacion
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
	INNER JOIN Persona AS p ON r.idPersona = p.idPersona

	WHERE  r.fechaEntrada >= IIF(@fechaEntrada IS NOT NULL, @fechaEntrada, r.fechaEntrada)
	AND r.fechaSalida <= IIF(@fechaSalida IS NOT NULL, @fechaSalida,r.fechaSalida)
	ORDER BY r.idReservacion DESC 
	end
GO
/****** Object:  StoredProcedure [dbo].[spGesReservacionFiltros]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGesReservacionFiltros] --procedimiento para buscar por filtros

	@idpersona int,
	@fechaEntrada DATETIME,
	@fechaSalida DATETIME
AS
BEGIN
SELECT
		r.idReservacion,
		p.idPersona,
		p.nombreCompleto,
		r.idHabitacion,
		ho.idHotel,
		ho.nombre as hotel,
		r.fechaEntrada,
		r.fechaSalida,
		r.costoTotal,
		(case when r.estado = 'I'  then 'Cancelada' when r.estado = 'A' 
		and r.fechaEntrada <= Getdate() then 'En proceso' 
		when r.estado = 'A' and r.fechaEntrada > getdate()and r.fechaSalida > getdate() then 'En espera' 
		when r.estado = 'A' and r.fechaSalida < GETDATE() THEN 'Finalizada' end) As estado
 FROM Reservacion as r 
	INNER JOIN Habitacion AS ha ON r.idHabitacion = ha.idHabitacion
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
	INNER JOIN Persona AS p ON r.idPersona = p.idPersona

	WHERE p.idPersona = IIF(@idpersona >= 0 ,@idpersona,p.idPersona) AND r.fechaEntrada >= IIF(@fechaEntrada IS NOT NULL, @fechaEntrada, r.fechaEntrada)
	AND r.fechaSalida <= IIF(@fechaSalida IS NOT NULL, @fechaSalida,r.fechaSalida)
	ORDER BY r.idReservacion DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[spGestionarReservaciones]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[spGestionarReservaciones]
AS
BEGIN
SELECT
		r.idReservacion,
		p.idPersona,
		p.nombreCompleto,
		r.idHabitacion,
		ho.idHotel,
		ho.nombre as hotel,
		r.fechaEntrada,
		r.fechaSalida,
		r.costoTotal,
		 (case when r.estado = 'I'  then 'Cancelada'
		 when r.estado = 'A' and r.fechaEntrada <= Getdate() or r.estado = 'A' and r.fechaEntrada = Getdate() then 'En proceso' 
		 when r.estado = 'A' and r.fechaEntrada > getdate() and r.fechaSalida > getdate() then 'En espera' 
		 when r.estado = 'A' and r.fechaSalida < GETDATE() THEN 'Finalizada' end) as estado
FROM Reservacion as r 
	INNER JOIN Habitacion AS ha ON r.idHabitacion = ha.idHabitacion
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
	INNER JOIN Persona AS p ON r.idPersona = p.idPersona

order by r.idReservacion desc 

END
GO
/****** Object:  StoredProcedure [dbo].[spHabitacionInactiva]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spHabitacionInactiva]
@idHabitacion int
AS
BEGIN

	UPDATE Habitacion
	 SET
	  estado ='I'

	WHERE (idHabitacion = @idHabitacion) and (estado = 'A')

END
GO
/****** Object:  StoredProcedure [dbo].[spListaHabitaciones]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, joe>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[spListaHabitaciones]
AS
BEGIN

	SELECT  
	idHabitacion,
	ho.idHotel,
	ho.nombre,
	numeroHabitacion,
	capacidadMaxima,
	(case when estado = 'I'  then 'Inactiva' when estado = 'A'  THEN 'Activa' end) as estado

	FROM Habitacion AS ha
	INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel

	ORDER BY nombre,estado,numeroHabitacion ASC
	
END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spLogin]

@Email varchar(100),
@Clave varchar(50)

AS

BEGIN
--Este procedimiento consulta el email, clave y estado para realizar el logueo

	SELECT
	*
	FROM dbo.Persona 
	where estado = 'A' and email = @Email and clave = @Clave

END
GO
/****** Object:  StoredProcedure [dbo].[spNuevaBitacora]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spNuevaBitacora]
--Insertcion de una nueva Bitacora
@idReservacion int,
@idPersona int,
@fechaCreacion DATETIME,
@accion VARCHAR(25)

AS
BEGIN

	insert into Bitacora(idReservacion,idPersona,accionRealizada,fechaDeLaAccion)
	 select idReservacion,@idPersona, @accion,@fechaCreacion
	 from Reservacion          
	 where idReservacion = @idReservacion
	 

END
GO
/****** Object:  StoredProcedure [dbo].[spNuevaReservacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joe, Chang>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spNuevaReservacion] 

@idPersonaAutenticada int,
@idPersona int,
@idHotel int,
@fechaEntrada DATETIME,
@fechaSalida DATETIME,
@numeroAdultos int,
@numeroNinhos int
AS
DECLARE
@idReservacion int,
@idHabitacion int,
@costoPorAdulto numeric (10,2),
@costoPorNinho numeric (10,2),
@totalDiasReservacion int,
@totalPersonaReservacion int,
@costoTotal numeric(14,2)

BEGIN
set @totalDiasReservacion = DATEDIFF(Day, @fechaEntrada, @fechaSalida) + 1
set @totalPersonaReservacion = @numeroAdultos + @numeroNinhos

select @costoPorAdulto = ho.costoPorCadaAdulto, @costoPorNinho = ho.costoPorCadaNinho
from dbo.Hotel as ho
where ho.idHotel = @idHotel

SELECT Top 1 @idHabitacion = rha.idHabitacion
from dbo.vReservacionesPorHabitacionActiva as rha
Where rha.idHotel = @idHotel AND rha.capacidadMaxima >= @totalPersonaReservacion
Order by rha.cantidadResevacion ASC, rha.capacidadMaxima ASC, rha.idHabitacion ASC

Set @costoTotal = @totalDiasReservacion *((@numeroAdultos * @costoPorAdulto) + (@numeroNinhos * @costoPorNinho))

insert into dbo.Reservacion (idPersona, idHabitacion, fechaEntrada, fechaSalida, numeroAdultos, numeroNinhos, totalDiasReservacion, costoPorCadaNinho, costoPorCadaAdulto, costoTotal, fechaModificacion, fechaCreacion, estado)
values (@idPersona, @idHabitacion,@fechaEntrada,@fechaSalida,@numeroAdultos,@numeroNinhos, @totalDiasReservacion, @costoPorNinho,@costoPorAdulto,@costoTotal, GETDATE(), GETDATE(), 'A')

set @idReservacion = SCOPE_IDENTITY()

EXEC spCrearBitacora @idReservacion, @idPersona, 'CREADA'

end 
GO
/****** Object:  StoredProcedure [dbo].[spValidacionHabitacion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spValidacionHabitacion]
@idHotel INT,
@NumHabitacion varchar(15)
AS
DECLARE
@resultado Int
BEGIN
select @resultado = count(*)
from dbo.Habitacion ha
INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
where 
ha.idHotel = ISNULL(@idHotel, 0) AND
ha.idHabitacion <> ISNULL(ho.idHotel, 0) AND
ha.numeroHabitacion = ISNULL(@NumHabitacion, '')

select @resultado resultado
END
GO
/****** Object:  StoredProcedure [dbo].[spValidacionHabitacionEicion]    Script Date: 3/9/2023 12:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spValidacionHabitacionEicion]
@idHabitacion INT,
@NumHabitacion varchar(15)
AS
DECLARE
@resultado Int
BEGIN
select @resultado = count(*)
from dbo.Habitacion ha
INNER JOIN Hotel AS ho ON ha.idHotel = ho.idHotel
where 
ha.idHotel = ISNULL(ho.idHotel, 0) AND
ha.idHabitacion <> ISNULL(@idHabitacion, 0) AND
ha.numeroHabitacion = ISNULL(@NumHabitacion, '')

select @resultado resultado
END
GO
USE [master]
GO
ALTER DATABASE [Hosting_System] SET  READ_WRITE 
GO
