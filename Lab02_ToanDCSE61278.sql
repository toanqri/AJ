CREATE DATABASE [LabAJ]
USE [LabAJ]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/18/2015 20:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Code] [varchar](5) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](255) NULL,
	[Price] [float] NOT NULL,
	[Category] [varchar](25) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Product] ([Code], [Name], [Description], [Price], [Category]) VALUES (N'b0001', N'Coca Cola', N'coca', 0.5, N'Beverage')
INSERT [dbo].[Product] ([Code], [Name], [Description], [Price], [Category]) VALUES (N'b0012', N'Pepsi', N'pepsi', 0.5, N'Beverage')
INSERT [dbo].[Product] ([Code], [Name], [Description], [Price], [Category]) VALUES (N'b0013', N'Pepsico', N'pepsi', 333, N'Food')
INSERT [dbo].[Product] ([Code], [Name], [Description], [Price], [Category]) VALUES (N'b1111', N'Coca Coka', N'cocacoca', 1, N'Vegetables')
INSERT [dbo].[Product] ([Code], [Name], [Description], [Price], [Category]) VALUES (N'b2221', N'Ga Ran', N'Chicken', 99, N'Beverage')
INSERT [dbo].[Product] ([Code], [Name], [Description], [Price], [Category]) VALUES (N'b5555', N'McDonald', N'McDonald', 22, N'Meat')
