USE [master]
GO
/****** Object:  Database [LSHOP]    Script Date: 6/26/2021 11:27:58 AM ******/
CREATE DATABASE [LSHOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LSHOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LSHOP.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LSHOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LSHOP_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LSHOP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LSHOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LSHOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LSHOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LSHOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LSHOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LSHOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [LSHOP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LSHOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LSHOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LSHOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LSHOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LSHOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LSHOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LSHOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LSHOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LSHOP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LSHOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LSHOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LSHOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LSHOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LSHOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LSHOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LSHOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LSHOP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LSHOP] SET  MULTI_USER 
GO
ALTER DATABASE [LSHOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LSHOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LSHOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LSHOP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LSHOP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LSHOP]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Image] [nvarchar](100) NULL,
	[Title] [nvarchar](500) NULL,
	[ShortDes] [nvarchar](500) NULL,
	[Fulldecription] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[Metakey] [nvarchar](max) NULL,
	[Metadesc] [nvarchar](max) NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Links]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_Links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Orders] [int] NULL,
	[Position] [nvarchar](max) NOT NULL,
	[TableId] [int] NULL,
	[ParentId] [int] NOT NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [real] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExportDate] [datetime] NULL,
	[DeliveryAddress] [nvarchar](max) NULL,
	[DeliveryName] [nvarchar](max) NULL,
	[DeliveryPhone] [nvarchar](max) NULL,
	[DeliveryEmail] [nvarchar](max) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Img] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Metakey] [nvarchar](max) NOT NULL,
	[Metadesc] [nvarchar](max) NOT NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Number] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[PriceSale] [real] NOT NULL,
	[Metakey] [nvarchar](max) NOT NULL,
	[Metadesc] [nvarchar](max) NOT NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[Position] [nvarchar](max) NOT NULL,
	[Img] [nvarchar](max) NOT NULL,
	[Orders] [int] NOT NULL,
	[Attribute] [nvarchar](50) NULL,
	[Sort_order] [nvarchar](50) NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[Orders] [int] NULL,
	[Metakey] [nvarchar](max) NOT NULL,
	[Metadesc] [nvarchar](max) NOT NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/26/2021 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Gender] [int] NULL,
	[Roles] [int] NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[Access] [int] NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [nvarchar](50) NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Image], [Title], [ShortDes], [Fulldecription], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'Thời trang và quần áo', N'thoi-trang-va-quan-ao', 0, N'Content/images/banners/thiet-ke-shop-giay-dep-woody of shoes-4.jpg', N'Thời trang nam nữ hot', N'Thời trang hot', N'“Thời trang không nhất thiết phải đến từ nhãn mác, thương hiệu. Thời trang đến từ những thứ ẩn bên trong tâm hồn, tính cách của bạn”', 1, N'1', N'1', CAST(N'2021-04-12 00:08:42.000' AS DateTime), N'mai xuan loi', CAST(N'2021-06-25 18:42:00.000' AS DateTime), N'1', 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Image], [Title], [ShortDes], [Fulldecription], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'Ô tô và xe máy', N'oto-va-xe-may', 0, N'Content/images/banners/20191112-Backdrop-lai-thu-640x360.jpg', N'Ô tô và xe máy hot', N'Phương tiện giảm giá sốc chỉ có trong hôm nay', N'Giá thành cao khiến bạn chẳng có đủ tiền để có một chiếc xe. Đừng lo đã có LShop đây', 2, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 19:26:25.650' AS DateTime), NULL, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Image], [Title], [ShortDes], [Fulldecription], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (3, N'Điện thoại- máy tính bảng', N'dien-thoai-may-tinh-bang', 0, N'Content/images/banners/31b6gyvgyvjbjnjj1377427106-1455840758.jpg', N'Điện thoại mới nhất', N'Điện thoại chính hãng giao hàng miễn phí ', N'Mua online điện thoại, smartphone, điện thoại thông minh giá rẻ, chính hãng. Giao nhanh, đem nhiều mẫu chọn, cà thẻ tại nhà. Trả góp 0%, bảo hánh nhanh chóng, tiết kiệm chi phí', 3, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 19:26:51.007' AS DateTime), NULL, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Image], [Title], [ShortDes], [Fulldecription], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (4, N'Nhà cửa - đời sống ', N'nha-cua-doi-song', 0, N'Content/images/banners/4515f0bb-953d-4343-9686-5f65c230c122.jpg', N'Đồ gia dụng', N'Đồ gia dụng chất luongj tốt nhất', N'Mua sắm đồ gia dụng, thiết bị nhà bếp cao cấp Malloca nhận quà tặng giá trị tới 22 triệu. Cung cấp thiết bị nhà bếp sang trọng và hiện đại. Malloca đồng hành cùng gia đình bạn.', 4, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 19:27:15.020' AS DateTime), NULL, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Image], [Title], [ShortDes], [Fulldecription], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (5, N'Hàng tiêu dùng - thực phẩm', N'hang-tieu-dung-thuc-pham', 0, N'Content/images/banners/shutterstock365425265-860x9999-157000283775029168135.jpg', N'Hàng tiêu dùng mua nhiều', N'Hàng tiêu dùng giảm giá đến 50%', N'Các nhà sản xuất trong ngành hàng tiêu dùng hoạt động trong lĩnh vực tinh vi với tốc độ cao. Họ luôn phải đáp ứng các kì vọng và xu hướng thay đổi theo người tiêu dùng, đặc biệt là bộ phận giới trung lưu và dân cư đô thị đang mở rộng trên quy mô toàn cầu hiện nay.', 5, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 19:27:31.503' AS DateTime), NULL, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Image], [Title], [ShortDes], [Fulldecription], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (6, N'Điện tử - điện lạnh', N'dien-tu-dien-lanh', 0, N'Content/images/banners/dien-tu-dien-lanh-bach-khoa.jpg', N'Thiết bị điện tử - điện lạnh  mới', N'Máy lạnh chính hãng giá như hạt giẻ', N'【Nhanh nhất】+ 【Tốt Nhất】 + 【Chuyên Nghiệp】Tại TP.HCM. “Niềm tin của mọi gia đình!” tivi mất nguồn do sét đánh tivi bị ẩm do nước. tivi ánh sáng mờ không có hình. thay màn hình tivi giá rẻ. thay màn hình hãng. sửa chữa tại hcm. sửa chữa tận nhà.', 6, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 19:27:57.497' AS DateTime), NULL, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Image], [Title], [ShortDes], [Fulldecription], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (9, N'Laptop - thiết bị IT', N'laptop-thiet-bi-dien-tu', 0, N'Content/images/banners/laptop-cho-do-hoa-chuyen-nghiep-2019-a78694c2-1221-4946-b4e7-78aeafab0b53.jpg', N'Laptop - Công nghệ mới', N'Công nghệ mới chính hãng', N'【Sp chính hãng, Mới 100%, BH 1 Năm Dell】LShop Được Chứng Nhận Đại Lý Uỷ Quyền DellVN. Giá Cạnh Tranh, Trả Góp 0%, 1 Đổi 1 Trong 10 Ngày, Mua Ngay Để Nhận Giá ƯuĐãi. Hỗ Trợ Trả Góp 0% Nhiều Quà Hấp Dẫn. Sản Phẩm Full Box.', 7, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 19:28:25.087' AS DateTime), NULL, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Image], [Title], [ShortDes], [Fulldecription], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (11, N'Sách - vở - truyện', N'sach-vo-truyen', 0, N'Content/images/banners/sach.jpg', N'Sách hay mới nhất', N'Sách mới nhưng giá cũ', N'Sách hay, các tác phẩm văn học hay, tin tức về sách, tiểu thuyết, truyện hay được giới thiệu và cập nhật trên LShop.com', 8, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 19:35:37.573' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Categorys] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Detail], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'mai xuan loi', N'xuanloi.1234@gmail.com', N'039191764', N'dsfsd', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Detail], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'mxl', N'thanhacr@gmail.com', N'379191764', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo finibus luctus et vitae lorem', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[Links] ON 

INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (4, N'thoi-trang-va-quan-ao', N'category', 1)
INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (5, N'oto-va-xe-may', N'category', 2)
INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (7, N'dien-thoai-may-tinh-bang', N'category', 3)
INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (8, N'nha-cua-doi-song', N'category', 4)
INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (9, N'hang-tieu-dung-thuc-pham', N'category', 5)
INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (10, N'dien-tu-dien-lanh', N'category', 6)
INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (11, N'laptop-thiet-bi-dien-tu', N'category', 9)
INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (12, N'sach-vo-truyen', N'category', 11)
INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (15, N'tin-tuc', N'topic', 2)
INSERT [dbo].[Links] ([Id], [Slug], [Type], [TableId]) VALUES (16, N'gioi-thieu', N'news', 3)
SET IDENTITY_INSERT [dbo].[Links] OFF
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [Orders], [Position], [TableId], [ParentId], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'Sản phẩm', N'tat-ca-san-pham', N'1', 2, N'mainmenu', 1, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [Orders], [Position], [TableId], [ParentId], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (5, N'Tin tức', N'tat-ca-tin-tuc', N'1', 3, N'mainmenu', 1, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [Orders], [Position], [TableId], [ParentId], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (16, N'Giới thiệu', N'gioi-thieu', N'1', 4, N'mainmenu', 1, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [Orders], [Position], [TableId], [ParentId], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (17, N'Trang chủ', N'trang-chu', N'1', 1, N'mainmenu', 1, 0, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [TopId], [Title], [Slug], [Detail], [Img], [Type], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (3, 1, N'PostsPage', N'gioi-thieu', N'Nội dung trang bán hàng', N'1', N'page', N'gioi', N'thieu', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Posts] ([Id], [TopId], [Title], [Slug], [Detail], [Img], [Type], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (5, 1, N'Giảm giá điện thoại lên đến 2 triệu đồng', N'giam-gia-dien-thoai-len-den-2-trieu-dong', N'Giảm giá điện thoại lên đến 2 triệu đồng, máy tính bảng giảm liền 20%, giao hàng chỉ trong vòng 2 giờ', N'Content/images/posts/banner1.jpg', N'news', N'tin', N'tuc', NULL, NULL, CAST(N'2021-06-25 21:35:05.957' AS DateTime), NULL, 1)
INSERT [dbo].[Posts] ([Id], [TopId], [Title], [Slug], [Detail], [Img], [Type], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (6, 1, N'Giảm giá tai nghe cực khủng + miễn phí vận chuyển nội thành', N'giam-gia-tai-nghe-cuc-khung-mien-phi-van-chuyen-noi-thanh', N'Hãy nhanh chân đến với các chi nhánh của LShope ngay lập tức hoặc nhất điện thoại lên và tải ngay app LShope để trãi nghiệm hàng nghìn ưu đãi hấp dẫn', N'Content/images/posts/banner2.jpg', N'page', N'1', N'1', NULL, NULL, CAST(N'2021-06-25 21:28:19.737' AS DateTime), NULL, 0)
INSERT [dbo].[Posts] ([Id], [TopId], [Title], [Slug], [Detail], [Img], [Type], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (7, 1, N'Giảm giá tai nghe cực khủng + miễn phí vận chuyển nội thành', N'giam-gia-tai-nghe-cuc-khung-mien-phi-van-chuyen-noi-thanh', N'Hãy nhanh chân đến với các chi nhánh của LShope ngay lập tức hoặc nhất điện thoại lên và tải ngay app LShope để trãi nghiệm hàng nghìn ưu đãi hấp dẫn', N'Content/images/posts/banner2.jpg', N'news', N'1', N'1', NULL, NULL, CAST(N'2021-06-25 21:35:53.133' AS DateTime), NULL, 1)
INSERT [dbo].[Posts] ([Id], [TopId], [Title], [Slug], [Detail], [Img], [Type], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (8, 1, N'Ngày của cha giảm giá sản phẩm dành cho nam cực hot ', N'ngay-cua-cha-giam-gia-san-pham-danh-cho-nam-cuc-hot', N'Hãy nhanh chân đến với các chi nhánh của LShope ngay lập tức hoặc nhất điện thoại lên và tải ngay app LShope để trãi nghiệm hàng nghìn ưu đãi hấp dẫn', N'Content/images/posts/banner4.jpg', N'news', N'1', N'1', NULL, NULL, CAST(N'2021-06-25 21:37:53.387' AS DateTime), NULL, 1)
INSERT [dbo].[Posts] ([Id], [TopId], [Title], [Slug], [Detail], [Img], [Type], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (9, 1, N'Giảm giá thiết bị chơi game', N'giam-gia-thiet-bi-choi-game', N'Hãy nhanh chân đến với các chi nhánh của LShope ngay lập tức hoặc nhất điện thoại lên và tải ngay app LShope để trãi nghiệm hàng nghìn ưu đãi hấp dẫn', N'Content/images/posts/banner3.jpg', N'news', N'1', N'1', NULL, NULL, CAST(N'2021-06-25 21:39:53.410' AS DateTime), NULL, 1)
INSERT [dbo].[Posts] ([Id], [TopId], [Title], [Slug], [Detail], [Img], [Type], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (10, 1, N'Ngày của cha nhưng giảm giá quần áo trẻ em', N'ngay-cua-cha-nhung-giam-gia-quan-ao-tre-en', N'Hãy nhanh chân đến với các chi nhánh của LShope ngay lập tức hoặc nhất điện thoại lên và tải ngay app LShope để trãi nghiệm hàng nghìn ưu đãi hấp dẫn', N'Content/images/posts/banner6.jpg', N'news', N'1', N'1', NULL, NULL, CAST(N'2021-06-25 21:41:59.350' AS DateTime), NULL, 1)
INSERT [dbo].[Posts] ([Id], [TopId], [Title], [Slug], [Detail], [Img], [Type], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (11, 1, N'Đồng hồ thông minh mới ra mắt mà đã giảm', N'dong-ho-thong-minh-moi-ra-mat-ma-da-giam', N'Hãy nhanh chân đến với các chi nhánh của LShope ngay lập tức hoặc nhất điện thoại lên và tải ngay app LShope để trãi nghiệm hàng nghìn ưu đãi hấp dẫn', N'Content/images/posts/banner-item2.jpg', N'news', N'1', N'1', NULL, NULL, CAST(N'2021-06-25 21:43:31.257' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, 1, N'Áo thun nam', N'ao-thun-nam', N'Content/images/items/1.jpg', N'<p>hời gian giao h&agrave;ng dự kiến cho sản phẩm n&agrave;y l&agrave; từ 7-9 ng&agrave;y</p>

<p>Họa tiết: m&agrave;u trơn</p>

<p>D&agrave;nh cho: nam Cỡ: S M L XL 2XL 3XL 4XL 5XL</p>

<p>Chiều d&agrave;i tay &aacute;o: tay d&agrave;i</p>

<p>Th&agrave;nh phần chất liệu: cotton</p>
', 1, 100000, 80000, N'1', N'1', NULL, NULL, CAST(N'2021-06-24 13:58:50.000' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (3, 2, N'Xe Honda', N'xe-honda', N'Content/images/items/xe.jpg', N'<p>Thiết kế ph&iacute;a trước kế thừa sự năng động vốn c&oacute; của Vision nhưng ấn tượng hơn với diện mạo ho&agrave;n to&agrave;n mới. Hiệu ứng &aacute;nh s&aacute;ng đẹp mắt bằng việc kết hợp giữa đường n&eacute;t thiết kế ba chiều sắc n&eacute;t v&agrave; hệ thống đ&egrave;n trước với khả năng chiếu s&aacute;ng mạnh mẽ tổng h&ograve;a n&ecirc;n một thiết kế trẻ trung, hiện đại v&agrave; năng động. Đặc biệt đ&egrave;n trang tr&iacute; ph&iacute;a trước được trang bị c&ocirc;ng nghệ LED th&ocirc;ng minh (&aacute;p dụng cho phi&ecirc;n bản Đặc biệt v&agrave; Cao cấp), mang đến cảm gi&aacute;c sang trọng v&agrave; hiện đại.</p>
', 1, 9999999, 8888888, N'1', N'1', NULL, NULL, CAST(N'2021-06-24 13:59:08.000' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (5, 3, N'Điện thoại ', N'dien-thoai', N'Content/images/items/dienthoai.jpg', N'<p>iPhone 12 Pro Max sở hữu m&agrave;n h&igrave;nh k&iacute;ch thước kh&oacute; tin, l&ecirc;n tới 6,7 inch, cho bạn trải nghiệm h&igrave;nh ảnh cực đ&atilde;. Chất lượng đến từ một m&agrave;n h&igrave;nh c&ocirc;ng nghệ Super Retina XDR, tấm nền OLED cao cấp v&agrave; độ ph&acirc;n giải si&ecirc;u cao thực sự qu&aacute; tuyệt vời.</p>

<p>Mọi thứ đều trở n&ecirc;n sống động tr&ecirc;n&nbsp;<strong>iPhone 12 Pro Max</strong>, đặc biệt khi bạn xem ảnh, xem phim hay chơi game. C&ograve;n bất ngờ hơn khi d&ugrave; m&agrave;n h&igrave;nh lớn hơn, nhưng iPhone 12 Pro Max vẫn gọn g&agrave;ng như thế hệ trước nhờ viền m&agrave;n h&igrave;nh được tối ưu si&ecirc;u mỏng đầy tinh tế.</p>
', 1, 5699000, 4899000, N'1', N'1', NULL, NULL, CAST(N'2021-06-24 14:01:54.000' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (6, 4, N'Máy giặt', N'may-giat', N'Content/images/items/maygiat.jpg', N'<p>Loại m&aacute;y giặt</p>

<p>Lồng ngang</p>

<p>Khối lượng giặt</p>

<p>8.5 Kg</p>

<p>C&ocirc;ng nghệ Inverter</p>

<p>Inverter</p>

<p>Khối lượng đồ giặt</p>

<p>Từ 7.5 Kg - 8.5 Kg</p>

<p>Động Cơ</p>

<p>Dẫn động trực tiếp</p>

<p>C&ocirc;ng nghệ giặt</p>

<p>AI Direct Drive: Tự động tối ưu h&oacute;a chuyển động giặt qua cảm biến tự động x&aacute;c định chất liệu đồ giặt để giảm hư tổn quần &aacute;o, C&ocirc;ng nghệ giặt hơi nước Steam+, Giặt 6 chuyển động</p>
', 1, 5300000, 4700000, N'1', N'1', NULL, NULL, CAST(N'2021-06-24 14:02:11.000' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (8, 5, N'Khô bò', N'kho-bo', N'Content/images/items/khobo.jpg', N'<p>🐮 KH&Ocirc; B&Ograve; GI&Ograve;N HỒNG NGỰ 🐮 🐂 Kh&ocirc; b&ograve; được l&agrave;m 100% từ b&ograve; tươi n&ecirc;n miếng b&ograve; to rất đặc biệt, bao chuẩn Hồng Ngự. 🍀 🐂 B&ograve; sấy kh&ocirc; gi&ograve;n rụm, kh&ocirc;ng qu&aacute; gia vị n&ecirc;n vẫn giữ nguy&ecirc;n vị thơm của miếng b&ograve;. 🐂Khi ăn kh&ocirc; b&ograve; sẽ cảm nhận được vị thịt tươi ngay từ miếng đầu ti&ecirc;n. Miếng kh&ocirc; b&ograve; to đẹp mắt, rất th&iacute;ch hợp để l&agrave;m qu&agrave; biếu tặng. 🍺🍺👍</p>
', 1, 99000, 75000, N'1', N'1', NULL, NULL, CAST(N'2021-06-24 14:02:23.000' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (9, 6, N'Máy lạnh', N'may-lanh', N'Content/images/items/maylanh.jpg', N'<p>C&ocirc;ng suất l&agrave;m lạnh:1.5 HP - 12.000 BTU C&ocirc;ng suất sưởi ấm:Kh&ocirc;ng c&oacute; sưởi ấm Phạm vi l&agrave;m lạnh hiệu quả:Từ 15 - 20 m2 (từ 40 đến 60 m3) C&ocirc;ng nghệ Inverter:M&aacute;y lạnh Inverter Loại m&aacute;y:Điều ho&agrave; 1 chiều (chỉ l&agrave;m lạnh) C&ocirc;ng suất ti&ecirc;u thụ trung b&igrave;nh:1.03 kW/h Nh&atilde;n năng lượng tiết kiệm điện:5 sao (Hiệu suất năng lượng 5.40)</p>
', 1, 7590000, 6500000, N'1', N'1', NULL, NULL, CAST(N'2021-06-24 14:02:39.000' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (10, 9, N'Laptop dell', N'laptop-dell', N'Content/images/items/dell.jpg', N'<p>❌ Ch&ecirc;́ đ&ocirc;̣ bảo hành: 👉 Bảo hành 1 đ&ocirc;̉i 1 trong vòng 1 tháng n&ecirc;́u có l&ocirc;̃i từ nhà sản xu&acirc;́t. 👉 Bảo hành ph&acirc;̀n cứng 6 tháng. 👉 Bảo hành trọn đời, h&ocirc;̃ trợ dịch vụ ph&acirc;̀n m&ecirc;̀m. 👉 Mi&ecirc;̃n phí v&acirc;̣n chuy&ecirc;̉n bảo hành. ❌ Qu&agrave; tặng gi&aacute; trị k&egrave;m theo: ✔️ Tặng Sạc Chu&acirc;̉n (Chu&acirc;̉n dòng, chu&acirc;̉n ngu&ocirc;̀n) ✔️ Tặng Cable USB (Kết nối với m&aacute;y t&iacute;nh) ✔️ Tặng Đế Dựng/I-ring (Gi&uacute;p để m&aacute;y l&ecirc;n b&agrave;n xem phim m&agrave; kh&ocirc;ng cần cầm) ✔️ Tặng Thẻ giảm gi&aacute; (C&aacute;c bạn mua lần 2 sẽ được giảm gi&aacute; 50-100k) ✔️ Tặng Bao da/Ốp lưng (C&aacute;c phụ kiện được tặng t&ugrave;y mỗi dịp v&agrave; g&oacute;i sản phẩm)</p>

<p>❌C&acirc;́u hình chi ti&ecirc;́t</p>

<p>M&agrave;n h&igrave;nh: IPS</p>

<p>Độ ph&acirc;n giải: HD</p>

<p>K&iacute;ch thước: 12.5&quot; (16:9)</p>

<p>Hệ điều h&agrave;nh: Win 10</p>

<p>RAM: 4GB</p>

<p>CPU: Intel I5 4200</p>

<p>Bộ nhớ trong: 128GB</p>

<p>Camera sau: No</p>

<p>Camera trước: 2.0 Quay</p>

<p>Video: Full HD Kết nối mạng:</p>

<p>Wifi Hỗ trợ sim: No</p>

<p>Pin: NoI</p>
', 1, 9700000, 8999000, N'1', N'1', NULL, NULL, CAST(N'2021-06-24 14:02:53.000' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (11, 11, N'Sách toeic', N'sach-toeic', N'Content/images/items/toeic.jpg', N'<p>&nbsp;</p>

<p>C&ocirc;ng ty ph&aacute;t h&agrave;nh First News - Tr&iacute; Việt T&aacute;c Giả Nhiều T&aacute;c Giả Ng&agrave;y xuất bản 03-2019 K&iacute;ch thước 19 x 26 cm Loại b&igrave;a B&igrave;a mềm Số trang 456 SKU 2975785987205 Nh&agrave; xuất bản Nh&agrave; Xuất Bản Tổng hợp TP.HCM</p>
', 1, 130000, 100000, N'1', N'1', NULL, NULL, CAST(N'2021-06-24 14:03:05.000' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (17, 1, N'Áo sơ mi nam xanh dương', N'ao-so-mi-nam-xanh-duong', N'Content/images/items/aosominam.jpg', N'<p>Thời gian giao h&agrave;ng dự kiến cho sản phẩm n&agrave;y l&agrave; từ 7-9 ng&agrave;y</p>

<p>Họa tiết: m&agrave;u trơn</p>

<p>D&agrave;nh cho: nam Cỡ: S M L XL 2XL 3XL 4XL 5XL</p>

<p>Chiều d&agrave;i tay &aacute;o: tay d&agrave;i</p>

<p>Th&agrave;nh phần chất liệu: cotton</p>
', 1, 150000, 99000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:24:34.297' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (18, 1, N'Đầm nữ màu trắng', N'dam-nu-mau-trang', N'Content/images/items/damnu.jpg', N'<p>Thời gian giao h&agrave;ng dự kiến cho sản phẩm n&agrave;y l&agrave; từ 7-9 ng&agrave;y</p>

<p>Họa tiết: m&agrave;u trơn</p>

<p>D&agrave;nh cho: nữ&nbsp;</p>

<p>Cỡ: S M L XL 2XL 3XL 4XL 5XL</p>

<p>Chiều d&agrave;i tay &aacute;o: tay d&agrave;i</p>

<p>Th&agrave;nh phần chất liệu: cotton</p>
', 1, 200000, 149000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:26:31.760' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (19, 1, N'Giày nam sneaker nam', N'giay-sneaker-nam', N'Content/images/items/15.jpg', N'<ul>
	<li>Phong c&aacute;ch H&agrave;n Quốc trẻ trung.</li>
	<li>Th&iacute;ch hợp khi tham gia c&aacute;c hoạt động vui chơi, du lịch, chơi thể thao như chơi b&oacute;ng rổ,&hellip;</li>
	<li>Size: 39-44</li>
	<li>Chiều cao đế: 2 cm</li>
	<li>Chất liệu th&acirc;n gi&agrave;y: Da PU.</li>
	<li>Chất liệu đế: Cao su tổng hợp.</li>
	<li>Trọng lượng: 0,75kg</li>
	<li>C&oacute; sẵn tại cửa h&agrave;ng.</li>
</ul>
', 1, 1500000, 999000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:28:46.697' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (20, 1, N'Quần thun nam mát mẻ', N'quan-thun-nam-mat-me', N'Content/images/items/quandainam.jpg', N'<p>&bull; Bộ sưu tập: ESSENTIALS<br />
&bull; Chất liệu: 70% Cotton, 30% Polyester. Chất liệu th&ocirc;ng tho&aacute;ng, thấm h&uacute;t mồ h&ocirc;i tốt v&agrave; c&oacute; độ bền cao.<br />
&bull; Thiết kế: Kiểu quần ngắn, form d&aacute;ng đơn giản, thiết kế lưng thun co gi&atilde;n thoải m&aacute;i kết hợp d&acirc;y r&uacute;t tiện dụng. Họa tiết chim bồ c&acirc;u được th&ecirc;u nổi bật ở phần t&uacute;i.<br />
&bull; Ph&ugrave; hợp: Vui chơi, dạo phố, đi học, đi l&agrave;m, tập luyện thể thao.<br />
&bull; Nguồn gốc xuất xứ: Mỹ</p>
', 1, 120000, 79000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:30:55.723' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (21, 1, N'Giày Biti''sHunter nam ', N'giay-biiti''shunter-nam', N'Content/images/items/giaynam.jpg', N'<ul>
	<li><strong>Gi&agrave;y Thể Thao Nam Biti&#39;s Hunter Street x VietMax - Arising Vietnam R3 Gold DSMH05500</strong>&nbsp;nằm trong BST Arising Vietnam d&agrave;nh cho Thế hệ trẻ vươn m&igrave;nh. Một năm nhiều biến động, tuổi trẻ Việt vẫn tự h&agrave;o khẳng định vị thế Việt khắp năm ch&acirc;u.</li>
	<li>Lấy cảm hứng từ vị thế &quot;Rồng bay&quot;, BST c&oacute; ng&ocirc;n ngữ thiết kế mạnh mẽ, kỳ c&ocirc;ng v&agrave; độc đ&aacute;o đến từng chi tiết như vảy da, chỉ viền, khoen gi&agrave;y, d&acirc;y gi&agrave;y. Đặc biệt, biểu tượng Rồng tr&ecirc;n lưỡi g&agrave; được s&aacute;ng tạo từ n&eacute;t hoa văn quen thuộc của</li>
	<li>Trống Đồng, đại diện cho sự song h&agrave;nh của bản sắc Việt v&agrave; s&aacute;ng tạo Việt.</li>
	<li>Phom d&aacute;ng cổ cao đầu ti&ecirc;n từ Biti&#39;s Hunter Street.</li>
</ul>
', 1, 799000, 599000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:34:04.257' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (22, 1, N'Giày sneaker nữ ', N'giay-sneaker-nu', N'Content/images/items/giaynu.jpg', N'<ul>
	<li>Phong c&aacute;ch H&agrave;n Quốc trẻ trung.</li>
	<li>Th&iacute;ch hợp khi tham gia c&aacute;c hoạt động vui chơi, du lịch,...</li>
	<li>Size: 39-44</li>
	<li>Chiều cao đế: 2 cm</li>
	<li>Chất liệu th&acirc;n gi&agrave;y: Da PU.</li>
	<li>Chất liệu đế: Cao su tổng hợp.</li>
	<li>Trọng lượng: 0,75kg</li>
	<li>C&oacute; sẵn tại cửa h&agrave;ng.</li>
</ul>
', 1, 125000, 79000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:35:47.703' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (23, 1, N'Marshmallow 1.0 Backpack – Balo Nam Nữ', N'marshmallow-1.0 -backpack–balonamnu', N'Content/images/items/Backpack-box-14-5-2.jpg', N'<ul>
	<li>&ecirc;n sản phẩm: Marshmallow 1.0 Backpack &ndash; Balo nhiều ngăn trong suốt k&egrave;m m&oacute;c kho&aacute; trang tr&iacute;</li>
	<li>K&iacute;ch thước: 33 x 12 x 45 cm</li>
	<li>Chất liệu: Oxford</li>
	<li>Chức năng: Đi học, đi chơi, đi l&agrave;m</li>
	<li>M&ocirc; tả: Balo nhẹ v&agrave; tho&aacute;ng, chống thấm nước, 1 ngăn lớn, nhiều ngăn phụ, c&oacute; ngăn đựng laptop.</li>
	<li>Ph&ugrave; hợp cho cả nam nữ</li>
</ul>
', 1, 465000, 355000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:41:15.267' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (24, 1, N'Áo khoác Hoodie trơn màu xanh dương', N'ao-khoac-hoodie tron-mau-xanh-duong', N'Content/images/items/Hoodie-Basic-Xanh-Duong-9.jpg', N'<ul>
	<li>Chất liệu: 80% Cotton, 20% Polyester.</li>
	<li>C&ocirc;ng nghệ dệt vải da c&aacute; tho&aacute;ng m&aacute;t.</li>
	<li>D&acirc;y r&uacute;t bọc nh&ocirc;m chống x&ugrave; l&ocirc;ng.</li>
	<li>Hướng dẫn giặt ủi: Giặt tay, kh&ocirc;ng giặt nước n&oacute;ng, kh&ocirc;ng phơi trực tiếp dưới &aacute;nh nắng.</li>
</ul>
', 1, 455000, 355000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:49:24.377' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (25, 2, N'Cammera xe hơi', N'cammera-xe-hoi', N'Content/images/items/camxehoi.jpg', N'<pre>
<strong>Chống nước 10m, m&agrave;n h&igrave;nh cảm ứng điều khiển bằng giọng n&oacute;i</strong></pre>

<p>Với k&iacute;ch thước nhỏ gọn c&ugrave;ng trọng lượng 136 g, camera h&agrave;nh tr&igrave;nh GoPro Hero 8 rất gọn nhẹ, đ&uacute;ng với t&iacute;nh chất của một thiết bị&nbsp;<a href="https://cellphones.com.vn/phu-kien/camera/hanh-trinh.html" target="_blank">camera h&agrave;nh tr&igrave;nh ch&iacute;nh h&atilde;ng</a>&nbsp;gắn liền với d&acirc;n phượt. Kh&ocirc;ng c&ograve;n vỏ bọc giống như GoPro&nbsp;Hero 6 v&agrave; Hero 7 trước đ&oacute;, nhưng GoPro 8 vẫn đảm bảo khả năng chống nước ở độ s&acirc;u l&ecirc;n đến 10m, th&iacute;ch hợp để quay trong điều kiện thời tiết xấu, lặn quay dưới nước.</p>
', 1, 650000, 499000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:53:39.000' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (26, 2, N'Dầu nhớt ô tô PROTEC', N'DAU-NHOT-ÔT-PRO-TEC', N'Content/images/items/daunhototo.jpg', N'<p>Dầu động cơ tổng hợp to&agrave;n phần hiệu suất cao cho động cơ xăng v&agrave; diesel hiện đại. N&oacute; đ&aacute;p ứng c&aacute;c y&ecirc;u cầu nghi&ecirc;m ngặt của c&aacute;c nh&agrave; sản xuất &ocirc; t&ocirc; h&agrave;ng đầu. Sản phẩm được thiết kế đặc biệt cho động cơ với c&ocirc;ng nghệ đa van, tăng &aacute;p hoặc phun trực tiếp.</p>

<p>Dầu nhờn đa cấp.&nbsp;100% Tổng hợp.</p>

<p>D&ugrave;ng cho động cơ Xăng v&agrave; Diesel.</p>

<p>Ti&ecirc;u chuẩn: API SN, ILSAC GF-5</p>

<p>Sử dụng:&nbsp;Thay mới dầu nhờn động cơ:</p>

<p>&ndash; Sau mỗi&nbsp;15.000km&nbsp;khi d&ugrave;ng lọc dầu mới.</p>

<p>&ndash; Sau&nbsp;10.000km&nbsp;khi d&ugrave;ng lọc dầu cũ.</p>
', 1, 300000, 279000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 15:56:30.817' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (27, 2, N'Gương xe máy cao cấp', N'guong-xư-may-cao-cap', N'Content/images/items/guongxemay.jpg', N'<p>- Cung cấp c&aacute;c sản phẩm theo đ&uacute;ng ti&ecirc;u chuẩn với chất lượng tốt nhất;</p>

<p>- Gi&aacute; cả cạnh tranh;</p>

<p>- Đ&aacute;p ứng mọi y&ecirc;u cầu của kh&aacute;ch h&agrave;ng trong thời gian ngắn nhất;</p>

<p>- Đảm bảo về số lượng v&agrave; đ&uacute;ng chủng loại kh&aacute;ch đặt ;</p>

<p>- Tư vấn miễn ph&iacute; 24/24 cho qu&yacute; kh&aacute;ch h&agrave;ng về c&aacute;c sản phẩm của ch&uacute;ng t&ocirc;i, bất cứ thắc mắc g&igrave; trước v&agrave; sau khi mua sản phẩm ;</p>

<p>- Shop chỉ cung cấp những sản phẩm c&oacute; chất lượng tốt nhất tới tay kh&aacute;ch h&agrave;ng.</p>

<p>Với phương ch&acirc;m &ldquo;Sự h&agrave;i l&ograve;ng của qu&yacute; kh&aacute;ch l&agrave; th&agrave;nh c&ocirc;ng của ch&uacute;ng t&ocirc;i&rdquo;&nbsp;Shop&nbsp;lu&ocirc;n lu&ocirc;n lắng nghe v&agrave; sẵn s&agrave;ng tiếp thu mọi &yacute; kiến g&oacute;p &yacute; của qu&yacute; kh&aacute;ch h&agrave;ng;&nbsp; để ng&agrave;y c&agrave;ng ho&agrave;n thiện hơn c&aacute;c d&ograve;ng sản phẩm ch&iacute;nh, n&acirc;ng cao t&iacute;nh năng v&agrave; giảm gi&aacute; th&agrave;nh sản xuất, mang lại cho kh&aacute;ch h&agrave;ng nhiều sự lựa chọn với gi&aacute; cả hợp l&yacute; nhất.</p>
', 1, 120000, 99000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:02:24.193' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (28, 2, N'Miếng lót sàn ô tô', N'mieng-lot-san-oto', N'Content/images/items/lotsanoto.jpg', N'<ul>
	<li>XẾ CƯNG TR&Acirc;N TRỌNG GỬI ĐẾN KH&Aacute;CH H&Agrave;NG SI&Ecirc;U PHẨM ĐẦU NĂM 2020- THẢM L&Oacute;T S&Agrave;N CHO XE &Ocirc; T&Ocirc; TỪ 5D,...8D&nbsp;- NƯỚC HOA, TINH DẦU,...TRONG XE &Ocirc; T&Ocirc;- BỌC V&Ocirc; LĂNG CHO XE TH&Ecirc;M PHẦN MẠNH MẼ.- V&Iacute; ĐỰNG GIẤY TỜ V&Agrave; RẤT NHIỀU MẶT H&Agrave;NG KH&Aacute;CH,MỌI CHI TIẾT VUI LONG LI&Ecirc;N HỆ CHO SHOP THEO SỐ M&Aacute;YLH : 0846779111TR&Acirc;N TRỌNG CẢM ƠN QU&Yacute; KH&Aacute;CH QUAN T&Acirc;M TỚI DAN H&Agrave;NG CỦA CH&Uacute;NG T&Ocirc;I.</li>
</ul>
', 1, 500000, 485000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:03:57.997' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (29, 2, N'Phuộc nhún dành cho xe máy', N'phuoc-nhun-danh-cho-xe-may', N'Content/images/items/phuocnhunxemay.jpg', N'<ul>
	<li>Phuộc nh&uacute;n sau YSS b&igrave;nh dầu gắn cho c&aacute;c xe W Dr Si Ju Axelo ...c&oacute; n&uacute;t tăng chỉnh kiểu , mẫu m&atilde; chất chơi s&aacute;ng xe nha anh em , b&ecirc;n shop em h&agrave;ng c&oacute; sẵn, anh em cứ l&ecirc;n đơn , em gửi h&agrave;ng trong 1 nốt nhạc n&egrave;</li>
</ul>
', 1, 990000, 889000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:07:29.143' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (30, 2, N'Xe Mô tô R15 PLT', N'xe-moto-r15-plt', N'Content/images/items/r15.jpg', N'<p>Loại 4 th&igrave;, 4 van, l&agrave;m m&aacute;t bằng dung dịch, SOHC Bố tr&iacute; xi lanh Xy lanh đơn Dung t&iacute;ch xy lanh (CC) 155 Đường k&iacute;nh v&agrave; h&agrave;nh tr&igrave;nh piston 58 x 58,7 mm Tỷ số n&eacute;n 11,6:1 C&ocirc;ng suất tối đa 14,2 kW/ 10.000 v&ograve;ng /ph&uacute;t M&ocirc; men cực đại 14,7 Nm/ 8.500 v&ograve;ng /ph&uacute;t Hệ thống khởi động Điện Hệ thống b&ocirc;i trơn C&aacute;cte ướt Mức ti&ecirc;u thụ nhi&ecirc;n liệu (l/100km) 2,02 Bộ chế h&ograve;a kh&iacute; Hệ thống phun xăng điện tử Hệ thống đ&aacute;nh lửa TCI Tỷ số truyền sơ cấp v&agrave; thứ cấp 3,042 - 3,429 Hệ thống ly hợp Ly hợp ướt, đa đĩa Kiểu hệ thống truyền lực B&aacute;nh răng ăn khớp, 6 số</p>
', 1, 1.5E+07, 1.2E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:15:05.617' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (31, 2, N'Xe vision 2017', N'xe-vision-2017', N'Content/images/items/vision.jpg', N'<p>Thiết kế ph&iacute;a trước kế thừa sự năng động vốn c&oacute; của Vision nhưng ấn tượng hơn với diện mạo ho&agrave;n to&agrave;n mới. Hiệu ứng &aacute;nh s&aacute;ng đẹp mắt bằng việc kết hợp giữa đường n&eacute;t thiết kế ba chiều sắc n&eacute;t v&agrave; hệ thống đ&egrave;n trước với khả năng chiếu s&aacute;ng mạnh mẽ tổng h&ograve;a n&ecirc;n một thiết kế trẻ trung, hiện đại v&agrave; năng động. Đặc biệt đ&egrave;n trang tr&iacute; ph&iacute;a trước được trang bị c&ocirc;ng nghệ LED th&ocirc;ng minh (&aacute;p dụng cho phi&ecirc;n bản Đặc biệt v&agrave; Cao cấp), mang đến cảm gi&aacute;c sang trọng v&agrave; hiện đại.</p>
', 1, 2E+07, 1.9E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:17:01.617' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (32, 2, N'Xe tay ga', N'xe-tay-ga', N'Content/images/items/xe.jpg', N'<p>Thiết kế ph&iacute;a trước kế thừa sự năng động vốn c&oacute; của Vision nhưng ấn tượng hơn với diện mạo ho&agrave;n to&agrave;n mới. Hiệu ứng &aacute;nh s&aacute;ng đẹp mắt bằng việc kết hợp giữa đường n&eacute;t thiết kế ba chiều sắc n&eacute;t v&agrave; hệ thống đ&egrave;n trước với khả năng chiếu s&aacute;ng mạnh mẽ tổng h&ograve;a n&ecirc;n một thiết kế trẻ trung, hiện đại v&agrave; năng động. Đặc biệt đ&egrave;n trang tr&iacute; ph&iacute;a trước được trang bị c&ocirc;ng nghệ LED th&ocirc;ng minh (&aacute;p dụng cho phi&ecirc;n bản Đặc biệt v&agrave; Cao cấp), mang đến cảm gi&aacute;c sang trọng v&agrave; hiện đại.</p>
', 1, 3.5E+07, 3.1E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:17:50.250' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (33, 3, N'Điện thoại Galaxy M62', N'dien-thoai-galaxy-m62', N'Content/images/items/galaxym62.jpg', N'<p>Bộ xử l&yacute; hứa hẹn cung cấp năng lượng cực kỳ xuất sắc trong khả năng gaming v&agrave; c&aacute;c hoạt động giải tr&iacute; đa dạng kh&aacute;c cho ph&eacute;p người d&ugrave;ng &ldquo;chiến&rdquo; hết m&igrave;nh với c&aacute;c tựa game mạnh.&nbsp;</p>

<p>Hiệu năng sử dụng mượt m&agrave;, kết hợp với bộ nhớ RAM 8 GB v&agrave; bộ nhớ lưu trữ lớn 256 GB gi&uacute;p m&aacute;y thao t&aacute;c nhanh nhạy, cung cấp khả năng đa nhiệm thoải m&aacute;i, kh&ocirc;ng gian lưu trữ lớn để lưu c&aacute;c th&ocirc;ng tin, dữ liệu cần thiết.&nbsp;</p>
', 1, 899000, 7599000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:20:28.693' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (34, 3, N'Iphone 12 Promax', N'iphone-12-promax', N'Content/images/items/ip12promax.jpg', N'<p>iPhone 12 Pro Max sở hữu m&agrave;n h&igrave;nh k&iacute;ch thước kh&oacute; tin, l&ecirc;n tới 6,7 inch, cho bạn trải nghiệm h&igrave;nh ảnh cực đ&atilde;. Chất lượng đến từ một m&agrave;n h&igrave;nh c&ocirc;ng nghệ Super Retina XDR, tấm nền OLED cao cấp v&agrave; độ ph&acirc;n giải si&ecirc;u cao thực sự qu&aacute; tuyệt vời.</p>

<p>Mọi thứ đều trở n&ecirc;n sống động tr&ecirc;n&nbsp;<strong>iPhone 12 Pro Max</strong>, đặc biệt khi bạn xem ảnh, xem phim hay chơi game. C&ograve;n bất ngờ hơn khi d&ugrave; m&agrave;n h&igrave;nh lớn hơn, nhưng iPhone 12 Pro Max vẫn gọn g&agrave;ng như thế hệ trước nhờ viền m&agrave;n h&igrave;nh được tối ưu si&ecirc;u mỏng đầy tinh tế.</p>
', 1, 2.5E+07, 2.45E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:22:02.237' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (35, 3, N'Ipad Air 2020', N'ipad-air-2020', N'Content/images/items/ipadair.jpg', N'<p>M&aacute;y t&iacute;nh bảng iPad Air 2020 sẽ c&oacute; thiết kế ho&agrave;n to&agrave;n mới với kiểu d&aacute;ng tương tự với iPad Pro 2020 nhưng với k&iacute;ch thước nhỏ gọn hơn 247.6 x 178.5 mm v&agrave; độ mỏng chỉ 6.1 mm c&ugrave;ng trọng lượng chưa đến 500g gi&uacute;p bạn dễ d&agrave;ng mang theo iPad để sử dụng ở bất cứ đ&acirc;u.</p>

<p>Thiết kế nguy&ecirc;n khối mang đến tổng thể sang trọng cho iPad Air 4 c&ugrave;ng với gam m&agrave;u mới thời thượng, n&uacute;t home được loại bỏ để tạo n&ecirc;n kh&ocirc;ng gian hiển thị rộng hơn.</p>
', 1, 1.5E+07, 1.35E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:26:15.027' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (36, 3, N'Ipad pro', N'ipad-pro', N'Content/images/items/ipadpro.jpg', N'<p>Bắt đầu được giới thiệu từ lần đầu v&agrave;o năm 2015, iPad Pro l&agrave; d&ograve;ng tablet cao cấp nhất của Apple. Ở phi&ecirc;n bản 2018, iPad Pro đ&atilde; sở hữu m&agrave;n h&igrave;nh viền mỏng c&ugrave;ng hệ thống nhận diện khu&ocirc;n mặt Face ID. Cho đến hai năm sau, Apple cho ra mắt&nbsp;<strong>iPad Pro 11 WiFi 2020 128gb</strong>&nbsp;được n&acirc;ng cấp mạnh mẽ hơn về hiệu năng v&agrave; camera.</p>

<p>V&agrave; mới đ&acirc;y, Apple đ&atilde; cho ra mắt&nbsp;<a href="https://cellphones.com.vn/ipad-pro-11-2021.html">iPad Pro 11 inch 2021</a>&nbsp;với chip M1 cực mạnh sắp được b&aacute;n tại CellphoneS với mức gi&aacute; ưu đ&atilde;i.</p>

<h3>Kết nối mạng qua wifi ổn định, kh&ocirc;ng hỗ trợ 4G</h3>

<p>Ở phi&ecirc;n bản n&agrave;y, chiếc m&aacute;y sử dụng phương thức kết nối chủ yếu l&agrave; WiFi, kh&ocirc;ng d&ugrave;ng SIM điện thoại. Khi iPad Pro 11 WiFi 2020 được kết nối với đường truyền WiFi, người d&ugrave;ng c&oacute; thể sử dụng thiết bị để truy cập website, c&aacute;c ứng dụng, call video hoặc thực hiện t&aacute;c vụ cần thiết tr&ecirc;n mạng internet.</p>
', 1, 2E+07, 1.92E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:27:50.100' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (37, 3, N'Máy tính bảng sony', N'may-tinh-bang-sony', N'Content/images/items/maytinhbangsony.jpg', N'<ul>
	<li>Với mức tiền chỉ 2.850.000đ l&agrave; bạn c&oacute; thể sở hữu 1 chiếc m&aacute;y t&iacute;nh bảng mỏng v&agrave; nhẹ- Cấu hinh khủng SONY TAB Z2 l&agrave; sự lựa chọn hợp l&iacute;Mua h&agrave;ng tại Zin Mobile 14/104 Đ&agrave;o Tấn - Ba Đ&igrave;nh -H&agrave; NộiUy t&iacute;n H&agrave;ng đầu b&aacute;n h&agrave;ng chất lượng _ Hoặc c&aacute;c bạn c&oacute; thể qua trực tiếp cửa h&agrave;ng của ch&uacute;ng t&ocirc;i để trực tiếp trải nghiệm</li>
</ul>
', 1, 3250000, 2850000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:30:01.530' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (38, 3, N'Máy tính bảng samsung A8', N'may-tinh-bang-samsung-a8', N'Content/images/items/maytinhbangssa8.jpg', N'<h2><strong>M&agrave;n h&igrave;nh: 8&#39;&#39; WUXGA TFT Độ ph&acirc;n giải 1280 x 800 pixels</strong></h2>

<h2><strong>Camera Sau: 8 MP</strong></h2>

<h2><strong>Camera Trước: 2 MP</strong></h2>

<h2><strong>CPU: Qualcomm Snapdragon 429 processor</strong></h2>

<h2><strong>Bộ Nhớ: 32GB</strong></h2>

<h2><strong>RAM: 2GB</strong></h2>

<h2><strong>Hỗ trợ thẻ nhớ MicroSD, l&ecirc;n đến 512 GB</strong></h2>

<h2><strong>M&aacute;y đ&atilde; qua sử dụng, ngoại h&igrave;nh c&ograve;n đẹp like new 98-99%, c&oacute; bảo h&agrave;nh đầy đủ</strong></h2>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h2><strong>M&agrave;n h&igrave;nh lớn thoải m&aacute;i<br />
sử dụng</strong></h2>

<h2>M&aacute;y T&iacute;nh Bảng Samsung Galaxy Tab A8 8&quot; Wifi T290 (2019) sở hữu k&iacute;nh thước m&agrave;n h&igrave;nh lớn đem lại kh&ocirc;ng gian sử dụng thoải m&aacute;i. M&agrave;n h&igrave;nh của chiếc m&aacute;y t&iacute;nh bảng Samsung được thiết kế theo tỷ lệ 16:10 rất l&yacute; tưởng cho việc đọc s&aacute;ch, tạp ch&iacute;, đọc b&aacute;o hoặc lướt web. Đặc biệt với độ ph&acirc;n giải 1280 x 800 pixels cho h&igrave;nh ảnh hiển thị chi tiết, gi&uacute;p bạn thoải m&aacute;i lướt web hay xem phim phụ đề m&agrave; kh&ocirc;ng mỏi mắt.</h2>
', 1, 7300000, 6900000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:33:11.367' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (39, 3, N'Vivo Y1S', N'vivo-y1s', N'Content/images/items/vivoy1s.jpg', N'<p>M&agrave;n h&igrave;nh: IPS LCD, 6.22&quot;, HD+<br />
Hệ điều h&agrave;nh: Android 10<br />
Camera sau: 13 MP<br />
Camera trước: 5 MP<br />
CPU: MediaTek Helio P35 8 nh&acirc;n<br />
RAM: 2 GB<br />
Bộ nhớ trong: 32 GB<br />
Thẻ nhớ: MicroSD, hỗ trợ tối đa 256 GB<br />
Thẻ SIM:<br />
2 Nano SIM, Hỗ trợ 4G<br />
Dung lượng pin: 4030 mAh</p>
', 1, 3900000, 2570000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:34:40.957' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (40, 3, N'Điện thoại vsmart', N'dien-thoai-vsmart', N'Content/images/items/vsmart.jpg', N'<p>Vsmart Joy 4 mang tr&ecirc;n m&igrave;nh một triết l&yacute; thiết kế kh&aacute;c biệt hẳn so với Joy 3, đặc biệt l&agrave; về phần m&agrave;n h&igrave;nh. Thay v&igrave; m&agrave;n h&igrave;nh giọt nước, m&agrave;n h&igrave;nh của Vsmart Joy 4 giờ đ&acirc;y đ&atilde; được chuyển sang dạng &ldquo;nốt ruồi&rdquo;, xu hướng những mẫu smartphone của năm 2020. Ph&iacute;a mặt lưng tuy vẫn chỉ được ho&agrave;n thiện từ nhựa nhưng 2 phần cạnh b&ecirc;n của m&aacute;y lại được bo cong theo dạng 3D mềm mại tạo cảm gi&aacute;c cầm nắm rất tốt, c&ugrave;ng với việc khi người d&ugrave;ng bỏ m&aacute;y v&agrave;o trong t&uacute;i quần sẽ kh&ocirc;ng tạo cảm gi&aacute;c bị cấn hoặc kh&oacute; chịu.</p>
', 1, 2500000, 2300000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:36:13.353' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (41, 4, N'Bếp hồng ngoại', N'bep-hong-ngoai', N'Content/images/items/bephongngoai.jpg', N'<ul>
	<li>Bếp&nbsp;<em>hồng ngoại</em>&nbsp;EH-HL2000A với nhiều chế độ nấu kh&aacute;c nhau: R&aacute;n, x&agrave;o, nấu, nướng, kho, hấp, lẩu&hellip;</li>
	<li>Sử dụng với c&aacute;c loại xoong nồi c&oacute; chất liệu kh&aacute;c nhau: thủy tinh, gốm, nh&ocirc;m, inox&hellip;c&oacute; đ&aacute;y phẳng.</li>
	<li>Chức năng tự động điều chỉnh c&ocirc;ng suất khi bếp đủ nhiệt độ để tiết kiệm điện năng.</li>
	<li>Điều chỉnh nhiệt độ, c&ocirc;ng suất nhiều mức</li>
	<li>Chức năng hẹn giờ tắt l&ecirc;n đến 12:59 ph&uacute;t.</li>
	<li>M&agrave;n h&igrave;nh LED hiển thị số</li>
	<li>Ph&iacute;m cảm ứng si&ecirc;u nhạy cả khi tay ướt.</li>
	<li>Chức năng giải nhiệt bằng quạt gi&oacute; khi bếp ngừng hoạt động.</li>
	<li>Sử dụng an to&agrave;n với t&iacute;nh năng bảo vệ qu&aacute; nhiệt mặt bếp, th&acirc;n bếp; qu&aacute; điện &aacute;p cao, thấp.</li>
	<li>T&iacute;nh năng an to&agrave;n: cảnh b&aacute;o nhiệt dư v&ugrave;ng nấu sau khi sử dụng của bếp hồng ngoại EH &ndash; HL2000A</li>
	<li>T&iacute;nh năng an to&agrave;n: tự động tắt bếp sau 2h nếu bị để qu&ecirc;n.</li>
	<li>T&iacute;nh năng an to&agrave;n: kho&aacute; an to&agrave;n trẻ em.</li>
</ul>
', 1, 599000, 499000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:37:29.210' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (42, 4, N'Bàn ủi hơi nước', N'ban-ui-hoi-nuoc', N'Content/images/items/banui.jpg', N'<p>B&agrave;n ủi hơi nước cầm tay D&ograve;ng 3000 được thiết kế nhẹ, nhỏ gọn v&agrave; c&oacute; thể gập lại để dễ d&agrave;ng sử dụng v&agrave; cất giữ để đảm bảo trang phục lu&ocirc;n phẳng phiu mọi l&uacute;c, mọi nơi. Đ&acirc;y l&agrave; người bạn đồng h&agrave;nh l&yacute; tưởng của bạn để chỉnh sửa quần &aacute;o dễ d&agrave;ng v&agrave; nhanh ch&oacute;ng khi sử dụng tại nh&agrave; v&agrave; khi đi du lịch.</p>
', 1, 699000, 457000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:39:12.567' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (43, 4, N'Chăn gối ngủ văn phòng', N'chan-goi-ngu-van-phong', N'Content/images/items/changoinguvp.jpg', N'<p>Bộ chăn gối 2 trong 1 x&aacute;ch tay Totoro l&agrave; m&oacute;n qu&agrave; tiện &iacute;ch m&agrave; bất cứ ai cũng cảm thấy h&agrave;i l&ograve;ng khi sử dụng qu&agrave; tặng n&agrave;y. M&oacute;n qu&agrave; ph&ugrave; hợp cho những nh&acirc;n vi&ecirc;n văn ph&ograve;ng, c&aacute;c em nhỏ hay bất kỳ ai muốn c&oacute; giấc ngủ ngắn ngon l&agrave;nh với bộ chăn gối x&aacute;ch tay h&igrave;nh nh&acirc;n vật Totoro ấn tượng n&agrave;y.</p>

<p>Chiếc chăn được l&agrave;m bằng vải b&ocirc;ng mềm ấm &aacute;p, gi&uacute;p bạn giữ nhiệt tốt hơn. Khi kh&ocirc;ng sử dụng bạn gấp chăn gọn v&agrave; cho v&agrave;o trong gối gọn g&agrave;ng, sử dụng như gối &ocirc;m, gối tựa lưng, rất th&iacute;ch hợp l&agrave;m chăn gối văn ph&ograve;ng, gi&uacute;p bạn c&oacute; những giờ ph&uacute;t nghỉ ngơi thật thư gi&atilde;n.</p>

<p>Bộ chăn gối 2 trong 1 x&aacute;ch tay Totoro l&agrave; bộ chăn gối du lịch tiện lợi. Trọng lượng rất nhẹ nh&agrave;ng kh&ocirc;ng g&acirc;y nặng nề hay ảnh hưởng tới việc đi lại. Bằng việc thiết kế quai x&aacute;ch như chiếc cặp b&ocirc;ng khiến đ&ocirc;i tay bạn như được giải ph&oacute;ng. Qu&agrave; tặng thay cho những t&igrave;nh cảm quan t&acirc;m ch&acirc;n th&agrave;nh m&agrave; bạn muốn gửi đến những người th&acirc;n y&ecirc;u, bạn b&egrave; của m&igrave;nh mang lại cho họ cảm gi&aacute;c ấm &aacute;p, c&oacute; giấc ngủ ngon hơn.</p>
', 1, 255000, 220000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:40:35.063' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (44, 4, N'Đồng hồ dán tường', N'dong-ho-gian-tuong', N'Content/images/items/donghodantuong.jpg', N'<p>&ndash; C&ocirc;ng ty: SHOUSE VIỆT NAM<br />
&ndash; M&atilde; sản phẩm: Đồng hồ d&aacute;n tường G68 (Phi&ecirc;n bản cao cấp Shouse 2020)<br />
&ndash; Bao b&igrave;: Đ&oacute;ng g&oacute;i chống va đập 100%, phi&ecirc;n bản cao cấp.<br />
&ndash; Chiều d&agrave;i kim ph&uacute;t: 39cm<br />
&ndash; Chiều d&agrave;i kim giời: 31cm<br />
&ndash; Sản phẩm c&oacute; 3 m&agrave;u: Bạc &ndash; V&agrave;ng &ndash; Đen<br />
&ndash; Pin AA: c&oacute; thể d&ugrave;ng pin tiểu con thỏ được<br />
&ndash; Chất liệu: Thiết kế với bộ số bằng meka cao cấp tr&aacute;ng gương l&oacute;t xốp d&agrave;y c&oacute; sẵn keo d&aacute;n ở 1 mặt, bộ kim bằng th&eacute;p mạ sơn tĩnh điện cực bền. (d&agrave;y hơn 20% so với loại thường)</p>
', 1, 245000, 195000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:42:35.957' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (45, 4, N'Gía sách', N'gia-sach', N'Content/images/items/giasach.jpg', N'<p>Cấu tạo&nbsp;Khung kệ&nbsp;Vinaoffice&nbsp;gồm 2 phần:</p>

<ul>
	<li>Phần kệ&nbsp;l&agrave;m từ gỗ c&ocirc;ng nghiệp MFC 18mmc&oacute; khả năng chống thấm nước tr&ecirc;n bề mặt &nbsp;tốt, c&aacute;c đường v&acirc;n hi&ecirc;n đại.</li>
	<li>Phần khung kệ&nbsp;được l&agrave;m từ sắt&nbsp;hộp 19mm sơn tỉnh điện&nbsp;c&oacute; khả năng chống rỉ s&eacute;t, độ bền ho&agrave;n hảo.</li>
	<li>Với c&aacute;c nhu cầu kh&aacute;c nhau&nbsp;Vinaoffice&nbsp;c&oacute; c&aacute;c kiểu d&aacute;ng ph&ugrave; hợp cho bạn</li>
</ul>
', 1, 499000, 455000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:44:11.830' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (46, 4, N'Hộp đựng rau củ', N'hop-dung-rau-cu', N'Content/images/items/hopdungraucu.jpg', N'<ul>
	<li>
	<p>Ch&agrave;o mừng bạn đến với insound Store, Ch&uacute;c bạn mua sắm vui vẻ tại đ&acirc;y</p>
	</li>
	<li>
	<p>Theo d&otilde;i cửa h&agrave;ng để nhận phiếu giảm gi&aacute; độc quyền để tiết kiệm tiền của bạn</p>
	</li>
	<li>
	<p>Chất liệu: Nhựa</p>
	</li>
	<li>
	<p>Kiểu Hẹp: 37*10.2*10cm</p>
	</li>
	<li>
	<p>Kiểu ngắn: 37*21*6.5cm</p>
	</li>
	<li>
	<p>Kiểu d&aacute;ng cao: 37*21*10cm</p>
	</li>
</ul>
', 1, 99000, 59000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:45:58.910' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (47, 4, N'Kệ gỗ 5 tầng', N'ke-go-5-tang', N'Content/images/items/kego5tang.jpg', N'<p>Sẽ rất thiếu s&oacute;t nếu ph&ograve;ng l&agrave;m việc thiếu đi kệ s&aacute;ch, nơi cất giữ những tri thức nh&acirc;n loại hay những c&acirc;u chuyện kinh điển đầy cảm hứng, l&agrave;m say m&ecirc; biết bao nhi&ecirc;u thế hệ độc giả</p>

<p>Kệ sắt 5 tầng kh&ocirc;ng những gi&uacute;p người d&ugrave;ng lưu trữ trưng b&agrave;y nhiều loại s&aacute;ch, sản phẩm, vật dụng m&agrave; c&ograve;n l&agrave; một sản phẩm mang lại phong c&aacute;ch thanh lịch, hiện đại ph&ugrave; hợp với nhiều kh&ocirc;ng gian sử dụng kh&aacute;c nhau. Kệ sắt kết hợp mặt gỗ mang đến nhiều ưu điểm ưu việt như đa năng, tiện lợi, bền đẹp v&agrave; gi&aacute; rẻ.</p>
', 1, 880000, 790000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:47:16.220' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (48, 4, N'Kệ dán tường', N'ke-dan-tuong', N'Content/images/items/kedantuongpt.jpg', N'<p>Chất liệu: MFC phủ melamine Độ d&agrave;y gỗ 18mm Bộ bao gồm 1 Kệ gỗ KS-24 3 tầng. Chiều cao mỗi tầng&nbsp;25cm Gỗ k&iacute;ch thước: 80 x 75 x 14cm M&agrave;u sắc: Trắng, V&acirc;n gỗ Chịu lực mỗi kệ: 15kg Sử dụng tr&ecirc;n mọi loại tường C&oacute; thể th&aacute;o lắp dễ d&agrave;ng, thuận tiện Sản phẩm c&oacute; phụ kiện lắp đặt k&egrave;m theo Thiết kế v&acirc;n gỗ v&acirc;n chống trầy c&ugrave;ng với lớp phủ Melamine kh&aacute; bắt mắt v&agrave; c&oacute; hai m&agrave;u sắc chủ đạo&nbsp; Ph&ugrave; hợp trang tr&iacute; g&oacute;c l&agrave;m việc, ph&ograve;ng kh&aacute;ch nhỏ, ph&ograve;ng ngủ...tạo điểm nhấn cho kh&ocirc;ng gian Lắp đẹp khi kết hợp từ 2 bộ trở l&ecirc;n</p>

<p><strong>Đặc điểm chi tiết kệ s&aacute;ch treo tường 3 tầng KS-24</strong></p>

<p>Thiết kế chắc chắn, thẩm mỹ gi&uacute;p để đồ hiệu quả, tiện lợi m&agrave; vẫn độc đ&aacute;o, s&aacute;ng tạo cho kh&ocirc;ng gian căn ph&ograve;ng.</p>

<p>Ph&ugrave; hợp trang tr&iacute; g&oacute;c l&agrave;m việc, ph&ograve;ng kh&aacute;ch nhỏ, ph&ograve;ng ngủ tạo điểm nhấn cho kh&ocirc;ng gian.</p>

<p>Gi&aacute; s&aacute;ch n&agrave;y được thiết kế với k&iacute;ch thước khi&ecirc;m tốn nhưng vẫn đ&aacute;p ứng được đầy đủ c&ocirc;ng năng sử dụng d&ugrave;ng để chứa s&aacute;ch v&agrave; để trang tr&iacute;.</p>

<p>Sự đa dạng của m&agrave;u sắc cũng như sự đơn giản của kết cấu gi&uacute;p cho sản phẩm c&oacute; thể được trưng b&agrave;y ở nhiều kh&ocirc;ng gian kh&aacute;c nhau.</p>

<p>&nbsp;</p>
', 1, 90000, 75000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 16:58:45.567' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (49, 4, N'Máy xay tỏi ớt', N'may-xay-toi-ot', N'Content/images/items/mayxaytoiot.jpg', N'<p>M&aacute;y xay tỏi, xay thức ăn mini bằng pin qua cổng usb xay tỏi v&agrave; c&aacute;c loại thức ăn ko cần d&ugrave;ng sức . chỉ cần 1 n&uacute;t bấm, pin sạc điện qua cổng usb nhỏ gọn c&oacute; thể mang theo bất cứ đ&acirc;u M&aacute;y c&oacute; thể sử dụng trong 1 th&aacute;ng chỉ cần 1 lần sạc pin 3 giờ, (c&oacute; thể cắm v&agrave;o m&agrave;y t&iacute;nh hoặc pin sạc dự ph&ograve;ng ddeere sạc) gồm 2 loại 100 ml v&agrave; 250 ml trọng lượng sản phẩm: 314 g - 377 g c&ocirc;ng suất 45w, điện &aacute;p 3,7v K&iacute;ch thước hộp m&agrave;u: 9.5 * 9.5 * 13cm</p>

<p>M&aacute;y xay tỏi, xay thức ăn mini bằng pin qua cổng usb<br />
xay tỏi v&agrave; c&aacute;c loại thức ăn ko cần d&ugrave;ng sức . chỉ cần 1 n&uacute;t bấm, pin sạc điện qua cổng usb nhỏ gọn c&oacute; thể mang theo bất cứ đ&acirc;u<br />
M&aacute;y c&oacute; thể sử dụng trong 1 th&aacute;ng chỉ cần 1 lần sạc pin 3 giờ, (c&oacute; thể cắm v&agrave;o m&agrave;y t&iacute;nh hoặc pin sạc dự ph&ograve;ng ddeere sạc)<br />
gồm 2 loại 100 ml v&agrave; 250 ml<br />
trọng lượng sản phẩm: 314 g - 377 g<br />
c&ocirc;ng suất 45w, điện &aacute;p 3,7v<br />
K&iacute;ch thước hộp m&agrave;u: 9.5 * 9.5 * 13cm</p>
', 1, 50000, 25000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:00:27.023' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (50, 4, N'Máy hút bụi', N'may-hut-bui', N'Content/images/items/mayhutbui.jpg', N'<p><strong>máy hút bụi&nbsp;</strong>si&ecirc;u phẩm nằm trong top c&aacute;c thiết bị vệ sinh c&ocirc;ng nghiệp b&aacute;n chạy nhất hiện nay tại thị trường Việt Nam . Sản phẩm với thiết kế b&aacute;nh xe di chuyển 360 độ cực kỳ tiện lợi cho người sử dụng, d&acirc;y điện d&agrave;i 7 m sẽ gi&uacute;p cho bạn c&oacute; thể l&agrave;m việc tại những nơi &iacute;t ổ cắm thuận lợi hơn. &nbsp;C&ocirc;ng suất vừa phải 1200W, độ ồn thấp - m&aacute;y c&oacute; thiết kế nhỏ gọn rất ph&ugrave; hợp với c&aacute;c m&ocirc;i trường c&oacute; diện t&iacute;ch nhỏ v&agrave; vừa.</p>

<p>Với trọng lượng chỉ 8kg, dung t&iacute;ch th&ugrave;ng chứa 15 l&iacute;t v&agrave; gi&aacute; th&agrave;nh chưa đến 3 triệu đồng, &nbsp;<strong><a href="https://dienmaydanang.com.vn/mua/may-hut-bui-life-clean-15-lit-39.html">M&aacute;y h&uacute;t bụi LifeClean</a>&nbsp;LC151</strong>&nbsp;được đ&aacute;nh gi&aacute; l&agrave; chiếc m&aacute;y h&uacute;t bụi c&ocirc;ng nghiệp ph&ugrave; hợp với nhu cầu vệ sinh của nhiều gia đ&igrave;nh hiện nay. Cụ thể l&agrave; m&aacute;y c&oacute; thiết kế gọn nhẹ, hệ thống b&aacute;nh xe di chuyển linh hoạt v&agrave; d&acirc;y điện d&agrave;i 10 m&eacute;t, c&oacute; thể thực hiện vệ sinh cho những khu vực c&oacute; diện t&iacute;ch hẹp với nhiều đồ đạc như ph&ograve;ng kh&aacute;ch, ph&ograve;ng ngủ hay ph&ograve;ng bếp,&hellip; Đồng thời, th&acirc;n m&aacute;y cũng được l&agrave;m từ chất liệu inox chống gỉ s&eacute;t, chịu được t&aacute;c động từ m&ocirc;i trường l&agrave;m việc b&ecirc;n ngo&agrave;i n&ecirc;n c&oacute; tuổi thọ d&agrave;i l&acirc;u.</p>

<p>Kh&ocirc;ng chỉ ghi điểm bởi thiết kế nhỏ gọn, hiệu suất l&agrave;m việc ấn tượng cũng l&agrave; một l&yacute; do khiến chiếc&nbsp;<strong>m&aacute;y h&uacute;t bụi LifeClean&nbsp;</strong>n&agrave;y trở th&agrave;nh thiết bị vệ sinh được nhiều gia đ&igrave;nh lựa chọn hiện nay. Với đầy đủ phụ kiện gồm b&agrave;n h&uacute;t bụi, b&agrave;n h&uacute;t nước, đầu h&uacute;t khe, chổi tr&ograve;n,&hellip; m&aacute;y c&oacute; thể thể h&uacute;t bụi v&agrave; h&uacute;t nước trong nh&agrave; nhanh ch&oacute;ng, ấn tượng hơn hẳn so với d&ograve;ng m&aacute;y h&uacute;t bụi kh&ocirc; th&ocirc;ng thường. Đồng thời, motor của m&aacute;y cũng c&oacute; c&ocirc;ng suất 1200W, cho khả năng h&uacute;t cực khỏe đối với mọi loại bụi bẩn, giấy vụn hay r&aacute;c thải trong nh&agrave;. Bởi vậy, đ&acirc;y ch&iacute;nh l&agrave; trợ thủ đắc lực của c&aacute;c b&agrave; nội trợ cho c&ocirc;ng t&aacute;c vệ sinh trong gia đ&igrave;nh.</p>
', 1, 1500000, 1200000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:03:18.320' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (51, 5, N'Bánh quy COSY', N'banh-quy-cosy', N'Content/images/items/banhquy.jpg', N'<p>B&aacute;nh quy hạt socola yến mạch cosy. khối lượng tịnh: 163,2g. th&agrave;nh phần: bột m&igrave;, hạt socola, bột cacao...</p>
', 1, 40000, 35000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:04:52.630' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (52, 5, N'Hạt nêm Knorr', N'hat-nam-knorr', N'Content/images/items/hatnem.jpg', N'<ul>
	<li>Vị:Thịt thăn, xương ống, tủy</li>
	<li>Khối lượng:1,2kg</li>
	<li>Chế biến:N&ecirc;m canh, x&agrave;o, ướp, kho</li>
</ul>
', 1, 95000, 85000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:34:53.730' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (53, 5, N'1kg mận bắc', N'1kg-man-bac', N'Content/images/items/man.jpg', N'<ul>
	<li>Qủa m&acirc;̣n có c&ocirc;ng dụng cao trong ngừa b&ecirc;̣nh tim mạch</li>
	<li>Ch&ocirc;́ng oxy hóa và cải thi&ecirc;̣n các chức năng của cơ th&ecirc;̉</li>
	<li>đ&acirc;y là loại quả mang lại giá trị dinh dưỡng cao được nhi&ecirc;̀u người ưa chu&ocirc;̣ng bởi hương vị chua ngọt đặc trưng mà v&ocirc; cùng h&acirc;́p d&acirc;̃n</li>
</ul>
', 1, 44000, 40000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:37:12.350' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (54, 5, N'Sữa Milk Extra', N'sua-milk-extra', N'Content/images/items/milk_extra.jpg', N'<p>Khối lượng 1 l&iacute;t</p>

<p>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời</p>

<p>Hsd 1 năm kể từ ng&agrave;y sản xuất</p>

<p>Sản xuất tại Ba Lan</p>

<p>Sỉ từ 12 hộp vui l&ograve;ng inbox</p>

<ul>
</ul>
', 1, 45000, 35000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:39:39.493' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (55, 5, N'200g Sườn bò mỹ', N'200g-suon-bo-my', N'Content/images/items/suonbo.jpg', N'<h2>Đặc t&iacute;nh sản phẩm Dẻ sườn non b&ograve; Mỹ (Rib fingers) (USA) - g&oacute;i 200g</h2>

<ul>
	<li>Thương hiệu
	<p>SPB Good Meal</p>
	</li>
	<li>SKU
	<p>1224485329_VNAMZ-4537051774</p>
	</li>
</ul>
', 1, 149000, 139000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:42:34.947' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (56, 5, N'1kg táo mỹ', N'1kg-tao-my', N'Content/images/items/tao.jpg', N'<p>CAO CẤP HƯƠNG VỊ CHUA NGỌT MỌNG NƯỚC ĐAN XEN SỰ GI&Ograve;N TAN</p>

<p>&nbsp;T&aacute;o Gala Enza c&oacute; lớp vỏ đỏ tươi v&agrave; kh&ocirc;ng chỉ c&oacute; hương vị thơm ngon, đ&acirc;y cũng l&agrave; một loại tr&aacute;i c&acirc;y c&oacute; nhiều lợi &iacute;ch cho sức khỏe.</p>

<p>&nbsp;T&aacute;o Gala Enza b&ecirc;n trong thịt trắng, nhiều nước, thơm ngon đặc trưng được thu hoạch từ những v&ugrave;ng đất tr&ugrave; ph&uacute; nhất của New Zealand</p>

<p>&nbsp;Trong t&aacute;o c&oacute; chứa nhiều chất pectin, một chất xơ h&ograve;a tan l&agrave;m giảm cholesterol v&agrave; chất chống oxy h&oacute;a, ngăn ngừa bệnh tim. Lượng magi&ecirc; v&agrave; kali trong t&aacute;o gi&uacute;p điều chỉnh &aacute;p suất m&aacute;u v&agrave; giữ cho nhịp đập tim ở mức ổn định, chất chống oxy ho&aacute; tự nhi&ecirc;n gi&uacute;p bảo vệ th&agrave;nh mạch m&aacute;u.</p>
', 1, 120000, 105000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:44:35.100' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (57, 5, N'Xúc xích  VIENNA SAUSAGE', N'xũ-xich-sausage', N'Content/images/items/xucxich.jpg', N'<p>X&uacute;c x&iacute;ch thịt heo ponnie l&agrave; lựa chọn h&agrave;ng đầu cho bạn những khi bận rộn, kh&ocirc;ng c&oacute; nhiều thời gian d&agrave;nh cho việc chuẩn bị bữa ăn s&aacute;ng hoặc bữa ăn nhẹ. Sản phẩm với th&agrave;nh phần nguy&ecirc;n liệu từ thịt heo, tinh bột biến t&iacute;nh, nước, đạm đậu n&agrave;nh&hellip; mang lại dinh dưỡng cho cơ thể, cung cấp năng lượng cho c&aacute;c hoạt động trong ng&agrave;y. Nguồn nguy&ecirc;n liệu n&agrave;y được chọn lọc kỹ c&agrave;ng, chế biến tr&ecirc;n d&acirc;y chuyền hiện đại, kh&eacute;p k&iacute;n n&ecirc;n đảm bảo vệ sinh an to&agrave;n thực phẩm.</p>

<p>Sản phẩm được đ&oacute;ng th&agrave;nh nhiều g&oacute;i nhỏ v&agrave; đựng trong t&uacute;i rất tiện lợi cho việc sử dụng cũng như bảo quản. Bạn c&oacute; thể sử dụng X&uacute;c x&iacute;ch dinh dưỡng thịt heo ponnie tại gia đ&igrave;nh hoặc dễ d&agrave;ng mang theo khi đi l&agrave;m, đi học, du lịch d&atilde; ngoại.</p>

<p>Hướng dẫn sử dụng D&ugrave;ng ăn ngay hoặc chế biến th&agrave;nh c&aacute;c m&oacute;n ăn kh&aacute;c</p>

<p>Hướng dẫn bảo quản Nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời</p>

<p>Sản xuất tại Việt Nam</p>

<p>HSD 4 th&aacute;ng kể từ ng&agrave;y sản xuất...</p>
', 1, 125000, 120000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:46:53.813' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (58, 6, N'Loa hát karaok', N'loa-hat-karaok', N'Content/images/items/loahatkara.jpg', N'<ul>
	<li>LOA BLUETOOTH LINK BITSC&Oacute; MIC</li>
	<li>-Chất liệu: nhựa ABS</li>
	<li>-C&ocirc;ng suất: 15W</li>
	<li>-Tần số đ&aacute;p ứng: 100Hz &ndash; 20KHz</li>
	<li>-Hỗ trợ chức năng nghe nhạc MP3 từ: USB/ TF card</li>
	<li>-Kết nối bluetooth -Khoảng c&aacute;ch kết nối khoảng 10m</li>
	<li>-Dung lượng pin: 4200mAh -Nguồn: AC 220V</li>
	<li>-Thời gian sử dụng: 3 &ndash; 6h Tặng k&egrave;m + C&oacute; mic karaoke Mic vol t&iacute;ch hợp tiếng vang ( echo )</li>
	<li>K&iacute;ch thước :33cm x 24cm x 12cm</li>
	<li>Sản phẩm : loa, micro, d&acirc;y sạc, d&acirc;y 2 đầu 3,5</li>
	<li>Phụ kiện: 1 mic c&oacute; d&acirc;y, d&acirc;y nguồn.d&acirc;y sạc</li>
</ul>
', 1, 450000, 333000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:48:40.480' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (59, 6, N'Máy hàn điện', N'may-han-dien', N'Content/images/items/mayhandien.jpg', N'<ul>
	<li>Từ ng&agrave;y 5/7/2021 m&atilde; h&agrave;n 275CS chuyển sang m&atilde; h&agrave;ng 275CS.2 phi&ecirc;n bản 2021 tối ưu d&ograve;ng h&agrave;n v&agrave; độ ngấu v&agrave;o một n&uacute;t chỉnh</li>
	<li>Thương Hiệu:XCORT</li>
	<li>M&atilde; sản phẩm: MMA-275CS</li>
	<li>Nguồn điện : 220V</li>
	<li>Phạm vi điều chỉnh d&ograve;ng h&agrave;n: 30-275A</li>
	<li>Đường k&iacute;nh que h&agrave;n: 1.6-3.2mm</li>
	<li>Duty Cycle (%):60</li>
	<li>Base Material： Carbon,Stainless,Low-alloy steel.6013,7018</li>
	<li>Thương hiệu: ĐỨC</li>
	<li>C&ocirc;ng nghệ : Inverter</li>
	<li>Rated voltage: 220-240V~50/60Hz</li>
	<li>C&acirc;n nặng m&aacute;y :3.5 Kg</li>
</ul>
', 1, 1500000, 1250000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:50:20.480' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (60, 6, N'Máy khoan cầm tay', N'may-khoan-cam-tay', N'Content/images/items/maykhoancamtay.jpg', N'<ul>
	<li>Cấu tạo m&aacute;y bền bỉ, sử dụng tr&ecirc;n nhiều chất liệu</li>
	<li>Mũi khoan th&aacute;o lắp dễ d&agrave;ng</li>
	<li>C&ocirc;ng suất 500W v&agrave; tốc độ kh&ocirc;ng tải l&ecirc;n đến 2800 ph&uacute;t</li>
	<li>C&ocirc;ng tắc đảo chiều linh hoạt</li>
	<li>Thiết kế hiện đại, nhỏ gọn v&agrave; tiện lợi</li>
</ul>
', 1, 1500000, 1190000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:51:43.287' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (61, 6, N'Máy may mini dành cho gia đình', N'may-may-mini-danh-cho-gia-dinh', N'Content/images/items/maymaymini.jpg', N'<ul>
	<li>Thi&ecirc;́t k&ecirc;́ trang nhã, nhỏ gọn.</li>
	<li>May vá được t&acirc;́t cả các loại vải, từ vải m&ecirc;̀m cho đ&ecirc;́n vải th&ocirc;,vải cứng...(trừ vải thun).</li>
	<li>R&acirc;́t cơ đ&ocirc;̣ng, kh&ocirc;ng chi&ecirc;́m kh&ocirc;ng gian trong nhà, có th&ecirc;̉ đặt ở mọi nơi tùy thích.</li>
	<li>Có th&ecirc;̉ sử dụng ngu&ocirc;̀n đi&ecirc;̣n hoặc pin đ&ecirc;̀u được.</li>
	<li>Ti&ecirc;́t ki&ecirc;̣m được những b&ocirc;̣ đ&ocirc;̀ đáng y&ecirc;u chỉ với m&acirc;́y đường chỉ nhỏ.</li>
	<li>Thỏa mãn mong mu&ocirc;́n tự thi&ecirc;́t k&ecirc;́ những b&ocirc;̣ cánh l&ocirc;̣ng l&acirc;̃y cho mình và những người th&acirc;n.</li>
	<li>2 t&ocirc;́c đ&ocirc;̣ nhanh- ch&acirc;̣m phù hợp cho từng mục đích khác nhau.</li>
</ul>
', 1, 355000, 291000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:53:27.960' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (62, 6, N'Tủ lạnh Samsung', N'tu-lanh-samsung', N'Content/images/items/tulanh.jpg', N'<ul>
	<li>C&ocirc;ng nghệ Digital Inverter bền bỉ, tiết kiệm điện</li>
	<li>Bộ lọc than hoạt t&iacute;nh Deodorizer khử m&ugrave;i mạnh mẽ</li>
	<li>Hệ thống khay đựng bằng k&iacute;nh chịu lực</li>
</ul>
', 1, 5500000, 4900000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:55:23.123' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (63, 6, N'Máy in 3d max', N'may-in-3d-max', N'Content/images/items/12.jpg', N'<ul>
	<li>M&aacute;y in Laser đen trắng Đa chức năng HP Pro M1132MFP (in, scan, copy, photo) tặng hộp mực , d&acirc;y nguồn , d&acirc;y USB mới Th&ocirc;ng số kĩ thuật :Loại m&aacute;y in: M&aacute;y in Laser Đa chức năngM&atilde; mực : HP 85A (CE285A)Khổ giấy in tối đa: A4Trọng lượng : 7 kg K&iacute;ch thước (Rộng x S&acirc;u x Cao) : 415 x 265 x 250mmTốc độ in: Khoảng 18 trang đen / ph&uacute;tĐộ ph&acirc;n giải: 600 x 600 dpiChuẩn kết nối: USB 2.0 Hi &ndash; Speed,Chức năng đặc biệt: In, Scan, Copy, Photo</li>
</ul>
', 1, 1450000, 1399000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 17:58:15.470' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (64, 6, N'Lò nướng thông minh', N'lo-nuong-thong-minh', N'Content/images/items/13.jpg', N'<ul>
	<li>Thiết kế gọn đẹp, m&agrave;u sắc s&aacute;ng v&agrave; sang trọng.</li>
	<li>C&oacute; đ&egrave;n led hiển thị b&ecirc;n trong l&ograve; gi&uacute;p dễ quan s&aacute;t thực phẩm trong qu&aacute; tr&igrave;nh chế biến.</li>
	<li>Đầy đủ phụ kiện như Khay nướng, vỉ nướng, khay hứng mỡ bẩn.</li>
	<li>Đặc biệt c&oacute; xi&ecirc;n quay g&agrave; vịt tiện lợi.</li>
	<li>M&agrave;u đen golden.</li>
	<li>Vỏ th&ugrave;ng v&agrave; lồng l&ograve; nướng bằng th&eacute;p kh&ocirc;ng gỉ dễ lau ch&ugrave;i vệ sinh.</li>
	<li>Điện trở bằng th&eacute;p kh&ocirc;ng gỉ si&ecirc;u bền.</li>
	<li>Điều chỉnh nhiệt độ tiện lợi: 70 &ndash; 230 độ C. C&aacute;c chức năng nướng đa dạng: nhiệt tr&ecirc;n, nhiệt dưới, quạt đối lưu, r&atilde; đ&ocirc;ng.</li>
	<li>Quạt đối lưu gi&uacute;p ch&iacute;n đều thực phẩm.</li>
</ul>
', 1, 1600000, 1550000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:00:52.907' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (65, 9, N'Gía đỡ màng hình', N'gia-do-mang-hinh', N'Content/images/items/giadomanghinh.jpg', N'<ul>
	<li>ch&acirc;n kẹp ipad full box b&agrave;n chuy&ecirc;n d&ugrave;ng choch&acirc;n kẹp ipad full boxl&agrave; phụ kiện &acirc;m thanh kh&ocirc;ng thể thiếu trong c&aacute;c buổi hội thảo, biểu diễn nghệ thuật, đặt biệt l&agrave; d&ugrave;ng cho ph&ograve;ng thu &acirc;m, hoặc c&aacute;c buổi livestream trực tuyến, đượcd&ugrave;ng l&agrave;m ch&acirc;n kẹp ipad full box, ch&acirc;n kẹp ipad full boxv&agrave; n&oacute; gi&uacute;p bạn điều chỉnh vị tr&iacute; của micro một c&aacute;ch dễ d&agrave;ng</li>
	<li>Ch&acirc;n kẹpđược sản xuất với chất liệu bằng sắt kh&ocirc;ng rỉ với l&ograve; xo chịu tải được c&aacute;c d&ograve;ng micro nặng l&ecirc;n đến hơn 3kg</li>
	<li>ch&acirc;n kẹp ipad full box kẹp b&agrave;nd&agrave;nh cho m&iacute;c thu &acirc;mvới ưu điểml&agrave; k&iacute;ch thước nhỏ gọn, đưa ch&acirc;n kẹp ipad full box s&aacute;t với người h&aacute;t, mixer khi ngồi thu &acirc;m tại m&aacute;y t&iacute;nh, h&aacute;t karaoke online,ph&ugrave; hợp đối với c&aacute;c ph&ograve;ng thu mini</li>
</ul>
', 1, 99000, 25000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:03:05.957' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (66, 9, N'Macbook Air 2020', N'macbook-air-2020', N'Content/images/items/macbookair.jpg', N'<ul>
	<li>Macbook Air M1 2020 256GB Ch&iacute;nh h&atilde;ng (Full VAT) b&aacute;n tại Di Động Việt - Đại l&yacute; uỷ quyền ch&iacute;nh thức của Apple tại Việt Nam, l&agrave; phi&ecirc;n bản quốc tế ch&iacute;nh h&atilde;ng. M&aacute;y chưa Active + nguy&ecirc;n seal hộp, mới 100% (Fullbox).Macbook Air M1 2020 256GB Ch&iacute;nh h&atilde;ng (Full VAT) l&agrave; phi&ecirc;n bản được ph&acirc;n phối ch&iacute;nh thức bởi Apple Việt Nam, được bảo h&agrave;nh 12 th&aacute;ng tại Trung t&acirc;m Uỷ quyền cao cấp nhất của Apple tại Việt Nam v&agrave; tr&ecirc;n to&agrave;n cầu miễn ph&iacute;. Đồng thời hưởng nhiều ưu đ&atilde;i, khuyến m&atilde;i hấp dẫn tại Di Động Việt.</li>
</ul>
', 1, 2.65E+07, 2.49E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:05:05.997' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (67, 9, N'Macbook Pro 2020', N'macbook-pro-2020', N'Content/images/items/macbookpro.jpg', N'<ul>
	<li>Apple M1 chip with 8-core CPU, 8-core GPU, and 16-core Neural Engine</li>
	<li>8GB unified memory</li>
	<li>512GB SSD storage&sup1;</li>
	<li>13-inch Retina display with True Tone</li>
	<li>Magic Keyboard</li>
	<li>Touch Bar and TouchID</li>
	<li>Force Touch trackpad</li>
	<li>Two Thunderbolt / USB 4 ports</li>
</ul>
', 1, 3.65E+07, 3.49E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:08:34.250' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (68, 9, N'Máy chơi game Nitendo X7', N'may-choi-game-nitendo-x7', N'Content/images/items/maychoigame.jpg', N'<ul>
	<li>Kết Nối Tivi Hỗ Trợ Cho 2 Người Chơi C&ugrave;ng L&uacute;c</li>
	<li>Sở hữu những tựa game đ&igrave;nh đ&aacute;m một thời như Mario, Contra,Tank hay Circus,....</li>
	<li>M&aacute;y chơi game Supthật sự đang l&agrave; một lựa chọn kh&ocirc;ng thể bỏ qua với những ai đam m&ecirc; game</li>
	<li>.L&agrave; một sản phẩm cầm tay với 400tr&ograve; chơi, chiếc m&aacute;y chơi game Supc&oacute; ngoại h&igrave;nh cầm tay kh&aacute; vừa vặn v&agrave; cho cảm gi&aacute;c thoải m&aacute;i.</li>
</ul>
', 1, 900000, 850000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:10:05.263' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (69, 9, N'Máy tính chơi game giá rẻ', N'may-tinh-choi-game-gia-re', N'Content/images/items/maytinhchoigame.jpg', N'<ul>
	<li>Qu&yacute; Kh&aacute;ch kiểm tra h&agrave;ng, nếu kh&ocirc;ng đ&uacute;ng qu&yacute; kh&aacute;ch c&oacute; thể ho&agrave;n trả h&agrave;ng ngay m&agrave; kh&ocirc;ng hề tốn một chi ph&iacute; n&agrave;o</li>
	<li>D&ugrave;ng thử 7 ng&agrave;y miễn ph&iacute;, sản phẩm MỚI bảo h&agrave;nh 12 th&aacute;ng</li>
	<li>Ho&agrave;n 110% tiền nếu sản phẩm kh&ocirc;ng đ&uacute;ng m&ocirc; tả, thương hiệu top đầu KH&Ocirc;NG Đ&Aacute;NH ĐỔI UY T&Iacute;N LẤY TIỀN BẠC, KH&Ocirc;NG chạy theo gi&aacute; rẻ b&aacute;n h&agrave;ng k&eacute;m chất lượng ( d&ugrave; biết b&aacute;n h&agrave;ng chất lượng sẽ kh&oacute; cạnh tranh)</li>
	<li>100% kh&aacute;ch h&agrave;ng h&agrave;i l&ograve;ng đ&aacute;nh gi&aacute; tốt tr&ecirc;n tất cả c&aacute;c sản phẩm đang b&aacute;n mời qu&yacute; kh&aacute;ch v&agrave;o xem</li>
</ul>
', 1, 4700000, 4600000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:12:02.230' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (70, 9, N'Laptop dell inspiron  5570 i5', N'laptop-dell-inspiron-5570-i5', N'Content/images/items/Untitled-1.png', N'<h3>Bật ngay lập tức</h3>

<p>Bật m&aacute;y t&iacute;nh x&aacute;ch tay của bạn chỉ đơn giản bằng c&aacute;ch mở nắp v&agrave; đăng nhập. Ngay cả từ chế độ ngủ đ&ocirc;ng hoặc tắt nguồn, cảm biến mở nắp cũng gi&uacute;p m&aacute;y t&iacute;nh x&aacute;ch tay khởi động ngay khi bạn mở n&oacute;. Đăng nhập dễ d&agrave;ng, nhanh ch&oacute;ng v&agrave; an to&agrave;n với đầu đọc dấu v&acirc;n tay tr&ecirc;n n&uacute;t nguồn v&agrave; Windows Hello.</p>

<p><strong>Cảm nhận sức mạnh:</strong>Bộ xử l&yacute; Intel Core I3Thế hệ thứ 11,Intel Core i3-1115G4 (up to 4.10 Ghz, 6 MB) mới nhất mang lại khả năng phản hồi đ&aacute;ng kinh ngạc.Dễ d&agrave;ng chuyển đổi qua lại giữa c&aacute;c ứng dụng đang mở với bộ nhớ8 GB, LPDDR4x, 3733 MHz.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 1, 2E+07, 1.87E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:14:09.360' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (71, 9, N'Máy tính chơi game sang trọng', N'may-tinh-choi-game-sang-trong', N'Content/images/items/bomaytinh.jpg', N'<h3>Bật ngay lập tức</h3>

<p>Bật m&aacute;y t&iacute;nh x&aacute;ch tay của bạn chỉ đơn giản bằng c&aacute;ch mở nắp v&agrave; đăng nhập. Ngay cả từ chế độ ngủ đ&ocirc;ng hoặc tắt nguồn, cảm biến mở nắp cũng gi&uacute;p m&aacute;y t&iacute;nh x&aacute;ch tay khởi động ngay khi bạn mở n&oacute;. Đăng nhập dễ d&agrave;ng, nhanh ch&oacute;ng v&agrave; an to&agrave;n với đầu đọc dấu v&acirc;n tay tr&ecirc;n n&uacute;t nguồn v&agrave; Windows Hello.</p>

<p><strong>Cảm nhận sức mạnh:</strong>Bộ xử l&yacute; Intel Core I7Thế hệ thứ 11,Intel Core i7-1115G4 (up to 6.10 Ghz, 16 MB) mới nhất mang lại khả năng phản hồi đ&aacute;ng kinh ngạc.Dễ d&agrave;ng chuyển đổi qua lại giữa c&aacute;c ứng dụng đang mở với bộ nhớ16 GB, LPDDR4x, 3733 MHz.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 1, 2.5E+07, 2.45E+07, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:17:02.107' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (72, 9, N'Tai nghe nhét tai', N'tai-nghe-nhet-tai', N'Content/images/items/tainghe.jpg', N'<p>Loại sản phẩm: Tai nghe nh&eacute;t tai JBL TUNE 110<br />
Chế độ đeo: Điều khiển trong tai + một ph&iacute;m<br />
Đường k&iacute;nh ph&iacute;ch cắm: 3.5mm<br />
Chiều d&agrave;i c&aacute;p: 1.2m<br />
Trở kh&aacute;ng: 16&Omega;<br />
Ổ đĩa động: 9mm<br />
Dải tần đ&aacute;p ứng: 20Hz-22kHz<br />
Danh Mục tai nghe: Tai nghe stereo c&oacute; d&acirc;y<br />
Độ nhạy: 96dB<br />
Chức năng: nghe nhạc, gọi thoại</p>
', 1, 120000, 95000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:18:32.243' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (73, 11, N'Sách người bán hàng giỏi nhất', N'sach-nguoi-ban-hang-gioi-nhat', N'Content/images/items/bhgn.jpg', N'<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng ty ph&aacute;t h&agrave;nh</td>
			<td>Nh&atilde; Nam</td>
		</tr>
		<tr>
			<td>Ng&agrave;y xuất bản</td>
			<td>10-2016</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>14 x 20.5 cm</td>
		</tr>
		<tr>
			<td>Loại b&igrave;a</td>
			<td>B&igrave;a mềm</td>
		</tr>
		<tr>
			<td>Số trang</td>
			<td>285</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>4168928065047</td>
		</tr>
	</tbody>
</table>
', 1, 95000, 70000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:20:02.553' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (74, 11, N'Bài tập luyện dịch tiếng trung', N'bai-tap-luyen-dich-tieng-trung', N'Content/images/items/bttt.jpg', N'<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng ty ph&aacute;t h&agrave;nh</td>
			<td>Nh&atilde; Nam</td>
		</tr>
		<tr>
			<td>Ng&agrave;y xuất bản</td>
			<td>10-2016</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>14 x 20.5 cm</td>
		</tr>
		<tr>
			<td>Loại b&igrave;a</td>
			<td>B&igrave;a mềm</td>
		</tr>
		<tr>
			<td>Số trang</td>
			<td>285</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>4168928065047</td>
		</tr>
	</tbody>
</table>
', 1, 150000, 105000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:21:04.820' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (75, 11, N'Combo sách: Bức thư viết cho bản thân + Bức thư viết cho tương lai ', N'combo-sach-btvcbt-+-btvctl', N'Content/images/items/btvcbt-btvctl.jpg', N'<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng ty ph&aacute;t h&agrave;nh</td>
			<td>Nh&atilde; Nam</td>
		</tr>
		<tr>
			<td>Ng&agrave;y xuất bản</td>
			<td>10-2016</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>14 x 20.5 cm</td>
		</tr>
		<tr>
			<td>Loại b&igrave;a</td>
			<td>B&igrave;a mềm</td>
		</tr>
		<tr>
			<td>Số trang</td>
			<td>285</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>4168928065047</td>
		</tr>
	</tbody>
</table>
', 1, 255000, 190000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:23:01.400' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (76, 11, N'Sách Bán hàng, quảng cáo và kiếm tiền trên Facebook', N'sach-ban-hang-quang-cao-va-kiem-tien-tren-facebook', N'Content/images/items/sachfacebook.jpg', N'<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng ty ph&aacute;t h&agrave;nh</td>
			<td>Nh&atilde; Nam</td>
		</tr>
		<tr>
			<td>Ng&agrave;y xuất bản</td>
			<td>10-2016</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>14 x 20.5 cm</td>
		</tr>
		<tr>
			<td>Loại b&igrave;a</td>
			<td>B&igrave;a mềm</td>
		</tr>
		<tr>
			<td>Số trang</td>
			<td>285</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>4168928065047</td>
		</tr>
	</tbody>
</table>
', 1, 45000, 30000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:24:53.360' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (77, 11, N'Sách: Nhà lãnh đạo không chức danh', N'sach-nha-lanh-dao-khong-chuc-danh', N'Content/images/items/nldkcd.jpg', N'<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng ty ph&aacute;t h&agrave;nh</td>
			<td>Nh&atilde; Nam</td>
		</tr>
		<tr>
			<td>Ng&agrave;y xuất bản</td>
			<td>10-2016</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>14 x 20.5 cm</td>
		</tr>
		<tr>
			<td>Loại b&igrave;a</td>
			<td>B&igrave;a mềm</td>
		</tr>
		<tr>
			<td>Số trang</td>
			<td>285</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>4168928065047</td>
		</tr>
	</tbody>
</table>
', 1, 70000, 65000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:26:02.803' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (78, 11, N'Sách: Marketing', N'sach-marketing', N'Content/images/items/sachmarketing.jpg', N'<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng ty ph&aacute;t h&agrave;nh</td>
			<td>Nh&atilde; Nam</td>
		</tr>
		<tr>
			<td>Ng&agrave;y xuất bản</td>
			<td>10-2016</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>14 x 20.5 cm</td>
		</tr>
		<tr>
			<td>Loại b&igrave;a</td>
			<td>B&igrave;a mềm</td>
		</tr>
		<tr>
			<td>Số trang</td>
			<td>285</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>4168928065047</td>
		</tr>
	</tbody>
</table>
', 1, 125000, 99000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:26:54.653' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (79, 11, N'Sách: Sức mạnh của đọng lực', N'sach-suc-manh-cua-dong-luc', N'Content/images/items/sach-smdl.jpg', N'<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng ty ph&aacute;t h&agrave;nh</td>
			<td>Nh&atilde; Nam</td>
		</tr>
		<tr>
			<td>Ng&agrave;y xuất bản</td>
			<td>10-2016</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>14 x 20.5 cm</td>
		</tr>
		<tr>
			<td>Loại b&igrave;a</td>
			<td>B&igrave;a mềm</td>
		</tr>
		<tr>
			<td>Số trang</td>
			<td>285</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>4168928065047</td>
		</tr>
	</tbody>
</table>
', 1, 145000, 78000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:28:08.717' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Slug], [Img], [Detail], [Number], [Price], [PriceSale], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (80, 11, N'Sách: Tuổi trẻ đáng giá bao nhiêu', N'sach-tuoi-tre-dang-gia-bao-nhieu', N'Content/images/items/ttdgbn.jpg', N'<table>
	<tbody>
		<tr>
			<td>C&ocirc;ng ty ph&aacute;t h&agrave;nh</td>
			<td>Nh&atilde; Nam</td>
		</tr>
		<tr>
			<td>Ng&agrave;y xuất bản</td>
			<td>10-2016</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>14 x 20.5 cm</td>
		</tr>
		<tr>
			<td>Loại b&igrave;a</td>
			<td>B&igrave;a mềm</td>
		</tr>
		<tr>
			<td>Số trang</td>
			<td>285</td>
		</tr>
		<tr>
			<td>SKU</td>
			<td>4168928065047</td>
		</tr>
	</tbody>
</table>
', 1, 105000, 85000, N'1', N'1', NULL, NULL, CAST(N'2021-06-25 18:29:06.727' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Attribute], [Sort_order], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'qeqw', N'qweq', N'slideshow', N'Content/images/banners/slide1.jpg', 1, N'active', N'First slide', NULL, NULL, CAST(N'2021-06-25 08:51:42.870' AS DateTime), NULL, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Attribute], [Sort_order], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (4, N'dsfdsfafd', N'dsafa', N'slideshow', N'Content/images/banners/slide2.jpg', 1, NULL, N'Second slide', NULL, NULL, CAST(N'2021-06-25 08:51:53.957' AS DateTime), NULL, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Attribute], [Sort_order], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (5, N'fddsaf', N'asfas', N'slideshow', N'Content/images/banners/slide3.jpg', 1, NULL, N'Third slide', NULL, NULL, CAST(N'2021-06-25 08:52:04.603' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'Tin tức', N'tin-tuc', 0, 1, N'Tin', N'Tuc', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Topics] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FullName], [UserName], [Password], [Email], [Gender], [Roles], [Phone], [Address], [Img], [Access], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'mai xuan loi', N'user', N'4QrcOUm6Wau+VuBX8g+IPg==', N'user@gmail.com', 1, 1, N'0379191764', N'46/24, duong 61', N'user.jpg', 1, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [LSHOP] SET  READ_WRITE 
GO
