USE [master]
GO
/****** Object:  Database [CS_CAR]    Script Date: 04/17/2018 6:37:12 PM ******/
CREATE DATABASE [CS_CAR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CS_CAR', FILENAME = N'D:\PLESKMSSQL\Data\CS_CAR.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CS_CAR_log', FILENAME = N'D:\PLESKMSSQL\Data\CS_CAR_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CS_CAR] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CS_CAR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CS_CAR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CS_CAR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CS_CAR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CS_CAR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CS_CAR] SET ARITHABORT OFF 
GO
ALTER DATABASE [CS_CAR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CS_CAR] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CS_CAR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CS_CAR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CS_CAR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CS_CAR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CS_CAR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CS_CAR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CS_CAR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CS_CAR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CS_CAR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CS_CAR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CS_CAR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CS_CAR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CS_CAR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CS_CAR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CS_CAR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CS_CAR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CS_CAR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CS_CAR] SET  MULTI_USER 
GO
ALTER DATABASE [CS_CAR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CS_CAR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CS_CAR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CS_CAR] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CS_CAR]
GO
/****** Object:  Table [dbo].[Area_Master]    Script Date: 04/17/2018 6:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area_Master](
	[PK_Area] [bigint] IDENTITY(1,1) NOT NULL,
	[Area_Name] [nvarchar](50) NOT NULL,
	[FK_CREATED_BY] [bigint] NOT NULL,
	[FK_MODIFIED_BY] [bigint] NOT NULL,
	[CREATED_DATE] [datetime] NOT NULL,
	[MODIFIED_DATE] [datetime] NOT NULL,
	[IS_DELETED] [bit] NOT NULL,
	[IS_ACTIVE] [bit] NOT NULL,
 CONSTRAINT [PK_Area_Master] PRIMARY KEY CLUSTERED 
(
	[PK_Area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMER_MASTER]    Script Date: 04/17/2018 6:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER_MASTER](
	[PK_CUSTOMERID] [bigint] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_NAME] [nvarchar](500) NOT NULL,
	[ADDRESS] [nvarchar](max) NULL,
	[FK_AREAID] [bigint] NOT NULL,
	[CITY] [nvarchar](50) NULL,
	[PINCODE] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[EMAIL] [nvarchar](500) NULL,
	[PHONE] [nvarchar](50) NULL,
	[MOBILE] [nvarchar](50) NULL,
	[BIRTHDAY_DATE] [date] NULL,
	[ANNIVERSARY_DATE] [date] NULL,
	[FK_CREATED_BY] [bigint] NULL,
	[FK_MODIFIED_BY] [bigint] NULL,
	[CREATED_DATE] [datetime] NOT NULL,
	[MODIFIED_DATE] [datetime] NOT NULL,
	[IS_DELETED] [bit] NOT NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[OTP] [nvarchar](50) NULL,
	[USERNAME] [nvarchar](50) NOT NULL,
	[PASSWORD] [nvarchar](50) NOT NULL,
	[IS_EMAIL_VERIFY] [bit] NOT NULL,
 CONSTRAINT [PK_CUSTOMER_MASTER] PRIMARY KEY CLUSTERED 
(
	[PK_CUSTOMERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback_Master]    Script Date: 04/17/2018 6:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback_Master](
	[PK_FeedBackID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_MechanicID] [bigint] NULL,
	[FK_CUSTOMERID] [bigint] NULL,
	[FeedBack_Subject] [nvarchar](200) NOT NULL,
	[FeedBack_Descriptions] [nvarchar](1000) NOT NULL,
	[FK_CREATED_BY] [bigint] NULL,
	[FK_MODIFIED_BY] [bigint] NULL,
	[CREATED_DATE] [datetime] NOT NULL,
	[MODIFIED_DATE] [datetime] NOT NULL,
	[IS_DELETED] [bit] NOT NULL,
	[IS_ACTIVE] [bit] NOT NULL,
 CONSTRAINT [PK_Feedback_Master] PRIMARY KEY CLUSTERED 
(
	[PK_FeedBackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MECHANIC_PAYMENTS]    Script Date: 04/17/2018 6:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MECHANIC_PAYMENTS](
	[PK_Mechnic_PAYMENTID] [bigint] NOT NULL,
	[FK_MechanicID] [bigint] NOT NULL,
	[RECEIPT_NUMBER] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MechanicProfile]    Script Date: 04/17/2018 6:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MechanicProfile](
	[PK_MechanicID] [bigint] IDENTITY(1,1) NOT NULL,
	[Mechanic_NAME] [nvarchar](50) NOT NULL,
	[USERNAME] [nvarchar](50) NOT NULL,
	[PASSWORD] [nvarchar](50) NOT NULL,
	[ADDRESS] [nvarchar](1000) NULL,
	[EMAIL] [nvarchar](500) NULL,
	[MOBILE] [nvarchar](50) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[M_Garage_NAME] [nvarchar](50) NULL,
	[Fk_Area] [bigint] NOT NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[NOTES] [nvarchar](max) NULL,
	[FK_CREATED_BY] [bigint] NULL,
	[FK_MODIFIED_BY] [bigint] NULL,
	[CREATED_DATE] [datetime] NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[IS_DELETED] [bit] NOT NULL,
	[OTP] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
 CONSTRAINT [PK_MechanicProfile] PRIMARY KEY CLUSTERED 
(
	[PK_MechanicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubArea_Master]    Script Date: 04/17/2018 6:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubArea_Master](
	[PK_SubArea] [bigint] NOT NULL,
	[SubArea_Name] [nvarchar](50) NOT NULL,
	[FK_CREATED_BY] [bigint] NOT NULL,
	[FK_MODIFIED_BY] [bigint] NOT NULL,
	[CREATED_DATE] [datetime] NOT NULL,
	[MODIFIED_DATE] [datetime] NOT NULL,
	[IS_DELETED] [bit] NOT NULL,
	[IS_ACTIVE] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USERS]    Script Date: 04/17/2018 6:37:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[PK_USERID] [bigint] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](500) NOT NULL,
	[USERNAME] [nvarchar](50) NOT NULL,
	[PASSWORD] [nvarchar](50) NOT NULL,
	[NOTES] [nvarchar](max) NULL,
	[FK_CREATED_BY] [bigint] NULL,
	[FK_MODIFIED_BY] [bigint] NULL,
	[CREATED_DATE] [datetime] NOT NULL,
	[MODIFIED_DATE] [datetime] NOT NULL,
	[IS_DELETED] [bit] NOT NULL,
	[IS_ACTIVE] [bit] NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[PK_USERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Area_Master] ON 

GO
INSERT [dbo].[Area_Master] ([PK_Area], [Area_Name], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE]) VALUES (3, N'Alkapuri', 5, 5, CAST(0x0000A8B900000000 AS DateTime), CAST(0x0000A8B900000000 AS DateTime), 0, 1)
GO
INSERT [dbo].[Area_Master] ([PK_Area], [Area_Name], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE]) VALUES (4, N'Akota', 1, 1, CAST(0x0000A8B900000000 AS DateTime), CAST(0x0000A8B900000000 AS DateTime), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Area_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER_MASTER] ON 

GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (1, N'nevil', N'Nadiad', 3, N'Nadiad', NULL, NULL, N'ada@afadf.in', NULL, N'90900990', NULL, NULL, NULL, NULL, CAST(0x0000A8BA00E4E9C7 AS DateTime), CAST(0x0000A8BA00E4E9C7 AS DateTime), 0, 1, NULL, N'nevil', N'123456', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (2, N'charlie', N'abc', 4, N'makarpura', NULL, NULL, N'a@d.com', NULL, N'1234567890', NULL, NULL, NULL, NULL, CAST(0x0000A8BD01654FFA AS DateTime), CAST(0x0000A8BD01654FFA AS DateTime), 0, 1, NULL, N'chiman', N'123456', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (3, N'test', N'test', 3, N'teste', NULL, NULL, N'', NULL, N'9876', NULL, NULL, NULL, NULL, CAST(0x0000A8BE00BB3385 AS DateTime), CAST(0x0000A8BE00BB3385 AS DateTime), 0, 1, NULL, N'test', N'123', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (4, N'abc', N'asd', 4, N'awd', NULL, NULL, N'a@d.com', NULL, N'1234567890', NULL, NULL, NULL, NULL, CAST(0x0000A8BE010B08F8 AS DateTime), CAST(0x0000A8BE010B08F8 AS DateTime), 0, 1, NULL, N'apu', N'123456', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (5, N'charmi', N'makarpura', 4, N'vadodara', NULL, NULL, N'123456', NULL, N'1234455668', NULL, NULL, NULL, NULL, CAST(0x0000A8BE0112C916 AS DateTime), CAST(0x0000A8BE0112C916 AS DateTime), 0, 1, NULL, N'charlie', N'123456', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (6, N'pranav', N'vadodara', 3, N'vadodara', NULL, NULL, N'test', NULL, N'9998768081', NULL, NULL, NULL, NULL, CAST(0x0000A8BE01189FC9 AS DateTime), CAST(0x0000A8BE01189FC9 AS DateTime), 0, 1, NULL, N'test', N'test', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (7, N'charmi', N'agdudjs', 3, N'vadodara', NULL, NULL, N'123456', NULL, N'1470852369', NULL, NULL, NULL, NULL, CAST(0x0000A8BE011C26E6 AS DateTime), CAST(0x0000A8BE011C26E6 AS DateTime), 0, 1, NULL, N'charjt', N'123456', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10003, N'Me', N'Abc', 4, N'Vadodara', NULL, NULL, N'A@d.com', NULL, N'1234567890', NULL, NULL, NULL, NULL, CAST(0x0000A8BF007A5164 AS DateTime), CAST(0x0000A8BF007A5164 AS DateTime), 0, 1, NULL, N'Charmi', N'123456', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10004, N'Me', N'Abc', 4, N'Vadodara', NULL, NULL, N'A@d.com', NULL, N'1234567890', NULL, NULL, NULL, NULL, CAST(0x0000A8BF007A6B89 AS DateTime), CAST(0x0000A8BF007A6B89 AS DateTime), 0, 1, NULL, N'Charmi', N'123456', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10005, N'pranav', N'vadodara', 3, N'vadodara', NULL, NULL, N'pp', NULL, N'9998768081', NULL, NULL, NULL, NULL, CAST(0x0000A8C00132190A AS DateTime), CAST(0x0000A8C00132190A AS DateTime), 0, 1, NULL, N'pp', N'pp', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10006, N'Rachel Green', N'anywhere', 4, N'Vadodara', NULL, NULL, N'12345678', NULL, N'9974018816', NULL, NULL, NULL, NULL, CAST(0x0000A8C001489A48 AS DateTime), CAST(0x0000A8C001489A48 AS DateTime), 0, 1, NULL, N'rguser', N'12345678', 0)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10007, N'meet patel', N'B/41,Jay maharaj township,pij road', 3, N'Vadodara', NULL, NULL, N'meet60333351', NULL, N'8690956935', NULL, NULL, NULL, NULL, CAST(0x0000A8C0014CBD3B AS DateTime), CAST(0x0000A8C0014CBD3B AS DateTime), 0, 1, NULL, N'meet007', N'meet60333351', 0)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10008, N'charmy', N'ankleshwar', 3, N'vadodara', NULL, NULL, N'charmijoshi93@gmail.com', NULL, N'1234567890', NULL, NULL, NULL, NULL, CAST(0x0000A8C300CEC6DD AS DateTime), CAST(0x0000A8C300CEC6DD AS DateTime), 0, 1, NULL, N'charmie', N'123456', 0)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10009, N'nevil', N'test', 3, N'vadodara', NULL, NULL, N'nevil8555@gmail.com', NULL, N'342', NULL, NULL, NULL, NULL, CAST(0x0000A8C400D67A08 AS DateTime), CAST(0x0000A8C400D67A08 AS DateTime), 0, 1, NULL, N'nevil123', N'123', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10010, N'nevil', N'test', 3, N'vadodara', NULL, NULL, N'nevil8555@gmail.com', NULL, N'342', NULL, NULL, NULL, NULL, CAST(0x0000A8C400DACB69 AS DateTime), CAST(0x0000A8C400DACB69 AS DateTime), 0, 1, NULL, N'n1', N'123', 0)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10011, N'n', N'n', 3, N'n', NULL, NULL, N'nevil8555@gmail.com', NULL, N'87', NULL, NULL, NULL, NULL, CAST(0x0000A8C400DB7179 AS DateTime), CAST(0x0000A8C400DB7179 AS DateTime), 0, 1, NULL, N'n11', N'123', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10012, N'n', N'n', 3, N'n', NULL, NULL, N'nevil8555@gmail.com', NULL, N'87', NULL, NULL, NULL, NULL, CAST(0x0000A8C400E728ED AS DateTime), CAST(0x0000A8C400E728ED AS DateTime), 0, 1, NULL, N'n2', N'123', 0)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10013, N'n4', N'nj', 4, N'nik', NULL, NULL, N'nevil8555@gmail.com', NULL, N'876', NULL, NULL, NULL, NULL, CAST(0x0000A8C400E7770F AS DateTime), CAST(0x0000A8C400E7770F AS DateTime), 0, 1, NULL, N'n4', N'123', 1)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10014, N'charmie', N'ankleshwar', 3, N'vadodara', NULL, NULL, N'123456', NULL, N'1478523690', NULL, NULL, NULL, 5, CAST(0x0000A8C5010F8F9F AS DateTime), CAST(0x0000A8C5012E643F AS DateTime), 1, 1, NULL, N'charmiiee', N'123456', 0)
GO
INSERT [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID], [CUSTOMER_NAME], [ADDRESS], [FK_AREAID], [CITY], [PINCODE], [STATE], [EMAIL], [PHONE], [MOBILE], [BIRTHDAY_DATE], [ANNIVERSARY_DATE], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE], [OTP], [USERNAME], [PASSWORD], [IS_EMAIL_VERIFY]) VALUES (10015, N'charmy', N'ankleshwar', 3, N'vadodara', NULL, NULL, N'123456', NULL, N'1478523690', NULL, NULL, NULL, 5, CAST(0x0000A8C5010FB756 AS DateTime), CAST(0x0000A8C5012E5D29 AS DateTime), 1, 1, NULL, N'charmy', N'123456', 0)
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER_MASTER] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback_Master] ON 

GO
INSERT [dbo].[Feedback_Master] ([PK_FeedBackID], [FK_MechanicID], [FK_CUSTOMERID], [FeedBack_Subject], [FeedBack_Descriptions], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE]) VALUES (1, 2, 2, N'test', N'test texste egtded', NULL, NULL, CAST(0x0000A8C000FBB313 AS DateTime), CAST(0x0000A8C000FBB313 AS DateTime), 0, 1)
GO
INSERT [dbo].[Feedback_Master] ([PK_FeedBackID], [FK_MechanicID], [FK_CUSTOMERID], [FeedBack_Subject], [FeedBack_Descriptions], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE]) VALUES (2, NULL, NULL, N'', N'', NULL, NULL, CAST(0x0000A8C001279FAE AS DateTime), CAST(0x0000A8C001279FAE AS DateTime), 0, 1)
GO
INSERT [dbo].[Feedback_Master] ([PK_FeedBackID], [FK_MechanicID], [FK_CUSTOMERID], [FeedBack_Subject], [FeedBack_Descriptions], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE]) VALUES (3, 1, 1, N'dsdjhjs', N'idsvuj', NULL, NULL, CAST(0x0000A8C001281452 AS DateTime), CAST(0x0000A8C001281452 AS DateTime), 0, 1)
GO
INSERT [dbo].[Feedback_Master] ([PK_FeedBackID], [FK_MechanicID], [FK_CUSTOMERID], [FeedBack_Subject], [FeedBack_Descriptions], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE]) VALUES (4, 2, 2, N'Test', N'Test tesdf', NULL, NULL, CAST(0x0000A8C001289D2F AS DateTime), CAST(0x0000A8C001289D2F AS DateTime), 0, 1)
GO
INSERT [dbo].[Feedback_Master] ([PK_FeedBackID], [FK_MechanicID], [FK_CUSTOMERID], [FeedBack_Subject], [FeedBack_Descriptions], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE]) VALUES (5, 2, 2, N'Test', N'Test tesdf', NULL, NULL, CAST(0x0000A8C1001BA199 AS DateTime), CAST(0x0000A8C1001BA199 AS DateTime), 0, 1)
GO
INSERT [dbo].[Feedback_Master] ([PK_FeedBackID], [FK_MechanicID], [FK_CUSTOMERID], [FeedBack_Subject], [FeedBack_Descriptions], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE]) VALUES (6, 3, 6, N'hello', N'nice', NULL, NULL, CAST(0x0000A8C40080CC82 AS DateTime), CAST(0x0000A8C40080CC82 AS DateTime), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Feedback_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[MechanicProfile] ON 

GO
INSERT [dbo].[MechanicProfile] ([PK_MechanicID], [Mechanic_NAME], [USERNAME], [PASSWORD], [ADDRESS], [EMAIL], [MOBILE], [CITY], [STATE], [M_Garage_NAME], [Fk_Area], [IS_ACTIVE], [NOTES], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [OTP], [Longitude], [Latitude]) VALUES (1, N'Babu', N'babu', N'123456', N'bhdsb', N'ankurpatel00001@gmail.com', N'877899', N'Vadoadara', NULL, N'Star garage', 3, 1, NULL, NULL, NULL, CAST(0x0000A8BA010FC43D AS DateTime), CAST(0x0000A8BA010FC43F AS DateTime), 0, NULL, N'32.98877', N'73.8877765')
GO
INSERT [dbo].[MechanicProfile] ([PK_MechanicID], [Mechanic_NAME], [USERNAME], [PASSWORD], [ADDRESS], [EMAIL], [MOBILE], [CITY], [STATE], [M_Garage_NAME], [Fk_Area], [IS_ACTIVE], [NOTES], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [OTP], [Longitude], [Latitude]) VALUES (2, N'charmi', N'charmi', N'123456', N'alkapuri', N'a@d.com', N'1234567890', N'vadodara', NULL, N'abc', 3, 1, NULL, NULL, NULL, CAST(0x0000A8BB01269C02 AS DateTime), CAST(0x0000A8BB01269C02 AS DateTime), 0, NULL, N'22.678', N'12.89077')
GO
INSERT [dbo].[MechanicProfile] ([PK_MechanicID], [Mechanic_NAME], [USERNAME], [PASSWORD], [ADDRESS], [EMAIL], [MOBILE], [CITY], [STATE], [M_Garage_NAME], [Fk_Area], [IS_ACTIVE], [NOTES], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [OTP], [Longitude], [Latitude]) VALUES (3, N'a', N'a', N'a', N'a', N'', N'98765', N'a', NULL, N'', 3, 1, NULL, NULL, NULL, CAST(0x0000A8BE00BB782A AS DateTime), CAST(0x0000A8BE00BB782A AS DateTime), 0, NULL, N'54.678', N'73.556677')
GO
INSERT [dbo].[MechanicProfile] ([PK_MechanicID], [Mechanic_NAME], [USERNAME], [PASSWORD], [ADDRESS], [EMAIL], [MOBILE], [CITY], [STATE], [M_Garage_NAME], [Fk_Area], [IS_ACTIVE], [NOTES], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [OTP], [Longitude], [Latitude]) VALUES (4, N'rj', N'rjb', N'123456', N'Vadodara', N'Abc@qbc.com', N'9876556667', N'Vadodara', NULL, N'Rj', 3, 1, NULL, NULL, NULL, CAST(0x0000A8BE011AF8E0 AS DateTime), CAST(0x0000A8BE011AF8E0 AS DateTime), 0, NULL, N'23.56778', N'73.56776')
GO
INSERT [dbo].[MechanicProfile] ([PK_MechanicID], [Mechanic_NAME], [USERNAME], [PASSWORD], [ADDRESS], [EMAIL], [MOBILE], [CITY], [STATE], [M_Garage_NAME], [Fk_Area], [IS_ACTIVE], [NOTES], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [OTP], [Longitude], [Latitude]) VALUES (5, N'charlie', N'charmiee', N'123456', N'haysueke', N'a@z.com', N'1470522369', N'vadodara', NULL, N'sai garage', 4, 1, NULL, NULL, NULL, CAST(0x0000A8BE011CEB5C AS DateTime), CAST(0x0000A8BE011CEB5C AS DateTime), 0, NULL, N'73.16954369999999', N'22.2945396')
GO
INSERT [dbo].[MechanicProfile] ([PK_MechanicID], [Mechanic_NAME], [USERNAME], [PASSWORD], [ADDRESS], [EMAIL], [MOBILE], [CITY], [STATE], [M_Garage_NAME], [Fk_Area], [IS_ACTIVE], [NOTES], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [OTP], [Longitude], [Latitude]) VALUES (10003, N'meet patel', N'meet', N'meet', N'akota', N'meet@gmail.com', N'7894561230', N'Vadodara ', NULL, N'patel garage ', 4, 1, NULL, NULL, NULL, CAST(0x0000A8C0013FD4D4 AS DateTime), CAST(0x0000A8C0013FD4D4 AS DateTime), 0, NULL, N'73.16954369999999', N'22.2945396')
GO
INSERT [dbo].[MechanicProfile] ([PK_MechanicID], [Mechanic_NAME], [USERNAME], [PASSWORD], [ADDRESS], [EMAIL], [MOBILE], [CITY], [STATE], [M_Garage_NAME], [Fk_Area], [IS_ACTIVE], [NOTES], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [OTP], [Longitude], [Latitude]) VALUES (10004, N'shivam patel', N'shivam ', N'sivam', N'near Galleria Mall, Beside Sir Sayajirao Nagar Gruh, Akota Road, Ajit Nagar Society, Akota, Ajit Nagar Society, Akota, Vadodara, Gujarat ', N'shivam@gmail.com', N'0852369741', N'Vadodara ', NULL, N'shivam garage', 4, 1, NULL, NULL, NULL, CAST(0x0000A8C00143D4DD AS DateTime), CAST(0x0000A8C00143D4DD AS DateTime), 0, NULL, N'73.169178', N'22.300422')
GO
SET IDENTITY_INSERT [dbo].[MechanicProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

GO
INSERT [dbo].[USERS] ([PK_USERID], [NAME], [USERNAME], [PASSWORD], [NOTES], [FK_CREATED_BY], [FK_MODIFIED_BY], [CREATED_DATE], [MODIFIED_DATE], [IS_DELETED], [IS_ACTIVE]) VALUES (5, N'admin', N'admin', N'123', N'n', 1, 1, CAST(0x0000A8B900000000 AS DateTime), CAST(0x0000A8B900000000 AS DateTime), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
ALTER TABLE [dbo].[CUSTOMER_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_MASTER_Area_Master] FOREIGN KEY([FK_AREAID])
REFERENCES [dbo].[Area_Master] ([PK_Area])
GO
ALTER TABLE [dbo].[CUSTOMER_MASTER] CHECK CONSTRAINT [FK_CUSTOMER_MASTER_Area_Master]
GO
ALTER TABLE [dbo].[Feedback_Master]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Master_CUSTOMER_MASTER] FOREIGN KEY([FK_CUSTOMERID])
REFERENCES [dbo].[CUSTOMER_MASTER] ([PK_CUSTOMERID])
GO
ALTER TABLE [dbo].[Feedback_Master] CHECK CONSTRAINT [FK_Feedback_Master_CUSTOMER_MASTER]
GO
ALTER TABLE [dbo].[Feedback_Master]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Master_MechanicProfile] FOREIGN KEY([FK_MechanicID])
REFERENCES [dbo].[MechanicProfile] ([PK_MechanicID])
GO
ALTER TABLE [dbo].[Feedback_Master] CHECK CONSTRAINT [FK_Feedback_Master_MechanicProfile]
GO
ALTER TABLE [dbo].[MechanicProfile]  WITH CHECK ADD  CONSTRAINT [FK_MechanicProfile_Area_Master] FOREIGN KEY([Fk_Area])
REFERENCES [dbo].[Area_Master] ([PK_Area])
GO
ALTER TABLE [dbo].[MechanicProfile] CHECK CONSTRAINT [FK_MechanicProfile_Area_Master]
GO
USE [master]
GO
ALTER DATABASE [CS_CAR] SET  READ_WRITE 
GO
