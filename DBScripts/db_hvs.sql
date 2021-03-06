USE [master]
GO
/****** Object:  Database [HVS]    Script Date: 9/24/2020 9:29:53 PM ******/
CREATE DATABASE [HVS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HVS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HVS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HVS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HVS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HVS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HVS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HVS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HVS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HVS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HVS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HVS] SET ARITHABORT OFF 
GO
ALTER DATABASE [HVS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HVS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HVS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HVS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HVS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HVS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HVS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HVS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HVS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HVS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HVS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HVS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HVS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HVS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HVS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HVS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HVS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HVS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HVS] SET  MULTI_USER 
GO
ALTER DATABASE [HVS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HVS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HVS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HVS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HVS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HVS] SET QUERY_STORE = OFF
GO
USE [HVS]
GO
/****** Object:  Table [dbo].[tbl_classes]    Script Date: 9/24/2020 9:29:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_classes](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_classes] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_contract_code]    Script Date: 9/24/2020 9:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_contract_code](
	[contract_code] [varchar](50) NULL,
	[ticker] [varchar](50) NULL,
	[last_trade] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_student]    Script Date: 9/24/2020 9:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_student](
	[student_id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_name] [varchar](50) NULL,
	[created_datetime] [datetime] NULL,
 CONSTRAINT [PK_tbl_student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_student_class_mapping]    Script Date: 9/24/2020 9:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_student_class_mapping](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NULL,
	[class_id] [bigint] NULL,
	[created_datetime] [datetime] NULL,
 CONSTRAINT [PK_tbl_student_class_mapping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_student_interests]    Script Date: 9/24/2020 9:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_student_interests](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NULL,
	[interests] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_student_interests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_student_subject_mapping]    Script Date: 9/24/2020 9:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_student_subject_mapping](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NULL,
	[subject_id] [int] NULL,
 CONSTRAINT [PK_tbl_student_subject_mapping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_subject]    Script Date: 9/24/2020 9:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subject](
	[subject_id] [int] IDENTITY(1,1) NOT NULL,
	[subject_name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_subject] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_classes] ON 

INSERT [dbo].[tbl_classes] ([class_id], [class_name]) VALUES (1, N'1st class')
INSERT [dbo].[tbl_classes] ([class_id], [class_name]) VALUES (2, N'2nd class')
INSERT [dbo].[tbl_classes] ([class_id], [class_name]) VALUES (3, N'3rd class')
INSERT [dbo].[tbl_classes] ([class_id], [class_name]) VALUES (4, N'4th class')
INSERT [dbo].[tbl_classes] ([class_id], [class_name]) VALUES (5, N'5th class')
SET IDENTITY_INSERT [dbo].[tbl_classes] OFF
GO
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (N'ES', N'ESU0', CAST(N'2020-09-15' AS Date))
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (NULL, N'ESZ0', CAST(N'2020-12-15' AS Date))
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (NULL, N'ESH1', CAST(N'2021-03-15' AS Date))
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (NULL, N'ESU1', CAST(N'2021-06-15' AS Date))
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (NULL, NULL, CAST(N'2021-09-15' AS Date))
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (N'NK', N'NK1', CAST(N'2020-09-15' AS Date))
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (NULL, N'NK2', CAST(N'2020-10-15' AS Date))
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (NULL, N'NK3', CAST(N'2020-11-15' AS Date))
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (NULL, N'NK4', CAST(N'2020-12-15' AS Date))
INSERT [dbo].[tbl_contract_code] ([contract_code], [ticker], [last_trade]) VALUES (NULL, N'NK5', CAST(N'2021-01-15' AS Date))
GO
SET IDENTITY_INSERT [dbo].[tbl_student] ON 

INSERT [dbo].[tbl_student] ([student_id], [student_name], [created_datetime]) VALUES (3, N'Ashutosh Kumar', CAST(N'2020-09-23T15:24:24.117' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_student] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_student_class_mapping] ON 

INSERT [dbo].[tbl_student_class_mapping] ([id], [student_id], [class_id], [created_datetime]) VALUES (1, 1, 1, CAST(N'2020-09-23T15:28:28.140' AS DateTime))
INSERT [dbo].[tbl_student_class_mapping] ([id], [student_id], [class_id], [created_datetime]) VALUES (2, 2, 2, CAST(N'2020-09-23T15:28:49.067' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_student_class_mapping] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_student_subject_mapping] ON 

INSERT [dbo].[tbl_student_subject_mapping] ([id], [student_id], [subject_id]) VALUES (1, 1, 1)
INSERT [dbo].[tbl_student_subject_mapping] ([id], [student_id], [subject_id]) VALUES (2, 1, 2)
INSERT [dbo].[tbl_student_subject_mapping] ([id], [student_id], [subject_id]) VALUES (3, 1, 3)
INSERT [dbo].[tbl_student_subject_mapping] ([id], [student_id], [subject_id]) VALUES (4, 2, 2)
INSERT [dbo].[tbl_student_subject_mapping] ([id], [student_id], [subject_id]) VALUES (5, 2, 2)
INSERT [dbo].[tbl_student_subject_mapping] ([id], [student_id], [subject_id]) VALUES (6, 2, 4)
SET IDENTITY_INSERT [dbo].[tbl_student_subject_mapping] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_subject] ON 

INSERT [dbo].[tbl_subject] ([subject_id], [subject_name]) VALUES (1, N'Physics')
INSERT [dbo].[tbl_subject] ([subject_id], [subject_name]) VALUES (2, N'Chemistry')
INSERT [dbo].[tbl_subject] ([subject_id], [subject_name]) VALUES (3, N'Maths')
INSERT [dbo].[tbl_subject] ([subject_id], [subject_name]) VALUES (4, N'Arts')
INSERT [dbo].[tbl_subject] ([subject_id], [subject_name]) VALUES (5, N'Computers')
SET IDENTITY_INSERT [dbo].[tbl_subject] OFF
GO
ALTER TABLE [dbo].[tbl_student] ADD  CONSTRAINT [DF_tbl_student_created_datetime]  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[tbl_student_class_mapping] ADD  CONSTRAINT [DF_tbl_student_class_mapping_created_datetime]  DEFAULT (getdate()) FOR [created_datetime]
GO
/****** Object:  StoredProcedure [dbo].[sp_get_expiring_contract]    Script Date: 9/24/2020 9:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_expiring_contract]
	-- Add the parameters for the stored procedure here
	@date date,
	@depth int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * from tbl_contract_code;
END
GO
USE [master]
GO
ALTER DATABASE [HVS] SET  READ_WRITE 
GO
