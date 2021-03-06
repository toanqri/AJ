USE [UserDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 04/01/2015 19:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[accountId] [varchar](10) NOT NULL,
	[balance] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([accountId], [balance]) VALUES (N'duy', 300)
INSERT [dbo].[Account] ([accountId], [balance]) VALUES (N'manh', 200)
INSERT [dbo].[Account] ([accountId], [balance]) VALUES (N'quan', 444)
INSERT [dbo].[Account] ([accountId], [balance]) VALUES (N'tai', 555)
INSERT [dbo].[Account] ([accountId], [balance]) VALUES (N'toan', 100)
