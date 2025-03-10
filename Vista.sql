
USE [IronGrip]
GO
/****** Object:  Table [dbo].[ejercicio]    Script Date: 03/03/2025 21:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ejercicio](
	[id_ejercicio] [int] NOT NULL,
	[id_usuario] [int] NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [text] NULL,
	[foto] [text] NULL,
	[es_tiempo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ejercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ejercicio_hecho]    Script Date: 03/03/2025 21:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ejercicio_hecho](
	[id_ejercicio_hecho] [int] NOT NULL,
	[id_entrenamiento] [int] NULL,
	[id_ejercicio] [int] NULL,
	[notas] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ejercicio_hecho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ejercicio_tag]    Script Date: 03/03/2025 21:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ejercicio_tag](
	[id_ejercicio] [int] NOT NULL,
	[id_tag] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ejercicio] ASC,
	[id_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entrenamiento]    Script Date: 03/03/2025 21:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entrenamiento](
	[id_entrenamiento] [int] NOT NULL,
	[id_usuario] [int] NULL,
	[fecha] [datetime] NOT NULL,
	[notas] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_entrenamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entrenamiento_tag]    Script Date: 03/03/2025 21:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entrenamiento_tag](
	[id_entrenamiento] [int] NOT NULL,
	[id_tag] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_entrenamiento] ASC,
	[id_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[serie]    Script Date: 03/03/2025 21:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[serie](
	[id_serie] [int] NOT NULL,
	[id_ejercicio_hecho] [int] NULL,
	[peso] [float] NULL,
	[repeticiones] [int] NULL,
	[tiempo] [int] NULL,
	[intervalo_descanso] [int] NULL,
	[num_series] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_serie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tag]    Script Date: 03/03/2025 21:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tag](
	[id_tag] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[color] [char](7) NOT NULL,
	[id_usuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 03/03/2025 21:59:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[foto] [text] NULL,
	[pwd] [varbinary](max) NULL,
	[salt] [nvarchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[serie] ADD  DEFAULT ((0)) FOR [tiempo]
GO
ALTER TABLE [dbo].[ejercicio]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[ejercicio_hecho]  WITH CHECK ADD FOREIGN KEY([id_ejercicio])
REFERENCES [dbo].[ejercicio] ([id_ejercicio])
GO
ALTER TABLE [dbo].[ejercicio_hecho]  WITH CHECK ADD FOREIGN KEY([id_entrenamiento])
REFERENCES [dbo].[entrenamiento] ([id_entrenamiento])
GO
ALTER TABLE [dbo].[ejercicio_tag]  WITH CHECK ADD FOREIGN KEY([id_ejercicio])
REFERENCES [dbo].[ejercicio] ([id_ejercicio])
GO
ALTER TABLE [dbo].[ejercicio_tag]  WITH CHECK ADD FOREIGN KEY([id_tag])
REFERENCES [dbo].[tag] ([id_tag])
GO
ALTER TABLE [dbo].[entrenamiento]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[entrenamiento_tag]  WITH CHECK ADD FOREIGN KEY([id_entrenamiento])
REFERENCES [dbo].[entrenamiento] ([id_entrenamiento])
GO
ALTER TABLE [dbo].[entrenamiento_tag]  WITH CHECK ADD FOREIGN KEY([id_tag])
REFERENCES [dbo].[tag] ([id_tag])
GO
ALTER TABLE [dbo].[serie]  WITH CHECK ADD FOREIGN KEY([id_ejercicio_hecho])
REFERENCES [dbo].[ejercicio_hecho] ([id_ejercicio_hecho])
GO
ALTER TABLE [dbo].[tag]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO


select * from usuario

CREATE VIEW VistaEntrenamientoDetalle AS
SELECT
    -- Datos del entrenamiento
    e.id_entrenamiento,
    e.id_usuario AS id_usuario_entrenamiento,
    e.fecha AS fecha_entrenamiento,
    e.notas AS notas_entrenamiento,

    -- Datos del ejercicio (ejemplo)
    ej.id_ejercicio,
    ej.nombre AS nombre_ejercicio,
    ej.descripcion AS descripcion_ejercicio,
    ej.foto AS foto_ejercicio,
    ej.es_tiempo AS es_tiempo_ejercicio,

    -- Datos del ejercicio hecho
    eh.id_ejercicio_hecho,
    eh.notas AS notas_ejercicio_hecho,

    -- Datos de las series
    s.id_serie,
    s.peso,
    s.repeticiones,
    s.tiempo,
    s.intervalo_descanso,
    s.num_series,

    -- Datos de los tags del ejercicio
    t.id_tag,
    t.nombre AS nombre_tag,
    t.color AS color_tag

FROM
    entrenamiento e
    INNER JOIN ejercicio_hecho eh ON e.id_entrenamiento = eh.id_entrenamiento
    INNER JOIN ejercicio ej ON eh.id_ejercicio = ej.id_ejercicio
    LEFT JOIN serie s ON eh.id_ejercicio_hecho = s.id_ejercicio_hecho
    LEFT JOIN ejercicio_tag et ON ej.id_ejercicio = et.id_ejercicio
    LEFT JOIN tag t ON et.id_tag = t.id_tag;

	select * from VistaEntrenamientoDetalle;

	insert into ejercicio values (1, 1, 'PRESS PECHO', 'pechitou pa' , null, 0);
	
	insert into ejercicio_hecho values(1, 1, 1, 'bastante god el pechito na?');

	insert into serie values(1, 1, 30, 7, null, null, 2 );

	insert into entrenamiento values(1, 1,GETDATE(), 'pechitou ricoricoricorico');