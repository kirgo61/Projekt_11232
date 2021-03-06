USE [master]
GO
/****** Object:  Database [Projekt_11232]    Script Date: 2018-06-17 21:29:40 ******/
CREATE DATABASE [Projekt_11232]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Salon Samochodowy', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Salon Samochodowy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Salon Samochodowy_log', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Salon Samochodowy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Projekt_11232] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projekt_11232].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projekt_11232] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projekt_11232] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projekt_11232] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projekt_11232] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projekt_11232] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projekt_11232] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projekt_11232] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projekt_11232] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projekt_11232] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projekt_11232] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projekt_11232] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projekt_11232] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projekt_11232] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projekt_11232] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projekt_11232] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Projekt_11232] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projekt_11232] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projekt_11232] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projekt_11232] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projekt_11232] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projekt_11232] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projekt_11232] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projekt_11232] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Projekt_11232] SET  MULTI_USER 
GO
ALTER DATABASE [Projekt_11232] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projekt_11232] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projekt_11232] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projekt_11232] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projekt_11232] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Projekt_11232] SET QUERY_STORE = OFF
GO
USE [Projekt_11232]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Projekt_11232]
GO
/****** Object:  Schema [raporty]    Script Date: 2018-06-17 21:29:40 ******/
CREATE SCHEMA [raporty]
GO
/****** Object:  Table [dbo].[tabelaZamowienia]    Script Date: 2018-06-17 21:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabelaZamowienia](
	[idZamowienia] [nchar](10) NOT NULL,
	[idKlienta] [nchar](10) NOT NULL,
	[idPojazdu] [nchar](10) NOT NULL,
	[idPracownika] [nchar](10) NOT NULL,
	[nazwaMarki] [varchar](50) NOT NULL,
	[nazwaModelu] [varchar](50) NOT NULL,
	[cenaModelu] [money] NOT NULL,
	[dataZamowienia] [date] NOT NULL,
	[dataOdbioru] [date] NOT NULL,
	[realizacjaZamowienia] [bit] NOT NULL,
	[oplacenieZamowienia] [bit] NOT NULL,
 CONSTRAINT [PK_tabelaZamowienia] PRIMARY KEY CLUSTERED 
(
	[idZamowienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [raporty].[kwerendaPracownicyZadanie4]    Script Date: 2018-06-17 21:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  Schema [raporty]    Script Date: 2018-06-17 12:04:45 ******/
CREATE VIEW [raporty].[kwerendaPracownicyZadanie4] AS
SELECT 
      COUNT(idZamowienia) as sumaZamowien
      ,SUM(cenaModelu) as sumaZarobionychPieniedzy,
	  idPracownika
  FROM tabelaZamowienia
 GROUP BY idPracownika
GO
/****** Object:  Table [dbo].[tabelaMarki]    Script Date: 2018-06-17 21:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabelaMarki](
	[idMarki] [nchar](10) NOT NULL,
	[nazwaMarki] [varchar](50) NOT NULL,
	[pochodzenieMarki] [varchar](50) NOT NULL,
	[dataPowstaniaMarki] [date] NOT NULL,
 CONSTRAINT [PK_tabelaMarki] PRIMARY KEY CLUSTERED 
(
	[idMarki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabelaModele]    Script Date: 2018-06-17 21:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabelaModele](
	[idModele] [nchar](10) NOT NULL,
	[nazwaModelu] [varchar](50) NOT NULL,
	[kolorModelu] [varchar](50) NOT NULL,
	[rokPowstaniaModelu] [date] NOT NULL,
	[idMarki] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tabelaModele] PRIMARY KEY CLUSTERED 
(
	[idModele] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabelaCennik]    Script Date: 2018-06-17 21:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabelaCennik](
	[idPojazdu] [nchar](10) NOT NULL,
	[idMarki] [nchar](10) NOT NULL,
	[idModele] [nchar](10) NOT NULL,
	[nazwaMarki] [varchar](50) NOT NULL,
	[nazwaModelu] [varchar](50) NOT NULL,
	[dataPowstaniaSamochodu] [date] NOT NULL,
	[cenaModelu] [money] NOT NULL,
	[dataOd] [date] NOT NULL,
	[dataDo] [date] NOT NULL,
	[cenaKatalogowa] [money] NULL,
 CONSTRAINT [PK_tabelaCennik] PRIMARY KEY CLUSTERED 
(
	[idPojazdu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [raporty].[kwerendaSprzedaneModeleZadanie1]    Script Date: 2018-06-17 21:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [raporty].[kwerendaSprzedaneModeleZadanie1] AS
SELECT
Marki.nazwaMarki,
COUNT(Zamowienia.idZamowienia) as liczbaSprzedanychPojazdow,
SUM(Cena.cenaModelu) as SumaSprzedazy
FROM
dbo.tabelaMarki as Marki
INNER JOIN  dbo.tabelaModele as Modele ON Modele.idMarki = Marki.idMarki
INNER JOIN  dbo.tabelaCennik as Cena ON Cena.idModele = Modele.idModele
INNER JOIN  dbo.tabelaZamowienia as Zamowienia ON Zamowienia.idZamowienia = Marki.idMarki
GROUP BY
Marki.nazwaMarki
GO
/****** Object:  View [raporty].[kwerendaNiesprzedaneModeleZadanie3]    Script Date: 2018-06-17 21:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  Schema [raporty]    Script Date: 2018-06-17 14:35:59 ******/
CREATE VIEW [raporty].[kwerendaNiesprzedaneModeleZadanie3] AS
 
SELECT nazwaModelu
FROM   tabelaModele
WHERE  nazwaModelu NOT IN 
       (SELECT DISTINCT nazwaModelu FROM tabelaZamowienia);
GO
/****** Object:  Table [dbo].[tabelaKlienci]    Script Date: 2018-06-17 21:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabelaKlienci](
	[idKlienta] [nchar](10) NOT NULL,
	[nrDowoduKlienta] [varchar](50) NOT NULL,
	[imieKlienta] [varchar](50) NOT NULL,
	[nazwiskoKlienta] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tabelaKlienci] PRIMARY KEY CLUSTERED 
(
	[idKlienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabelaPracownicy]    Script Date: 2018-06-17 21:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabelaPracownicy](
	[idPracownika] [nchar](10) NOT NULL,
	[imiePracownika] [varchar](50) NOT NULL,
	[nazwiskoPracownika] [varchar](50) NOT NULL,
	[peselPracownika] [nchar](11) NOT NULL,
 CONSTRAINT [PK_tabelaPracownicy] PRIMARY KEY CLUSTERED 
(
	[idPracownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tabelaCennik] ([idPojazdu], [idMarki], [idModele], [nazwaMarki], [nazwaModelu], [dataPowstaniaSamochodu], [cenaModelu], [dataOd], [dataDo], [cenaKatalogowa]) VALUES (N'1         ', N'1         ', N'1         ', N'Peugeot', N'207', CAST(N'2002-01-02' AS Date), 8000.0000, CAST(N'2018-01-01' AS Date), CAST(N'2018-06-12' AS Date), NULL)
INSERT [dbo].[tabelaCennik] ([idPojazdu], [idMarki], [idModele], [nazwaMarki], [nazwaModelu], [dataPowstaniaSamochodu], [cenaModelu], [dataOd], [dataDo], [cenaKatalogowa]) VALUES (N'2         ', N'1         ', N'3         ', N'Peugeot', N'407', CAST(N'2003-12-12' AS Date), 10000.0000, CAST(N'2018-01-02' AS Date), CAST(N'2019-06-11' AS Date), NULL)
INSERT [dbo].[tabelaCennik] ([idPojazdu], [idMarki], [idModele], [nazwaMarki], [nazwaModelu], [dataPowstaniaSamochodu], [cenaModelu], [dataOd], [dataDo], [cenaKatalogowa]) VALUES (N'3         ', N'2         ', N'5         ', N'Skoda', N'Fabia', CAST(N'1995-12-12' AS Date), 4000.0000, CAST(N'2016-03-04' AS Date), CAST(N'2020-03-05' AS Date), NULL)
INSERT [dbo].[tabelaCennik] ([idPojazdu], [idMarki], [idModele], [nazwaMarki], [nazwaModelu], [dataPowstaniaSamochodu], [cenaModelu], [dataOd], [dataDo], [cenaKatalogowa]) VALUES (N'4         ', N'2         ', N'6         ', N'Skoda', N'Felicia', CAST(N'1992-06-06' AS Date), 3000.0000, CAST(N'2015-08-08' AS Date), CAST(N'2019-04-05' AS Date), NULL)
INSERT [dbo].[tabelaCennik] ([idPojazdu], [idMarki], [idModele], [nazwaMarki], [nazwaModelu], [dataPowstaniaSamochodu], [cenaModelu], [dataOd], [dataDo], [cenaKatalogowa]) VALUES (N'5         ', N'3         ', N'8         ', N'Nissan', N'Pathfinder', CAST(N'1994-02-07' AS Date), 6000.0000, CAST(N'2018-01-09' AS Date), CAST(N'2021-01-05' AS Date), NULL)
INSERT [dbo].[tabelaCennik] ([idPojazdu], [idMarki], [idModele], [nazwaMarki], [nazwaModelu], [dataPowstaniaSamochodu], [cenaModelu], [dataOd], [dataDo], [cenaKatalogowa]) VALUES (N'6         ', N'3         ', N'9         ', N'Nissan', N'Patrol', CAST(N'1993-06-08' AS Date), 10000.0000, CAST(N'2017-04-23' AS Date), CAST(N'2022-04-08' AS Date), NULL)
INSERT [dbo].[tabelaCennik] ([idPojazdu], [idMarki], [idModele], [nazwaMarki], [nazwaModelu], [dataPowstaniaSamochodu], [cenaModelu], [dataOd], [dataDo], [cenaKatalogowa]) VALUES (N'7         ', N'4         ', N'12        ', N'Kia', N'Ceed', CAST(N'2010-03-06' AS Date), 20000.0000, CAST(N'2018-01-03' AS Date), CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[tabelaCennik] ([idPojazdu], [idMarki], [idModele], [nazwaMarki], [nazwaModelu], [dataPowstaniaSamochodu], [cenaModelu], [dataOd], [dataDo], [cenaKatalogowa]) VALUES (N'8         ', N'5         ', N'14        ', N'FSO Polonez', N'Polonez', CAST(N'1980-03-05' AS Date), 5000.0000, CAST(N'2006-03-04' AS Date), CAST(N'2025-03-25' AS Date), NULL)
INSERT [dbo].[tabelaKlienci] ([idKlienta], [nrDowoduKlienta], [imieKlienta], [nazwiskoKlienta]) VALUES (N'1         ', N'NW3453WE', N'Przemysław', N'Sołtys')
INSERT [dbo].[tabelaKlienci] ([idKlienta], [nrDowoduKlienta], [imieKlienta], [nazwiskoKlienta]) VALUES (N'2         ', N'C98W3456', N'Miłosz', N'Roman')
INSERT [dbo].[tabelaKlienci] ([idKlienta], [nrDowoduKlienta], [imieKlienta], [nazwiskoKlienta]) VALUES (N'3         ', N'C98W3443', N'Łukasz', N'Woloszyn')
INSERT [dbo].[tabelaKlienci] ([idKlienta], [nrDowoduKlienta], [imieKlienta], [nazwiskoKlienta]) VALUES (N'4         ', N'W7482W21', N'Wojciech', N'Strzabala')
INSERT [dbo].[tabelaKlienci] ([idKlienta], [nrDowoduKlienta], [imieKlienta], [nazwiskoKlienta]) VALUES (N'5         ', N'YTW2873W', N'Wojciech', N'Suchodolsky')
INSERT [dbo].[tabelaKlienci] ([idKlienta], [nrDowoduKlienta], [imieKlienta], [nazwiskoKlienta]) VALUES (N'6         ', N'UW45SW52', N'Krzysztof', N'Kononowitz')
INSERT [dbo].[tabelaMarki] ([idMarki], [nazwaMarki], [pochodzenieMarki], [dataPowstaniaMarki]) VALUES (N'1         ', N'Peugeot', N'Francja', CAST(N'1930-02-01' AS Date))
INSERT [dbo].[tabelaMarki] ([idMarki], [nazwaMarki], [pochodzenieMarki], [dataPowstaniaMarki]) VALUES (N'2         ', N'Skoda', N'Czechy', CAST(N'1940-01-01' AS Date))
INSERT [dbo].[tabelaMarki] ([idMarki], [nazwaMarki], [pochodzenieMarki], [dataPowstaniaMarki]) VALUES (N'3         ', N'Nissan', N'Japonia', CAST(N'1940-02-02' AS Date))
INSERT [dbo].[tabelaMarki] ([idMarki], [nazwaMarki], [pochodzenieMarki], [dataPowstaniaMarki]) VALUES (N'4         ', N'Kia', N'Korea', CAST(N'1941-01-02' AS Date))
INSERT [dbo].[tabelaMarki] ([idMarki], [nazwaMarki], [pochodzenieMarki], [dataPowstaniaMarki]) VALUES (N'5         ', N'FSO Polonez', N'Polska', CAST(N'1942-01-04' AS Date))
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'1         ', N'207', N'Srebrny', CAST(N'1960-02-11' AS Date), N'1         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'10        ', N'Skyline', N'Srebrny', CAST(N'1990-03-12' AS Date), N'3         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'11        ', N'Sportage', N'Biały', CAST(N'2000-12-12' AS Date), N'4         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'12        ', N'Ceed', N'Biały', CAST(N'2001-06-10' AS Date), N'4         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'13        ', N'Picanto', N'Biały', CAST(N'2005-01-01' AS Date), N'4         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'14        ', N'Polonez', N'Zielony', CAST(N'1991-03-01' AS Date), N'5         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'2         ', N'206', N'Srebrny', CAST(N'1960-03-11' AS Date), N'1         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'3         ', N'407', N'Czerwony', CAST(N'1960-03-21' AS Date), N'1         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'4         ', N'406', N'Czerwony', CAST(N'1960-04-12' AS Date), N'1         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'5         ', N'Fabia', N'Zielony', CAST(N'1960-05-03' AS Date), N'2         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'6         ', N'Felicia', N'Zielony', CAST(N'1960-07-22' AS Date), N'2         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'7         ', N'Superb', N'Zielony', CAST(N'2010-01-01' AS Date), N'2         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'8         ', N'Pathfinder', N'Czarny', CAST(N'1950-02-01' AS Date), N'3         ')
INSERT [dbo].[tabelaModele] ([idModele], [nazwaModelu], [kolorModelu], [rokPowstaniaModelu], [idMarki]) VALUES (N'9         ', N'Patrol', N'Czarny', CAST(N'1970-03-12' AS Date), N'3         ')
INSERT [dbo].[tabelaPracownicy] ([idPracownika], [imiePracownika], [nazwiskoPracownika], [peselPracownika]) VALUES (N'1         ', N'Dawid', N'Sołtys', N'96023420312')
INSERT [dbo].[tabelaPracownicy] ([idPracownika], [imiePracownika], [nazwiskoPracownika], [peselPracownika]) VALUES (N'2         ', N'Przemysław', N'Graham', N'88021234565')
INSERT [dbo].[tabelaPracownicy] ([idPracownika], [imiePracownika], [nazwiskoPracownika], [peselPracownika]) VALUES (N'3         ', N'Damian', N'Łomza', N'78031345987')
INSERT [dbo].[tabelaPracownicy] ([idPracownika], [imiePracownika], [nazwiskoPracownika], [peselPracownika]) VALUES (N'4         ', N'Andrzej', N'Andrzejewski', N'78031345734')
INSERT [dbo].[tabelaZamowienia] ([idZamowienia], [idKlienta], [idPojazdu], [idPracownika], [nazwaMarki], [nazwaModelu], [cenaModelu], [dataZamowienia], [dataOdbioru], [realizacjaZamowienia], [oplacenieZamowienia]) VALUES (N'1         ', N'1         ', N'1         ', N'2         ', N'Peugeot', N'207', 8000.0000, CAST(N'2018-01-02' AS Date), CAST(N'2018-01-10' AS Date), 1, 0)
INSERT [dbo].[tabelaZamowienia] ([idZamowienia], [idKlienta], [idPojazdu], [idPracownika], [nazwaMarki], [nazwaModelu], [cenaModelu], [dataZamowienia], [dataOdbioru], [realizacjaZamowienia], [oplacenieZamowienia]) VALUES (N'2         ', N'2         ', N'2         ', N'2         ', N'Peugeot', N'407', 10000.0000, CAST(N'2018-04-05' AS Date), CAST(N'2018-04-10' AS Date), 1, 1)
INSERT [dbo].[tabelaZamowienia] ([idZamowienia], [idKlienta], [idPojazdu], [idPracownika], [nazwaMarki], [nazwaModelu], [cenaModelu], [dataZamowienia], [dataOdbioru], [realizacjaZamowienia], [oplacenieZamowienia]) VALUES (N'3         ', N'3         ', N'3         ', N'1         ', N'Skoda', N'Fabia', 4000.0000, CAST(N'2018-05-05' AS Date), CAST(N'2018-05-10' AS Date), 1, 1)
INSERT [dbo].[tabelaZamowienia] ([idZamowienia], [idKlienta], [idPojazdu], [idPracownika], [nazwaMarki], [nazwaModelu], [cenaModelu], [dataZamowienia], [dataOdbioru], [realizacjaZamowienia], [oplacenieZamowienia]) VALUES (N'4         ', N'4         ', N'4         ', N'1         ', N'Skoda', N'Felicia ', 3000.0000, CAST(N'2018-03-05' AS Date), CAST(N'2018-03-10' AS Date), 1, 1)
INSERT [dbo].[tabelaZamowienia] ([idZamowienia], [idKlienta], [idPojazdu], [idPracownika], [nazwaMarki], [nazwaModelu], [cenaModelu], [dataZamowienia], [dataOdbioru], [realizacjaZamowienia], [oplacenieZamowienia]) VALUES (N'5         ', N'5         ', N'5         ', N'3         ', N'Nissan', N'Pathfinder', 6000.0000, CAST(N'2018-03-06' AS Date), CAST(N'2018-03-11' AS Date), 1, 1)
INSERT [dbo].[tabelaZamowienia] ([idZamowienia], [idKlienta], [idPojazdu], [idPracownika], [nazwaMarki], [nazwaModelu], [cenaModelu], [dataZamowienia], [dataOdbioru], [realizacjaZamowienia], [oplacenieZamowienia]) VALUES (N'6         ', N'6         ', N'6         ', N'4         ', N'Nissan', N'Patrol', 10000.0000, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-21' AS Date), 1, 1)
INSERT [dbo].[tabelaZamowienia] ([idZamowienia], [idKlienta], [idPojazdu], [idPracownika], [nazwaMarki], [nazwaModelu], [cenaModelu], [dataZamowienia], [dataOdbioru], [realizacjaZamowienia], [oplacenieZamowienia]) VALUES (N'7         ', N'1         ', N'7         ', N'4         ', N'Kia', N'Ceed', 20000.0000, CAST(N'2018-06-01' AS Date), CAST(N'2018-06-10' AS Date), 1, 1)
INSERT [dbo].[tabelaZamowienia] ([idZamowienia], [idKlienta], [idPojazdu], [idPracownika], [nazwaMarki], [nazwaModelu], [cenaModelu], [dataZamowienia], [dataOdbioru], [realizacjaZamowienia], [oplacenieZamowienia]) VALUES (N'8         ', N'2         ', N'8         ', N'2         ', N'FSO Polonez', N'Polonez', 5000.0000, CAST(N'2018-07-01' AS Date), CAST(N'2018-08-11' AS Date), 1, 1)
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tabelaKl__3CC29957256F4D2D]    Script Date: 2018-06-17 21:29:40 ******/
ALTER TABLE [dbo].[tabelaKlienci] ADD UNIQUE NONCLUSTERED 
(
	[nrDowoduKlienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tabelaPr__6059742F757CFA64]    Script Date: 2018-06-17 21:29:40 ******/
ALTER TABLE [dbo].[tabelaPracownicy] ADD UNIQUE NONCLUSTERED 
(
	[peselPracownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tabelaCennik]  WITH CHECK ADD  CONSTRAINT [FK_tabelaCennik_tabelaMarki] FOREIGN KEY([idMarki])
REFERENCES [dbo].[tabelaMarki] ([idMarki])
GO
ALTER TABLE [dbo].[tabelaCennik] CHECK CONSTRAINT [FK_tabelaCennik_tabelaMarki]
GO
ALTER TABLE [dbo].[tabelaCennik]  WITH CHECK ADD  CONSTRAINT [FK_tabelaCennik_tabelaModele] FOREIGN KEY([idModele])
REFERENCES [dbo].[tabelaModele] ([idModele])
GO
ALTER TABLE [dbo].[tabelaCennik] CHECK CONSTRAINT [FK_tabelaCennik_tabelaModele]
GO
ALTER TABLE [dbo].[tabelaModele]  WITH CHECK ADD  CONSTRAINT [FK_tabelaModele_tabelaMarki] FOREIGN KEY([idMarki])
REFERENCES [dbo].[tabelaMarki] ([idMarki])
GO
ALTER TABLE [dbo].[tabelaModele] CHECK CONSTRAINT [FK_tabelaModele_tabelaMarki]
GO
ALTER TABLE [dbo].[tabelaZamowienia]  WITH CHECK ADD  CONSTRAINT [FK_tabelaZamowienia_tabelaCennik] FOREIGN KEY([idPojazdu])
REFERENCES [dbo].[tabelaCennik] ([idPojazdu])
GO
ALTER TABLE [dbo].[tabelaZamowienia] CHECK CONSTRAINT [FK_tabelaZamowienia_tabelaCennik]
GO
ALTER TABLE [dbo].[tabelaZamowienia]  WITH CHECK ADD  CONSTRAINT [FK_tabelaZamowienia_tabelaKlienci] FOREIGN KEY([idKlienta])
REFERENCES [dbo].[tabelaKlienci] ([idKlienta])
GO
ALTER TABLE [dbo].[tabelaZamowienia] CHECK CONSTRAINT [FK_tabelaZamowienia_tabelaKlienci]
GO
ALTER TABLE [dbo].[tabelaZamowienia]  WITH CHECK ADD  CONSTRAINT [FK_tabelaZamowienia_tabelaPracownicy] FOREIGN KEY([idPracownika])
REFERENCES [dbo].[tabelaPracownicy] ([idPracownika])
GO
ALTER TABLE [dbo].[tabelaZamowienia] CHECK CONSTRAINT [FK_tabelaZamowienia_tabelaPracownicy]
GO
ALTER TABLE [dbo].[tabelaCennik]  WITH CHECK ADD CHECK  (([cenaModelu]>(0)))
GO
ALTER TABLE [dbo].[tabelaCennik]  WITH CHECK ADD CHECK  (([cenaModelu]>(0)))
GO
ALTER TABLE [dbo].[tabelaCennik]  WITH CHECK ADD CHECK  (([cenaModelu]>(0)))
GO
ALTER TABLE [dbo].[tabelaZamowienia]  WITH CHECK ADD CHECK  (([cenaModelu]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Projekt_11232] SET  READ_WRITE 
GO
