Create database PRA_RWA_DB
GO
USE [PRA_RWA_DB]
GO
/****** Object:  Table [dbo].[Djelatnik]    Script Date: 16.8.2020. 13:22:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Djelatnik](
	[IDDjelatnik] [int] NOT NULL IDENTITY,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DatumZaposlenja] [datetime2](7) NOT NULL,
	[Zaporka] [nvarchar](50) NOT NULL,
	[JeAktivan] [bit] NULL,
	[TipDjelatnikaID] [int] NOT NULL,
	[TimID] [int] NULL,
 CONSTRAINT [PK_Djelatnik] PRIMARY KEY CLUSTERED
(
	[IDDjelatnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klijent]    Script Date: 16.8.2020. 13:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klijent](
	[IDKlijent] [int] NOT NULL IDENTITY,
	[Naziv] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[JeAktivan] [bit] NULL,
 CONSTRAINT [PK_Klijent] PRIMARY KEY CLUSTERED 
(
	[IDKlijent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projekt]    Script Date: 16.8.2020. 13:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projekt](
	[IDProjekt] [int] NOT NULL IDENTITY,
	[Naziv] [nvarchar](50) NOT NULL,
	[KlijentID] [int] NOT NULL,
	[DatumOtvaranja] [date] NOT NULL,
	[JeAktivan] [bit] NULL,
	[VoditeljProjektaID] [int] NOT NULL,
 CONSTRAINT [PK_Projekt] PRIMARY KEY CLUSTERED 
(
	[IDProjekt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjektDjelatnik]    Script Date: 16.8.2020. 13:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjektDjelatnik](
	[IDProjektDjelatnik] [int] NOT NULL IDENTITY,
	[ProjektID] [int] NOT NULL,
	[DjelatnikID] [int] NOT NULL,
 CONSTRAINT [PK_ProjektDjelatnik] PRIMARY KEY CLUSTERED 
(
	[IDProjektDjelatnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satnica]    Script Date: 16.8.2020. 13:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satnica](
	[IDSatnica] [int] NOT NULL IDENTITY,
	[Datum] [datetime] NOT NULL,
	[RadniSati] [nvarchar](50) NULL,
	[PrekovremeniSati] [nvarchar](50) NULL,
	[Komentar] [nvarchar](max) NULL,
	[JePoslano] [bit] NOT NULL,
	[JePotvreno] [bit] NOT NULL,
	[JeOdbijeno] [bit] NOT NULL,
	[VoditeljTimaID] [int] NULL,
	[DjelatnikID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDSatnica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SatnicaProjekt]    Script Date: 16.8.2020. 13:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SatnicaPoProjektu](
	[IDSatnicaProjekt] [int] IDENTITY(1,1) NOT NULL,
	[RadniSati] [nvarchar](50) NULL,
	[PrekovremeniSati] [nvarchar](50) NULL,
	[ProjetID] [int] NULL,
	[SatnicaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDSatnicaProjekt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tim]    Script Date: 16.8.2020. 13:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tim](
	[IDTim] [int] NOT NULL IDENTITY,
	[Naziv] [nvarchar](50) NOT NULL,
	[DatumKreiranja] [date] NOT NULL,
	[JeAktivan] [bit] NULL,
 CONSTRAINT [PK_Tim] PRIMARY KEY CLUSTERED 
(
	[IDTim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipDjelatnika]    Script Date: 16.8.2020. 13:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipDjelatnika](
	[IDTipDjelatnika] [int] NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipDjelatnika] PRIMARY KEY CLUSTERED 
(
	[IDTipDjelatnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

Set identity_insert Djelatnik on

GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (1, N'Mia', N'Horvat', N'mhorvat@ingenii.hr', CAST(N'2018-02-28T00:00:00.0000000' AS DateTime2), N'ZSJR6F', 2, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (2, N'Sara', N'Kovačević', N'skovacevic@ingenii.hr', CAST(N'2019-11-30T00:00:00.0000000' AS DateTime2), N'6SU2H9T3Y5', 3, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (3, N'Nika', N'Babić', N'nbabic@ingenii.hr', CAST(N'2015-08-23T00:00:00.0000000' AS DateTime2), N'OY273H0CPP', 3, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (4, N'Lana', N'Marić', N'lmaric@ingenii.hr', CAST(N'2014-02-13T00:00:00.0000000' AS DateTime2), N'72W5W3', 3, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (5, N'Elena', N'Jurić', N'ejuric@ingenii.hr', CAST(N'2010-02-13T00:00:00.0000000' AS DateTime2), N'WVN2IOL', 4, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (6, N'Eva', N'Novak', N'enovak@ingenii.hr', CAST(N'2010-07-19T00:00:00.0000000' AS DateTime2), N'O0DZ7Z0F8G', 5, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (7, N'Petra', N'Kovačić', N'pkovacic@ingenii.hr', CAST(N'2016-12-25T00:00:00.0000000' AS DateTime2), N'0B0VQ2', 4, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (8, N'Iva', N'Knežević', N'iknezevic@ingenii.hr', CAST(N'2014-06-28T00:00:00.0000000' AS DateTime2), N'0UMUW8LAXW', 3, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (9, N'Mila', N'Vuković', N'mvukovic@ingenii.hr', CAST(N'2014-09-22T00:00:00.0000000' AS DateTime2), N'Q43R3GWF2Y', 3, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (10, N'Klara', N'Marković', N'kmarkovic@ingenii.hr', CAST(N'2017-06-28T00:00:00.0000000' AS DateTime2), N'5ELC7KIOBN', 4, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (11, N'Tena', N'Matić', N'tmatic@ingenii.hr', CAST(N'2012-05-22T00:00:00.0000000' AS DateTime2), N'XJDSSQ', 2, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (12, N'Leona', N'Petrović', N'lpetrovic@ingenii.hr', CAST(N'2015-11-26T00:00:00.0000000' AS DateTime2), N'JUJKZ8IH65', 5, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (13, N'Lorena', N'Tomić', N'ltomic@ingenii.hr', CAST(N'2013-10-29T00:00:00.0000000' AS DateTime2), N'2CIIP2R9P3', 3, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (14, N'Tia', N'Pavlović', N'tpavlovic@ingenii.hr', CAST(N'2015-07-05T00:00:00.0000000' AS DateTime2), N'UILRWW', 4, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (15, N'Lena', N'Kovač', N'lkovac@ingenii.hr', CAST(N'2017-10-27T00:00:00.0000000' AS DateTime2), N'GM8RKUH60T', 4, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (16, N'Katarina', N'Božić', N'kbozic@ingenii.hr', CAST(N'2015-04-15T00:00:00.0000000' AS DateTime2), N'AZ8C8PZBPV', 3, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (17, N'Ena', N'Grgić', N'egrgic@ingenii.hr', CAST(N'2015-06-10T00:00:00.0000000' AS DateTime2), N'FCRMLG', 3, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (18, N'Bruna', N'Blažević', N'bblazevic@ingenii.hr', CAST(N'2014-10-03T00:00:00.0000000' AS DateTime2), N'RSDAN5', 5, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (19, N'Lota', N'Perić', N'lperic@ingenii.hr', CAST(N'2017-11-09T00:00:00.0000000' AS DateTime2), N'CF3VNFYNTH', 3, 2)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (20, N'Una', N'Pavić', N'upavic@ingenii.hr', CAST(N'2018-08-21T00:00:00.0000000' AS DateTime2), N'TL95F5', 4, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (21, N'Korina', N'Radić', N'kradic@ingenii.hr', CAST(N'2013-06-26T00:00:00.0000000' AS DateTime2), N'FTU4XB', 2, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (22, N'Greta', N'Šarić', N'gsaric@ingenii.hr', CAST(N'2018-04-18T00:00:00.0000000' AS DateTime2), N'H23B44', 3, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (23, N'Luna', N'Lovrić', N'llovric@ingenii.hr', CAST(N'2016-09-05T00:00:00.0000000' AS DateTime2), N'4J8N89', 3, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (24, N'Gabriela', N'Filipović', N'gfilipovic@ingenii.hr', CAST(N'2014-04-20T00:00:00.0000000' AS DateTime2), N'17N82S', 5, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (25, N'Barbara', N'Vidović', N'bvidovic@ingenii.hr', CAST(N'2010-12-02T00:00:00.0000000' AS DateTime2), N'45M8FLLQSW', 4, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (26, N'Iris', N'Jukić', N'ijukic@ingenii.hr', CAST(N'2010-12-28T00:00:00.0000000' AS DateTime2), N'VI7GD9I4', 3, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (27, N'Tea', N'Bošnjak', N'tbosnjak@ingenii.hr', CAST(N'2013-09-24T00:00:00.0000000' AS DateTime2), N'45FYDHUXQK', 3, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (28, N'Anja', N'Perković', N'aperkovic@ingenii.hr', CAST(N'2011-08-30T00:00:00.0000000' AS DateTime2), N'5BFONJDYLT', 4, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (29, N'Gabrijela', N'Popović', N'gpopovic@ingenii.hr', CAST(N'2016-07-08T00:00:00.0000000' AS DateTime2), N'F1CWCA9KMY', 3, 3)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (30, N'Emma', N'Nikolić', N'enikolic@ingenii.hr', CAST(N'2013-01-10T00:00:00.0000000' AS DateTime2), N'LGEF3ZPMIO', 4, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (31, N'Sofija', N'Šimić', N'ssimic@ingenii.hr', CAST(N'2016-08-21T00:00:00.0000000' AS DateTime2), N'L61BNH827Z', 2, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (32, N'Tonka', N'Barišić', N'tbarisic@ingenii.hr', CAST(N'2015-01-26T00:00:00.0000000' AS DateTime2), N'K6LIKRP8YG', 3, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (33, N'Maja', N'Bašić', N'mbasic@ingenii.hr', CAST(N'2019-01-22T00:00:00.0000000' AS DateTime2), N'EE3F080H', 3, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (34, N'Doris', N'Mandić', N'dmandic@ingenii.hr', CAST(N'2010-11-21T00:00:00.0000000' AS DateTime2), N'JZROT3', 3, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (35, N'Nicole', N'Klarić', N'nklaric@ingenii.hr', CAST(N'2010-05-24T00:00:00.0000000' AS DateTime2), N'0FC3O08UOC', 4, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (36, N'Nikol', N'Živković', N'nzivkovic@ingenii.hr', CAST(N'2019-05-14T00:00:00.0000000' AS DateTime2), N'XVTQGPEPEL', 5, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (37, N'Noemi', N'Lončar', N'nloncar@ingenii.hr', CAST(N'2013-06-09T00:00:00.0000000' AS DateTime2), N'0PVF9NHR2P', 3, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (38, N'Antea', N'Martinović', N'amartinovic@ingenii.hr', CAST(N'2011-01-26T00:00:00.0000000' AS DateTime2), N'I22ZGX8PF6', 3, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (39, N'Ines', N'Barić', N'ibaric@ingenii.hr', CAST(N'2010-04-13T00:00:00.0000000' AS DateTime2), N'LS4V68', 3, 4)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (40, N'Paola', N'Brkić', N'pbrkic@ingenii.hr', CAST(N'2012-04-15T00:00:00.0000000' AS DateTime2), N'T4DDI6', 4, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (41, N'Anđela', N'Galić', N'agalic@ingenii.hr', CAST(N'2015-10-05T00:00:00.0000000' AS DateTime2), N'9NVG13YYN4', 2, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (42, N'Julia', N'Jurković', N'jjurkovic@ingenii.hr', CAST(N'2018-04-11T00:00:00.0000000' AS DateTime2), N'YBIYE7', 4, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (43, N'Kaja', N'Bilić', N'kbilic@ingenii.hr', CAST(N'2014-01-28T00:00:00.0000000' AS DateTime2), N'73UUAR', 3, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (44, N'Cvita', N'Kos', N'ckos@ingenii.hr', CAST(N'2017-04-06T00:00:00.0000000' AS DateTime2), N'ISUTZ1', 3, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (45, N'Ivona', N'Stanić', N'istanic@ingenii.hr', CAST(N'2010-02-28T00:00:00.0000000' AS DateTime2), N'D8D22ADNUR', 4, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (46, N'Martina', N'Lukić', N'mlukic@ingenii.hr', CAST(N'2013-03-05T00:00:00.0000000' AS DateTime2), N'50BI10', 3, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (47, N'Emili', N'Matijević', N'ematijevic@ingenii.hr', CAST(N'2016-12-24T00:00:00.0000000' AS DateTime2), N'W5HO8ALY7C', 3, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (48, N'Nola', N'Matković', N'nmatkovic@ingenii.hr', CAST(N'2015-03-15T00:00:00.0000000' AS DateTime2), N'R871UB', 5, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (49, N'Emily', N'Kralj', N'ekralj@ingenii.hr', CAST(N'2015-05-18T00:00:00.0000000' AS DateTime2), N'CEIW8F453R', 4, 5)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (50, N'Leda', N'Janković', N'ljankovic@ingenii.hr', CAST(N'2017-07-02T00:00:00.0000000' AS DateTime2), N'4RZUJY', 4, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (51, N'David', N'Novosel', N'dnovosel@ingenii.hr', CAST(N'2018-10-01T00:00:00.0000000' AS DateTime2), N'Z13J0XC1', 2, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (52, N'Petar', N'Jelić', N'pjelic@ingenii.hr', CAST(N'2015-03-21T00:00:00.0000000' AS DateTime2), N'4AKI89KRF5', 3, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (53, N'Mihael', N'Ćosić', N'mcosic@ingenii.hr', CAST(N'2015-04-09T00:00:00.0000000' AS DateTime2), N'BFCDHP', 3, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (54, N'Marko', N'Miletić', N'mmiletic@ingenii.hr', CAST(N'2013-01-11T00:00:00.0000000' AS DateTime2), N'LI17BL', 5, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (55, N'Fran', N'Jurišić', N'fjurisic@ingenii.hr', CAST(N'2019-12-17T00:00:00.0000000' AS DateTime2), N'O6OMTL8', 4, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (56, N'Josip', N'Ivanović', N'jivanovic@ingenii.hr', CAST(N'2019-11-13T00:00:00.0000000' AS DateTime2), N'951S0C', 4, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (57, N'Toma', N'Katić', N'tkatic@ingenii.hr', CAST(N'2013-03-26T00:00:00.0000000' AS DateTime2), N'K3U85QPC2D', 3, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (58, N'Lovro', N'Lučić', N'llucic@ingenii.hr', CAST(N'2011-05-05T00:00:00.0000000' AS DateTime2), N'HKR932', 3, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (59, N'Borna', N'Mihaljević', N'bmihaljevic@ingenii.hr', CAST(N'2013-03-14T00:00:00.0000000' AS DateTime2), N'QVCQP6', 3, 6)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (60, N'Noa', N'Ilić', N'nilic@ingenii.hr', CAST(N'2019-02-18T00:00:00.0000000' AS DateTime2), N'2K3XM1SOBZ', 4, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (61, N'Roko', N'Tadić', N'rtadic@ingenii.hr', CAST(N'2016-10-25T00:00:00.0000000' AS DateTime2), N'M2JTT1', 2, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (62, N'Lukas', N'Posavec', N'lposavec@ingenii.hr', CAST(N'2015-04-29T00:00:00.0000000' AS DateTime2), N'AQAMORDNKK', 3, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (63, N'Nikola', N'Jerković', N'njerkovic@ingenii.hr', CAST(N'2017-12-22T00:00:00.0000000' AS DateTime2), N'JURUT8B9RQ', 4, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (64, N'Patrik', N'Marinović', N'pmarinovic@ingenii.hr', CAST(N'2011-09-13T00:00:00.0000000' AS DateTime2), N'KTB9IFOGIA', 3, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (65, N'Šimun', N'Ivanković', N'sivankovic@ingenii.hr', CAST(N'2010-11-07T00:00:00.0000000' AS DateTime2), N'3IW0YKXR9H', 4, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (66, N'Tin', N'Mikulić', N'tmikulic@ingenii.hr', CAST(N'2017-04-27T00:00:00.0000000' AS DateTime2), N'F3OWYWI8MI', 5, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (67, N'Teo', N'Šimunović', N'tsimunovic@ingenii.hr', CAST(N'2016-11-05T00:00:00.0000000' AS DateTime2), N'GBCRYE0UDP', 3, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (68, N'Viktor', N'Ivančić', N'vivancic@ingenii.hr', CAST(N'2012-12-08T00:00:00.0000000' AS DateTime2), N'YJ0PAD', 3, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (69, N'Leo', N'Poljak', N'lpoljak@ingenii.hr', CAST(N'2015-02-11T00:00:00.0000000' AS DateTime2), N'U0ORHLRACI', 3, 7)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (70, N'Rafael', N'Jovanović', N'rjovanovic@ingenii.hr', CAST(N'2018-06-17T00:00:00.0000000' AS DateTime2), N'CMC7E38D08', 4, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (71, N'Adrian', N'Herceg', N'aherceg@ingenii.hr', CAST(N'2011-11-06T00:00:00.0000000' AS DateTime2), N'BAU977EOZB', 2, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (72, N'Andrej', N'Marjanović', N'amarjanovic@ingenii.hr', CAST(N'2014-05-15T00:00:00.0000000' AS DateTime2), N'T1TP62OH0R', 5, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (73, N'Juraj', N'Milić', N'jmilic@ingenii.hr', CAST(N'2014-06-22T00:00:00.0000000' AS DateTime2), N'OLSN6DZ3GN', 3, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (74, N'Gabrijel', N'Vidaković', N'gvidakovic@ingenii.hr', CAST(N'2015-07-27T00:00:00.0000000' AS DateTime2), N'2MAM1X4X69', 3, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (75, N'Oliver', N'Cindrić', N'ocindric@ingenii.hr', CAST(N'2012-11-16T00:00:00.0000000' AS DateTime2), N'RUSDOP', 4, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (76, N'Mark', N'Marušić', N'mmarusic@ingenii.hr', CAST(N'2015-03-19T00:00:00.0000000' AS DateTime2), N'OOXDM7', 3, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (77, N'Benjamin', N'Vučković', N'bvuckovic@ingenii.hr', CAST(N'2014-03-22T00:00:00.0000000' AS DateTime2), N'Q6SJED82VH', 4, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (78, N'Dino', N'Topić', N'dtopic@ingenii.hr', CAST(N'2019-06-03T00:00:00.0000000' AS DateTime2), N'NAJ1RTKYD', 5, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (79, N'Toni', N'Rukavina', N'trukavina@ingenii.hr', CAST(N'2014-02-21T00:00:00.0000000' AS DateTime2), N'22BSI2', 3, 8)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (80, N'Maks', N'Jozić', N'mjozic@ingenii.hr', CAST(N'2017-09-30T00:00:00.0000000' AS DateTime2), N'LLPKL5UIIN', 4, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (81, N'Lucas', N'Delić', N'ldelic@ingenii.hr', CAST(N'2014-01-04T00:00:00.0000000' AS DateTime2), N'JFX85N7T0G', 2, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (82, N'Noel', N'Novaković', N'nnovakovic@ingenii.hr', CAST(N'2018-07-14T00:00:00.0000000' AS DateTime2), N'EBT22C3RRL', 3, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (83, N'Leonardo', N'Varga', N'lvarga@ingenii.hr', CAST(N'2016-04-14T00:00:00.0000000' AS DateTime2), N'EEH4EYRNCO', 3, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (84, N'Vigo', N'Pavičić', N'vpavicic@ingenii.hr', CAST(N'2019-01-07T00:00:00.0000000' AS DateTime2), N'F41JAQVUYB', 4, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (85, N'Maksim', N'Bogdan', N'mbogdan@ingenii.hr', CAST(N'2014-04-12T00:00:00.0000000' AS DateTime2), N'FU9CETA59X', 4, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (86, N'Kristijan', N'Grubišić', N'kgrubisic@ingenii.hr', CAST(N'2011-06-04T00:00:00.0000000' AS DateTime2), N'EU0X7TYMOE', 3, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (87, N'Tomislav', N'Đurić', N'tdjuric@ingenii.hr', CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), N'YSU6WA', 3, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (88, N'Noah', N'Špoljarić', N'nspoljaric@ingenii.hr', CAST(N'2016-01-11T00:00:00.0000000' AS DateTime2), N'SCW8RAVFU4', 3, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (89, N'Pavle', N'Dujmović', N'pdujmovic@ingenii.hr', CAST(N'2010-12-06T00:00:00.0000000' AS DateTime2), N'G6SRDN', 3, 9)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (90, N'Arian', N'Vukelić', N'avukelic@ingenii.hr', CAST(N'2010-07-13T00:00:00.0000000' AS DateTime2), N'ZHVYB2', 4, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (91, N'Manuel', N'Kolar', N'mkolar@ingenii.hr', CAST(N'2016-02-19T00:00:00.0000000' AS DateTime2), N'9E94KFE8MK', 2, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (92, N'Mislav', N'Burić', N'mburic@ingenii.hr', CAST(N'2012-02-06T00:00:00.0000000' AS DateTime2), N'8F7F3AHPPB', 3, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (93, N'Jure', N'Štimac', N'jstimac@ingenii.hr', CAST(N'2017-11-15T00:00:00.0000000' AS DateTime2), N'TNCLZ4', 3, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (94, N'Neo', N'Petković', N'npetkovic@ingenii.hr', CAST(N'2011-02-25T00:00:00.0000000' AS DateTime2), N'7717GF68F9', 3, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (95, N'Robert', N'Kolarić', N'rkolaric@ingenii.hr', CAST(N'2015-06-23T00:00:00.0000000' AS DateTime2), N'HTEEDSPUSX', 4, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (96, N'Vedran', N'Petrić', N'vpetric@ingenii.hr', CAST(N'2010-06-09T00:00:00.0000000' AS DateTime2), N'438DX8', 5, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (97, N'Frane', N'Brajković', N'fbrajkovic@ingenii.hr', CAST(N'2010-04-20T00:00:00.0000000' AS DateTime2), N'SMYX944HEB', 3, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (98, N'Ian', N'Bačić', N'ibacic@ingenii.hr', CAST(N'2012-05-18T00:00:00.0000000' AS DateTime2), N'3QGCN9', 4, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (99, N'Mate', N'Jakšić', N'mjaksic@ingenii.hr', CAST(N'2016-05-31T00:00:00.0000000' AS DateTime2), N'9UV8BPWR6I', 3, 10)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (100, N'Oskar', N'Jović', N'ojovic@ingenii.hr', CAST(N'2012-11-04T00:00:00.0000000' AS DateTime2), N'IU2DZF0VR4', 4, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (101, N'Lucija', N'Ivić', N'livic@ingenii.hr', CAST(N'2016-04-30T00:00:00.0000000' AS DateTime2), N'8E2V2WTBRZ', 2, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (102, N'Ema', N'Stanković', N'estankovic@ingenii.hr', CAST(N'2014-01-17T00:00:00.0000000' AS DateTime2), N'X31AX9', 5, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (103, N'Ana', N'Ružić', N'aruzic@ingenii.hr', CAST(N'2010-02-01T00:00:00.0000000' AS DateTime2), N'0L9JUV', 3, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (104, N'Marta', N'Pranjić', N'mpranjic@ingenii.hr', CAST(N'2016-12-02T00:00:00.0000000' AS DateTime2), N'HH4JYBQ4S6', 3, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (105, N'Rita', N'Stojanović', N'rstojanovic@ingenii.hr', CAST(N'2015-08-28T00:00:00.0000000' AS DateTime2), N'OF94WPL5QS', 4, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (106, N'Marija', N'Antunović', N'mantunovic@ingenii.hr', CAST(N'2014-05-19T00:00:00.0000000' AS DateTime2), N'ESOATE0JMG', 3, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (107, N'Laura', N'Mitrović', N'lmitrovic@ingenii.hr', CAST(N'2010-09-29T00:00:00.0000000' AS DateTime2), N'3W1JZVGRTX', 3, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (108, N'Lea', N'Lončarić', N'lloncaric@ingenii.hr', CAST(N'2019-09-14T00:00:00.0000000' AS DateTime2), N'3Q5GMZR67I', 5, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (109, N'Dora', N'Ban', N'dban@ingenii.hr', CAST(N'2010-02-26T00:00:00.0000000' AS DateTime2), N'WK0IIW', 3, 11)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (110, N'Lara', N'Tolić', N'ltolic@ingenii.hr', CAST(N'2014-10-01T00:00:00.0000000' AS DateTime2), N'HFCT1G', 4, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (111, N'Franka', N'Josipović', N'fjosipovic@ingenii.hr', CAST(N'2015-08-25T00:00:00.0000000' AS DateTime2), N'VDDOD6', 2, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (112, N'Katja', N'Pejić', N'kpejic@ingenii.hr', CAST(N'2013-10-24T00:00:00.0000000' AS DateTime2), N'29XAFMQ028', 4, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (113, N'Helena', N'Pintarić', N'hpintaric@ingenii.hr', CAST(N'2017-03-15T00:00:00.0000000' AS DateTime2), N'5MWY1BJ9XB', 3, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (114, N'Karla', N'Golubić', N'kgolubic@ingenii.hr', CAST(N'2015-06-16T00:00:00.0000000' AS DateTime2), N'R4KDHP', 5, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (115, N'Magdalena', N'Anić', N'manic@ingenii.hr', CAST(N'2015-02-14T00:00:00.0000000' AS DateTime2), N'OEOZ93OOBM', 4, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (116, N'Maša', N'Prpić', N'mprpic@ingenii.hr', CAST(N'2018-04-14T00:00:00.0000000' AS DateTime2), N'B2KJ412XOD', 3, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (117, N'Sofia', N'Tokić', N'stokic@ingenii.hr', CAST(N'2019-01-15T00:00:00.0000000' AS DateTime2), N'4ZD9WVWIUL', 3, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (118, N'Jana', N'Erceg', N'jerceg@ingenii.hr', CAST(N'2018-12-16T00:00:00.0000000' AS DateTime2), N'4MJY0KU6', 3, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (119, N'Paula', N'Petričević', N'ppetricevic@ingenii.hr', CAST(N'2017-06-03T00:00:00.0000000' AS DateTime2), N'33MWUIOWXF', 4, 12)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (120, N'Vita', N'Budimir', N'vbudimir@ingenii.hr', CAST(N'2019-06-06T00:00:00.0000000' AS DateTime2), N'IXPNMEYMJ9', 4, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (121, N'Tara', N'Baričević', N'tbaricevic@ingenii.hr', CAST(N'2017-07-09T00:00:00.0000000' AS DateTime2), N'XSH8V2X49P', 2, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (122, N'Hana', N'Martić', N'hmartic@ingenii.hr', CAST(N'2010-10-26T00:00:00.0000000' AS DateTime2), N'4GC85XRDJF', 3, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (123, N'Nina', N'Starčević', N'nstarcevic@ingenii.hr', CAST(N'2012-01-03T00:00:00.0000000' AS DateTime2), N'5AO9M341LI', 3, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (124, N'Mara', N'Vlašić', N'mvlasic@ingenii.hr', CAST(N'2014-08-02T00:00:00.0000000' AS DateTime2), N'2R7463LQTK', 3, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (125, N'Ela', N'Vrdoljak', N'evrdoljak@ingenii.hr', CAST(N'2012-04-29T00:00:00.0000000' AS DateTime2), N'KSTWLT2XEM', 4, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (126, N'Matea', N'Mijatović', N'mmijatovic@ingenii.hr', CAST(N'2019-10-02T00:00:00.0000000' AS DateTime2), N'071D5JKFR9', 4, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (127, N'Nora', N'Car', N'ncar@ingenii.hr', CAST(N'2016-07-01T00:00:00.0000000' AS DateTime2), N'6ZPM6F5BXH', 3, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (128, N'Ella', N'Majić', N'emajic@ingenii.hr', CAST(N'2013-04-27T00:00:00.0000000' AS DateTime2), N'IMXW7WI8BJ', 3, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (129, N'Vida', N'Šimunić', N'vsimunic@ingenii.hr', CAST(N'2010-02-04T00:00:00.0000000' AS DateTime2), N'Y9HEM46AWK', 3, 13)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (130, N'Pia', N'Horvatić', N'phorvatic@ingenii.hr', CAST(N'2012-06-09T00:00:00.0000000' AS DateTime2), N'HJL5PL0LGS', 4, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (131, N'Kiara', N'Mlinarić', N'kmlinaric@ingenii.hr', CAST(N'2014-11-29T00:00:00.0000000' AS DateTime2), N'EGKR5G', 2, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (132, N'Maria', N'Ljubičić', N'mljubicic@ingenii.hr', CAST(N'2011-11-04T00:00:00.0000000' AS DateTime2), N'8D45L4NLOW', 5, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (133, N'Aria', N'Pavlić', N'apavlic@ingenii.hr', CAST(N'2013-01-03T00:00:00.0000000' AS DateTime2), N'47RO5I', 4, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (134, N'Mihaela', N'Vukić', N'mvukic@ingenii.hr', CAST(N'2011-04-20T00:00:00.0000000' AS DateTime2), N'MM94MQGUTK', 3, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (135, N'Monika', N'Vlahović', N'mvlahovic@ingenii.hr', CAST(N'2011-06-03T00:00:00.0000000' AS DateTime2), N'VBGK1', 4, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (136, N'Nikolina', N'Sever', N'nsever@ingenii.hr', CAST(N'2019-12-20T00:00:00.0000000' AS DateTime2), N'ANQSPF', 3, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (137, N'Viktorija', N'Abramović', N'vabramovic@ingenii.hr', CAST(N'2018-06-12T00:00:00.0000000' AS DateTime2), N'14ZR6V', 3, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (138, N'Aurora', N'Crnković', N'acrnkovic@ingenii.hr', CAST(N'2019-05-15T00:00:00.0000000' AS DateTime2), N'6FT3L5JY55', 5, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (139, N'Lora', N'Mamić', N'lmamic@ingenii.hr', CAST(N'2013-05-13T00:00:00.0000000' AS DateTime2), N'68TZ58FAMR', 3, 14)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (140, N'Viktoria', N'Grgurić', N'vgrguric@ingenii.hr', CAST(N'2019-11-25T00:00:00.0000000' AS DateTime2), N'OL1JME', 4, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (141, N'Iskra', N'Ivković', N'iivkovic@ingenii.hr', CAST(N'2010-09-06T00:00:00.0000000' AS DateTime2), N'LQOF40LT69', 2, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (142, N'Julija', N'Zorić', N'jzoric@ingenii.hr', CAST(N'2010-02-06T00:00:00.0000000' AS DateTime2), N'FVVA09BZEG', 3, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (143, N'Brigita', N'Čović', N'bcovic@ingenii.hr', CAST(N'2015-11-16T00:00:00.0000000' AS DateTime2), N'GO93IY', 3, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (144, N'Gita', N'Dragičević', N'gdragicevic@ingenii.hr', CAST(N'2016-03-08T00:00:00.0000000' AS DateTime2), N'0QOC1H', 5, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (145, N'Josipa', N'Radoš', N'jrados@ingenii.hr', CAST(N'2014-11-19T00:00:00.0000000' AS DateTime2), N'3W3VBD', 4, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (146, N'Zara', N'Rašić', N'zrasic@ingenii.hr', CAST(N'2012-04-27T00:00:00.0000000' AS DateTime2), N'D38U27KYK2', 3, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (147, N'Larisa', N'Orešković', N'loreskovic@ingenii.hr', CAST(N'2014-11-25T00:00:00.0000000' AS DateTime2), N'L305QI', 4, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (148, N'Veronika', N'Sertić', N'vsertic@ingenii.hr', CAST(N'2012-06-01T00:00:00.0000000' AS DateTime2), N'ZODE5VFHLC', 3, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (149, N'Ivana', N'Miličević', N'imilicevic@ingenii.hr', CAST(N'2016-01-13T00:00:00.0000000' AS DateTime2), N'VKF1N6KF9N', 3, 15)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (150, N'Maris', N'Ljubić', N'mljubic@ingenii.hr', CAST(N'2017-03-11T00:00:00.0000000' AS DateTime2), N'9EAUR', 4, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (151, N'Luka', N'Milković', N'lmilkovic@ingenii.hr', CAST(N'2011-05-27T00:00:00.0000000' AS DateTime2), N'SZ478X52QB', 2, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (152, N'Jakov', N'Medved', N'jmedved@ingenii.hr', CAST(N'2011-05-07T00:00:00.0000000' AS DateTime2), N'BBB12CBE0D', 3, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (153, N'Ivan', N'Matošević', N'imatosevic@ingenii.hr', CAST(N'2014-12-16T00:00:00.0000000' AS DateTime2), N'9CFRMN869L', 3, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (154, N'Filip', N'Andrić', N'fandric@ingenii.hr', CAST(N'2016-12-27T00:00:00.0000000' AS DateTime2), N'X1ERCAAXJ8', 4, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (155, N'Matej', N'Milošević', N'mmilosevic@ingenii.hr', CAST(N'2015-04-29T00:00:00.0000000' AS DateTime2), N'JKUTBD', 4, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (156, N'Leon', N'Turković', N'lturkovic@ingenii.hr', CAST(N'2015-07-07T00:00:00.0000000' AS DateTime2), N'XUJBT5', 5, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (157, N'Karlo', N'Franić', N'kfranic@ingenii.hr', CAST(N'2012-01-15T00:00:00.0000000' AS DateTime2), N'WORW9R', 3, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (158, N'Mateo', N'Mišković', N'mmiskovic@ingenii.hr', CAST(N'2015-07-04T00:00:00.0000000' AS DateTime2), N'99EZW6R5EO', 3, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (159, N'Niko', N'Balić', N'nbalic@ingenii.hr', CAST(N'2014-08-06T00:00:00.0000000' AS DateTime2), N'D6WKO0QHCA', 3, 16)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (160, N'Jan', N'Šoštarić', N'jsostaric@ingenii.hr', CAST(N'2015-11-28T00:00:00.0000000' AS DateTime2), N'32S5CEK53I', 4, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (161, N'Gabriel', N'Mihalić', N'gmihalic@ingenii.hr', CAST(N'2017-11-19T00:00:00.0000000' AS DateTime2), N'PDGAB6', 2, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (162, N'Vito', N'Milanović', N'vmilanovic@ingenii.hr', CAST(N'2017-06-04T00:00:00.0000000' AS DateTime2), N'X75Q8PW36P', 5, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (163, N'Ivano', N'Jurčević', N'ijurcevic@ingenii.hr', CAST(N'2019-08-10T00:00:00.0000000' AS DateTime2), N'Z6CJDHJOLR', 3, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (164, N'Ante', N'Galović', N'agalovic@ingenii.hr', CAST(N'2017-09-19T00:00:00.0000000' AS DateTime2), N'8SKC5WVYGK', 3, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (165, N'Dominik', N'Radošević', N'dradosevic@ingenii.hr', CAST(N'2019-11-03T00:00:00.0000000' AS DateTime2), N'KC77VGW88R', 4, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (166, N'Bruno', N'Rajković', N'brajkovic@ingenii.hr', CAST(N'2013-10-22T00:00:00.0000000' AS DateTime2), N'ZI8E99DVU2', 3, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (167, N'Marin', N'Balog', N'mbalog@ingenii.hr', CAST(N'2010-10-22T00:00:00.0000000' AS DateTime2), N'K4T02X', 3, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (168, N'Matija', N'Mikić', N'mmikic@ingenii.hr', CAST(N'2015-11-27T00:00:00.0000000' AS DateTime2), N'RKBMCV', 4, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (169, N'Antonio', N'Medić', N'amedic@ingenii.hr', CAST(N'2014-01-14T00:00:00.0000000' AS DateTime2), N'GWP4FB', 3, 17)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (170, N'Martin', N'Savić', N'msavic@ingenii.hr', CAST(N'2015-02-26T00:00:00.0000000' AS DateTime2), N'ISNQ5A', 4, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (171, N'Emanuel', N'Lacković', N'elackovic@ingenii.hr', CAST(N'2019-11-03T00:00:00.0000000' AS DateTime2), N'V34D2X', 2, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (172, N'Vid', N'Puškarić', N'vpuskaric@ingenii.hr', CAST(N'2019-09-04T00:00:00.0000000' AS DateTime2), N'BDGJ4T962Y', 3, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (173, N'Franko', N'Buljan', N'fbuljan@ingenii.hr', CAST(N'2015-08-05T00:00:00.0000000' AS DateTime2), N'OBE7AHBX6', 3, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (174, N'Erik', N'Kolić', N'ekolic@ingenii.hr', CAST(N'2017-07-11T00:00:00.0000000' AS DateTime2), N'RVF92A', 5, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (175, N'Stjepan', N'Majstorović', N'smajstorovic@ingenii.hr', CAST(N'2018-09-30T00:00:00.0000000' AS DateTime2), N'K2188G3W5B', 4, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (176, N'Bartol', N'Mijić', N'bmijic@ingenii.hr', CAST(N'2017-06-02T00:00:00.0000000' AS DateTime2), N'KRLUQLVXD', 3, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (177, N'Adam', N'Sučić', N'asucic@ingenii.hr', CAST(N'2014-12-11T00:00:00.0000000' AS DateTime2), N'HEY6NRFLBI', 3, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (178, N'Liam', N'Tomašić', N'ltomasic@ingenii.hr', CAST(N'2015-10-29T00:00:00.0000000' AS DateTime2), N'G4PPGGBVYS', 3, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (179, N'Dorian', N'Meštrović', N'dmestrovic@ingenii.hr', CAST(N'2019-09-14T00:00:00.0000000' AS DateTime2), N'GMKAG1', 3, 18)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (180, N'Antun', N'Ćurić', N'acuric@ingenii.hr', CAST(N'2010-01-02T00:00:00.0000000' AS DateTime2), N'0H7XPX', 4, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (181, N'Andrija', N'Marijanović', N'amarijanovic@ingenii.hr', CAST(N'2014-11-07T00:00:00.0000000' AS DateTime2), N'C4A1OMZ2O6', 2, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (182, N'Maro', N'Cvitković', N'mcvitkovic@ingenii.hr', CAST(N'2014-01-30T00:00:00.0000000' AS DateTime2), N'ZYUNBC', 4, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (183, N'Ilija', N'Vukušić', N'ivukusic@ingenii.hr', CAST(N'2017-04-16T00:00:00.0000000' AS DateTime2), N'A8PTT78', 3, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (184, N'Sven', N'Nekić', N'snekic@ingenii.hr', CAST(N'2012-11-27T00:00:00.0000000' AS DateTime2), N'I0E26E', 3, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (185, N'Jona', N'Hodak', N'jhodak@ingenii.hr', CAST(N'2011-01-15T00:00:00.0000000' AS DateTime2), N'0KMFBX', 4, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (186, N'Domagoj', N'Đurđević', N'ddjurdjevic@ingenii.hr', CAST(N'2013-07-26T00:00:00.0000000' AS DateTime2), N'XLR414K4XV', 5, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (187, N'Mak', N'Glavaš', N'mglavas@ingenii.hr', CAST(N'2016-11-20T00:00:00.0000000' AS DateTime2), N'W6ZO7XCOR4', 3, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (188, N'Aleksandar', N'Begić', N'abegic@ingenii.hr', CAST(N'2016-01-08T00:00:00.0000000' AS DateTime2), N'L5JQSO', 3, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (189, N'Pavel', N'Maričić', N'pmaricic@ingenii.hr', CAST(N'2015-12-23T00:00:00.0000000' AS DateTime2), N'PMG7X', 4, 19)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (190, N'Stefan', N'Rožić', N'srozic@ingenii.hr', CAST(N'2015-11-28T00:00:00.0000000' AS DateTime2), N'U9IF5N', 4, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (191, N'Ivor', N'Kraljević', N'ikraljevic@ingenii.hr', CAST(N'2017-12-06T00:00:00.0000000' AS DateTime2), N'UWQPYH', 2, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (192, N'Mauro', N'Devčić', N'mdevcic@ingenii.hr', CAST(N'2012-12-09T00:00:00.0000000' AS DateTime2), N'B7N9EZJ80W', 5, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (193, N'Damjan', N'Vuletić', N'dvuletic@ingenii.hr', CAST(N'2014-10-10T00:00:00.0000000' AS DateTime2), N'8Y2XPH', 3, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (194, N'Max', N'Ostojić', N'mostojic@ingenii.hr', CAST(N'2017-06-17T00:00:00.0000000' AS DateTime2), N'1SA87C', 3, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (195, N'Pavao', N'Vuk', N'pvuk@ingenii.hr', CAST(N'2012-01-07T00:00:00.0000000' AS DateTime2), N'THEE4', 4, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (196, N'Sebastian', N'Matanović', N'smatanovic@ingenii.hr', CAST(N'2013-04-04T00:00:00.0000000' AS DateTime2), N'I2Z2YHYPSB', 4, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (197, N'Aron', N'Jakovljević', N'ajakovljevic@ingenii.hr', CAST(N'2010-06-30T00:00:00.0000000' AS DateTime2), N'T54SBM', 3, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (198, N'Grga', N'Dukić', N'gdukic@ingenii.hr', CAST(N'2018-02-28T00:00:00.0000000' AS DateTime2), N'RQX533', 5, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (199, N'Marino', N'Begović', N'mbegovic@ingenii.hr', CAST(N'2016-05-07T00:00:00.0000000' AS DateTime2), N'JA8PR4', 3, 20)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [Ime], [Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (200, N'Matias', N'Salopek', N'msalopek@ingenii.hr', CAST(N'2011-01-29T00:00:00.0000000' AS DateTime2), N'EH7VIH', 1, NULL)
GO

Set identity_insert Djelatnik off

Set identity_insert Klijent on

GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (1, N'Mucrosoft d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (2, N'Oricle d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (3, N'Ubm d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (4, N'Sip d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (5, N'Symintec d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (6, N'Emc d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (7, N'Vmwire d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (9, N'Silesforcecom d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (10, N'Untaut d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (11, N'Idobe d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (13, N'Sis d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (14, N'Cusco d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (16, N'Suemens d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (17, N'Fajutsa d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (18, N'Iatodesk d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (19, N'Cutrux d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (21, N'Hutichu d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (22, N'Ipple d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (23, N'Unfor d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (25, N'Untel d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (27, N'Sige d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (28, N'Idp d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (31, N'Opentext d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (32, N'Sangird d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (33, N'Nec d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (35, N'Hexigon d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (37, N'Teriditi d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (38, N'Netipp d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (42, N'Mckesson d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (44, N'Ptc d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (47, N'Ditev d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (48, N'Esru d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (49, N'Cerner d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (50, N'Insys d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (51, N'Unformituci d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (52, N'Tubco d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (54, N'Optam d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (56, N'Fuserv d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (57, N'Iviyi d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (58, N'Kronos d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (64, N'Itheniheilth d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (67, N'Fuco d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (68, N'Fus d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (69, N'Musys d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (71, N'Swuft d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (72, N'Workdiy d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (74, N'Totvs d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (76, N'Servucenow d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (77, N'Commvialt d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (79, N'Convergys d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (80, N'Neasoft d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (81, N'Vusmi d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (82, N'Qluk d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (85, N'Untersystems d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (86, N'Pilintur d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (87, N'Anuto d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (88, N'Illscrupts d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (89, N'Medutech d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (90, N'Blickboird d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (91, N'Imizoncom d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (93, N'Pegisystems d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (94, N'Netsaute d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (95, N'Mucrostritegy d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (96, N'Eset d.o.o.', N'NULL', N'NULL')
GO
INSERT [dbo].[Klijent] ([IDKlijent], [Naziv], [Telefon], [Email]) VALUES (98, N'Solirwunds d.o.o.', N'NULL', N'NULL')
GO

Set identity_insert Klijent off

Set identity_insert Projekt on

GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (1, N'Projekt Mucrosoft Prvi', 1, CAST(N'2010-01-01' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (2, N'Projekt Oricle Prvi', 2, CAST(N'2010-01-31' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (3, N'Projekt Ubm Prvi', 3, CAST(N'2010-03-02' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (4, N'Projekt Sip Prvi', 4, CAST(N'2010-04-01' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (5, N'Projekt Symintec Prvi', 5, CAST(N'2010-05-01' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (6, N'Projekt Emc Prvi', 6, CAST(N'2010-05-31' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (7, N'Projekt Vmwire Prvi', 7, CAST(N'2010-06-30' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (8, N'Projekt Silesforcecom Prvi', 9, CAST(N'2010-07-30' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (9, N'Projekt Untaut Prvi', 10, CAST(N'2010-08-29' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (10, N'Projekt Idobe Prvi', 11, CAST(N'2010-09-28' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (11, N'Projekt Sis Prvi', 13, CAST(N'2010-10-28' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (12, N'Projekt Cusco Prvi', 14, CAST(N'2010-11-27' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (13, N'Projekt Suemens Prvi', 16, CAST(N'2010-12-27' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (14, N'Projekt Fajutsa Prvi', 17, CAST(N'2011-01-26' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (15, N'Projekt Iatodesk Prvi', 18, CAST(N'2011-02-25' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (16, N'Projekt Cutrux Prvi', 19, CAST(N'2011-03-27' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (17, N'Projekt Hutichu Prvi', 21, CAST(N'2011-04-26' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (18, N'Projekt Ipple Prvi', 22, CAST(N'2011-05-26' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (19, N'Projekt Unfor Prvi', 23, CAST(N'2011-06-25' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (20, N'Projekt Untel Prvi', 25, CAST(N'2011-07-25' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (21, N'Projekt Sige Prvi', 27, CAST(N'2011-08-24' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (22, N'Projekt Idp Prvi', 28, CAST(N'2011-09-23' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (23, N'Projekt Opentext Prvi', 31, CAST(N'2011-10-23' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (24, N'Projekt Sangird Prvi', 32, CAST(N'2011-11-22' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (25, N'Projekt Nec Prvi', 33, CAST(N'2011-12-22' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (26, N'Projekt Hexigon Prvi', 35, CAST(N'2012-01-21' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (27, N'Projekt Teriditi Prvi', 37, CAST(N'2012-02-20' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (28, N'Projekt Netipp Prvi', 38, CAST(N'2012-03-21' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (29, N'Projekt Mckesson Prvi', 42, CAST(N'2012-04-20' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (30, N'Projekt Ptc Prvi', 44, CAST(N'2012-05-20' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (31, N'Projekt Ditev Prvi', 47, CAST(N'2012-06-19' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (32, N'Projekt Esru Prvi', 48, CAST(N'2012-07-19' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (33, N'Projekt Cerner Prvi', 49, CAST(N'2012-08-18' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (34, N'Projekt Insys Prvi', 50, CAST(N'2012-09-17' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (35, N'Projekt Unformituci Prvi', 51, CAST(N'2012-10-17' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (36, N'Projekt Tubco Prvi', 52, CAST(N'2012-11-16' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (37, N'Projekt Optam Prvi', 54, CAST(N'2012-12-16' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (38, N'Projekt Fuserv Prvi', 56, CAST(N'2013-01-15' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (39, N'Projekt Iviyi Prvi', 57, CAST(N'2013-02-14' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (40, N'Projekt Kronos Prvi', 58, CAST(N'2013-03-16' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (41, N'Projekt Itheniheilth Prvi', 64, CAST(N'2013-04-15' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (42, N'Projekt Fuco Prvi', 67, CAST(N'2013-05-15' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (43, N'Projekt Fus Prvi', 68, CAST(N'2013-06-14' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (44, N'Projekt Musys Prvi', 69, CAST(N'2013-07-14' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (45, N'Projekt Swuft Prvi', 71, CAST(N'2013-08-13' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (46, N'Projekt Workdiy Prvi', 72, CAST(N'2013-09-12' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (47, N'Projekt Totvs Prvi', 74, CAST(N'2013-10-12' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (48, N'Projekt Servucenow Prvi', 76, CAST(N'2013-11-11' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (49, N'Projekt Commvialt Prvi', 77, CAST(N'2013-12-11' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (50, N'Projekt Convergys Prvi', 79, CAST(N'2014-01-10' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (51, N'Projekt Neasoft Prvi', 80, CAST(N'2014-02-09' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (52, N'Projekt Vusmi Prvi', 81, CAST(N'2014-03-11' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (53, N'Projekt Qluk Prvi', 82, CAST(N'2014-04-10' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (54, N'Projekt Untersystems Prvi', 85, CAST(N'2014-05-10' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (55, N'Projekt Pilintur Prvi', 86, CAST(N'2014-06-09' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (56, N'Projekt Anuto Prvi', 87, CAST(N'2014-07-09' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (57, N'Projekt Illscrupts Prvi', 88, CAST(N'2014-08-08' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (58, N'Projekt Medutech Prvi', 89, CAST(N'2014-09-07' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (59, N'Projekt Blickboird Prvi', 90, CAST(N'2014-10-07' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (60, N'Projekt Imizoncom Prvi', 91, CAST(N'2014-11-06' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (61, N'Projekt Pegisystems Prvi', 93, CAST(N'2014-12-06' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (62, N'Projekt Netsaute Prvi', 94, CAST(N'2015-01-05' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (63, N'Projekt Mucrostritegy Prvi', 95, CAST(N'2015-02-04' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (64, N'Projekt Eset Prvi', 96, CAST(N'2015-03-06' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (65, N'Projekt Solirwunds Prvi', 98, CAST(N'2015-04-05' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (66, N'Projekt Mucrosoft Drugi', 1, CAST(N'2015-05-05' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (67, N'Projekt Oricle Drugi', 2, CAST(N'2015-06-04' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (68, N'Projekt Ubm Drugi', 3, CAST(N'2015-07-04' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (69, N'Projekt Sip Drugi', 4, CAST(N'2015-08-03' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (70, N'Projekt Symintec Drugi', 5, CAST(N'2015-09-02' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (71, N'Projekt Emc Drugi', 6, CAST(N'2015-10-02' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (72, N'Projekt Vmwire Drugi', 7, CAST(N'2015-11-01' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (73, N'Projekt Silesforcecom Drugi', 9, CAST(N'2015-12-01' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (74, N'Projekt Untaut Drugi', 10, CAST(N'2015-12-31' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (75, N'Projekt Idobe Drugi', 11, CAST(N'2016-01-30' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (76, N'Projekt Sis Drugi', 13, CAST(N'2016-02-29' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (77, N'Projekt Cusco Drugi', 14, CAST(N'2016-03-30' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (78, N'Projekt Suemens Drugi', 16, CAST(N'2016-04-29' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (79, N'Projekt Fajutsa Drugi', 17, CAST(N'2016-05-29' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (80, N'Projekt Iatodesk Drugi', 18, CAST(N'2016-06-28' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (81, N'Projekt Cutrux Drugi', 19, CAST(N'2016-07-28' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (82, N'Projekt Hutichu Drugi', 21, CAST(N'2016-08-27' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (83, N'Projekt Ipple Drugi', 22, CAST(N'2016-09-26' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (84, N'Projekt Unfor Drugi', 23, CAST(N'2016-10-26' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (85, N'Projekt Untel Drugi', 25, CAST(N'2016-11-25' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (86, N'Projekt Sige Drugi', 27, CAST(N'2016-12-25' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (87, N'Projekt Idp Drugi', 28, CAST(N'2017-01-24' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (88, N'Projekt Opentext Drugi', 31, CAST(N'2017-02-23' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (89, N'Projekt Sangird Drugi', 32, CAST(N'2017-03-25' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (90, N'Projekt Nec Drugi', 33, CAST(N'2017-04-24' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (91, N'Projekt Hexigon Drugi', 35, CAST(N'2017-05-24' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (92, N'Projekt Teriditi Drugi', 37, CAST(N'2017-06-23' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (93, N'Projekt Netipp Drugi', 38, CAST(N'2017-07-23' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (94, N'Projekt Mckesson Drugi', 42, CAST(N'2017-08-22' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (95, N'Projekt Ptc Drugi', 44, CAST(N'2017-09-21' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (96, N'Projekt Ditev Drugi', 47, CAST(N'2017-10-21' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (97, N'Projekt Esru Drugi', 48, CAST(N'2017-11-20' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (98, N'Projekt Cerner Drugi', 49, CAST(N'2017-12-20' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (99, N'Projekt Insys Drugi', 50, CAST(N'2018-01-19' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (100, N'Projekt Unformituci Drugi', 51, CAST(N'2018-02-18' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (101, N'Projekt Tubco Drugi', 52, CAST(N'2018-03-20' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (102, N'Projekt Optam Drugi', 54, CAST(N'2018-04-19' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (103, N'Projekt Fuserv Drugi', 56, CAST(N'2018-05-19' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (104, N'Projekt Iviyi Drugi', 57, CAST(N'2018-06-18' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (105, N'Projekt Kronos Drugi', 58, CAST(N'2018-07-18' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (106, N'Projekt Itheniheilth Drugi', 64, CAST(N'2018-08-17' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (107, N'Projekt Fuco Drugi', 67, CAST(N'2018-09-16' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (108, N'Projekt Fus Drugi', 68, CAST(N'2018-10-16' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (109, N'Projekt Musys Drugi', 69, CAST(N'2018-11-15' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (110, N'Projekt Swuft Drugi', 71, CAST(N'2018-12-15' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (111, N'Projekt Workdiy Drugi', 72, CAST(N'2019-01-14' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (112, N'Projekt Totvs Drugi', 74, CAST(N'2019-02-13' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (113, N'Projekt Servucenow Drugi', 76, CAST(N'2019-03-15' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (114, N'Projekt Commvialt Drugi', 77, CAST(N'2019-04-14' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (115, N'Projekt Convergys Drugi', 79, CAST(N'2019-05-14' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (116, N'Projekt Neasoft Drugi', 80, CAST(N'2019-06-13' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (117, N'Projekt Vusmi Drugi', 81, CAST(N'2019-07-13' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (118, N'Projekt Qluk Drugi', 82, CAST(N'2019-08-12' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (119, N'Projekt Untersystems Drugi', 85, CAST(N'2019-09-11' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (120, N'Projekt Pilintur Drugi', 86, CAST(N'2019-10-11' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (121, N'Projekt Anuto Drugi', 87, CAST(N'2019-11-10' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (122, N'Projekt Illscrupts Drugi', 88, CAST(N'2019-12-10' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (123, N'Projekt Medutech Drugi', 89, CAST(N'2010-01-01' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (124, N'Projekt Blickboird Drugi', 90, CAST(N'2010-01-31' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (125, N'Projekt Imizoncom Drugi', 91, CAST(N'2010-03-02' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (126, N'Projekt Pegisystems Drugi', 93, CAST(N'2010-04-01' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (127, N'Projekt Netsaute Drugi', 94, CAST(N'2010-05-01' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (128, N'Projekt Mucrostritegy Drugi', 95, CAST(N'2010-05-31' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (129, N'Projekt Eset Drugi', 96, CAST(N'2010-06-30' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (130, N'Projekt Solirwunds Drugi', 98, CAST(N'2010-07-30' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (131, N'Projekt Mucrosoft Prvi iza drugog', 1, CAST(N'2010-08-29' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (132, N'Projekt Oricle Prvi iza drugog', 2, CAST(N'2010-09-28' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (133, N'Projekt Ubm Prvi iza drugog', 3, CAST(N'2010-10-28' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (134, N'Projekt Sip Prvi iza drugog', 4, CAST(N'2010-11-27' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (135, N'Projekt Symintec Prvi iza drugog', 5, CAST(N'2010-12-27' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (136, N'Projekt Emc Prvi iza drugog', 6, CAST(N'2011-01-26' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (137, N'Projekt Vmwire Prvi iza drugog', 7, CAST(N'2011-02-25' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (138, N'Projekt Silesforcecom Prvi iza drugog', 9, CAST(N'2011-03-27' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (139, N'Projekt Untaut Prvi iza drugog', 10, CAST(N'2011-04-26' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (140, N'Projekt Idobe Prvi iza drugog', 11, CAST(N'2011-05-26' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (141, N'Projekt Sis Prvi iza drugog', 13, CAST(N'2011-06-25' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (142, N'Projekt Cusco Prvi iza drugog', 14, CAST(N'2011-07-25' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (143, N'Projekt Suemens Prvi iza drugog', 16, CAST(N'2011-08-24' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (144, N'Projekt Fajutsa Prvi iza drugog', 17, CAST(N'2011-09-23' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (145, N'Projekt Iatodesk Prvi iza drugog', 18, CAST(N'2011-10-23' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (146, N'Projekt Cutrux Prvi iza drugog', 19, CAST(N'2011-11-22' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (147, N'Projekt Hutichu Prvi iza drugog', 21, CAST(N'2011-12-22' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (148, N'Projekt Ipple Prvi iza drugog', 22, CAST(N'2012-01-21' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (149, N'Projekt Unfor Prvi iza drugog', 23, CAST(N'2012-02-20' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (150, N'Projekt Untel Prvi iza drugog', 25, CAST(N'2012-03-21' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (151, N'Projekt Sige Prvi iza drugog', 27, CAST(N'2012-04-20' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (152, N'Projekt Idp Prvi iza drugog', 28, CAST(N'2012-05-20' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (153, N'Projekt Opentext Prvi iza drugog', 31, CAST(N'2012-06-19' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (154, N'Projekt Sangird Prvi iza drugog', 32, CAST(N'2012-07-19' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (155, N'Projekt Nec Prvi iza drugog', 33, CAST(N'2012-08-18' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (156, N'Projekt Hexigon Prvi iza drugog', 35, CAST(N'2012-09-17' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (157, N'Projekt Teriditi Prvi iza drugog', 37, CAST(N'2012-10-17' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (158, N'Projekt Netipp Prvi iza drugog', 38, CAST(N'2012-11-16' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (159, N'Projekt Mckesson Prvi iza drugog', 42, CAST(N'2012-12-16' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (160, N'Projekt Ptc Prvi iza drugog', 44, CAST(N'2013-01-15' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (161, N'Projekt Ditev Prvi iza drugog', 47, CAST(N'2013-02-14' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (162, N'Projekt Esru Prvi iza drugog', 48, CAST(N'2013-03-16' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (163, N'Projekt Cerner Prvi iza drugog', 49, CAST(N'2013-04-15' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (164, N'Projekt Insys Prvi iza drugog', 50, CAST(N'2013-05-15' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (165, N'Projekt Unformituci Prvi iza drugog', 51, CAST(N'2013-06-14' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (166, N'Projekt Tubco Prvi iza drugog', 52, CAST(N'2013-07-14' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (167, N'Projekt Optam Prvi iza drugog', 54, CAST(N'2013-08-13' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (168, N'Projekt Fuserv Prvi iza drugog', 56, CAST(N'2013-09-12' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (169, N'Projekt Iviyi Prvi iza drugog', 57, CAST(N'2013-10-12' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (170, N'Projekt Kronos Prvi iza drugog', 58, CAST(N'2013-11-11' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (171, N'Projekt Itheniheilth Prvi iza drugog', 64, CAST(N'2013-12-11' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (172, N'Projekt Fuco Prvi iza drugog', 67, CAST(N'2014-01-10' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (173, N'Projekt Fus Prvi iza drugog', 68, CAST(N'2014-02-09' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (174, N'Projekt Musys Prvi iza drugog', 69, CAST(N'2014-03-11' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (175, N'Projekt Swuft Prvi iza drugog', 71, CAST(N'2014-04-10' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (176, N'Projekt Workdiy Prvi iza drugog', 72, CAST(N'2014-05-10' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (177, N'Projekt Totvs Prvi iza drugog', 74, CAST(N'2014-06-09' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (178, N'Projekt Servucenow Prvi iza drugog', 76, CAST(N'2014-07-09' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (179, N'Projekt Commvialt Prvi iza drugog', 77, CAST(N'2014-08-08' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (180, N'Projekt Convergys Prvi iza drugog', 79, CAST(N'2014-09-07' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (181, N'Projekt Neasoft Prvi iza drugog', 80, CAST(N'2014-10-07' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (182, N'Projekt Vusmi Prvi iza drugog', 81, CAST(N'2014-11-06' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (183, N'Projekt Qluk Prvi iza drugog', 82, CAST(N'2014-12-06' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (184, N'Projekt Untersystems Prvi iza drugog', 85, CAST(N'2015-01-05' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (185, N'Projekt Pilintur Prvi iza drugog', 86, CAST(N'2015-02-04' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (186, N'Projekt Anuto Prvi iza drugog', 87, CAST(N'2015-03-06' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (187, N'Projekt Illscrupts Prvi iza drugog', 88, CAST(N'2015-04-05' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (188, N'Projekt Medutech Prvi iza drugog', 89, CAST(N'2015-05-05' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (189, N'Projekt Blickboird Prvi iza drugog', 90, CAST(N'2015-06-04' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (190, N'Projekt Imizoncom Prvi iza drugog', 91, CAST(N'2015-07-04' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (191, N'Projekt Pegisystems Prvi iza drugog', 93, CAST(N'2015-08-03' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (192, N'Projekt Netsaute Prvi iza drugog', 94, CAST(N'2015-09-02' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (193, N'Projekt Mucrostritegy Prvi iza drugog', 95, CAST(N'2015-10-02' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (194, N'Projekt Eset Prvi iza drugog', 96, CAST(N'2015-11-01' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (195, N'Projekt Solirwunds Prvi iza drugog', 98, CAST(N'2015-12-01' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (196, N'Projekt Mucrosoft Treći iza prvog', 1, CAST(N'2015-12-31' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (197, N'Projekt Oricle Treći iza prvog', 2, CAST(N'2016-01-30' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (198, N'Projekt Ubm Treći iza prvog', 3, CAST(N'2016-02-29' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (199, N'Projekt Sip Treći iza prvog', 4, CAST(N'2016-03-30' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (200, N'Projekt Symintec Treći iza prvog', 5, CAST(N'2016-04-29' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (201, N'Projekt Emc Treći iza prvog', 6, CAST(N'2016-05-29' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (202, N'Projekt Vmwire Treći iza prvog', 7, CAST(N'2016-06-28' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (203, N'Projekt Silesforcecom Treći iza prvog', 9, CAST(N'2016-07-28' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (204, N'Projekt Untaut Treći iza prvog', 10, CAST(N'2016-08-27' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (205, N'Projekt Idobe Treći iza prvog', 11, CAST(N'2016-09-26' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (206, N'Projekt Sis Treći iza prvog', 13, CAST(N'2016-10-26' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (207, N'Projekt Cusco Treći iza prvog', 14, CAST(N'2016-11-25' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (208, N'Projekt Suemens Treći iza prvog', 16, CAST(N'2016-12-25' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (209, N'Projekt Fajutsa Treći iza prvog', 17, CAST(N'2017-01-24' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (210, N'Projekt Iatodesk Treći iza prvog', 18, CAST(N'2017-02-23' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (211, N'Projekt Cutrux Treći iza prvog', 19, CAST(N'2017-03-25' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (212, N'Projekt Hutichu Treći iza prvog', 21, CAST(N'2017-04-24' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (213, N'Projekt Ipple Treći iza prvog', 22, CAST(N'2017-05-24' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (214, N'Projekt Unfor Treći iza prvog', 23, CAST(N'2017-06-23' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (215, N'Projekt Untel Treći iza prvog', 25, CAST(N'2017-07-23' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (216, N'Projekt Sige Treći iza prvog', 27, CAST(N'2017-08-22' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (217, N'Projekt Idp Treći iza prvog', 28, CAST(N'2017-09-21' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (218, N'Projekt Opentext Treći iza prvog', 31, CAST(N'2017-10-21' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (219, N'Projekt Sangird Treći iza prvog', 32, CAST(N'2017-11-20' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (220, N'Projekt Nec Treći iza prvog', 33, CAST(N'2017-12-20' AS Date), 91)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (221, N'Projekt Hexigon Treći iza prvog', 35, CAST(N'2018-01-19' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (222, N'Projekt Teriditi Treći iza prvog', 37, CAST(N'2018-02-18' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (223, N'Projekt Netipp Treći iza prvog', 38, CAST(N'2018-03-20' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (224, N'Projekt Mckesson Treći iza prvog', 42, CAST(N'2018-04-19' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (225, N'Projekt Ptc Treći iza prvog', 44, CAST(N'2018-05-19' AS Date), 161)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (226, N'Projekt Ditev Treći iza prvog', 47, CAST(N'2018-06-18' AS Date), 181)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (227, N'Projekt Esru Treći iza prvog', 48, CAST(N'2018-07-18' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (228, N'Projekt Cerner Treći iza prvog', 49, CAST(N'2018-08-17' AS Date), 171)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (229, N'Projekt Insys Treći iza prvog', 50, CAST(N'2018-09-16' AS Date), 111)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (230, N'Projekt Unformituci Treći iza prvog', 51, CAST(N'2018-10-16' AS Date), 21)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (231, N'Projekt Tubco Treći iza prvog', 52, CAST(N'2018-11-15' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (232, N'Projekt Optam Treći iza prvog', 54, CAST(N'2018-12-15' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (233, N'Projekt Fuserv Treći iza prvog', 56, CAST(N'2019-01-14' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (234, N'Projekt Iviyi Treći iza prvog', 57, CAST(N'2019-02-13' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (235, N'Projekt Kronos Treći iza prvog', 58, CAST(N'2019-03-15' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (236, N'Projekt Itheniheilth Treći iza prvog', 64, CAST(N'2019-04-14' AS Date), 81)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (237, N'Projekt Fuco Treći iza prvog', 67, CAST(N'2019-05-14' AS Date), 41)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (238, N'Projekt Fus Treći iza prvog', 68, CAST(N'2019-06-13' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (239, N'Projekt Musys Treći iza prvog', 69, CAST(N'2019-07-13' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (240, N'Projekt Swuft Treći iza prvog', 71, CAST(N'2019-08-12' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (241, N'Projekt Workdiy Treći iza prvog', 72, CAST(N'2019-09-11' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (242, N'Projekt Totvs Treći iza prvog', 74, CAST(N'2019-10-11' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (243, N'Projekt Servucenow Treći iza prvog', 76, CAST(N'2019-11-10' AS Date), 121)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (244, N'Projekt Commvialt Treći iza prvog', 77, CAST(N'2019-12-10' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (245, N'Projekt Convergys Treći iza prvog', 79, CAST(N'2010-01-01' AS Date), 101)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (246, N'Projekt Neasoft Treći iza prvog', 80, CAST(N'2010-01-31' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (247, N'Projekt Vusmi Treći iza prvog', 81, CAST(N'2010-03-02' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (248, N'Projekt Qluk Treći iza prvog', 82, CAST(N'2010-04-01' AS Date), 61)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (249, N'Projekt Untersystems Treći iza prvog', 85, CAST(N'2010-05-01' AS Date), 31)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (250, N'Projekt Pilintur Treći iza prvog', 86, CAST(N'2010-05-31' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (251, N'Projekt Anuto Treći iza prvog', 87, CAST(N'2010-06-30' AS Date), 191)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (252, N'Projekt Illscrupts Treći iza prvog', 88, CAST(N'2010-07-30' AS Date), 71)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (253, N'Projekt Medutech Treći iza prvog', 89, CAST(N'2010-08-29' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (254, N'Projekt Blickboird Treći iza prvog', 90, CAST(N'2010-09-28' AS Date), 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (255, N'Projekt Imizoncom Treći iza prvog', 91, CAST(N'2010-10-28' AS Date), 51)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (256, N'Projekt Pegisystems Treći iza prvog', 93, CAST(N'2010-11-27' AS Date), 11)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (257, N'Projekt Netsaute Treći iza prvog', 94, CAST(N'2010-12-27' AS Date), 141)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (258, N'Projekt Mucrostritegy Treći iza prvog', 95, CAST(N'2011-01-26' AS Date), 151)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (259, N'Projekt Eset Treći iza prvog', 96, CAST(N'2011-02-25' AS Date), 131)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [KlijentID], [DatumOtvaranja], [VoditeljProjektaID]) VALUES (260, N'Projekt Solirwunds Treći iza prvog', 98, CAST(N'2011-03-27' AS Date), 71)
GO

Set identity_insert Projekt off

Set identity_insert ProjektDjelatnik on

GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (1, 1, 2)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (2, 2, 2)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (3, 2, 3)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (4, 3, 3)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (5, 3, 4)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (6, 4, 4)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (7, 5, 4)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (8, 5, 5)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (9, 6, 5)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (10, 6, 6)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (11, 7, 6)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (12, 8, 6)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (13, 8, 7)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (14, 9, 7)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (15, 9, 8)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (16, 10, 8)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (17, 11, 8)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (18, 11, 9)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (19, 12, 9)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (20, 12, 10)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (21, 13, 10)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (22, 14, 10)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (23, 14, 12)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (24, 15, 12)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (25, 15, 13)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (26, 16, 13)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (27, 16, 14)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (28, 17, 14)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (29, 18, 14)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (30, 18, 15)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (31, 19, 15)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (32, 19, 16)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (33, 20, 16)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (34, 21, 16)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (35, 21, 17)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (36, 22, 17)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (37, 22, 18)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (38, 23, 18)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (39, 24, 18)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (40, 24, 19)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (41, 25, 19)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (42, 25, 20)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (43, 26, 20)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (44, 27, 20)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (45, 27, 22)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (46, 28, 22)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (47, 28, 23)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (48, 29, 23)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (49, 30, 23)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (50, 30, 24)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (51, 31, 24)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (52, 31, 25)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (53, 32, 25)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (54, 32, 26)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (55, 33, 26)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (56, 34, 26)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (57, 34, 27)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (58, 35, 27)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (59, 35, 28)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (60, 36, 28)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (61, 37, 28)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (62, 37, 29)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (63, 38, 29)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (64, 38, 30)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (65, 39, 30)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (66, 40, 30)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (67, 40, 32)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (68, 41, 32)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (69, 41, 33)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (70, 42, 33)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (71, 43, 33)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (72, 43, 34)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (73, 44, 34)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (74, 44, 35)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (75, 45, 35)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (76, 46, 35)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (77, 46, 36)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (78, 47, 36)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (79, 47, 37)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (80, 48, 37)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (81, 48, 38)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (82, 49, 38)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (83, 50, 38)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (84, 50, 39)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (85, 51, 39)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (86, 51, 40)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (87, 52, 40)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (88, 53, 40)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (89, 53, 42)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (90, 54, 42)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (91, 54, 43)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (92, 55, 43)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (93, 56, 43)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (94, 56, 44)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (95, 57, 44)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (96, 57, 45)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (97, 58, 45)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (98, 59, 45)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (99, 59, 46)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (100, 60, 46)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (101, 60, 47)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (102, 61, 47)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (103, 62, 47)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (104, 62, 48)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (105, 63, 48)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (106, 63, 49)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (107, 64, 49)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (108, 64, 50)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (109, 65, 50)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (110, 66, 50)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (111, 66, 52)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (112, 67, 52)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (113, 67, 53)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (114, 68, 53)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (115, 69, 53)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (116, 69, 54)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (117, 70, 54)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (118, 70, 55)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (119, 71, 55)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (120, 72, 55)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (121, 72, 56)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (122, 73, 56)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (123, 73, 57)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (124, 74, 57)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (125, 75, 57)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (126, 75, 58)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (127, 76, 58)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (128, 76, 59)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (129, 77, 59)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (130, 77, 60)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (131, 78, 60)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (132, 79, 60)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (133, 79, 62)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (134, 80, 62)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (135, 80, 63)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (136, 81, 63)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (137, 82, 63)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (138, 82, 64)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (139, 83, 64)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (140, 83, 65)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (141, 84, 65)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (142, 85, 65)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (143, 85, 66)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (144, 86, 66)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (145, 86, 67)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (146, 87, 67)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (147, 88, 67)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (148, 88, 68)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (149, 89, 68)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (150, 89, 69)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (151, 90, 69)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (152, 91, 69)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (153, 91, 70)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (154, 92, 70)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (155, 92, 72)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (156, 93, 72)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (157, 93, 73)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (158, 94, 73)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (159, 95, 73)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (160, 95, 74)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (161, 96, 74)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (162, 96, 75)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (163, 97, 75)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (164, 98, 75)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (165, 98, 76)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (166, 99, 76)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (167, 99, 77)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (168, 100, 77)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (169, 101, 77)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (170, 101, 78)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (171, 102, 78)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (172, 102, 79)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (173, 103, 79)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (174, 104, 79)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (175, 104, 80)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (176, 105, 80)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (177, 105, 82)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (178, 106, 82)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (179, 107, 82)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (180, 107, 83)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (181, 108, 83)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (182, 108, 84)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (183, 109, 84)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (184, 109, 85)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (185, 110, 85)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (186, 111, 85)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (187, 111, 86)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (188, 112, 86)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (189, 112, 87)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (190, 113, 87)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (191, 114, 87)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (192, 114, 88)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (193, 115, 88)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (194, 115, 89)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (195, 116, 89)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (196, 117, 89)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (197, 117, 90)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (198, 118, 90)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (199, 118, 92)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (200, 119, 92)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (201, 120, 92)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (202, 120, 93)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (203, 121, 93)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (204, 121, 94)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (205, 122, 94)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (206, 123, 94)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (207, 123, 95)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (208, 124, 95)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (209, 124, 96)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (210, 125, 96)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (211, 125, 97)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (212, 126, 97)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (213, 127, 97)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (214, 127, 98)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (215, 128, 98)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (216, 128, 99)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (217, 129, 99)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (218, 130, 99)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (219, 130, 100)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (220, 131, 100)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (221, 131, 102)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (222, 132, 102)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (223, 133, 102)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (224, 133, 103)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (225, 134, 103)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (226, 134, 104)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (227, 135, 104)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (228, 136, 104)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (229, 136, 105)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (230, 137, 105)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (231, 137, 106)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (232, 138, 106)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (233, 138, 107)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (234, 139, 107)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (235, 140, 107)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (236, 140, 108)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (237, 141, 108)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (238, 141, 109)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (239, 142, 109)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (240, 143, 109)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (241, 143, 110)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (242, 144, 110)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (243, 144, 112)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (244, 145, 112)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (245, 146, 112)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (246, 146, 113)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (247, 147, 113)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (248, 147, 114)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (249, 148, 114)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (250, 149, 114)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (251, 149, 115)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (252, 150, 115)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (253, 150, 116)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (254, 151, 116)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (255, 152, 116)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (256, 152, 117)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (257, 153, 117)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (258, 153, 118)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (259, 154, 118)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (260, 154, 119)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (261, 155, 119)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (262, 156, 119)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (263, 156, 120)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (264, 157, 120)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (265, 157, 122)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (266, 158, 122)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (267, 159, 122)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (268, 159, 123)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (269, 160, 123)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (270, 160, 124)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (271, 161, 124)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (272, 162, 124)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (273, 162, 125)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (274, 163, 125)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (275, 163, 126)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (276, 164, 126)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (277, 165, 126)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (278, 165, 127)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (279, 166, 127)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (280, 166, 128)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (281, 167, 128)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (282, 168, 128)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (283, 168, 129)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (284, 169, 129)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (285, 169, 130)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (286, 170, 130)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (287, 170, 132)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (288, 171, 132)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (289, 172, 132)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (290, 172, 133)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (291, 173, 133)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (292, 173, 134)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (293, 174, 134)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (294, 175, 134)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (295, 175, 135)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (296, 176, 135)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (297, 176, 136)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (298, 177, 136)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (299, 178, 136)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (300, 178, 137)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (301, 179, 137)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (302, 179, 138)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (303, 180, 138)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (304, 181, 138)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (305, 181, 139)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (306, 182, 139)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (307, 182, 140)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (308, 183, 140)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (309, 184, 140)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (310, 184, 142)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (311, 185, 142)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (312, 185, 143)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (313, 186, 143)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (314, 186, 144)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (315, 187, 144)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (316, 188, 144)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (317, 188, 145)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (318, 189, 145)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (319, 189, 146)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (320, 190, 146)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (321, 191, 146)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (322, 191, 147)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (323, 192, 147)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (324, 192, 148)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (325, 193, 148)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (326, 194, 148)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (327, 194, 149)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (328, 195, 149)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (329, 195, 150)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (330, 196, 150)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (331, 197, 150)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (332, 197, 152)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (333, 198, 152)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (334, 198, 153)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (335, 199, 153)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (336, 199, 154)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (337, 200, 154)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (338, 201, 154)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (339, 201, 155)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (340, 202, 155)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (341, 202, 156)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (342, 203, 156)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (343, 204, 156)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (344, 204, 157)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (345, 205, 157)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (346, 205, 158)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (347, 206, 158)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (348, 207, 158)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (349, 207, 159)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (350, 208, 159)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (351, 208, 160)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (352, 209, 160)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (353, 210, 160)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (354, 210, 162)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (355, 211, 162)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (356, 211, 163)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (357, 212, 163)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (358, 213, 163)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (359, 213, 164)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (360, 214, 164)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (361, 214, 165)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (362, 215, 165)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (363, 215, 166)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (364, 216, 166)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (365, 217, 166)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (366, 217, 167)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (367, 218, 167)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (368, 218, 168)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (369, 219, 168)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (370, 220, 168)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (371, 220, 169)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (372, 221, 169)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (373, 221, 170)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (374, 222, 170)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (375, 223, 170)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (376, 223, 172)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (377, 224, 172)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (378, 224, 173)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (379, 225, 173)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (380, 226, 173)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (381, 226, 174)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (382, 227, 174)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (383, 227, 175)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (384, 228, 175)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (385, 229, 175)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (386, 229, 176)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (387, 230, 176)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (388, 230, 177)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (389, 231, 177)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (390, 231, 178)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (391, 232, 178)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (392, 233, 178)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (393, 233, 179)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (394, 234, 179)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (395, 234, 180)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (396, 235, 180)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (397, 236, 180)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (398, 236, 182)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (399, 237, 182)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (400, 237, 183)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (401, 238, 183)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (402, 239, 183)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (403, 239, 184)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (404, 240, 184)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (405, 240, 185)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (406, 241, 185)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (407, 242, 185)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (408, 242, 186)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (409, 243, 186)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (410, 243, 187)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (411, 244, 187)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (412, 245, 187)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (413, 245, 188)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (414, 246, 188)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (415, 246, 189)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (416, 247, 189)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (417, 247, 190)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (418, 248, 190)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (419, 249, 190)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (420, 249, 192)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (421, 250, 192)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (422, 250, 193)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (423, 251, 193)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (424, 252, 193)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (425, 252, 194)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (426, 253, 194)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (427, 253, 195)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (428, 254, 195)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (429, 255, 195)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (430, 255, 196)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (431, 256, 196)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (432, 256, 197)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (433, 257, 197)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (434, 258, 197)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (435, 258, 198)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (436, 259, 198)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (437, 259, 199)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (438, 260, 199)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (439, 1, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (440, 2, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (441, 3, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (442, 4, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (443, 5, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (444, 6, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (445, 7, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (446, 8, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (447, 9, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (448, 10, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (449, 11, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (450, 12, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (451, 13, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (452, 14, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (453, 15, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (454, 16, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (455, 17, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (456, 18, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (457, 19, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (458, 20, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (459, 21, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (460, 22, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (461, 23, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (462, 24, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (463, 25, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (464, 26, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (465, 27, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (466, 28, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (467, 29, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (468, 30, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (469, 31, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (470, 32, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (471, 33, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (472, 34, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (473, 35, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (474, 36, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (475, 37, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (476, 38, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (477, 39, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (478, 40, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (479, 41, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (480, 42, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (481, 43, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (482, 44, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (483, 45, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (484, 46, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (485, 47, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (486, 48, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (487, 49, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (488, 50, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (489, 51, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (490, 52, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (491, 53, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (492, 54, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (493, 55, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (494, 56, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (495, 57, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (496, 58, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (497, 59, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (498, 60, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (499, 61, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (500, 62, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (501, 63, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (502, 64, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (503, 65, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (504, 66, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (505, 67, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (506, 68, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (507, 69, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (508, 70, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (509, 71, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (510, 72, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (511, 73, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (512, 74, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (513, 75, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (514, 76, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (515, 77, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (516, 78, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (517, 79, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (518, 80, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (519, 81, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (520, 82, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (521, 83, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (522, 84, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (523, 85, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (524, 86, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (525, 87, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (526, 88, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (527, 89, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (528, 90, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (529, 91, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (530, 92, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (531, 93, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (532, 94, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (533, 95, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (534, 96, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (535, 97, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (536, 98, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (537, 99, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (538, 100, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (539, 101, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (540, 102, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (541, 103, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (542, 104, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (543, 105, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (544, 106, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (545, 107, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (546, 108, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (547, 109, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (548, 110, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (549, 111, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (550, 112, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (551, 113, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (552, 114, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (553, 115, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (554, 116, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (555, 117, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (556, 118, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (557, 119, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (558, 120, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (559, 121, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (560, 122, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (561, 123, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (562, 124, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (563, 125, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (564, 126, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (565, 127, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (566, 128, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (567, 129, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (568, 130, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (569, 131, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (570, 132, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (571, 133, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (572, 134, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (573, 135, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (574, 136, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (575, 137, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (576, 138, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (577, 139, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (578, 140, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (579, 141, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (580, 142, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (581, 143, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (582, 144, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (583, 145, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (584, 146, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (585, 147, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (586, 148, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (587, 149, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (588, 150, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (589, 151, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (590, 152, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (591, 153, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (592, 154, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (593, 155, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (594, 156, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (595, 157, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (596, 158, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (597, 159, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (598, 160, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (599, 161, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (600, 162, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (601, 163, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (602, 164, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (603, 165, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (604, 166, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (605, 167, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (606, 168, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (607, 169, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (608, 170, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (609, 171, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (610, 172, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (611, 173, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (612, 174, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (613, 175, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (614, 176, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (615, 177, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (616, 178, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (617, 179, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (618, 180, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (619, 181, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (620, 182, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (621, 183, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (622, 184, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (623, 185, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (624, 186, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (625, 187, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (626, 188, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (627, 189, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (628, 190, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (629, 191, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (630, 192, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (631, 193, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (632, 194, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (633, 195, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (634, 196, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (635, 197, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (636, 198, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (637, 199, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (638, 200, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (639, 201, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (640, 202, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (641, 203, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (642, 204, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (643, 205, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (644, 206, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (645, 207, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (646, 208, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (647, 209, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (648, 210, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (649, 211, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (650, 212, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (651, 213, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (652, 214, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (653, 215, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (654, 216, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (655, 217, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (656, 218, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (657, 219, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (658, 220, 91)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (659, 221, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (660, 222, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (661, 223, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (662, 224, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (663, 225, 161)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (664, 226, 181)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (665, 227, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (666, 228, 171)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (667, 229, 111)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (668, 230, 21)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (669, 231, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (670, 232, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (671, 233, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (672, 234, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (673, 235, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (674, 236, 81)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (675, 237, 41)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (676, 238, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (677, 239, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (678, 240, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (679, 241, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (680, 242, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (681, 243, 121)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (682, 244, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (683, 245, 101)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (684, 246, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (685, 247, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (686, 248, 61)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (687, 249, 31)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (688, 250, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (689, 251, 191)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (690, 252, 71)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (691, 253, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (692, 254, 1)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (693, 255, 51)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (694, 256, 11)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (695, 257, 141)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (696, 258, 151)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (697, 259, 131)
GO
INSERT [dbo].[ProjektDjelatnik] ([IDProjektDjelatnik], [ProjektID], [DjelatnikID]) VALUES (698, 260, 71)
GO

Set identity_insert ProjektDjelatnik off
Set identity_insert Tim on

GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (1, N'Tim Bube Ingenii', CAST(N'2016-04-02' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (2, N'Tim Čelični Ingenii', CAST(N'2012-06-20' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (3, N'Tim Duh Ingenii', CAST(N'2012-03-17' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (4, N'Tim Dijamantni Ingenii', CAST(N'2012-06-22' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (5, N'Tim Električni Ingenii', CAST(N'2013-12-12' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (6, N'Tim Kameni Ingenii', CAST(N'2017-12-03' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (7, N'Tim Ledeni Ingenii', CAST(N'2010-06-04' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (8, N'Tim Legendarni Ingenii', CAST(N'2013-06-13' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (9, N'Tim Leteći Ingenii', CAST(N'2019-09-09' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (10, N'Tim Mračni Ingenii', CAST(N'2014-02-27' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (11, N'Tim Normalni Ingenii', CAST(N'2014-02-19' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (12, N'Tim Otrovni Ingenii', CAST(N'2018-05-09' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (13, N'Tim Početni Ingenii', CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (14, N'Tim Završni Ingenii', CAST(N'2014-10-04' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (15, N'Tim Travnati Ingenii', CAST(N'2014-09-02' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (16, N'Tim Vatreni Ingenii', CAST(N'2013-03-04' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (17, N'Tim Vodeni Ingenii', CAST(N'2014-12-09' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (18, N'Tim Zemljani Ingenii', CAST(N'2017-07-12' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (19, N'Tim Zmaj Ingenii', CAST(N'2016-02-13' AS Date))
GO
INSERT [dbo].[Tim] ([IDTim], [Naziv], [DatumKreiranja]) VALUES (20, N'Tim Svemir Ingenii', CAST(N'2010-10-20' AS Date))
GO

Set identity_insert Tim off

GO
INSERT [dbo].[TipDjelatnika] ([IDTipDjelatnika], [Naziv]) VALUES (1, N'Direktor')
GO
INSERT [dbo].[TipDjelatnika] ([IDTipDjelatnika], [Naziv]) VALUES (2, N'Voditelj tima')
GO
INSERT [dbo].[TipDjelatnika] ([IDTipDjelatnika], [Naziv]) VALUES (3, N'Zaposlenik')
GO
INSERT [dbo].[TipDjelatnika] ([IDTipDjelatnika], [Naziv]) VALUES (4, N'Honorarni djelatnik')
GO
INSERT [dbo].[TipDjelatnika] ([IDTipDjelatnika], [Naziv]) VALUES (5, N'Student')
GO
ALTER TABLE [dbo].[Djelatnik]  WITH CHECK ADD FOREIGN KEY([TimID])
REFERENCES [dbo].[Tim] ([IDTim])
GO
ALTER TABLE [dbo].[Djelatnik]  WITH CHECK ADD FOREIGN KEY([TipDjelatnikaID])
REFERENCES [dbo].[TipDjelatnika] ([IDTipDjelatnika])
GO
ALTER TABLE [dbo].[Projekt]  WITH CHECK ADD FOREIGN KEY([KlijentID])
REFERENCES [dbo].[Klijent] ([IDKlijent])
GO
ALTER TABLE [dbo].[Projekt]  WITH CHECK ADD FOREIGN KEY([VoditeljProjektaID])
REFERENCES [dbo].[Djelatnik] ([IDDjelatnik])
GO
ALTER TABLE [dbo].[ProjektDjelatnik]  WITH CHECK ADD FOREIGN KEY([DjelatnikID])
REFERENCES [dbo].[Djelatnik] ([IDDjelatnik])
GO
ALTER TABLE [dbo].[ProjektDjelatnik]  WITH CHECK ADD FOREIGN KEY([ProjektID])
REFERENCES [dbo].[Projekt] ([IDProjekt])
GO
ALTER TABLE [dbo].[Satnica]  WITH CHECK ADD FOREIGN KEY([DjelatnikID])
REFERENCES [dbo].[Djelatnik] ([IDDjelatnik])
GO
ALTER TABLE [dbo].[Satnica]  WITH CHECK ADD FOREIGN KEY([VoditeljTimaID])
REFERENCES [dbo].[Djelatnik] ([IDDjelatnik])
GO
ALTER TABLE [dbo].[SatnicaPoProjektu]  WITH CHECK ADD FOREIGN KEY([ProjetID])
REFERENCES [dbo].[Projekt] ([IDProjekt])
GO
ALTER TABLE [dbo].[SatnicaPoProjektu]  WITH CHECK ADD FOREIGN KEY([SatnicaID])
REFERENCES [dbo].[Satnica] ([IDSatnica])
GO

UPDATE Djelatnik set JeAktivan = 1
UPDATE Tim set JeAktivan = 1
UPDATE Klijent set JeAktivan = 1
UPDATE Projekt set JeAktivan = 1

GO

CREATE PROC GetDjelatnikByEmailAndPassword
	@Email nvarchar(100),
	@Pass nvarchar(100)
AS
BEGIN
	SELECT * FROM Djelatnik WHERE Email = @Email AND Zaporka = @Pass
END

GO

CREATE PROC GetDjelatnici
AS
BEGIN
	SELECT * FROM Djelatnik
END

GO

CREATE PROC GetTipDjelatnika
	@IDTipDjelatnika int
AS
BEGIN
	SELECT * FROM TipDjelatnika WHERE IDTipDjelatnika = @IDTipDjelatnika
END

GO

CREATE PROC GetTim
	@IDTim int
AS
BEGIN
	SELECT * FROM Tim WHERE IDTim = @IDTim
END

GO

CREATE PROC GetTipoviDjelatnika
AS
BEGIN
	SELECT * FROM TipDjelatnika
END

GO

CREATE PROC GetTimovi
AS
BEGIN
	SELECT * FROM Tim
END

GO

CREATE PROC UpdateDjelatnik
	@IDDjelatnik int,
	@Ime nvarchar(max),
	@Prezime nvarchar(max),
	@Email nvarchar(max),
	@TipDjelatnikaID int,
	@TimID int
AS
BEGIN
	Update Djelatnik
	set Ime = @Ime,
	Prezime = @Prezime,
	Email = @Email,
	TipDjelatnikaID = @TipDjelatnikaID,
	TimID = @TimID
	WHERE IDDjelatnik = @IDDjelatnik
END

GO

CREATE PROC InsertDjelatnik
	@Ime nvarchar(max),
	@Prezime nvarchar(max),
	@Email nvarchar(max),
	@DatumZaposljenja datetime2,
	@Zaporka nvarchar(max),
	@TipDjelatnikaID int,
	@TimID int
AS
BEGIN
	INSERT INTO Djelatnik VALUES (@Ime, @Prezime, @Email, @DatumZaposljenja, @Zaporka, 1, @TipDjelatnikaID, @TimID)
END

GO

CREATE PROC DeactivateDjelatnik
	@IDDJelatnik int
AS
BEGIN
	UPDATE Djelatnik set JeAktivan = 0 WHERE IDDjelatnik = @IDDJelatnik
END

GO

CREATE PROC ActivateDjelatnik
	@IDDjelatnik int
AS
BEGIN
	UPDATE Djelatnik set JeAktivan = 1 WHERE IDDjelatnik = @IDDjelatnik
END

GO

CREATE PROC InsertTim
	@Naziv nvarchar(50),
	@DatumKreiranja date 
AS
BEGIN
	INSERT INTO Tim VALUES(@Naziv, @DatumKreiranja, 1)
END

GO

CREATE PROC UpdateTim
	@IDTim int,
	@Naziv nvarchar(50)
AS
BEGIN
	Update Tim set Naziv = @Naziv WHERE IDTim = @IDTim
END

GO

CREATE PROC DeactivateTim
	@IDTim int
AS
BEGIN
	UPDATE Tim set JeAktivan = 0 WHERE IDTim = @IDTim
END

GO

CREATE PROC ActivateTim
	@IDTim int
AS
BEGIN
	UPDATE Tim set JeAktivan = 1 WHERE IDTim = @IDTim
END

GO

CREATE PROC GetProjekti
AS
BEGIN
	SELECT * FROM Projekt
END

GO

CREATE PROC GetKlijent
	@IDKlijent int
AS
BEGIN
	SELECT * FROM Klijent WHERE IDKlijent = @IDKlijent
END

GO

CREATE PROC GetKlijenti
AS
BEGIN
	SELECT * FROM Klijent
END


GO

CREATE PROC GetDjelatnik
	@IDDjelatnik int
AS
BEGIN
	SELECT * FROM Djelatnik WHERE IDDjelatnik = @IDDjelatnik
END

GO

CREATE PROC UpdateProjekt
	@IDProjekt int,
	@Naziv nvarchar(100),
	@KlijentID int,
	@VoditeljID int
AS
BEGIN
	Update Projekt set Naziv = @Naziv, KlijentID = @KlijentID, VoditeljProjektaID = @VoditeljID WHERE IDProjekt = @IDProjekt
END

GO

CREATE PROC DeactivateProjekt
	@IDProjekt int
AS
BEGIN
	UPDATE Projekt set JeAktivan = 0 WHERE IDProjekt = @IDProjekt
END

GO

CREATE PROC ActivateProjekt
	@IDProjekt int
AS
BEGIN
	UPDATE Projekt set JeAktivan = 1 WHERE IDProjekt = @IDProjekt
END

GO

CREATE PROC InsertProjekt
	@Naziv nvarchar(50),
	@DatumKreiranja date,
	@KlijentID int, 
	@VoditeljID int
AS
BEGIN
	INSERT INTO Projekt VALUES(@Naziv, @KlijentID, @DatumKreiranja, 1, @VoditeljID)
END

GO

CREATE PROC UpdateKlijent
	@IDKlijent int,
	@Naziv nvarchar(100),
	@Telefon nvarchar(100),
	@Email nvarchar(100)
AS
BEGIN
	Update Klijent set Naziv = @Naziv, Telefon = @Telefon, Email = @Email WHERE IDKlijent = @IDKlijent
END

GO

CREATE PROC InsertKlijent
	@Naziv nvarchar(100),
	@Telefon nvarchar(100),
	@Email nvarchar(100)
AS
BEGIN
	Insert Klijent values(@Naziv, @Telefon, @Email, 1)
END

GO

CREATE PROC DeactivateKlijent
	@IDKlijent int
AS
BEGIN
	UPDATE Klijent set JeAktivan = 0 WHERE IDKlijent = @IDKlijent
END

GO

CREATE PROC ActivateKlijent
	@IDKlijent int
AS
BEGIN
	UPDATE Klijent set JeAktivan = 1 WHERE IDKlijent = @IDKlijent
END

GO

CREATE PROC GetProjektiDjelatnika
	@DjelatnikID int
AS
BEGIN
	SELECT p.* FROM Projekt as p
	inner join ProjektDjelatnik as pd
	on pd.ProjektID = p.IDProjekt
	inner join Djelatnik as d
	on d.IDDjelatnik = pd.DjelatnikID
	where d.IDDjelatnik = @DjelatnikID
END

GO

CREATE PROC UpdateZaporka
	@DjelatnikID int,
	@NovaZaporka nvarchar(50)
AS
BEGIN
	UPDATE Djelatnik
	SET Zaporka = @NovaZaporka
	WHERE IDDjelatnik = @DjelatnikID
END

GO

CREATE PROC GetSatnice
	@VoditeljTImaID int
AS
BEGIN
	SELECT * FROM Satnica
	WHERE VoditeljTimaID = @VoditeljTImaID
END

GO

CREATE PROC GetSatnica
	@SatnicaID int
AS
BEGIN
	SELECT * FROM Satnica WHERE IDSatnica = @SatnicaID
END

GO

CREATE PROC GetSatnicaPoDjelatnikuIDatumu
	@DjelatnikID int,
	@Datum date
AS
BEGIN
	SELECT * FROM Satnica
	WHERE DjelatnikID = @DjelatnikID AND Datum = @Datum
END

GO

CREATE PROC InsertSatnica
	@rSati nvarchar(50),
	@pSati nvarchar(50),
	@komentar nvarchar(max),
	@voditeljID int,
	@djelatnikID int,
	@datum Date,
	@Id int output
AS
BEGIN
	Insert into Satnica values(@datum, @rSati, @pSati, @komentar, 0, 0, 0, @voditeljID, @djelatnikID)
	set @Id = SCOPE_IDENTITY()
END

GO

CREATE PROC InsertSatnicaPoProjektu
	@rSati nvarchar(50),
	@pSati nvarchar(50),
	@projektID int,
	@satnicaID int
AS
BEGIN
	Insert into SatnicaPoProjektu values(@rSati, @pSati, @projektID, @satnicaID)
END

GO

CREATE PROC GetSatnicePoDjelatnikuIDatumu
	@DjelantnikId int,
	@Datum date
AS
BEGIN
	SELECT * FROM SatnicaPoProjektu as spp
	inner join Satnica as s
	on spp.SatnicaID = s.IDSatnica
	WHERE s.Datum = @Datum AND s.DjelatnikID = @DjelantnikId
END

GO

CREATE PROC UpdateSatnica
	@rSati nvarchar(50),
	@pSati nvarchar(50),
	@Komentar nvarchar(max),
	@SatnicaId int
AS
BEGIN
	UPDATE Satnica
	set RadniSati = @rSati,
	PrekovremeniSati = @pSati,
	Komentar = @Komentar
	WHERE IDSatnica = @SatnicaId
END

GO

CREATE PROC UpdateSatnicaPoProjektu
	@rSati nvarchar(50),
	@pSati nvarchar(50),
	@ProjektID int,
	@SatnicaID int
AS
BEGIN
	UPDATE SatnicaPoProjektu
	set RadniSati = @rSati,
	PrekovremeniSati = @pSati
	WHERE SatnicaID = @SatnicaID AND ProjetID = @ProjektID
END

GO

CREATE PROC GetSatniceProjekataPoSatnicaID
	@SatnicaID int
AS
BEGIN
	SELECT * FROM SatnicaPoProjektu
	WHERE SatnicaID = @SatnicaID
END

GO

CREATE PROC PredajSatnicu
	@SatnicaID int
AS
BEGIN
	UPDATE Satnica
	set JePoslano = 1
	WHERE IDSatnica = @SatnicaID
END

GO

CREATE PROC ClearSatnice
	@SatnicaID int
AS
BEGIN
	Delete from SatnicaPoProjektu
	WHERE SatnicaID = @SatnicaID
	Delete from Satnica
	WHERE IDSatnica = @SatnicaID
END

GO

CREATE PROC PotvrdiSatnice
	@SatnicaID int
AS
BEGIN
	UPDATE Satnica
	set JePotvreno = 1
	WHERE IDSatnica = @SatnicaID
END