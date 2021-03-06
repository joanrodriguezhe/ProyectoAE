USE [master]
GO
--Borrar si existe
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'AE_GestionEventos')
DROP DATABASE [AE_GestionEventos]
GO

--Crear la Base de Datos
CREATE DATABASE [AE_GestionEventos] ON  PRIMARY 
( NAME = N'AE_GestionEventos', FILENAME = N'C:\ProyectoAE\AE_GestionEventos.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AE_GestionEventos_log', FILENAME = N'C:\ProyectoAE\AE_GestionEventos.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

USE [AE_GestionEventos]
GO

--Crear Tablas
CREATE TABLE [dbo].[rh_cat_personas](
	[IdPersona] [int] identity(1,1),
	[IdInstituto] [int] NULL,
	[NumControl] [varchar](20) NULL,
	[Nombre] [varchar](100) NULL,
	[ApPaterno] [varchar](60) NULL,
	[ApMaterno] [varchar](60) NULL,
	[RFC] [varchar](10) NULL,
	[CURP] [varchar](25) NULL,
	[TipoPersona] [char](1) NULL,
	[Sexo] [char](1) NULL,
	[RutaFoto] [varchar](255) NULL,
	[Alias] [varchar](20) NULL,
	[FechaNac] [datetime] NULL,
 CONSTRAINT [PK_rh_cat_personas] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[eva_cat_edificios](
	[IdEdificio] [int] identity(1,1),
	[Clave] [varchar](20) NULL,
	[Alias] [varchar](10) NULL,
	[DesEdificio] [varchar](50) NULL,
	[Prioridad] [int] NULL,
 CONSTRAINT [PK_eva_cat_edificios] PRIMARY KEY CLUSTERED 
(
	[IdEdificio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cat_tipos_generales](
	[IdTipoGeneral] [int] identity(1,1),
	[DesTipo] [varchar](100) NULL,
	[Activo] [char](1) NULL,
 CONSTRAINT [PK_cat_tipos_generales] PRIMARY KEY CLUSTERED 
(
	[IdTipoGeneral] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cat_tipos_estatus](
	[IdTipoEstatus] [int] identity(1,1),
	[DesTipoEstatus] [varchar](30) NULL,
	[Activo] [char](1) NULL,
 CONSTRAINT [PK_cat_tipos_estatus] PRIMARY KEY CLUSTERED 
(
	[IdTipoEstatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[eva_cat_espacios](
	[IdEdificio] [int] NULL,
	[IdEspacio] [int] identity(1,1),
	[Clave] [varchar](20) NULL,
	[Alias] [varchar](10) NULL,
	[DesEspacio] [varchar](50) NULL,
	[Capacidad] [int] NULL,
	[Prioridad] [int] NULL,
 CONSTRAINT [PK_eva_cat_espacios] PRIMARY KEY CLUSTERED 
(
	[IdEspacio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cat_generales](
	[IdTipoGeneral] [int] NULL,
	[IdGeneral] [int] identity(1,1),
	[Clave] [varchar](20) NULL,
	[DesGeneral] [varchar](100) NULL,
	[Activo] [char](1) NULL,
 CONSTRAINT [PK_cat_generales] PRIMARY KEY CLUSTERED 
(
	[IdGeneral] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cat_estatus](
	[IdTipoEstatus] [int] NULL,
	[IdEstatus] [int] identity(1,1),
	[Clave] [varchar](50) NULL,
	[DesEstatus] [varchar](30) NULL,
	[Activo] [char](1) NULL,
 CONSTRAINT [PK_cat_estatus] PRIMARY KEY CLUSTERED 
(
	[IdEstatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_eventos](
	[IdEvento] [int] identity(1,1),
	[IdTipoGenEvento] [int] NOT NULL,
	[IdGenEvento] [int] NOT NULL,
	[IdPersonaReg] [int] NOT NULL,
	[NombreEvento] [varchar](50) NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[Explicacion] [varchar](50) NULL,
	[URL] [varchar](50) NULL,
	[FechaIn] [datetime] NULL,
	[FechaFin] [datetime] NULL,
	[IdEdificio] [int] NULL,
	[FechaReg] [datetime] NULL,
	[UsuarioReg] [smallint] NULL,
 CONSTRAINT [PK_res_eventos] PRIMARY KEY CLUSTERED 
(
	[IdEvento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_cat_zonas](
	[IdEdificio] [int] NULL,
	[IdEspacio] [int] NULL,
	[IdZona] [int] identity(1,1),
	[DesZona] [varchar](255) NULL,
	[CapacidadPer] [int] NULL,
	[Filas] [int] NULL,
	[AsientosPorFila] [int] NULL,
 CONSTRAINT [PK_res_cat_zonas] PRIMARY KEY CLUSTERED 
(
	[IdZona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cat_productos_servicios](
	[IdProdServ] [int] identity(1,1),
	[ClaveProdServ] [varchar](20) NULL,
	[CodigoBarras] [varchar](50) NULL,
	[DesProdServ] [varchar](200) NULL,
	[ProductoServicio] [char](1) NULL,
	[IdTipoGenProdServ] [int] NULL,
	[IdGenProdServ] [int] NULL,
 CONSTRAINT [PK_cat_productos_servicios] PRIMARY KEY CLUSTERED 
(
	[IdProdServ] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cat_prod_serv_especifico](
	[IdProdServ] [int] identity(1,1),
	[IdProdServEsp] [int] NOT NULL,
	[ClaveProdServEsp] [varchar](20) NULL,
	[DesProdServEsp] [varchar](200) NULL,
 CONSTRAINT [PK_cat_prod_serv_especifico] PRIMARY KEY CLUSTERED 
(
	[IdProdServEsp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_evento_horarios](
	[IdEvento] [int] NULL,
	[IdHorarioDet] [int] identity(1,1),
	[IdEdificio] [int] NULL,
	[IdEspacio] [int] NULL,
	[Dia] [varchar](10) NULL,
	[FechaHoraIni] [datetime] NULL,
	[FechaHoraFin] [datetime] NULL,
	[Disponible] [char](1) NULL,
	[FechaReg] [datetime] NULL,
	[UsuarioReg] [char](18) NULL,
 CONSTRAINT [PK_res_evento_horarios] PRIMARY KEY CLUSTERED 
(
	[IdHorarioDet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_evento_estatus](
	[IdEvento] [int] NOT NULL,
	[IdEstatusDet] [int] identity(1,1),
	[FechaEstatus] [datetime] NULL,
	[IdTipoEstatus] [int] NULL,
	[IdEstatus] [int] NULL,
	[Actual] [char](1) NULL,
	[Observacion] [varchar](50) NULL,
	[UsuarioReg] [varchar](50) NULL,
 CONSTRAINT [PK_res_evento_estatus] PRIMARY KEY CLUSTERED 
(
	[IdEstatusDet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_evento_clientes](
	[IdEvento] [int] NULL,
	[IdReservaCliente] [int] identity(1,1),
	[IdClienteReserva] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_res_evento_clientes] PRIMARY KEY CLUSTERED 
(
	[IdReservaCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_evento_zonas](
	[IdEdificio] [int] NULL,
	[IdEspacio] [int] NULL,
	[IdEvento] [int] NULL,
	[IdZona] [int] NULL,
	[FechaReg] [datetime] NULL,
	[UsuarioReg] [varchar](20) NULL,
	[RutaImagen] [varchar](255) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_evento_zona_boletos](
	[IdBoleto] [int] identity(1,1),
	[IdEvento] [int] NULL,
	[IdEdificio] [int] NULL,
	[IdEspacio] [int] NULL,
	[IdZona] [int] NULL,
	[NumBoleto] [varchar](20) NULL,
	[DesBoleto] [varchar](20) NULL,
	[Precio] [float] NULL,
	[IVA] [float] NULL,
	[Ubicacion] [varchar](50) NULL,
 CONSTRAINT [PK_res_evento_zona_boletos] PRIMARY KEY CLUSTERED 
(
	[IdBoleto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_zonas_servicios](
	[IdEdificio] [int] NULL,
	[IdEspacio] [int] NULL,
	[IdZona] [int] NULL,
	[IdProdServ] [int] NULL,
	[IdProdServEsp] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_evento_zona_boleto_estatus](
	[IdBoleto] [int] NULL,
	[IdEstatusDet] [int] identity(1,1),
	[FechaEstatus] [datetime] NULL,
	[IdTipoEstatus] [int] NULL,
	[IdEstatus] [int] NULL,
	[Actual] [char](1) NULL,
	[Observacion] [varchar](500) NULL,
	[UsuarioReg] [varchar](50) NULL,
 CONSTRAINT [PK_res_evento_zona_boleto_estatus] PRIMARY KEY CLUSTERED 
(
	[IdEstatusDet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[res_evento_servicios](
	[IdEvento] [int] NULL,
	[Requerido] [char](1) NULL,
	[IdProdServ] [int] NULL,
	[IdProdServEsp] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_evento_cliente_prod_serv](
	[IdEvento] [int] NULL,
	[IdReservaCliente] [int] NULL,
	[IdReservaServDet] [int] identity(1,1),
	[IdProdServ] [int] NULL,
	[IdProdServEsp] [int] NULL,
	[Cantidad] [float] NULL,
	[Precio] [float] NULL,
	[IVA] [float] NULL,
	[IdUnidadMedida] [int] NULL,
	[Importe] [float] NULL,
 CONSTRAINT [PK_res_evento_cliente_prod_serv] PRIMARY KEY CLUSTERED 
(
	[IdReservaServDet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[res_evento_cliente_boletos](
	[IdReservaCliente] [int] NULL,
	[IdEvento] [int] NULL,
	[IdBoleto] [int] NULL,
	[IdPersona] [int] NULL,
	[ConfirmaAsistencia] [char](1) NULL,
	[Nombre] [varchar](60) NULL
) ON [PRIMARY]
GO

--Llaves foráneas

/****** Object:  ForeignKey [FK_eva_cat_espacios_eva_cat_edificios]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[eva_cat_espacios]  WITH CHECK ADD  CONSTRAINT [FK_eva_cat_espacios_eva_cat_edificios] FOREIGN KEY([IdEdificio])
REFERENCES [dbo].[eva_cat_edificios] ([IdEdificio])
GO
ALTER TABLE [dbo].[eva_cat_espacios] CHECK CONSTRAINT [FK_eva_cat_espacios_eva_cat_edificios]
GO
/****** Object:  ForeignKey [FK_cat_generales_cat_tipos_generales]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[cat_generales]  WITH CHECK ADD  CONSTRAINT [FK_cat_generales_cat_tipos_generales] FOREIGN KEY([IdTipoGeneral])
REFERENCES [dbo].[cat_tipos_generales] ([IdTipoGeneral])
GO
ALTER TABLE [dbo].[cat_generales] CHECK CONSTRAINT [FK_cat_generales_cat_tipos_generales]
GO
/****** Object:  ForeignKey [FK_cat_estatus_cat_tipos_estatus]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[cat_estatus]  WITH CHECK ADD  CONSTRAINT [FK_cat_estatus_cat_tipos_estatus] FOREIGN KEY([IdTipoEstatus])
REFERENCES [dbo].[cat_tipos_estatus] ([IdTipoEstatus])
GO
ALTER TABLE [dbo].[cat_estatus] CHECK CONSTRAINT [FK_cat_estatus_cat_tipos_estatus]
GO
/****** Object:  ForeignKey [FK_res_eventos_cat_generales]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[res_eventos]  WITH CHECK ADD  CONSTRAINT [FK_res_eventos_cat_generales] FOREIGN KEY([IdGenEvento])
REFERENCES [dbo].[cat_generales] ([IdGeneral])
GO
ALTER TABLE [dbo].[res_eventos] CHECK CONSTRAINT [FK_res_eventos_cat_generales]
GO
/****** Object:  ForeignKey [FK_res_eventos_cat_tipos_generales]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[res_eventos]  WITH CHECK ADD  CONSTRAINT [FK_res_eventos_cat_tipos_generales] FOREIGN KEY([IdTipoGenEvento])
REFERENCES [dbo].[cat_tipos_generales] ([IdTipoGeneral])
GO
ALTER TABLE [dbo].[res_eventos] CHECK CONSTRAINT [FK_res_eventos_cat_tipos_generales]
GO
/****** Object:  ForeignKey [FK_res_eventos_eva_cat_edificios]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[res_eventos]  WITH CHECK ADD  CONSTRAINT [FK_res_eventos_eva_cat_edificios] FOREIGN KEY([IdEdificio])
REFERENCES [dbo].[eva_cat_edificios] ([IdEdificio])
GO
ALTER TABLE [dbo].[res_eventos] CHECK CONSTRAINT [FK_res_eventos_eva_cat_edificios]
GO
/****** Object:  ForeignKey [FK_res_eventos_rh_cat_personas]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[res_eventos]  WITH CHECK ADD  CONSTRAINT [FK_res_eventos_rh_cat_personas] FOREIGN KEY([IdPersonaReg])
REFERENCES [dbo].[rh_cat_personas] ([IdPersona])
GO
ALTER TABLE [dbo].[res_eventos] CHECK CONSTRAINT [FK_res_eventos_rh_cat_personas]
GO
/****** Object:  ForeignKey [FK_res_cat_zonas_eva_cat_edificios]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[res_cat_zonas]  WITH CHECK ADD  CONSTRAINT [FK_res_cat_zonas_eva_cat_edificios] FOREIGN KEY([IdEdificio])
REFERENCES [dbo].[eva_cat_edificios] ([IdEdificio])
GO
ALTER TABLE [dbo].[res_cat_zonas] CHECK CONSTRAINT [FK_res_cat_zonas_eva_cat_edificios]
GO
/****** Object:  ForeignKey [FK_res_cat_zonas_eva_cat_espacios]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[res_cat_zonas]  WITH CHECK ADD  CONSTRAINT [FK_res_cat_zonas_eva_cat_espacios] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[eva_cat_espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[res_cat_zonas] CHECK CONSTRAINT [FK_res_cat_zonas_eva_cat_espacios]
GO
/****** Object:  ForeignKey [FK_cat_productos_servicios_cat_generales]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[cat_productos_servicios]  WITH CHECK ADD  CONSTRAINT [FK_cat_productos_servicios_cat_generales] FOREIGN KEY([IdGenProdServ])
REFERENCES [dbo].[cat_generales] ([IdGeneral])
GO
ALTER TABLE [dbo].[cat_productos_servicios] CHECK CONSTRAINT [FK_cat_productos_servicios_cat_generales]
GO
/****** Object:  ForeignKey [FK_cat_productos_servicios_cat_tipos_generales]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[cat_productos_servicios]  WITH CHECK ADD  CONSTRAINT [FK_cat_productos_servicios_cat_tipos_generales] FOREIGN KEY([IdTipoGenProdServ])
REFERENCES [dbo].[cat_tipos_generales] ([IdTipoGeneral])
GO
ALTER TABLE [dbo].[cat_productos_servicios] CHECK CONSTRAINT [FK_cat_productos_servicios_cat_tipos_generales]
GO
/****** Object:  ForeignKey [FK_cat_prod_serv_especifico_cat_productos_servicios]    Script Date: 06/06/2018 21:19:11 ******/
ALTER TABLE [dbo].[cat_prod_serv_especifico]  WITH CHECK ADD  CONSTRAINT [FK_cat_prod_serv_especifico_cat_productos_servicios] FOREIGN KEY([IdProdServ])
REFERENCES [dbo].[cat_productos_servicios] ([IdProdServ])
GO
ALTER TABLE [dbo].[cat_prod_serv_especifico] CHECK CONSTRAINT [FK_cat_prod_serv_especifico_cat_productos_servicios]
GO
/****** Object:  ForeignKey [FK_res_evento_horarios_eva_cat_edificios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_horarios]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_horarios_eva_cat_edificios] FOREIGN KEY([IdEdificio])
REFERENCES [dbo].[eva_cat_edificios] ([IdEdificio])
GO
ALTER TABLE [dbo].[res_evento_horarios] CHECK CONSTRAINT [FK_res_evento_horarios_eva_cat_edificios]
GO
/****** Object:  ForeignKey [FK_res_evento_horarios_eva_cat_espacios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_horarios]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_horarios_eva_cat_espacios] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[eva_cat_espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[res_evento_horarios] CHECK CONSTRAINT [FK_res_evento_horarios_eva_cat_espacios]
GO
/****** Object:  ForeignKey [FK_res_evento_horarios_res_eventos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_horarios]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_horarios_res_eventos] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[res_eventos] ([IdEvento])
GO
ALTER TABLE [dbo].[res_evento_horarios] CHECK CONSTRAINT [FK_res_evento_horarios_res_eventos]
GO
/****** Object:  ForeignKey [FK_res_evento_estatus_cat_estatus]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_estatus]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_estatus_cat_estatus] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[cat_estatus] ([IdEstatus])
GO
ALTER TABLE [dbo].[res_evento_estatus] CHECK CONSTRAINT [FK_res_evento_estatus_cat_estatus]
GO
/****** Object:  ForeignKey [FK_res_evento_estatus_cat_tipos_estatus]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_estatus]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_estatus_cat_tipos_estatus] FOREIGN KEY([IdTipoEstatus])
REFERENCES [dbo].[cat_tipos_estatus] ([IdTipoEstatus])
GO
ALTER TABLE [dbo].[res_evento_estatus] CHECK CONSTRAINT [FK_res_evento_estatus_cat_tipos_estatus]
GO
/****** Object:  ForeignKey [FK_res_evento_estatus_res_eventos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_estatus]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_estatus_res_eventos] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[res_eventos] ([IdEvento])
GO
ALTER TABLE [dbo].[res_evento_estatus] CHECK CONSTRAINT [FK_res_evento_estatus_res_eventos]
GO
/****** Object:  ForeignKey [FK_res_evento_clientes_res_eventos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_clientes]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_clientes_res_eventos] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[res_eventos] ([IdEvento])
GO
ALTER TABLE [dbo].[res_evento_clientes] CHECK CONSTRAINT [FK_res_evento_clientes_res_eventos]
GO
/****** Object:  ForeignKey [FK_res_evento_zonas_eva_cat_edificios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zonas]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zonas_eva_cat_edificios] FOREIGN KEY([IdEdificio])
REFERENCES [dbo].[eva_cat_edificios] ([IdEdificio])
GO
ALTER TABLE [dbo].[res_evento_zonas] CHECK CONSTRAINT [FK_res_evento_zonas_eva_cat_edificios]
GO
/****** Object:  ForeignKey [FK_res_evento_zonas_eva_cat_espacios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zonas]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zonas_eva_cat_espacios] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[eva_cat_espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[res_evento_zonas] CHECK CONSTRAINT [FK_res_evento_zonas_eva_cat_espacios]
GO
/****** Object:  ForeignKey [FK_res_evento_zonas_res_cat_zonas]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zonas]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zonas_res_cat_zonas] FOREIGN KEY([IdZona])
REFERENCES [dbo].[res_cat_zonas] ([IdZona])
GO
ALTER TABLE [dbo].[res_evento_zonas] CHECK CONSTRAINT [FK_res_evento_zonas_res_cat_zonas]
GO
/****** Object:  ForeignKey [FK_res_evento_zonas_res_eventos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zonas]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zonas_res_eventos] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[res_eventos] ([IdEvento])
GO
ALTER TABLE [dbo].[res_evento_zonas] CHECK CONSTRAINT [FK_res_evento_zonas_res_eventos]
GO
/****** Object:  ForeignKey [FK_res_evento_zona_boletos_eva_cat_edificios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zona_boletos]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zona_boletos_eva_cat_edificios] FOREIGN KEY([IdEdificio])
REFERENCES [dbo].[eva_cat_edificios] ([IdEdificio])
GO
ALTER TABLE [dbo].[res_evento_zona_boletos] CHECK CONSTRAINT [FK_res_evento_zona_boletos_eva_cat_edificios]
GO
/****** Object:  ForeignKey [FK_res_evento_zona_boletos_eva_cat_espacios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zona_boletos]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zona_boletos_eva_cat_espacios] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[eva_cat_espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[res_evento_zona_boletos] CHECK CONSTRAINT [FK_res_evento_zona_boletos_eva_cat_espacios]
GO
/****** Object:  ForeignKey [FK_res_evento_zona_boletos_res_cat_zonas]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zona_boletos]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zona_boletos_res_cat_zonas] FOREIGN KEY([IdZona])
REFERENCES [dbo].[res_cat_zonas] ([IdZona])
GO
ALTER TABLE [dbo].[res_evento_zona_boletos] CHECK CONSTRAINT [FK_res_evento_zona_boletos_res_cat_zonas]
GO
/****** Object:  ForeignKey [FK_res_evento_zona_boletos_res_eventos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zona_boletos]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zona_boletos_res_eventos] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[res_eventos] ([IdEvento])
GO
ALTER TABLE [dbo].[res_evento_zona_boletos] CHECK CONSTRAINT [FK_res_evento_zona_boletos_res_eventos]
GO
/****** Object:  ForeignKey [FK_res_zonas_servicios_cat_prod_serv_especifico]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_zonas_servicios]  WITH CHECK ADD  CONSTRAINT [FK_res_zonas_servicios_cat_prod_serv_especifico] FOREIGN KEY([IdProdServEsp])
REFERENCES [dbo].[cat_prod_serv_especifico] ([IdProdServEsp])
GO
ALTER TABLE [dbo].[res_zonas_servicios] CHECK CONSTRAINT [FK_res_zonas_servicios_cat_prod_serv_especifico]
GO
/****** Object:  ForeignKey [FK_res_zonas_servicios_cat_productos_servicios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_zonas_servicios]  WITH CHECK ADD  CONSTRAINT [FK_res_zonas_servicios_cat_productos_servicios] FOREIGN KEY([IdProdServ])
REFERENCES [dbo].[cat_productos_servicios] ([IdProdServ])
GO
ALTER TABLE [dbo].[res_zonas_servicios] CHECK CONSTRAINT [FK_res_zonas_servicios_cat_productos_servicios]
GO
/****** Object:  ForeignKey [FK_res_zonas_servicios_eva_cat_edificios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_zonas_servicios]  WITH CHECK ADD  CONSTRAINT [FK_res_zonas_servicios_eva_cat_edificios] FOREIGN KEY([IdEdificio])
REFERENCES [dbo].[eva_cat_edificios] ([IdEdificio])
GO
ALTER TABLE [dbo].[res_zonas_servicios] CHECK CONSTRAINT [FK_res_zonas_servicios_eva_cat_edificios]
GO
/****** Object:  ForeignKey [FK_res_zonas_servicios_eva_cat_espacios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_zonas_servicios]  WITH CHECK ADD  CONSTRAINT [FK_res_zonas_servicios_eva_cat_espacios] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[eva_cat_espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[res_zonas_servicios] CHECK CONSTRAINT [FK_res_zonas_servicios_eva_cat_espacios]
GO
/****** Object:  ForeignKey [FK_res_zonas_servicios_res_cat_zonas]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_zonas_servicios]  WITH CHECK ADD  CONSTRAINT [FK_res_zonas_servicios_res_cat_zonas] FOREIGN KEY([IdZona])
REFERENCES [dbo].[res_cat_zonas] ([IdZona])
GO
ALTER TABLE [dbo].[res_zonas_servicios] CHECK CONSTRAINT [FK_res_zonas_servicios_res_cat_zonas]
GO
/****** Object:  ForeignKey [FK_res_evento_zona_boleto_estatus_cat_estatus]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zona_boleto_estatus]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zona_boleto_estatus_cat_estatus] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[cat_estatus] ([IdEstatus])
GO
ALTER TABLE [dbo].[res_evento_zona_boleto_estatus] CHECK CONSTRAINT [FK_res_evento_zona_boleto_estatus_cat_estatus]
GO
/****** Object:  ForeignKey [FK_res_evento_zona_boleto_estatus_cat_tipos_estatus]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zona_boleto_estatus]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zona_boleto_estatus_cat_tipos_estatus] FOREIGN KEY([IdTipoEstatus])
REFERENCES [dbo].[cat_tipos_estatus] ([IdTipoEstatus])
GO
ALTER TABLE [dbo].[res_evento_zona_boleto_estatus] CHECK CONSTRAINT [FK_res_evento_zona_boleto_estatus_cat_tipos_estatus]
GO
/****** Object:  ForeignKey [FK_res_evento_zona_boleto_estatus_res_evento_zona_boletos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_zona_boleto_estatus]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_zona_boleto_estatus_res_evento_zona_boletos] FOREIGN KEY([IdBoleto])
REFERENCES [dbo].[res_evento_zona_boletos] ([IdBoleto])
GO
ALTER TABLE [dbo].[res_evento_zona_boleto_estatus] CHECK CONSTRAINT [FK_res_evento_zona_boleto_estatus_res_evento_zona_boletos]
GO
/****** Object:  ForeignKey [FK_res_evento_servicios_cat_prod_serv_especifico]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_servicios]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_servicios_cat_prod_serv_especifico] FOREIGN KEY([IdProdServEsp])
REFERENCES [dbo].[cat_prod_serv_especifico] ([IdProdServEsp])
GO
ALTER TABLE [dbo].[res_evento_servicios] CHECK CONSTRAINT [FK_res_evento_servicios_cat_prod_serv_especifico]
GO
/****** Object:  ForeignKey [FK_res_evento_servicios_cat_productos_servicios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_servicios]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_servicios_cat_productos_servicios] FOREIGN KEY([IdProdServ])
REFERENCES [dbo].[cat_productos_servicios] ([IdProdServ])
GO
ALTER TABLE [dbo].[res_evento_servicios] CHECK CONSTRAINT [FK_res_evento_servicios_cat_productos_servicios]
GO
/****** Object:  ForeignKey [FK_res_evento_servicios_res_eventos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_servicios]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_servicios_res_eventos] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[res_eventos] ([IdEvento])
GO
ALTER TABLE [dbo].[res_evento_servicios] CHECK CONSTRAINT [FK_res_evento_servicios_res_eventos]
GO
/****** Object:  ForeignKey [FK_res_evento_cliente_prod_serv_cat_prod_serv_especifico]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_cliente_prod_serv]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_cliente_prod_serv_cat_prod_serv_especifico] FOREIGN KEY([IdProdServEsp])
REFERENCES [dbo].[cat_prod_serv_especifico] ([IdProdServEsp])
GO
ALTER TABLE [dbo].[res_evento_cliente_prod_serv] CHECK CONSTRAINT [FK_res_evento_cliente_prod_serv_cat_prod_serv_especifico]
GO
/****** Object:  ForeignKey [FK_res_evento_cliente_prod_serv_cat_productos_servicios]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_cliente_prod_serv]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_cliente_prod_serv_cat_productos_servicios] FOREIGN KEY([IdProdServ])
REFERENCES [dbo].[cat_productos_servicios] ([IdProdServ])
GO
ALTER TABLE [dbo].[res_evento_cliente_prod_serv] CHECK CONSTRAINT [FK_res_evento_cliente_prod_serv_cat_productos_servicios]
GO
/****** Object:  ForeignKey [FK_res_evento_cliente_prod_serv_res_evento_clientes]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_cliente_prod_serv]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_cliente_prod_serv_res_evento_clientes] FOREIGN KEY([IdReservaCliente])
REFERENCES [dbo].[res_evento_clientes] ([IdReservaCliente])
GO
ALTER TABLE [dbo].[res_evento_cliente_prod_serv] CHECK CONSTRAINT [FK_res_evento_cliente_prod_serv_res_evento_clientes]
GO
/****** Object:  ForeignKey [FK_res_evento_cliente_prod_serv_res_eventos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_cliente_prod_serv]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_cliente_prod_serv_res_eventos] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[res_eventos] ([IdEvento])
GO
ALTER TABLE [dbo].[res_evento_cliente_prod_serv] CHECK CONSTRAINT [FK_res_evento_cliente_prod_serv_res_eventos]
GO
/****** Object:  ForeignKey [FK_res_evento_cliente_boletos_res_evento_clientes]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_cliente_boletos]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_cliente_boletos_res_evento_clientes] FOREIGN KEY([IdReservaCliente])
REFERENCES [dbo].[res_evento_clientes] ([IdReservaCliente])
GO
ALTER TABLE [dbo].[res_evento_cliente_boletos] CHECK CONSTRAINT [FK_res_evento_cliente_boletos_res_evento_clientes]
GO
/****** Object:  ForeignKey [FK_res_evento_cliente_boletos_res_evento_zona_boletos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_cliente_boletos]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_cliente_boletos_res_evento_zona_boletos] FOREIGN KEY([IdBoleto])
REFERENCES [dbo].[res_evento_zona_boletos] ([IdBoleto])
GO
ALTER TABLE [dbo].[res_evento_cliente_boletos] CHECK CONSTRAINT [FK_res_evento_cliente_boletos_res_evento_zona_boletos]
GO
/****** Object:  ForeignKey [FK_res_evento_cliente_boletos_res_eventos]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_cliente_boletos]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_cliente_boletos_res_eventos] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[res_eventos] ([IdEvento])
GO
ALTER TABLE [dbo].[res_evento_cliente_boletos] CHECK CONSTRAINT [FK_res_evento_cliente_boletos_res_eventos]
GO
/****** Object:  ForeignKey [FK_res_evento_cliente_boletos_rh_cat_personas]    Script Date: 06/06/2018 21:19:12 ******/
ALTER TABLE [dbo].[res_evento_cliente_boletos]  WITH CHECK ADD  CONSTRAINT [FK_res_evento_cliente_boletos_rh_cat_personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[rh_cat_personas] ([IdPersona])
GO
ALTER TABLE [dbo].[res_evento_cliente_boletos] CHECK CONSTRAINT [FK_res_evento_cliente_boletos_rh_cat_personas]
GO