USE [LabAJ]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/20/2015 11:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [varchar](5) NOT NULL,
	[productName] [varchar](50) NOT NULL,
	[quantityPerUnit] [varchar](40) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Product] ([productID], [productName], [quantityPerUnit], [price]) VALUES (N'b0001', N'Chai', N'10 boxes x 20 bags', 18)
INSERT [dbo].[Product] ([productID], [productName], [quantityPerUnit], [price]) VALUES (N'b0012', N'Goi', N'10 boxes x 40 bags', 0.5)
INSERT [dbo].[Product] ([productID], [productName], [quantityPerUnit], [price]) VALUES (N'b0013', N'Gudbrandsdalsost', N'10 kg pkg', 36)
INSERT [dbo].[Product] ([productID], [productName], [quantityPerUnit], [price]) VALUES (N'b2221', N'Ga Ran', N'Chicken', 99)
INSERT [dbo].[Product] ([productID], [productName], [quantityPerUnit], [price]) VALUES (N'b5555', N'McDonald', N'McDonald', 22)
/****** Object:  Table [dbo].[Orders]    Script Date: 03/20/2015 11:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [varchar](5) NOT NULL,
	[orderDate] [date] NULL,
	[customerID] [varchar](5) NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Orders] ([orderID], [orderDate], [customerID], [total]) VALUES (N'C293', CAST(0xBC390B00 AS Date), N'00000', 116.5)
INSERT [dbo].[Orders] ([orderID], [orderDate], [customerID], [total]) VALUES (N'C297', CAST(0xBC390B00 AS Date), N'00000', 18)
INSERT [dbo].[Orders] ([orderID], [orderDate], [customerID], [total]) VALUES (N'C4536', CAST(0xBC390B00 AS Date), N'00000', 62.5)
INSERT [dbo].[Orders] ([orderID], [orderDate], [customerID], [total]) VALUES (N'C88', CAST(0xBC390B00 AS Date), N'00000', 18)
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 03/20/2015 11:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [varchar](5) NOT NULL,
	[productID] [varchar](5) NOT NULL,
	[productName] [varchar](50) NULL,
	[quantityPerUnit] [varchar](40) NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[OrderDetails] ([orderID], [productID], [productName], [quantityPerUnit], [price], [quantity]) VALUES (N'C293', N'b0012', N'Goi', N'10 boxes x 40 bags', 0.5, 1)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [productName], [quantityPerUnit], [price], [quantity]) VALUES (N'C293', N'b0013', N'Gudbrandsdalsost', N'10 kg pkg', 36, 2)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [productName], [quantityPerUnit], [price], [quantity]) VALUES (N'C293', N'b5555', N'McDonald', N'McDonald', 22, 2)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [productName], [quantityPerUnit], [price], [quantity]) VALUES (N'C297', N'b0001', N'Chai', N'10 boxes x 20 bags', 18, 1)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [productName], [quantityPerUnit], [price], [quantity]) VALUES (N'C4536', N'b0001', N'Chai', N'10 boxes x 20 bags', 18, 1)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [productName], [quantityPerUnit], [price], [quantity]) VALUES (N'C4536', N'b0012', N'Goi', N'10 boxes x 40 bags', 0.5, 1)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [productName], [quantityPerUnit], [price], [quantity]) VALUES (N'C4536', N'b5555', N'McDonald', N'McDonald', 22, 2)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [productName], [quantityPerUnit], [price], [quantity]) VALUES (N'C88', N'b0001', N'Chai', N'10 boxes x 20 bags', 18, 1)
/****** Object:  ForeignKey [FK_OrderDetails_Orders1]    Script Date: 03/20/2015 11:17:39 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders1] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders1]
GO
/****** Object:  ForeignKey [FK_OrderDetails_Product]    Script Date: 03/20/2015 11:17:39 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
