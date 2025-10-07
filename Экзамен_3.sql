USE master;

CREATE DATABASE CompanyDB;
GO

USE CompanyDB;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO

INSERT INTO [dbo].[MaterialType] ([Title], [DefectedPercent])
VALUES 
    ('�������', 0.0),
    ('������', 0.0),
    ('�����', 0.0);

INSERT INTO [dbo].[Supplier] ([Title], [INN], [StartDate], [QualityRating], [SupplierType])
VALUES
    ('���������������', '1718185951', '2011-12-20', 36, '���'),
    ('�������� ����', '1878504395', '2012-09-13', 2, '���'),
    ('���������', '1564667734', '2016-12-23', 79, '���'),
    ('�����', '2293562756', '2019-05-27', 64, '���'),
    ('�������', '1755853973', '2015-06-16', 14, '���'),
    ('�������� �����', '1429908355', '2010-12-27', 50, '���'),
    ('�������', '1944834477', '2011-04-10', 20, '���'),
    ('����������', '1488487851', '2012-03-13', 58, '���'),
    ('�����������', '2152486844', '2018-11-11', 59, '���'),
    ('����', '1036521658', '2011-11-23', 67, '���'),
    ('�������� ������������', '1178826599', '2012-07-07', 5, '���'),
    ('������������', '1954050214', '2011-07-23', 42, '���'),
    ('������', '1163880101', '2016-05-23', 10, '���'),
    ('�����������', '1654184411', '2015-06-25', 3, '���'),
    ('�������� �����IT���', '1685247455', '2017-03-09', 85, '���'),
    ('����������', '1002996016', '2015-05-07', 95, '���'),
    ('�����������', '1102143492', '2014-12-22', 36, '���'),
    ('�������', '2291253256', '2015-05-22', 82, '���'),
    ('������', '1113468466', '2011-11-25', 21, '���'),
    ('�������������', '1892306757', '2016-12-20', 26, '���'),
    ('������', '1965011544', '2015-03-16', 51, '���'),
    ('C��', '1949139718', '2011-11-28', 95, '���'),
    ('���������', '1740623312', '2011-11-20', 86, '���'),
    ('����������������', '1014490629', '2019-10-28', 73, '���'),
    ('���������', '1255275062', '2014-09-04', 76, '���'),
    ('�����������', '2167673760', '2013-11-13', 9, '���'),
    ('������������', '2200735978', '2015-01-11', 8, '���'),
    ('���������', '1404774111', '2013-06-28', 89, '���'),
    ('�������� �', '1468114280', '2018-12-07', 70, '���'),
    ('��������������', '1032089879', '2012-08-13', 66, '���'),
    ('�������� ��', '2027005945', '2016-06-22', 11, '���'),
    ('��������', '1076279398', '2015-08-23', 37, '���'),
    ('������', '2031832854', '2011-11-25', 25, '���'),
    ('����������', '1551173338', '2011-07-28', 60, '���'),
    ('���', '1906157177', '2011-03-06', 82, '���'),
    ('��������������������', '1846812080', '2011-02-26', 30, '���'),
    ('���������', '2021607106', '2015-10-03', 42, '���'),
    ('�������� ����������C��', '1371692583', '2015-10-19', 23, '���'),
    ('������������', '2164720385', '2018-08-28', 7, '���'),
    ('�������� ��������', '1947163072', '2013-11-18', 33, '���'),
    ('�������', '1426268088', '2018-11-09', 46, '���'),
    ('C��C������', '1988313615', '2018-01-13', 95, '���'),
    ('���������', '2299034130', '2012-02-10', 3, '���'),
    ('����������������', '2059691335', '2014-08-04', 18, '���'),
    ('���������������', '1794419510', '2015-12-22', 85, '���'),
    ('����������', '1650212184', '2018-12-09', 80, '���'),
    ('�����', '1019917089', '2017-04-24', 19, '���'),
    ('������������������', '1549496316', '2013-06-18', 68, '���'),
    ('���������', '2275526397', '2011-06-20', 92, '���'),
    ('����', '2170198203', '2010-05-01', 11, '���');

INSERT INTO [dbo].[Material] ([Title], [MaterialTypeID], [Image], [Cost], [CountInStock], [MinCount], [CountInPack], [Unit])
VALUES
    ('������� ����� 2x2', 1, NULL, 47680.00, 76, 8, 7, '�'),
    ('���� ����� 1x0', 2, NULL, 27456.00, 978, 42, 1, '�'),
    ('���� ����� 1x3', 3, NULL, 2191.00, 406, 27, 8, '�'),
    ('���� ������� 1x1', 2, '\materials\image_5.jpeg', 8619.00, 424, 10, 3, '�'),
    ('���� ������� 2x0', 2, NULL, 16856.00, 395, 26, 2, '�'),
    ('������ ����� 2x2', 2, NULL, 403.00, 334, 48, 6, '�'),
    ('���� ����� 0x2', 3, NULL, 7490.00, 654, 10, 9, '�'),
    ('������� ����� 2x2', 1, NULL, 15478.00, 648, 17, 7, '�'),
    ('������ ����� 1x2', 2, NULL, 44490.00, 640, 50, 2, '�'),
    ('���� ������� 2x0', 2, '\materials\image_10.jpeg', 28301.00, 535, 45, 5, '�'),
    ('������� ����� 1x2', 1, NULL, 9242.00, 680, 6, 3, '��'),
    ('���� ����� 3x2', 3, NULL, 10878.00, 529, 13, 1, '�'),
    ('������ ����� 2x2', 2, '\materials\image_3.jpeg', 29906.00, 659, 35, 1, '�'),
    ('������ ������� 0x3', 2, NULL, 24073.00, 50, 48, 2, '�'),
    ('���� ������� 2x3', 3, NULL, 20057.00, 649, 25, 7, '�'),
    ('������ ����� 2x1', 2, NULL, 3353.00, 790, 8, 2, '�'),
    ('���� ����� 2x3', 3, NULL, 22452.00, 431, 40, 1, '�'),
    ('������� ����� 3x2', 1, NULL, 29943.00, 96, 9, 5, '�'),
    ('������ ����� 3x2', 2, NULL, 55064.00, 806, 50, 3, '�'),
    ('������� ����� 0x3', 1, NULL, 7183.00, 538, 11, 3, '��'),
    ('������ ������� 1x1', 2, NULL, 43466.00, 784, 22, 3, '�'),
    ('������� ����� 1x0', 1, NULL, 27718.00, 980, 41, 3, '��'),
    ('������ ����� 0x2', 2, NULL, 33227.00, 679, 36, 3, '��'),
    ('������� ����� 3x3', 1, NULL, 15170.00, 2, 38, 5, '�'),
    ('������ ����� 3x0', 2, NULL, 19352.00, 341, 38, 7, '��'),
    ('������� ����� 2x1', 1, '\materials\image_2.jpeg', 231.00, 273, 17, 9, '�'),
    ('������� ����� 0x2', 1, NULL, 41646.00, 576, 36, 9, '�'),
    ('���� ������� 1x0', 3, NULL, 24948.00, 91, 38, 5, '�'),
    ('������ ������� 2x2', 2, NULL, 19014.00, 752, 36, 2, '��'),
    ('������ ������� 1x3', 2, NULL, 268.00, 730, 5, 9, '��'),
    ('������ ����� 2x0', 2, NULL, 35256.00, 131, 22, 2, '�'),
    ('���� ������� 2x1', 3, NULL, 34556.00, 802, 16, 6, '�'),
    ('������ ������� 0x3', 2, NULL, 3322.00, 324, 9, 10, '�'),
    ('���� ����� 2x3', 3, NULL, 10823.00, 283, 41, 3, '�'),
    ('������� ����� 3x0', 1, NULL, 16665.00, 411, 8, 1, '��'),
    ('������� ����� 1x3', 1, NULL, 5668.00, 41, 30, 8, '�'),
    ('���� ������� 2x1', 2, NULL, 7615.00, 150, 22, 3, '�'),
    ('������� ����� 3x0', 1, '\materials\image_7.jpeg', 702.00, 0, 5, 4, '�'),
    ('������ ����� 3x0', 2, NULL, 38644.00, 523, 42, 7, '�'),
    ('���� ������� 0x0', 2, NULL, 41827.00, 288, 43, 8, '�'),
    ('������� ����� 1x2', 1, NULL, 8129.00, 77, 46, 4, '�'),
    ('������ ����� 3x0', 2, NULL, 51471.00, 609, 48, 5, '��'),
    ('������ ������� 0x1', 2, NULL, 54401.00, 43, 8, 6, '�'),
    ('���� ����� 1x1', 3, NULL, 14474.00, 372, 22, 5, '�'),
    ('������ ����� 2x1', 2, NULL, 46848.00, 642, 29, 9, '�'),
    ('���� ����� 3x0', 3, NULL, 29503.00, 409, 19, 1, '�'),
    ('������ ������� 3x3', 2, NULL, 27710.00, 601, 32, 6, '�'),
    ('������ ����� 2x0', 2, NULL, 40074.00, 135, 50, 7, '�'),
    ('������� ����� 2x3', 1, NULL, 53482.00, 749, 45, 2, '�'),
    ('���� ����� 0x3', 2, NULL, 32087.00, 615, 22, 8, '�'),
    ('���� ����� 3x3', 3, NULL, 45774.00, 140, 12, 7, '�'),
    ('������ ������� 2x3', 2, NULL, 44978.00, 485, 8, 2, '�'),
    ('���� ����� 3x0', 3, NULL, 44407.00, 67, 23, 10, '�'),
    ('������� ����� 2x1', 1, NULL, 50339.00, 779, 44, 7, '��'),
    ('������ ������� 0x1', 2, NULL, 30581.00, 869, 7, 2, '�'),
    ('������ ����� 0x0', 2, NULL, 18656.00, 796, 29, 8, '��'),
    ('������ ����� 2x1', 2, NULL, 46579.00, 706, 45, 5, '�'),
    ('���� ����� 0x1', 3, NULL, 36883.00, 101, 43, 10, '�'),
    ('������� ������� 1x2', 1, NULL, 45083.00, 575, 15, 9, '�'),
    ('������ ����� 0x1', 2, NULL, 35063.00, 768, 27, 2, '�'),
    ('������� ������� 0x1', 1, NULL, 24488.00, 746, 50, 3, '�'),
    ('������� ����� 3x1', 1, NULL, 43711.00, 995, 27, 8, '�'),
    ('���� ������� 0x2', 3, NULL, 17429.00, 578, 20, 2, '�'),
    ('������� ������� 0x2', 1, NULL, 38217.00, 206, 34, 4, '�'),
    ('������ ������� 1x2', 2, NULL, 47701.00, 299, 50, 10, '�'),
    ('������ ������� 1x0', 2, NULL, 52189.00, 626, 17, 8, '��'),
    ('������� ����� 0x0', 1, NULL, 16715.00, 608, 12, 5, '�'),
    ('������� ����� 0x3', 1, NULL, 45134.00, 953, 48, 5, '��'),
    ('������ ������� 2x1', 2, NULL, 1846.00, 325, 45, 1, '�'),
    ('���� ����� 2x3', 2, NULL, 43659.00, 10, 21, 5, '�'),
    ('���� ����� 2x1', 2, NULL, 12283.00, 948, 13, 9, '�'),
    ('������� ����� 1x1', 1, NULL, 6557.00, 93, 11, 4, '�'),
    ('������ ����� 1x3', 2, NULL, 38230.00, 265, 17, 6, '��'),
    ('������ ������� 3x0', 2, '\materials\image_1.jpeg', 20226.00, 261, 7, 2, '�'),
    ('���� ������� 1x0', 3, NULL, 8105.00, 304, 43, 9, '�'),
    ('������ ������� 0x2', 2, NULL, 2600.00, 595, 38, 7, '�'),
    ('���� ����� 3x1', 2, NULL, 4920.00, 579, 48, 7, '�'),
    ('������ ������� 0x2', 2, NULL, 39809.00, 139, 23, 9, '�'),
    ('������ ����� 3x3', 2, NULL, 46545.00, 740, 24, 6, '��'),
    ('������ ������� 1x1', 2, '\materials\image_6.jpeg', 40583.00, 103, 34, 2, '��'),
    ('������ ������� 2x3', 2, NULL, 46502.00, 443, 46, 9, '�'),
    ('���� ������� 3x0', 3, NULL, 53651.00, 989, 14, 1, '�'),
    ('������� ����� 2x3', 1, NULL, 47757.00, 467, 28, 6, '�'),
    ('������ ����� 1x0', 2, NULL, 3543.00, 95, 6, 6, '�'),
    ('������� ����� 3x1', 1, NULL, 10899.00, 762, 6, 10, '��'),
    ('������� ����� 2x0', 1, '\materials\image_8.jpeg', 8939.00, 312, 21, 3, '��'),
    ('���� ����� 0x2', 3, NULL, 29271.00, 43, 19, 4, '�'),
    ('������� ������� 1x1', 1, '\materials\image_4.jpeg', 46455.00, 10, 19, 4, '�'),
    ('���� ����� 0x2', 2, '\materials\image_9.jpeg', 45744.00, 504, 10, 3, '�'),
    ('������� ����� 0x2', 1, NULL, 9330.00, 581, 40, 2, '�'),
    ('���� ������� 3x2', 3, NULL, 2939.00, 831, 46, 3, '�'),
    ('������� ����� 3x0', 1, NULL, 50217.00, 208, 7, 6, '�'),
    ('���� ����� 1x3', 2, NULL, 32002.00, 489, 25, 1, '�'),
    ('������ ����� 0x1', 2, NULL, 19777.00, 423, 47, 7, '�'),
    ('������� ������� 0x3', 1, NULL, 1209.00, 723, 44, 7, '��'),
    ('������� ����� 2x3', 1, NULL, 32446.00, 274, 8, 4, '�'),
    ('������ ������� 3x1', 2, NULL, 32487.00, 657, 19, 10, '�'),
    ('������� ������� 3x2', 1, NULL, 28596.00, 32, 45, 1, '�'),
    ('���� ����� 2x0', 2, NULL, 46684.00, 623, 23, 2, '�');

INSERT INTO [dbo].[MaterialCountHistory] ([MaterialID], [ChangeDate], [CountValue])
SELECT 
    [ID], 
    '2025-10-07', 
    [CountInStock]
FROM [dbo].[Material]
WHERE [CountInStock] IS NOT NULL;

INSERT INTO [dbo].[MaterialSupplier] ([MaterialID], [SupplierID])
SELECT 
    m.[ID] AS MaterialID, 
    s.[ID] AS SupplierID
FROM [dbo].[Material] m
JOIN [dbo].[Supplier] s ON 
    (m.[Title] = '���� ����� 1x2' AND s.[Title] = '�������') OR
    (m.[Title] = '������ ������� 2x1' AND s.[Title] = '����������') OR
    (m.[Title] = '���� ����� 1x0' AND s.[Title] = '�����������') OR
    (m.[Title] = '������ ������� 2x1' AND s.[Title] = '��������') OR
    (m.[Title] = '������ ����� 2x2' AND s.[Title] = '����') OR
    (m.[Title] = '���� ����� 1x3' AND s.[Title] = '������') OR
    (m.[Title] = '������� ������� 3x2' AND s.[Title] = '�������') OR
    (m.[Title] = '���� ����� 1x2' AND s.[Title] = '�������') OR
    (m.[Title] = '������ ������� 2x1' AND s.[Title] = '�������� ����������C��') OR
    (m.[Title] = '������ ����� 2x2' AND s.[Title] = '������������') OR
    (m.[Title] = '������ ������� 2x1' AND s.[Title] = 'C��C������') OR
    (m.[Title] = '���� ����� 1x0' AND s.[Title] = '�������������') OR
    (m.[Title] = '���� ����� 1x0' AND s.[Title] = '�����������') OR
    (m.[Title] = '������ ������� 2x1' AND s.[Title] = '�������������') OR
    (m.[Title] = '���� ����� 1x3' AND s.[Title] = '����������') OR
    (m.[Title] = '������ ����� 2x2' AND s.[Title] = '�������������') OR
    (m.[Title] = '������ ������� 3x0' AND s.[Title] = '�������� �') OR
    (m.[Title] = '���� ������� 2x0' AND s.[Title] = '������������') OR
    (m.[Title] = '������ ������� 3x0' AND s.[Title] = '���������') OR
    (m.[Title] = '���� ������� 2x0' AND s.[Title] = '����������') OR
    (m.[Title] = '������ ������� 3x0' AND s.[Title] = '�������� ����������C��') OR
    (m.[Title] = '������� ����� 0x2' AND s.[Title] = '������') OR
    (m.[Title] = '������ ������� 3x0' AND s.[Title] = '��������') OR
    (m.[Title] = '������ ������� 1x1' AND s.[Title] = '���������������') OR
    (m.[Title] = '������� ����� 0x2' AND s.[Title] = '�������� �����') OR
    (m.[Title] = '������ ������� 2x3' AND s.[Title] = '������') OR
    (m.[Title] = '���� ������� 2x0' AND s.[Title] = '����������') OR
    (m.[Title] = '������� ����� 0x2' AND s.[Title] = '����������������') OR
    (m.[Title] = '������� ����� 0x2' AND s.[Title] = '����������') OR
    (m.[Title] = '������ ������� 3x0' AND s.[Title] = '������������������') OR
    (m.[Title] = '������ ������� 1x1' AND s.[Title] = '���������') OR
    (m.[Title] = '������� ������� 0x1' AND s.[Title] = '�������� ��') OR
    (m.[Title] = '���� ������� 2x1' AND s.[Title] = '��������������') OR
    (m.[Title] = '���� ������� 1x1' AND s.[Title] = '�������') OR
    (m.[Title] = '������� ����� 2x0' AND s.[Title] = 'C��') OR
    (m.[Title] = '������� ����� 2x0' AND s.[Title] = '������������') OR
    (m.[Title] = '������ ������� 1x1' AND s.[Title] = 'C��C������') OR
    (m.[Title] = '������ ������� 1x1' AND s.[Title] = '������������') OR
    (m.[Title] = '������� ����� 0x3' AND s.[Title] = 'C��') OR
    (m.[Title] = '������ ������� 1x1' AND s.[Title] = '������') OR
    (m.[Title] = '���� ������� 2x1' AND s.[Title] = '����������') OR
    (m.[Title] = '������� ������� 0x2' AND s.[Title] = '�������') OR
    (m.[Title] = '������� ������� 1x1' AND s.[Title] = '����') OR
    (m.[Title] = '������� ������� 0x2' AND s.[Title] = '�������������') OR
    (m.[Title] = '������� ����� 1x2' AND s.[Title] = '�����') OR
    (m.[Title] = '������� ������� 0x2' AND s.[Title] = '�������') OR
    (m.[Title] = '������� ������� 0x2' AND s.[Title] = '�������� ����������C��') OR
    (m.[Title] = '������� ����� 1x2' AND s.[Title] = '��������������') OR
    (m.[Title] = '������� ������� 1x1' AND s.[Title] = '�������� ��������') OR
    (m.[Title] = '������� ������� 0x2' AND s.[Title] = '�������� ������������') OR
    (m.[Title] = '������� ������� 0x2' AND s.[Title] = '����') OR
    (m.[Title] = '������� ������� 0x2' AND s.[Title] = '����������������') OR
    (m.[Title] = '������� ����� 0x0' AND s.[Title] = '���������') OR
    (m.[Title] = '������� ����� 0x0' AND s.[Title] = '�����') OR
    (m.[Title] = '������� ����� 3x3' AND s.[Title] = '�������� �����') OR
    (m.[Title] = '���� ������� 2x0' AND s.[Title] = '����������������') OR
    (m.[Title] = '������ ����� 2x1' AND s.[Title] = '����������') OR
    (m.[Title] = '���� ������� 2x0' AND s.[Title] = '�������� ��') OR
    (m.[Title] = '������� ����� 0x0' AND s.[Title] = '��������') OR
    (m.[Title] = '���� ������� 2x0' AND s.[Title] = '����������') OR
    (m.[Title] = '������� ����� 3x3' AND s.[Title] = '���������') OR
    (m.[Title] = '������ ����� 3x0' AND s.[Title] = '������������') OR
    (m.[Title] = '������ ����� 1x3' AND s.[Title] = '�������� ����������C��') OR
    (m.[Title] = '������ ����� 2x2' AND s.[Title] = '�����') OR
    (m.[Title] = '������ ����� 1x3' AND s.[Title] = '���������') OR
    (m.[Title] = '������ ����� 1x3' AND s.[Title] = '���������������') OR
    (m.[Title] = '������� ����� 2x3' AND s.[Title] = '���') OR
    (m.[Title] = '������ ����� 2x2' AND s.[Title] = '��������') OR
    (m.[Title] = '������� ����� 2x3' AND s.[Title] = '������') OR
    (m.[Title] = '������ ����� 2x2' AND s.[Title] = '������') OR
    (m.[Title] = '������� ����� 2x3' AND s.[Title] = '���������������') OR
    (m.[Title] = '���� ����� 3x1' AND s.[Title] = '���������') OR
    (m.[Title] = '������ ������� 0x2' AND s.[Title] = '�������� ����������C��') OR
    (m.[Title] = '������� ����� 2x1' AND s.[Title] = '�������� �����') OR
    (m.[Title] = '������ ������� 0x2' AND s.[Title] = '�������') OR
    (m.[Title] = '���� ������� 2x3' AND s.[Title] = '�������') OR
    (m.[Title] = '������ ����� 3x0' AND s.[Title] = '��������������������') OR
    (m.[Title] = '���� ������� 2x3' AND s.[Title] = '������������') OR
    (m.[Title] = '������� ����� 2x1' AND s.[Title] = '�������� �����IT���') OR
    (m.[Title] = '���� ������� 0x0' AND s.[Title] = '������������') OR
    (m.[Title] = '������� ����� 1x3' AND s.[Title] = '�������� ������������') OR
    (m.[Title] = '���� ����� 1x3' AND s.[Title] = 'C��') OR
    (m.[Title] = '���� ������� 0x0' AND s.[Title] = '����������') OR
    (m.[Title] = '���� ������� 0x0' AND s.[Title] = '�����') OR
    (m.[Title] = '������� ����� 1x3' AND s.[Title] = '�������') OR
    (m.[Title] = '���� ����� 2x1' AND s.[Title] = '����������') OR
    (m.[Title] = '������ ������� 1x3' AND s.[Title] = '�������� ����������C��') OR
    (m.[Title] = '���� ����� 2x1' AND s.[Title] = '������������') OR
    (m.[Title] = '������ ������� 1x3' AND s.[Title] = '�������� ������������') OR
    (m.[Title] = '������ ������� 1x3' AND s.[Title] = '�����������') OR
    (m.[Title] = '���� ����� 2x1' AND s.[Title] = '��������') OR
    (m.[Title] = '������� ����� 2x1' AND s.[Title] = '�������') OR
    (m.[Title] = '���� ����� 2x1' AND s.[Title] = '�������� ����������C��') OR
    (m.[Title] = '���� ����� 0x1' AND s.[Title] = '�������� ����������C��') OR
    (m.[Title] = '���� ����� 0x1' AND s.[Title] = '������������') OR
    (m.[Title] = '������ ������� 1x2' AND s.[Title] = '�����������') OR
    (m.[Title] = '������� ����� 3x1' AND s.[Title] = 'C��C������') OR
    (m.[Title] = '������� ����� 3x1' AND s.[Title] = '���') OR
    (m.[Title] = '������� ����� 3x1' AND s.[Title] = '�������������') OR
    (m.[Title] = '������� ����� 3x1' AND s.[Title] = '��������');

SELECT * FROM [dbo].[MaterialType];
SELECT * FROM [dbo].[Supplier];
SELECT * FROM [dbo].[Material];
SELECT * FROM [dbo].[MaterialCountHistory];
SELECT * FROM [dbo].[MaterialSupplier];
GO
