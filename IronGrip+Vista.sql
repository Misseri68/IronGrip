USE [master]
GO
/****** Object:  Database [IronGrip]    Script Date: 05/03/2025 14:12:18 ******/
CREATE DATABASE [IronGrip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IronGrip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\IronGrip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IronGrip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\IronGrip_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IronGrip] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IronGrip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IronGrip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IronGrip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IronGrip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IronGrip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IronGrip] SET ARITHABORT OFF 
GO
ALTER DATABASE [IronGrip] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [IronGrip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IronGrip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IronGrip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IronGrip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IronGrip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IronGrip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IronGrip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IronGrip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IronGrip] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IronGrip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IronGrip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IronGrip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IronGrip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IronGrip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IronGrip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IronGrip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IronGrip] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IronGrip] SET  MULTI_USER 
GO
ALTER DATABASE [IronGrip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IronGrip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IronGrip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IronGrip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IronGrip] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IronGrip] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [IronGrip] SET QUERY_STORE = ON
GO
ALTER DATABASE [IronGrip] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IronGrip]
GO
/****** Object:  Table [dbo].[ejercicio]    Script Date: 05/03/2025 14:12:18 ******/
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
/****** Object:  Table [dbo].[ejercicio_hecho]    Script Date: 05/03/2025 14:12:18 ******/
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
/****** Object:  Table [dbo].[ejercicio_tag]    Script Date: 05/03/2025 14:12:18 ******/
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
/****** Object:  Table [dbo].[entrenamiento]    Script Date: 05/03/2025 14:12:18 ******/
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
/****** Object:  Table [dbo].[serie]    Script Date: 05/03/2025 14:12:18 ******/
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
/****** Object:  Table [dbo].[tag]    Script Date: 05/03/2025 14:12:18 ******/
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
/****** Object:  View [dbo].[VistaEntrenamientoDetalle]    Script Date: 05/03/2025 14:12:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaEntrenamientoDetalle] AS
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
GO
/****** Object:  Table [dbo].[entrenamiento_tag]    Script Date: 05/03/2025 14:12:18 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 05/03/2025 14:12:18 ******/
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
ALTER TABLE [dbo].[ejercicio]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[ejercicio]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[ejercicio_hecho]  WITH CHECK ADD FOREIGN KEY([id_ejercicio])
REFERENCES [dbo].[ejercicio] ([id_ejercicio])
GO
ALTER TABLE [dbo].[ejercicio_hecho]  WITH CHECK ADD FOREIGN KEY([id_ejercicio])
REFERENCES [dbo].[ejercicio] ([id_ejercicio])
GO
ALTER TABLE [dbo].[ejercicio_hecho]  WITH CHECK ADD FOREIGN KEY([id_ejercicio])
REFERENCES [dbo].[ejercicio] ([id_ejercicio])
GO
ALTER TABLE [dbo].[ejercicio_hecho]  WITH CHECK ADD FOREIGN KEY([id_entrenamiento])
REFERENCES [dbo].[entrenamiento] ([id_entrenamiento])
GO
ALTER TABLE [dbo].[ejercicio_hecho]  WITH CHECK ADD FOREIGN KEY([id_entrenamiento])
REFERENCES [dbo].[entrenamiento] ([id_entrenamiento])
GO
ALTER TABLE [dbo].[ejercicio_hecho]  WITH CHECK ADD FOREIGN KEY([id_entrenamiento])
REFERENCES [dbo].[entrenamiento] ([id_entrenamiento])
GO
ALTER TABLE [dbo].[ejercicio_tag]  WITH CHECK ADD FOREIGN KEY([id_ejercicio])
REFERENCES [dbo].[ejercicio] ([id_ejercicio])
GO
ALTER TABLE [dbo].[ejercicio_tag]  WITH CHECK ADD FOREIGN KEY([id_ejercicio])
REFERENCES [dbo].[ejercicio] ([id_ejercicio])
GO
ALTER TABLE [dbo].[ejercicio_tag]  WITH CHECK ADD FOREIGN KEY([id_ejercicio])
REFERENCES [dbo].[ejercicio] ([id_ejercicio])
GO
ALTER TABLE [dbo].[ejercicio_tag]  WITH CHECK ADD FOREIGN KEY([id_tag])
REFERENCES [dbo].[tag] ([id_tag])
GO
ALTER TABLE [dbo].[ejercicio_tag]  WITH CHECK ADD FOREIGN KEY([id_tag])
REFERENCES [dbo].[tag] ([id_tag])
GO
ALTER TABLE [dbo].[ejercicio_tag]  WITH CHECK ADD FOREIGN KEY([id_tag])
REFERENCES [dbo].[tag] ([id_tag])
GO
ALTER TABLE [dbo].[entrenamiento]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[entrenamiento]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[entrenamiento]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[entrenamiento_tag]  WITH CHECK ADD FOREIGN KEY([id_entrenamiento])
REFERENCES [dbo].[entrenamiento] ([id_entrenamiento])
GO
ALTER TABLE [dbo].[entrenamiento_tag]  WITH CHECK ADD FOREIGN KEY([id_entrenamiento])
REFERENCES [dbo].[entrenamiento] ([id_entrenamiento])
GO
ALTER TABLE [dbo].[entrenamiento_tag]  WITH CHECK ADD FOREIGN KEY([id_entrenamiento])
REFERENCES [dbo].[entrenamiento] ([id_entrenamiento])
GO
ALTER TABLE [dbo].[entrenamiento_tag]  WITH CHECK ADD FOREIGN KEY([id_tag])
REFERENCES [dbo].[tag] ([id_tag])
GO
ALTER TABLE [dbo].[entrenamiento_tag]  WITH CHECK ADD FOREIGN KEY([id_tag])
REFERENCES [dbo].[tag] ([id_tag])
GO
ALTER TABLE [dbo].[entrenamiento_tag]  WITH CHECK ADD FOREIGN KEY([id_tag])
REFERENCES [dbo].[tag] ([id_tag])
GO
ALTER TABLE [dbo].[serie]  WITH CHECK ADD FOREIGN KEY([id_ejercicio_hecho])
REFERENCES [dbo].[ejercicio_hecho] ([id_ejercicio_hecho])
GO
ALTER TABLE [dbo].[serie]  WITH CHECK ADD FOREIGN KEY([id_ejercicio_hecho])
REFERENCES [dbo].[ejercicio_hecho] ([id_ejercicio_hecho])
GO
ALTER TABLE [dbo].[serie]  WITH CHECK ADD FOREIGN KEY([id_ejercicio_hecho])
REFERENCES [dbo].[ejercicio_hecho] ([id_ejercicio_hecho])
GO
ALTER TABLE [dbo].[tag]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tag]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tag]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
USE [master]
GO
ALTER DATABASE [IronGrip] SET  READ_WRITE 
GO
