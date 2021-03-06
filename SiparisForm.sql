﻿USE [master]
GO
/****** Object:  Database [DbIliskiliTablolar]    Script Date: 31.03.2020 18:17:25 ******/
CREATE DATABASE [DbIliskiliTablolar]
 CONTAINMENT = NONE
GO
ALTER DATABASE [DbIliskiliTablolar] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbIliskiliTablolar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbIliskiliTablolar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbIliskiliTablolar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbIliskiliTablolar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbIliskiliTablolar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbIliskiliTablolar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbIliskiliTablolar] SET  MULTI_USER 
GO
ALTER DATABASE [DbIliskiliTablolar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbIliskiliTablolar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbIliskiliTablolar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbIliskiliTablolar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbIliskiliTablolar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbIliskiliTablolar] SET QUERY_STORE = OFF
GO
USE [DbIliskiliTablolar]
GO
/****** Object:  Table [dbo].[Hareket]    Script Date: 31.03.2020 18:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hareket](
	[HAREKETID] [smallint] IDENTITY(1,1) NOT NULL,
	[URUN] [tinyint] NULL,
	[PERSONEL] [tinyint] NULL,
	[MUSTERİ] [tinyint] NULL,
	[FIYAT] [smallint] NULL,
 CONSTRAINT [PK_Hareket] PRIMARY KEY CLUSTERED 
(
	[HAREKETID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 31.03.2020 18:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[ADSOYAD] [varchar](50) NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 31.03.2020 18:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[AD] [varchar](20) NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 31.03.2020 18:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[AD] [varchar](20) NULL,
	[STOK] [tinyint] NULL,
	[ALISFIYAT] [smallint] NULL,
	[SATISFIYAT] [smallint] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hareket]  WITH CHECK ADD  CONSTRAINT [FK_Hareket_Musteriler] FOREIGN KEY([MUSTERİ])
REFERENCES [dbo].[Musteriler] ([ID])
GO
ALTER TABLE [dbo].[Hareket] CHECK CONSTRAINT [FK_Hareket_Musteriler]
GO
ALTER TABLE [dbo].[Hareket]  WITH CHECK ADD  CONSTRAINT [FK_Hareket_Personel] FOREIGN KEY([PERSONEL])
REFERENCES [dbo].[Personel] ([ID])
GO
ALTER TABLE [dbo].[Hareket] CHECK CONSTRAINT [FK_Hareket_Personel]
GO
ALTER TABLE [dbo].[Hareket]  WITH CHECK ADD  CONSTRAINT [FK_Hareket_Urunler] FOREIGN KEY([URUN])
REFERENCES [dbo].[Urunler] ([ID])
GO
ALTER TABLE [dbo].[Hareket] CHECK CONSTRAINT [FK_Hareket_Urunler]
GO
/****** Object:  StoredProcedure [dbo].[CokluIliskiler]    Script Date: 31.03.2020 18:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[CokluIliskiler] 
as
select Urunler.AD as [Ürün Adı],ADSOYAD as [Müşteri] ,personel.AD as [Personel],FIYAT as Fiyat from Hareket inner join Urunler 
on Hareket.URUN=Urunler.ID inner join Musteriler on Musteriler.ID=Hareket.MUSTERİ inner join 
Personel on Personel.ID=Hareket.PERSONEL
GO
USE [master]
GO
ALTER DATABASE [DbIliskiliTablolar] SET  READ_WRITE 
GO
