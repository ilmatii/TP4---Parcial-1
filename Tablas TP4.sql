USE [TP4]
GO
/****** Object:  Table [dbo].[Aerolineas]    Script Date: 17/10/2023 11:19:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aerolineas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Aerolineas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelos]    Script Date: 17/10/2023 11:19:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numeroVuelo] [int] NOT NULL,
	[idAerolinea] [int] NOT NULL,
 CONSTRAINT [PK_Vuelos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vuelos]  WITH CHECK ADD  CONSTRAINT [FK_Vuelos_Aerolineas] FOREIGN KEY([idAerolinea])
REFERENCES [dbo].[Aerolineas] ([id])
GO
ALTER TABLE [dbo].[Vuelos] CHECK CONSTRAINT [FK_Vuelos_Aerolineas]
GO
