CREATE DATABASE Project1
USE [Project1]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 03/26/2015 20:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[custID] [varchar](10) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[custName] [varchar](15) NOT NULL,
	[lastName] [varchar](15) NOT NULL,
	[middleName] [varchar](15) NULL,
	[address] [varchar](250) NULL,
	[phone] [varchar](11) NULL,
	[custLevel] [int] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[custID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'congtoan', N'congtoan', N'toan', N'doan', N'cong', N'quang trung', N'124124214', 1)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'duydtt', N'duy', N'toandc', N'toan', N'toan', N'go vap', N'19274189479', 3)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'manhnv', N'manh', N'manh', N'manh', N'van', N'tan binh', N'012849187', 1)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'minhquan', N'minhquan', N'quan', N'minh', N'ho', N'quan 12', N'124124124', 1)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'toancong', N'toanqrii', N'toan cong', N'doan doan', N'cong', N'binh thanh', N'1241241241', 1)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'toandc', N'toan', N'toan', N'toan', N'cong', N'quang trung', N'01698235907', 2)
INSERT [dbo].[customer] ([custID], [password], [custName], [lastName], [middleName], [address], [phone], [custLevel]) VALUES (N'toanqri', N'toanqrii', N'toan', N'doan', N'cong', N'quang trung', N'019325723', 1)
/****** Object:  Table [dbo].[product]    Script Date: 03/26/2015 20:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[productID] [varchar](10) NOT NULL,
	[productName] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[product] ([productID], [productName], [price], [quantity]) VALUES (N'C123', N'Mi Tom', 12, 89)
INSERT [dbo].[product] ([productID], [productName], [price], [quantity]) VALUES (N'D456', N'Banh Mi', 15, 88)
INSERT [dbo].[product] ([productID], [productName], [price], [quantity]) VALUES (N'E321', N'Red Bull', 20, 200)
INSERT [dbo].[product] ([productID], [productName], [price], [quantity]) VALUES (N'F412', N'Number One', 9, 200)
INSERT [dbo].[product] ([productID], [productName], [price], [quantity]) VALUES (N'R514', N'Cafe Sua Da', 25, 200)
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 03/26/2015 20:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[orderID] [varchar](10) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[custID] [varchar](10) NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_tbl_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_Order] ([orderID], [orderDate], [custID], [total]) VALUES (N'INV22960', CAST(0x0000A46701568328 AS DateTime), N'toancong', 2997)
INSERT [dbo].[tbl_Order] ([orderID], [orderDate], [custID], [total]) VALUES (N'INV38071', CAST(0x0000A467014FB70D AS DateTime), N'toanqri', 2090)
INSERT [dbo].[tbl_Order] ([orderID], [orderDate], [custID], [total]) VALUES (N'INV41000', CAST(0x0000A467015538BC AS DateTime), N'minhquan', 15)
INSERT [dbo].[tbl_Order] ([orderID], [orderDate], [custID], [total]) VALUES (N'INV44327', CAST(0x0000A46701503392 AS DateTime), N'toanqri', 924)
INSERT [dbo].[tbl_Order] ([orderID], [orderDate], [custID], [total]) VALUES (N'INV47809', CAST(0x0000A467014C8E27 AS DateTime), N'toandc', 36)
INSERT [dbo].[tbl_Order] ([orderID], [orderDate], [custID], [total]) VALUES (N'INV59043', CAST(0x0000A467014C9B51 AS DateTime), N'toandc', 12)
INSERT [dbo].[tbl_Order] ([orderID], [orderDate], [custID], [total]) VALUES (N'INV78048', CAST(0x0000A4670151BAA6 AS DateTime), N'congtoan', 2805)
INSERT [dbo].[tbl_Order] ([orderID], [orderDate], [custID], [total]) VALUES (N'INV89762', CAST(0x0000A467014F7E71 AS DateTime), N'toanqri', 8094)
INSERT [dbo].[tbl_Order] ([orderID], [orderDate], [custID], [total]) VALUES (N'INV89924', CAST(0x0000A4670150DE31 AS DateTime), N'congtoan', 15)
/****** Object:  Table [dbo].[orderDetail]    Script Date: 03/26/2015 20:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productID] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[unitPrice] [float] NOT NULL,
	[unitItem] [varchar](10) NOT NULL,
	[total] [float] NOT NULL,
	[orderID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_orderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetail] ON
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (60, N'D456', 1, 15, N'', 15, N'INV47809')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (61, N'F412', 1, 9, N'', 9, N'INV47809')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (62, N'C123', 1, 12, N'', 12, N'INV47809')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (63, N'C123', 1, 12, N'', 12, N'INV59043')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (64, N'F412', 123, 9, N'', 1107, N'INV89762')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (65, N'C123', 121, 12, N'', 1452, N'INV89762')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (66, N'R514', 123, 25, N'', 3075, N'INV89762')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (67, N'E321', 123, 20, N'', 2460, N'INV89762')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (68, N'D456', 11, 15, N'', 165, N'INV38071')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (69, N'R514', 77, 25, N'', 1925, N'INV38071')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (70, N'C123', 77, 12, N'', 924, N'INV44327')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (71, N'D456', 1, 15, N'', 15, N'INV89924')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (72, N'D456', 187, 15, N'', 2805, N'INV78048')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (73, N'D456', 1, 15, N'', 15, N'INV41000')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (74, N'D456', 111, 15, N'', 1665, N'INV22960')
INSERT [dbo].[orderDetail] ([id], [productID], [quantity], [unitPrice], [unitItem], [total], [orderID]) VALUES (75, N'C123', 111, 12, N'', 1332, N'INV22960')
SET IDENTITY_INSERT [dbo].[orderDetail] OFF
/****** Object:  ForeignKey [FK_orderDetail_product]    Script Date: 03/26/2015 20:47:46 ******/
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_product]
GO
/****** Object:  ForeignKey [FK_orderDetail_tbl_Order]    Script Date: 03/26/2015 20:47:46 ******/
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_tbl_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[tbl_Order] ([orderID])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_tbl_Order]
GO
/****** Object:  ForeignKey [FK_tbl_Order_customer]    Script Date: 03/26/2015 20:47:46 ******/
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order_customer] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[tbl_Order] CHECK CONSTRAINT [FK_tbl_Order_customer]
GO
