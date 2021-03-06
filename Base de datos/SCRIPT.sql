USE [BD_VAZQUEZ]
GO
/****** Object:  Table [dbo].[tblCategoria]    Script Date: 07/09/2018 08:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategoria](
	[IdCategoria] [varchar](6) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tblCategoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDetalleVenta]    Script Date: 07/09/2018 08:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDetalleVenta](
	[IdDetVenta] [varchar](6) NOT NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [money] NULL,
	[PrecioTotal] [money] NULL,
	[IdVenta] [varchar](15) NULL,
 CONSTRAINT [PK_tblDetalleVenta] PRIMARY KEY CLUSTERED 
(
	[IdDetVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblModoEnvio]    Script Date: 07/09/2018 08:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblModoEnvio](
	[IdModoEnvio] [varchar](15) NOT NULL,
	[Nombre] [varchar](20) NULL,
 CONSTRAINT [PK_tblModoEnvio] PRIMARY KEY CLUSTERED 
(
	[IdModoEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 07/09/2018 08:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducto](
	[IdProducto] [varchar](20) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Marca] [varchar](30) NULL,
	[Stock] [int] NULL,
	[IdCategoria] [varchar](6) NULL,
	[IdDetVenta] [varchar](6) NULL,
 CONSTRAINT [PK_tblProducto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 07/09/2018 08:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[IdUsuario] [varchar](15) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[FecNac] [date] NULL,
	[Departamento] [varchar](30) NULL,
	[Provincia] [varchar](30) NULL,
	[Distrito] [varchar](30) NULL,
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblVenta]    Script Date: 07/09/2018 08:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblVenta](
	[IdVenta] [varchar](15) NOT NULL,
	[Fecha] [date] NULL,
	[LugarEnvio] [varchar](30) NULL,
	[IdUsuario] [varchar](15) NULL,
 CONSTRAINT [PK_tblVenta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblDetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_tblDetalleVenta_tblVenta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[tblVenta] ([IdVenta])
GO
ALTER TABLE [dbo].[tblDetalleVenta] CHECK CONSTRAINT [FK_tblDetalleVenta_tblVenta]
GO
ALTER TABLE [dbo].[tblModoEnvio]  WITH CHECK ADD  CONSTRAINT [FK_tblModoEnvio_tblVenta] FOREIGN KEY([IdModoEnvio])
REFERENCES [dbo].[tblVenta] ([IdVenta])
GO
ALTER TABLE [dbo].[tblModoEnvio] CHECK CONSTRAINT [FK_tblModoEnvio_tblVenta]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD  CONSTRAINT [FK_tblProducto_tblCategoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[tblCategoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[tblProducto] CHECK CONSTRAINT [FK_tblProducto_tblCategoria]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD  CONSTRAINT [FK_tblProducto_tblDetalleVenta] FOREIGN KEY([IdDetVenta])
REFERENCES [dbo].[tblDetalleVenta] ([IdDetVenta])
GO
ALTER TABLE [dbo].[tblProducto] CHECK CONSTRAINT [FK_tblProducto_tblDetalleVenta]
GO
ALTER TABLE [dbo].[tblVenta]  WITH CHECK ADD  CONSTRAINT [FK_tblVenta_tblUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tblUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblVenta] CHECK CONSTRAINT [FK_tblVenta_tblUsuario]
GO
