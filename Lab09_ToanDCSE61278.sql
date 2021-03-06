CREATE DATABASE UserDB
USE [UserDB]
GO
/****** Object:  Table [dbo].[TBL_Account]    Script Date: 03/23/2015 21:42:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_Account](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Lastname] [varchar](40) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_TBL_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TBL_Account] ([Username], [Password], [Lastname], [isAdmin]) VALUES (N'duy', N'duy', N'Doan Thanh Duy', 0)
INSERT [dbo].[TBL_Account] ([Username], [Password], [Lastname], [isAdmin]) VALUES (N'manh', N'manh', N'Nguyen Van Manh', 0)
INSERT [dbo].[TBL_Account] ([Username], [Password], [Lastname], [isAdmin]) VALUES (N'toan', N'toan', N'Doan Cong Toan', 1)
INSERT [dbo].[TBL_Account] ([Username], [Password], [Lastname], [isAdmin]) VALUES (N'tram', N'tram', N'Lu Lu', 1)
