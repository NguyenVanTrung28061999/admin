USE [VietWine]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Gender] [bit] NULL,
	[Status] [bit] NULL,
	[Address] [nvarchar](255) NULL,
	[CreateTime] [datetime] NULL,
	[AccountCategoryID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountCategory]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountCategory](
	[AccountCategoryID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Content] [text] NULL,
	[Keyword] [nvarchar](4000) NULL,
	[ImageList] [nvarchar](4000) NULL,
	[SourcePage] [nvarchar](50) NULL,
	[SourceLinhk] [nvarchar](255) NULL,
	[AttachmentFile] [nvarchar](4000) NULL,
	[ViewTime] [int] NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ArticleCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleCategory]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCategory](
	[ArticleCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Desition] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ArticleMainCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleMainCategory]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleMainCategory](
	[ArticleMainCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Desition] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleMainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Mobile] [nvarchar](20) NULL,
	[AttachmentFile] [nvarchar](4000) NULL,
	[Content] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ContactCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactCategory]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactCategory](
	[ContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Introduce]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Introduce](
	[IntroduceID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[YearHistory] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[IntroduceCategoryID] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IntroduceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IntroduceCategory]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntroduceCategory](
	[IntroduceCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IntroduceCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Total] [float] NULL,
	[FullName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Gender] [bit] NULL,
	[Comment] [nvarchar](4000) NULL,
	[PaymentMethod] [int] NULL,
	[Amount] [float] NULL,
	[CreateTime] [datetime] NULL,
	[OrderStatus] [bit] NULL,
	[ConfirmStatus] [bit] NULL,
	[ChargeStatus] [bit] NULL,
	[DeliveStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picture]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[PictureID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[PictureCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PictureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PictureCategory]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureCategory](
	[PictureCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[COde] [nvarchar](50) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[PictureMainCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PictureCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PictureMainCategory]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureMainCategory](
	[PictureMainCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PictureMainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[Price] [float] NULL,
	[OldPrice] [float] NULL,
	[Keyword] [nvarchar](4000) NULL,
	[ImageList] [nvarchar](4000) NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[Position] [int] NULL,
	[Taste] [nvarchar](4000) NULL,
	[Name] [nvarchar](255) NULL,
	[AddressProduct] [nvarchar](4000) NULL,
	[BgAvatar1] [nvarchar](255) NULL,
	[BgAvatar2] [nvarchar](255) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ProductCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Description] [nvarchar](4000) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ProductMainCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductInfo]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInfo](
	[ProductInfoID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Status] [bit] NULL,
	[ProductID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[Position] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductMainCategory]    Script Date: 4/7/2021 10:33:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMainCategory](
	[ProductMainCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Description] [nvarchar](4000) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductMainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Password], [Avatar], [Thumb], [FullName], [Email], [Mobile], [Gender], [Status], [Address], [CreateTime], [AccountCategoryID]) VALUES (N'admin', N'admin', N'/Uploads/Admin/Admin_ThanhTruc.jpg', NULL, N'Bùi Nguyễn Thanh Trúc', N'buinguyenthanhtruc99@gmail.com', N'0988191800', NULL, 1, N'Tiền Giang', CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL)
INSERT [dbo].[Account] ([Username], [Password], [Avatar], [Thumb], [FullName], [Email], [Mobile], [Gender], [Status], [Address], [CreateTime], [AccountCategoryID]) VALUES (N'subperadmin', N'admin', N'/Uploads/Admin/Admin_VanTrung.jpg', NULL, N'Nguyễn Văn Trung', N'nguyenvantrung@gmail.com', N'123456789', NULL, 1, N'Bình Dương', CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (1, NULL, N'CÁCH CHỌN RƯỢU VANG ĐÊM GIAO THỪA THÊM HOÀN HẢO', N'<p>Niềm vui&nbsp;trọn vẹn khi chia sẻ những giờ phút đáng nhớ với hương vị nồng ấm từ rượu vang. Hãy để Việt Ý gợi ý...</p>', N'/Uploads/Article/Article1.jpg"', NULL, N'<p style="text-align:justify">Sau m?t nam t?t b?t v?i nh?ng công vi?c, t?t là mùa c?a s? doàn t? ?m áp, là mùa c?a tình yêu, gia dình và cùng nhau dón chào mùa xuân dang t?i. S? háo h?c t?i kho?nh kh?c giao th?a, t?m bi?t nam cu và d?m ngu?c chào dón nam m?i. Có th? dêm giao th?a c?a b?n là m?t b?a t?i sang tr?ng c?a nhà hàng cao c?p hay don gi?n là b?a com t?t niên truy?n th?ng. Nhung kho?nh kh?c thiêng liêng ?y s? tuy?t v?i hon r?t nhi?u khi k?t h?p cùng ru?u vang.</p>
			<p style="text-align:justify">Ni?m vui sum h?p tr?n v?n khi chia s? nh?ng gi? phút dáng nh? v?i huong v? n?ng ?m t? ru?u vang d?, sáng khoái t? ru?u vang tr?ng hay tung b?ng r?n rã bên nh?ng chai vang n?. Vi?t Ý không ch? mang d?n cho b?n nh?ng chai ru?u vang ch?t lu?ng mà còn g?i t?i b?n nh?ng s? k?t h?p hoàn h?o gi?a phong cách hi?n d?i và giá tr? truy?n th?ng. Hãy d? Vi?t Ý g?i ý t?i b?n bí kíp ch?n&nbsp;<a href="https://vietywine.com/chon-ruou-vang-dem-giao-thua"><strong><em>ru?u vang dêm giao th?a</em></strong></a>.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article1.1.jpg" /></p>
			<p style="text-align:center"><em><strong>Kho?nh kh?c thiêng liêng s? tuy?t v?i hon r?t nhi?u khi k?t h?p cùng ru?u vang.</strong></em></p>
			<p style="text-align:justify">Th?i kh?c giao th?a, m?i ngu?i d?u t? t?u dông vui và bài hát chúc m?ng nam m?i du?c vang lên trong khi b?u tr?i ng?p ti?ng pháo hoa n? r?c r?, tràn d?y s?c màu cùng v?i dó là nh?ng ti?ng rò heo, chúc nhau nh?ng di?u d?p nh?t cùng ti?ng “Pop” khi b?t nút chai vang n? d? chia vui. Âm thanh “Pop” dánh d?u m?t th?i kh?c d?c bi?t trong cu?c s?ng c?a m?i ngu?i, v?i khát v?ng m?i th? s? t?t hon. Khi nghe th?y âm thanh dó, b?n có th? th?y hình ?nh tuoi sáng, c? v? phía tru?c hay phía sau.</p>
			<p style="text-align:justify">Ngày nay ru?u vang n? vô cùng ph? bi?n t?i Vi?t Nam. Prosecco là m?t lo?i ru?u vang s?i có ngu?n g?c t? vùng Valdobbiadene ? Veneto, Ý. Ðu?c t?o ra b?i nhà Monteverdi -&nbsp;nhà s?n xu?t ru?u vang n?i ti?ng nu?c Ý v?i hon 300 nam l?ch s?. Chai vang có v? chát và n?ng d? c?n th?p, du?c làm ra v?i phong cách frizzante style (sparkling wine from Italy). Giao th?a này, <a href="https://vietywine.com/prosecco-monteverdi">vang n? Prosecco</a> chính là s? l?a ch?n hoàn h?o c?a b?n và gia dình!</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article1.2.jpg" /></p>
			<p style="text-align:center"><strong><em>Prosecco chính là s? l?a ch?n hoàn h?o c?a b?n và gia dình</em></strong>!</p>
			<p style="text-align:justify">Ngoài vang n?, nhi?u gia dình Vi?t l?a ch?n <a href="https://vietywine.com/ruou-vang-monteverdi">ru?u vang d?</a> làm d? u?ng chính trong dêm giao th?a. Vang d? du?c yêu thích b?i huong v? m?nh m?, ?n tu?ng ngây ng?t và d? c?n không quá cao. Màu d? theo quan ni?m Á Ðông tu?ng trung cho s? may m?n. Vì v?y, ru?u vang d? r?t du?c ua chu?ng trong d?p t?t.</p>
			<p style="text-align:justify">Nh?c t?i ru?u vang d? ngon thì nh?t d?nh không th? thi?u nh?ng chai vang d?n t? Ý – qu?c gia có s? lu?ng ru?u vang d? ch?t lu?ng hàng d?u th? gi?i. V?i các dòng n?i b?t nhu Dolce Novella Exclusive&nbsp; – &nbsp;ru?u vang ng?t Ý du?c yêu thích hàng d?u, du?c m?nh danh là “hoàng d?” c?a các dòng vang ng?t. Hay Amarone Della Valpociano, chai ru?u vang d?c trung nu?c Ý v?i phuong th?c s?n xu?t d?c dáo b?c nh?t. Monteverdi còn r?t nhi?u dòng ru?u vang khác có th? chinh ph?c m?i th?c khách khó tính nh?t. Nh?ng chai vang d? t? nh?ng gi?ng nho d?c thù c?a Ý nhu Primitivo chát d?m vùng Nam Ý cung r?t phù h?p v?i kho?nh kh?c dêm giao th?a.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article1.3.jpg" /></p>
			<p style="text-align:center"><em><strong>Ru?u vang d? Dolce Novella r?t phù h?p v?i kho?nh kh?c dêm giao th?a.</strong></em></p>
			<p style="text-align:justify"><a href="https://vietywine.com/ruou-vang-y-bieu-tet-2021">Cùng thao kh?o top ru?u vang Ý dành riêng ngày T?t.</a></p>
			<p style="text-align:justify">Qua bài vi?t ch?n <strong><em>ru?u vang dêm giao th?a</em></strong>, hy v?ng b?n d?c có thêm nh?ng thông tin h?u ích. D?p T?t 2021 này, hãy cùng gia dình thân yêu t?n hu?ng tr?ng v?n v?i nh?ng k? ni?m dáng nh? bên gia dình. Trong không gian lung linh, cùng nâng ly, trao cho nhau nh?ng l?i chúc d? chào dón kho?nh kh?c chuy?n giao ý nghia v?i nh?ng di?u t?t d?p phía tru?c. Hãy liên h? t?i <a href="https://vietywine.com/">Vi?t Ý Wine</a> qua hotline <a href="tel:024.2269.6999">024.2269.6999</a>&nbsp;d? các chuyên viên tu v?n t?n tình nh?t.</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (2, NULL, N'MULLED WINE ẤM NÓNG CHO ĐÊM GIÁNG SINH', N'<p>Mulled Wine hay còn gọi là rượu vang nóng, là thức uống được ưa thích tại Châu Âu, đặc biệt v&a...</p>', N'/Uploads/Article/Article2.jpg', NULL, N'<p style="text-align:justify">Mulled&nbsp;Wine – ru?u vang nóng là th?c u?ng truy?n th?ng m?i d?p Giáng Sinh và nam m?i t?i các nu?c Châu Âu. Ru?u vang d? du?c hâm nóng cùng cam, qu?, h?i,….v?i huong v? n?ng ?m, d?m dà ch?c ch?n s? mang d?n c?m xúc tuy?t v?i, giúp xua tan di l?nh giá c?a mùa dông. Hãy cùng tìm hi?u v? công th?c pha ch? lo?i ru?u vang d?c bi?t ngay trong bài vi?t du?i dây!</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article2.1.jpg" /></p>
			<h3 style="text-align:justify">Công th?c pha ch? Mulled&nbsp;Wine</h3>
			<h4 style="text-align:justify">Nguyên li?u chu?n b?</h4>
			<ul>
				<li style="text-align:justify">1 chai vang d? (thu?ng ch?n ru?u vang Ý)</li>
				<li style="text-align:justify">1 qu? chanh vàng&nbsp;</li>
				<li style="text-align:justify">1 qu? cam vàng</li>
				<li style="text-align:justify">5 n? dinh huong</li>
				<li style="text-align:justify">2 thanh qu?</li>
				<li style="text-align:justify">2 cây h?i</li>
				<li style="text-align:justify">2 – 4 mu?ng canh du?ng, m?t ong ho?c maple syrup</li>
				<li style="text-align:justify">Trang trí tùy ch?n: Lát cam vàng&nbsp;(ho?c chanh), thanh qu?, hoa h?i,…</li>
				<li style="text-align:justify">Các d?ng c? c?n thi?t: M? nút chai, bào v? cam chanh, v?t nu?c cam</li>
			</ul>
			<p style="text-align:justify">&nbsp;</p>
			<h4 style="text-align:justify">Chu?n b?</h4>
			<ul>
				<li style="text-align:justify">Bào v? chanh và ½ qu? cam vàng</li>
				<li style="text-align:justify">C?t dôi cam, m?t n?a qu? thái lát tròn m?ng, m?t n?a qu? v?t nu?c, b? h?t.&nbsp;</li>
				<li style="text-align:justify">Chanh v?t nu?c, b? h?t.</li>
			</ul>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article2.2.jpg" /></p>
			<h4 style="text-align:justify">Cách Làm Mulled Wine</h4>
			<p style="text-align:justify">Cho t?t c? du?ng, nu?c cam, chanh, dinh huong, qu?, v? cam, chanh vào n?i. Sau dó cho ru?u vang v?i lu?ng v?a d? d? ng?p du?ng. Ðun nóng nh? cho d?n khi tan du?ng, luu ý khi dun dùng mu?ng khu?y cho d?u tay.</p>
			<p style="text-align:justify">Ti?p theo, m? l?a l?n và n?u sôi kho?ng 5 -7 phút cho d?n khi ru?u d? sánh l?i và có mùi thom, sau dó gi?m nh? l?a. Cho h?t s? ru?u d? còn l?i, hoa h?i vào, dun nóng h?n h?p ? nhi?t d? th?p trong 15 phút cho ru?u ng?m d? mùi v?.</p>
			<p style="text-align:justify">S? d?ng lu?i l?c m?n rót ru?u ra ly ho?c bình ? d? lo?i b? v? cam, chanh và các gia v? khác. N?m th? ru?u và cho thêm du?ng n?u c?n.&nbsp;</p>
			<p style="text-align:justify">Thu?ng th?c&nbsp;<a href="https://vietywine.com/mulled-wine-am-nong-cho-dem-giang-sinh"><strong><em>Mulled Wine</em></strong></a>&nbsp;?m trong nh?ng chi?c c?c ch?ng nhi?t, bên trên là nh?ng món trang trí nhu thanh qu?, vài lát cam vàng tùy theo s? thích c?a b?n d? tang ph?n h?p d?n cho th?c u?ng.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article2.3.jpg" /></p>
			<h3 style="text-align:justify">Các lo?i ru?u vang dùng d? pha ch? Mulled&nbsp;Wine</h3>
			<p style="text-align:justify">Ð?c tính c?a Mulled&nbsp;Wine là ru?u vang d? c?n du?c n?u ch?m trong kho?ng n?a gi?, d? c?n trong ru?u s? m?t di m?t lu?ng nh?, vì v?y ru?u vang d? t? nhiên có d? c?n cao hon luôn là l?a ch?n uu tiên khi pha ch? th?c u?ng này. Du?i dây là g?i ý v? các lo?i ru?u dùng d? pha ch? Mulled&nbsp;Wine t?t nh?t:</p>
			<p style="text-align:justify"><a href="https://vietywine.com/montepulciano-dabruzzo">Montepulciano D’abruzzo</a>: V?i d?c trung là huong v? cay n?ng, cùng huong thom c?a hoa qu? den. Ðây là dòng ru?u vang lý tu?ng d? làm Mulled&nbsp;Wine</p>
			<p style="text-align:justify"><a href="https://vietywine.com/negroamaro-puglia">Negroamaro Puglia</a>: Là dòng ru?u vang d? n?i ti?ng phía Ðông Nam Ý, Negroamaro mang trong mình màu d? d?m b?t m?t, huong v? chát d?m dà hòa quy?n cùng huong thom c?a trái cây r?ng. L?a ch?n Negroamaro d? pha ch?<strong> Mulled&nbsp;Wine</strong> ch?c ch?n s? chinh ph?c du?c v? giác b?t kì ai khi thu?ng th?c qua.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article2.4.jpg" /></p>
			<p style="text-align:justify">Hy v?ng, qua công th?c pha ch? Mulled&nbsp;Wine mà Vi?t Ý Wine gi?i thi?u, b?n và gia dình s? có m?t bu?i t?i ?m áp bên ly ru?u vang ?m nóng tuy?t h?o.&nbsp;C?n tu v?n v? các dòng ru?u vang Ý Monteverdi liên h? website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c g?i ngay d?n hotline&nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>&nbsp;.&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (3, NULL, N'ĐỊA CHỈ MUA SET QUÀ TẾT UY TÍN, CHẤT LƯỢNG', N'<p>Tết này, bạn đã có kế hoạch tặng quà cho đối tác và người thân ? Đâu là địa chỉ mua&nb...</p>', N'/Uploads/Article/Article3.jpg', NULL, N'<p style="text-align:justify">T?t Tân S?u 2021 dang c?n k?, b?n dang tìm ki?m d?a ch? mua set quà T?t uy tín, ch?t lu?ng d? g?i t?ng b?n bè, ngu?i thân và nh?ng d?i tác quan tr?ng. Hãy d? chúng tôi g?i ý d?n b?n d?a ch? mua set quà t?ng T?t ch?t lu?ng và vô cùng sang tr?ng.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article3.1.jpg" /></p>
			<h3 style="text-align:justify">Ý nghia set quà T?t</h3>
			<p style="text-align:justify">Quà t?ng T?t dang là v?n d? du?c nhi?u cá nhân, doanh nghi?p quan tâm nh?t m?i d?p cu?i nam. T?t không nh?ng là d?p d? ngu?i ngu?i, nhà nhà quay v? bên gia dình mà còn là d?p d? ta g?i d?n nh?ng ngu?i thân thuong, nh?ng d?i tác quan tr?ng l?i tri ân, l?i chúc m?ng m?t nam m?i thu?n l?i,….</p>
			<p style="text-align:justify">V?i doanh nghi?p, vi?c g?i t?ng set quà T?t d?n d?i tác, khách hàng quan tr?ng chính là cách vô cùng tinh t? d? doanh nghi?p th? hi?n s? chuyên nghi?p trong phong cách làm vi?c c?a mình. T? dó m?i quan h? gi?a&nbsp;doanh nghi?p v?i các d?i tác và khách hàng s? ngày càng g?n bó, khan khít hon.</p>
			<p style="text-align:justify">G?i d?n ngu?i thân, b?n bè nh?ng set quà T?t thay l?i c?m on và l?i chúc nam m?i. Nh? có s? d?ng hành, giúp d? c?a h?, b?n m?i có du?c nh?ng thành qu? hôm nay. Ðây chính là d?p vô cùng hoàn h?o d? b?n bày t? tình c?m c?a mình d?n h?.</p>
			<p style="text-align:justify">Ngoài vi?c l?a ch?n nh?ng set quà phù h?p, ch?t lu?ng, b?n cung nên ch?n nh?ng <a href="https://vietywine.com/dia-chi-mua-set-qua-tet-uy-tin--chat-luong"><em><strong>d?a ch? mua set quà T?t uy tín</strong></em></a>&nbsp;d? d?m mua du?c nh?ng s?n ph?m chính hãng.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article3.2.jpg" /></p>
			<h3 style="text-align:justify">Ð?a ch? mua Set quà T?t uy tín, ch?t lu?ng</h3>
			<p style="text-align:justify">Hi?u du?c tâm lý cung nhu n?i lo l?ng c?a nhi?u khách hàng, Vi?t Ý Wine dã ra m?t nh?ng set quà T?t d?y d?, ch?t lu?ng mà vô cùng sang tr?ng. Các set quà d?u du?c Vi?t Ý Wine cân nh?c s?p x?p h?t s?c t? m? và c?n th?n, d? m?i set quà là m?t l?i chúc ý nghia nh?t.</p>
			<p style="text-align:justify">Các set quà không nh?ng có d?y d? bánh, trà,…du?c s? d?ng trong d?p T?t, mà trong m?i set d?u có kèm theo m?t chai ru?u vang Ý Monteverdi n?i ti?ng. Trong nh?ng ngày d?u nam, ru?u vang luôn là hình ?nh tu?ng trung cho may m?n, tài l?c c?a nam m?i, l?a ch?n<a href="https://vietywine.com/3-ly-do-nen-chon-ruou-vang-lam-qua-tang-cuoi-nam--"> ru?u vang làm quà nam m?i</a> cách t?ng quà tinh t? và vô cùng thi?t th?c. Vi?t Ý Wine – don v? v?i hon 20 nam kinh nghi?m trong ngành nh?p kh?u và phân ph?i ru?u vang Ý Monteverdi v?i châm ngôn “uy tín song hành cùng thuong hi?u”. Ðây chính là d?a di?m mua set quà T?t uy tín, ch?t lu?ng nh?t.</p>
			<p style="text-align:justify">Vi?t Ý Wine&nbsp;cung c?p các set<a href="https://vietywine.com/tong-hop-set-qua-tet-doanh-nghiep-duoc-yeu-thich-nhat-2021"> quà T?t doanh nghi?p</a> và các set <a href="https://vietywine.com/goi-y-4-set-qua-tet-y-nghia-danh-tang-nguoi-than">quà T?t dành t?ng ngu?i thân</a>. Ð?n v?i Vi?t Ý Wine, b?n ch?c ch?n s? l?a ch?n du?c nh?ng set quà t?ng T?t phù h?p v?i nhu c?u c?a mình nh?t.&nbsp;</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article3.3.jpg" /></p>
			<p style="text-align:justify">Hy v?ng bài vi?t trên dã g?i d?n b?n nhi?u thông tin h?u ích d? l?a ch?n d?a ch? mua set quà T?t uy tín, ch?t lu?ng. C?n tu v?n v? các set quà t?ng cho nam m?i liên h? website chính th?c &nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c g?i ngay d?n hotline&nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (4, NULL, N'GỢI Ý 4 SET QUÀ TẾT Ý NGHĨA DÀNH TẶNG NGƯỜI THÂN', N'<p>Lựa chọn quà tặng Tết cho người thân bạn bè như thế nào cho phù hợp ? Một set quà Tết dành tặng&nbs...</p>', N'/Uploads/Article/Article4.jpg', NULL, N'<p style="text-align:justify">T?t d?n là ngày d? m?i ngu?i trong gia dình quay v? quây qu?n bên nhau, dây cung là d?p tuy?t v?i d? g?i d?n ngu?i thân nh?ng món quà thay cho l?i tri ân, l?i chúc s?c kh?e, s? nghi?p,…V?y ch?n set quà T?t dành t?ng&nbsp;ngu?i thân nhu th? nào là phù h?p? Hãy d? Vi?t Ý Wine g?i ý d?n b?n 4 set quà ý nghia cho&nbsp;ngu?i thân, b?n bè.&nbsp;</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article4.1.jpg" /></p>
			<h3 style="text-align:justify">Quà T?t dành t?ng ngu?i thân</h3>
			<p style="text-align:justify">B?n bè, ngu?i thân và gia dình là nh?ng ngu?i luôn d?ng hành và sát cánh bên ta trong m?i thang tr?m c?a cu?c s?ng. T?t chính là d?p d? ta g?i d?n h? nh?ng món quà thay cho l?i c?m on, l?i chúc nam m?i. V?y nên vi?c l?a ch?n quà cho b?n bè ngu?i thân dang là v?n d? du?c quan tâm nh?t m?i d?p xuân v?.</p>
			<p style="text-align:justify">Có r?t nhi?u l?a ch?n quà T?t cho ngu?i thân, b?n bè,…b?n hoàn toàn có th? tìm hi?u và l?a ch?n theo s? thích c?a t?ng ngu?i. <strong><a href="https://vietywine.com/3-ly-do-nen-chon-ruou-vang-lam-qua-tang-cuoi-nam--">Ch?n ru?u vang làm quà</a></strong> hay bánh trà d?u có th? là nh?ng ý tu?ng hay. Nhung d? th? hi?n du?c s? tinh t?, sang tr?ng thì l?a ch?n các set quà T?t dành t?ng&nbsp;ngu?i thân m?i th?c s? là thi?t th?c nh?t. Trong các set quà t?ng T?t dã du?c Vi?t Ý Wine chu?n b? luôn là nh?ng s?n ph?m trà bánh ch?t lu?ng cao, có xu?t x?, ngu?n g?c rõ ràng, d?c bi?t hon m?i set quà d?u kèm theo chai ru?u vang Ý Monteverdi n?i ti?ng.</p>
			<h3 style="text-align:justify">Các set quà T?t dành t?ng ngu?i thân</h3>
			<p style="text-align:justify">Cùng Vi?t Ý Wine di?m qua các set quà t?ng T?t cho ngu?i thân dang du?c ua chu?ng nh?t hi?n nay.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article4.2.jpg" /></p>
			<p style="text-align:center"><strong><em>SET SUM V?Y</em></strong></p>
			<p style="text-align:justify">Các set quà t?ng T?t t?i Vi?t Ý Wine luôn có d?y d? các lo?i bánh trà kèm m?t chai ru?u vang Ý nh?p kh?u d? m?i set quà là m?t l?i chúc ý nghia nh?t mà b?n dành t?ng d?n nh?ng ngu?i thân yêu.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article4.3.jpg" /></p>
			<p style="text-align:center"><em><strong>SET AN KHANG</strong></em></p>
			<p style="text-align:justify">Ru?u vang chính là món quà t?ng T?t lý tu?ng nh?t m?i d?p xuân v?, màu d? c?a ru?u vang là bi?u tu?ng c?a may m?n, d?c bi?t là các d?t nu?c Phuong Ðông.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article4.4.jpg" /></p>
			<p style="text-align:center"><em><strong>SET TÂN XUÂN</strong></em></p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article4.5.jpg" /></p>
			<p style="text-align:center"><em><strong>SET TÀI L?C</strong></em></p>
			<p style="text-align:justify">Ngoài các set quà T?t dành t?ng&nbsp;ngu?i thân, b?n bè, Vi?t Ý Wine còn có r?t nhi?u <strong><a href="https://vietywine.com/tong-hop-set-qua-tet-doanh-nghiep-duoc-yeu-thich-nhat-2021">set quà t?ng doanh nghi?p</a></strong> vô cùng sang tr?ng, ch?t lu?ng.</p>
			<p style="text-align:justify">Trên dây là g?i ý 4 set quà T?t dành t?ng&nbsp;ngu?i thân du?c yêu thích nh?t, hy v?ng quý khách hàng dã có th? l?a ch?n du?c cho mình nh?ng set quà phù h?p nh?t. C?n tu v?n v? ru?u vang cung nhu các set quà t?ng T?t, liên h? d?n website chính th?c &nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c g?i ngay d?n hotline&nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (5, NULL, N'3 LÝ DO NÊN CHỌN RƯỢU VANG LÀM QUÀ TẶNG CUỐI NĂM', N'<p>Tại sao nên chọn rượu vang làm quà tặng cuối năm? Lý do chọn rượu vang làm quà tặng.</p>', N'/Uploads/Article/Article5.jpg', NULL, N'<p style="text-align:justify">Ru?u vang là th?c u?ng quen thu?c và không th? v?ng bóng trong m?i b?a ti?c t?i Vi?t Nam. L?a ch?n ru?u vang làm quà t?ng, d?c bi?t là trong d?p cu?i nam ch?c ch?n là m?t ý tu?ng hoàn h?o mà vô cùng tinh t?. Cùng di?m qua nh?ng lý do nên ch?n ru?u vang làm quà t?ng d?p cu?i nam nhé!</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article5.1.jpg" /></p>
			<h3 style="text-align:justify">Ru?u vang bi?u tu?ng cho s? may m?n</h3>
			<p style="text-align:justify">Theo quan ni?m c?a nhi?u nu?c phuong Ðông, s?c d? c?a ru?u vang mang bi?u tu?ng c?a thành công, tài l?c, m?i s? t?t lành. M?t khác, ru?u vang du?c làm nên b?ng t?t c? tinh túy c?a gi?ng nho d?c trung, tr?i qua quá trình ngâm ? vô cùng kh?t khe nhung l?i v?n gi? du?c s? thu?n khi?t và t? nhiên v?n có. Ðây cung chính là hình ?nh tu?ng trung cho s? n? l?c và c? g?ng m?t nam v?a qua, gi? là lúc ta du?c nh?n v? thành qu?.</p>
			<p style="text-align:justify">Ch?n ru?u vang làm quà t?ng d?p cu?i nam t?a nhu m?t l?i chúc may m?n, bình an, t?t lành vô cùng tinh t? g?i d?n ngu?i thân, d?i tác.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article5.2.jpg" /></p>
			<h3 style="text-align:justify">Ru?u vang có tác d?ng t?t d?i v?i s?c kh?e</h3>
			<p style="text-align:justify">Ru?u vang là th?c u?ng có nhi?u công d?ng “vàng” t?t v?i s?c kh?e, m?i ngày m?t ly ru?u vang không nh?ng giúp b?n c?i thi?n các v?n d? liên quan d?n s?c kh?e tim m?ch mà còn giúp b?n gi?i t?a du?c cang th?ng, lo âu. Cu?i nam cung là d?p b?n ph?i tham d? r?t nhi?u b?a ti?c, ngoài vi?c thu?ng th?c nh?ng b?a an m?n d? ng?y, dùng thêm m?t ly vang d? s? khi?n th?c an d? tiêu hóa hon.</p>
			<p style="text-align:justify">Ru?u vang là món quá ý nghia thay cho l?i chúc s?c kh?e, an khang b?n dành d?n v?i nh?ng ngu?i thuong yêu.</p>
			<h3 style="text-align:justify">Ru?u vang th? hi?n d?ng c?p</h3>
			<p style="text-align:justify">Ru?u vang t? lâu dã là th?c u?ng toát lên s? sang tr?ng ? bên ngoài và ch?t lu?ng t? bên trong. Thêm vào dó, cách thu?ng th?c ru?u cung dã th? hi?n du?c d?ng c?p c?a ngu?i u?ng. Ch?n ru?u vang làm quà t?ng th? hi?n s? tinh t?, v? d?p c?a s? sang tr?ng ? trong dó nhi?u n?a. Nh?ng chai ru?u dó không nh?ng d? thu?ng th?c mà dôi khi có th? bày trang trí trong t? ru?u riêng d? th? hi?n d?ng c?p, v? d?p sang tr?ng n?a.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article5.3.jpg" /></p>
			<p style="text-align:justify">Trên dây là nh?ng lý do ph? bi?n nh?t nên ch?n ru?u vang làm quà t?ng. Quý khách hàng có nhu c?u mua ru?u vang làm quà t?ng d?p cu?i nam liên h? website chính th?c <a href="https://vietywine.com/">Vi?t Ý Wine</a> ho?c g?i ngay d?n hotline <a href="tel:024.2269.6999">024.2269.6999</a> d? nh?n du?c tu v?n t?n tình nh?t t? d?i ngu nhân viên giàu kinh nghi?m.</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (6, NULL, N'TỔNG HỢP SET QUÀ TẾT DOANH NGHIỆP ĐƯỢC YÊU THÍCH NHẤT 2021', N'<p>Set quà tết là vấn đề đang được quan tâm bởi nhiều doanh nghiệp mỗi dịp tết đến xuân về.</p>', N'/Uploads/Article/Article6.jpg', NULL, N'<p style="text-align:justify">M?i d?p cu?i nam, l?a ch?n các set quà T?t dang là v?n d? du?c nhi?u doanh nghi?p h?t s?c quan tâm. Vi?c l?a ch?n quà T?t t?ng d?i tác cung nhu khách hàng thân thi?t cách d? m?i doanh nghi?p th? hi?n s? quan tâm, tôn tr?ng d?n v?i nh?ng ngu?i quan tr?ng. Hãy d? Vi?t Ý Wine g?i ý d?n b?n m?t s? set quà T?t doanh nghi?p dang du?c ua chu?ng nh?t!</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article6.1.jpg" /></p>
			<h3 style="text-align:justify">Ý nghia c?a set quà T?t doanh nghi?p</h3>
			<p style="text-align:justify">Vi?c t?ng quà t?t trong doanh nghi?p t? lâu dã tr? thành m?t nét van hóa vô cùng d?c bi?t. M?i set quà T?t nhu thay l?i chúc, thay l?i tri ân c?a doanh nghi?p d?n v?i khách hàng và d?i tác quan tr?ng su?t th?i gian qua. Ðây cung là công c? h? tr? d?c l?c giúp doanh nghi?p th? hi?n s? chuyên nghi?p, d?ng c?p cung nhu s? tinh t? c?a mình trong vi?c qu?ng bá thuong hi?u.</p>
			<p style="text-align:justify">Nh?ng ngày t?t luôn d?p ý nghia và d?c bi?t nh?t trong nam. B?i v?y, dù là ch?n món quà nhu th? nào thì doanh nghi?p cung nên chú ý d?n hình th?c cung nhu ch?t lu?ng c?a m?i s?n ph?m. M?t set quà T?t doanh nghi?p d?p m?t, thi?t k? d?c dáo th? hi?n s? tôn tr?ng v?i d?i tác, khách hàng ngay t? cái nhìn d?u tiên.&nbsp;</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article6.2.jpg" /></p>
			<h3 style="text-align:justify">G?i ý set quà t?ng doanh nghi?p 2021</h3>
			<p style="text-align:justify">Du?i dây là m?t s? set quà t?ng T?t cho doanh nghi?p dang du?c ua chu?ng nh?t hi?n nay.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article6.3.jpg" /></p>
			<p style="text-align:justify">M?i set quà d?u có d?y d? bánh, trà, hoa qu? khô và d?c bi?t không th? v?ng bóng nh?ng chai ru?u vang Ý Monteverdi – s?n ph?m ru?u vang du?c nh?p kh?u d?c quy?n b?i Vi?t Ý Wine.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article6.4.jpg" /></p>
			<p style="text-align:justify">Ru?u vang d? có ý nghia r?t d?c dáo, d?c bi?t là trong d?p t?t d?n xuân v?. <strong><a href="https://vietywine.com/3-ly-do-nen-chon-ruou-vang-lam-qua-tang-cuoi-nam--">L?a&nbsp;ch?n ru?u vang làm quà t?ng</a></strong> dang là ý tu?ng vô cùng hoàn h?o c?a nhi?u doanh nghi?p.&nbsp;&nbsp;M?t set quà t?ng ý nghia ch?c ch?n không th? v?ng bóng nh?ng chai ru?u vang.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article6.5.jpg" /></p>
			<p style="text-align:justify">Ngoài t?ng quà doanh nghi?p, T?t cung là d?p d? b?n g?i nh?ng <strong><a href="https://vietywine.com/goi-y-4-set-qua-tet-y-nghia-danh-tang-nguoi-than">set quà t?ng b?n bè, ngu?i thân</a></strong> thay cho tình yêu thuong cung nhu l?i chúc m?t nam m?i t?t lành.</p>
			<p style="text-align:justify">Trên dây là t?ng h?p nh?ng set quà T?t doanh nghi?p du?c yêu thích nh?t, hy v?ng quý khách hàng dã có th? l?a ch?n du?c cho mình nh?ng set quà phù h?p nh?t. C?n tu v?n v? ru?u vang cung nhu các set quà t?ng T?t, liên h? d?n website chính th?c &nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c g?i ngay d?n hotline&nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (7, NULL, N'ĐỊA CHỈ MUA RƯỢU VANG Ý TẠI QUẬN TÂY HỒ', N'<p>Mua rượu vang tại quận Tây Hồ? Mua rượu vang nhập khẩu Ý ?</p>', N'/Uploads/Article/Article7.jpg', NULL, N'<p style="text-align:justify">Trong th?i hi?n d?i ngày nay, ru?u vang nh?p kh?u dã không còn xa l? v?i nhi?u ngu?i Vi?t Nam. Các b?a ti?c l?n nh? c?a m?i gia dình Vi?t d?u không th? thi?u v?ng bóng dáng c?a nh?ng chai ru?u vang. Nói cách khách thì ru?u vang mang ý nghia r?t l?n d?i v?i s? thành công c?a b?a ti?c. Là ngu?i yêu vang và dang cho nhu c?u mua ru?u vang t?i qu?n Tây H? chính hãng, uy tín? V?y bài vi?t này ch?c ch?n dành cho b?n.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article7.1.jpg" /></p>
			<h3 style="text-align:justify">Ru?u vang Ý Monteverdi</h3>
			<p style="text-align:justify">Ru?u vang Ý dang ngày càng du?c ua chu?ng t?i nhi?u qu?c gia trên Th? gi?i trong dó có Vi?t Nam. Monteverdi là m?t trong nh?ng nhà s?n xu?t ru?u vang lâu d?i b?c nh?t nu?c Ý, h?m ru?u c?a hãng có th? luu tr? t?i 2 tri?u lít ru?u vang chua du?c x?p trong tháp. S?n lu?ng ru?u vang Monteverdi du?c s?n xu?t lên t?i 10 tri?u chai m?i nam và dang ngày càng tang theo c?p s? nhân m?i nam.</p>
			<p style="text-align:justify">Vi?t Ý Wine – don v? nh?p kh?u và phân ph?i ru?u vang Monteverdi d?c quy?n t?i th? tru?ng Vi?t Nam. Trong su?t hon 20 nam t? khi có m?t trên th? tru?ng, Vi?t Ý Wine và d?i ngu nhân viên luôn c? g?ng và n? l?c d? dem nh?ng chai vang Ý ch?t lu?ng cao nh?t d?n v?i ngu?i Vi?t. Ð?n v?i Vi?t Ý Wine, mua ru?u vang t?i qu?n Tây H? chính hãng, ch?t lu?ng nh?t dã không còn là khó khan.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article7.2.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u vang Ý t?i qu?n Tây H?</h3>
			<p style="text-align:justify">V?a qua, Vi?t Ý Wine v?a h?p tác cùng BRG Group v?i hy v?ng dem nh?ng s?n ph?m ru?u vang Ý ch?t lu?ng chính hãng d?n g?n hon v?i ngu?i yêu vang t?i Vi?t Nam. Quý khách hàng yêu vang, có nhu c?u tìm mua ru?u vang Ý nhung còn lo l?ng v? ngu?n g?c, xu?t x? nay có th? d? dàng mua du?c chai ru?u vang ung ý, phù h?p v?i nhu c?u trên k? các chu?i siêu th? tr?c thu?c BRG Group.</p>
			<p style="text-align:justify">Là ngu?i yêu vang nói chung, vang Ý nói riêng và dang có nhu c?u<strong><em><a href="http://httpsvietywine.comdia-chi-mua-ruou-vang-y-tai-quan-tay-ho"> mua ru?u vang t?i qu?n Tây H?.</a></em></strong> Hi?n nay, trên k? h? th?ng siêu th? BRG Mart L?c Long Quân dang bày bán r?t nhi?u s?n ph?m ru?u vang Monteverdi n?i ti?ng du?c phân ph?i b?i Vi?t Ý Wine - don v? nh?p kh?u d?c quy?n t?i Vi?t Nam. Ch?c ch?n quý khách hàng s? có th? tìm du?c cho mình chai ru?u vang phù h?p v?i nhu c?u b?n thân nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article7.3.jpg" /></p>
			<p style="text-align:justify">Hy v?ng qua bài vi?t, ngu?i yêu vang Hà N?i dã có th? tìm du?c d?a ch? mua ru?u vang t?i qu?n Tây H? chính hãng, uy tín nh?t. C?n tu v?n v? các dòng ru?u vang Ý Monteverdi liên h? website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c g?i ngay d?n hotline&nbsp;<a href="tel:024.2269.6999">024.2269.6999</a></p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 7, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (8, NULL, N'CẬP NHẬT GIÁ RƯỢU VANG Ý CHIANTI MONTEVERDI', N'<p>Rượu vang Ý Chianti Monteverdi giá bao nhiêu? Mua rượu vang Ý Chianti ở đâu?</p>', N'/Uploads/Article/Article8.jpg', NULL, N'<p style="text-align:justify">Chianti là m?t tác ph?m ngh? thu?t c?a nhà Monteverdi. Ðây là m?t dòng vang c? di?n và n?i ti?ng, du?c dánh giá r?t cao v? ch?t lu?ng t?i Ý. V?y Chianti có d?c trung nhu th? nào, giá c?a ru?u vang Ý Chianti Monteverdi là bao nhiêu ? Bài vi?t du?i dây s? giúp b?n gi?i dáp các th?c m?c trên!</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article8.1.jpg" /></p>
			<p style="text-align:center"><strong><em>Chianti Monteverdi dòng vang c? di?n n?i ti?ng nu?c Ý</em></strong></p>
			<h3 style="text-align:justify">Ru?u vang Ý Chianti Monteverdi</h3>
			<p style="text-align:justify">Ru?u vang du?c d?nh giá qua nhi?u y?u t? nhu gi?ng nho, vùng, phuong th?c s?n xu?t,…V?y <a href="https://vietywine.com/cap-nhat-gia-ruou-vang-y-chianti-monteverdi">giá ru?u vang Ý Chianti Monteverdi</a> du?c d?nh giá nhu th? nào? Cùng khám phá nh?ng bí m?t v? chai ru?u vang này ngay nhé.</p>
			<p style="text-align:justify"><a href="https://vietywine.com/lich-su-ruou-vang-monteverdi">Monteverdi </a>– nhà s?n xu?t ru?u vang n?i ti?ng B?c Ý v?i hon 300 nam l?ch s?. Hãng Monteverdi góp ph?n làm tên tu?i ru?u vang Ý ti?n xa hon v?i nh?ng dòng vang d?c dáo mà v?n mang d?m nét truy?n th?ng c?a mình.</p>
			<p style="text-align:justify">Ru?u vang Chianti s?n xu?t t?i vùng Tuscany, mi?n trung nu?c Ý – noi có truy?n th?ng làm ru?u vang lâu d?i t? th?i Trung C?. Ðây có l? là vùng d?t s?n xu?t ru?u vang n?i ti?ng và là bi?u tu?ng d?i di?n cho s? sáng t?o c?a Ý.</p>
			<p style="text-align:justify">Chianti du?c t?o nên t? hai gi?ng nho Sangiovese và Canaiolo v?i t? l? 9:1. Sau khi thu ho?ch nho, nho du?c nghi?n d? gi?i phóng nu?c nho, tr?i qua các công do?n lên nghiêm ng?t v? nhi?t d? và khép kín so v?i môi tru?ng bên ngoài. Các ho?t d?ng ki?m soát, phân tích du?c ti?n hành d?u d?n nh?m d?m b?o ch?t lu?ng ru?u vang du?c toàn v?n.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article8.2.jpg" /></p>
			<p style="text-align:center"><strong><em>Chianti Monteverdi tác ph?m ngh? thu?t c?a vùng&nbsp;Tuscany</em></strong></p>
			<h3 style="text-align:justify">Giá ru?u vang Chianti Monteverdi&nbsp;</h3>
			<p style="text-align:justify">B?n dang nóng lòng mu?n bi?t <strong><em>giá ru?u vang Ý Chianti Monteverdi</em></strong> sau khi bi?t thông tin v? chai vang này, hãy cùng tìm hi?u.</p>
			<p style="text-align:justify"><a href="https://vietywine.com/chianti-monteverdi">Ru?u vang Ý Chianti</a> n?i b?t v?i màu d? ruby toát lên v? sang tr?ng và quy?n ru. Ru?u mang huong v? thom ngon v?i huong v? d?c trung là các lo?i trái cây nhu m?n d?, anh dào chua, vi?t qu?t, dâu r?ng hòa quy?n v?i huong vanilla tinh t?.</p>
			<p style="text-align:justify">Chianti có huong v? hài hòa và tròn tr?a. Là m?t lo?i vang chát c?a Ý nên Chianti r?t d? d? thu?ng th?c và s? thu hút b?n ngay l?n th? d?u tiên. M?t ly Chianti v?i bít t?t và tiêu den là m?t s? k?t h?p hoàn h?o hay pizza h?i s?n v?i các lo?i th?o m?c cung là m?t g?i ý mà b?n nên th?. Ch? t? 1.200.000 – 1.400.000 nghìn d?ng b?n dã s? h?u ngay cho mình m?t chai Chianti - ni?m t? hào c?a x? Tuscany.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article8.3.jpg" /></p>
			<p style="text-align:center"><strong><em>Ru?u vang Ý Chianti&nbsp;n?i b?t v?i màu d? ruby toát lên v? sang tr?ng và quy?n ru</em></strong></p>
			<p style="text-align:justify">Hy v?ng v?i bài vi?t <strong><em>giá ru?u vang Ý Chianti Monteverdi</em></strong> giúp b?n có thêm cho mình nh?ng thông tin h?u ích. N?u b?n mu?n có m?t l?n thu?ng th?c du?c nh?ng chai ru?u d?c trung c?a Ý, ch?c ch?n s? l?a ch?n c?a b?n ph?i là <a href="https://vietywine.com/">Vi?t Ý Wine</a>. Hãy nh?c máy g?i ngay t?i s? hotline&nbsp;<a href="tel:024.2269.6999">024.2269.6999</a> d? nh?n nh?ng chuong trình uu dãi h?p d?n.</p>
			<p style="text-align:justify">&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 8, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (9, NULL, N'ĐỊA CHỈ MUA RƯỢU VANG Ý TẠI QUẬN BA ĐÌNH', N'<p>Quý khách hàng là người yêu vang và đang cần tìm địa chỉ mua rượu vang tại quận Ba Đình...</p>', N'/Uploads/Article/Article9.jpg', NULL, N'<p style="text-align:justify">T?i Vi?t Nam, ru?u vang dang ngày càng tr? nên ph? bi?n và d?c bi?t du?c yêu thích t?i các thành ph? l?n nhu Hà N?i. Ru?u vang mang ý nghia r?t l?n t?o nên thành công c?a m?i b?a ti?c Quý khách hàng yêu vang mu?n tìm d?a ch? mua ru?u vang t?i qu?n Ba Ðình chính hãng. V?y hãy cùng tìm d?a ch? mua ru?u vang Ý chính hãng ngay trong bài vi?t du?i dây.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article9.1.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u vang chính hãng</h3>
			<p style="text-align:justify">Th? tru?ng t?i Vi?t Nam dang ngày càng khó ki?m soát, ru?u vang gi?, ru?u vang kém ch?t lu?ng dang du?c bày bán tràn lan, du?i quy mô vô cùng tinh vi và khó nh?n bi?t. Ð?c bi?t là t?i các thành ph? l?n nhu Hà N?i, n?u nhu không l?a ch?n nh?ng d?a ch? uy tín, vi?c mua ph?i s?n ph?m gi? r?t d? x?y ra. Dùng ru?u vang gi?, kém ch?t lu?ng gây tác h?i vô cùng l?n d?n s?c kh?e ngu?i s? d?ng.</p>
			<p style="text-align:justify">Vi?t Ý Wine – don v? nh?p kh?u ru?u vang Ý Monteverdi d?c quy?n t?i th? tru?ng Vi?t Nam. V?i hon 20 nam kinh nghi?m, chúng tôi t? hào là di?m d?n quen thu?c c?a ngu?i sành vang trong và ngoài nu?c. Quý khách hàng yêu vang c?n tìm mua ru?u vang t?i qu?n Ba Ðình chính hãng, uy tín có th? d?n ngay các d?i lý phân ph?i ru?u vang Ý Monteverdi c?a Vi?t Ý Wine trên d?a bàn qu?n Ba Ðình.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article9.2.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u vang Monteverdi t?i qu?n Ba Ðình</h3>
			<p style="text-align:justify">Vi?t Ý Wine v?a qua dã chính th?c h?p tác v?i t?p doàn BRG Group v?i mong mu?n dem các s?n ph?m ru?u vang Ý n?i ti?ng d?n g?n hon v?i ngu?i yêu vang Vi?t Nam. BRG Mart là m?t trong nh?ng d?a ch? mua s?m uy tín c?a nhi?u ngu?i tiêu dùng t?i Ba Ðình. Hi?n nay, ru?u vang Ý Monteverdi du?c phân ph?i b?i Vi?t Ý Wine dang du?c bày bán trên k? ru?u c?a h? th?ng siêu th? BRG Mart. Quý khách hàng có th? d? dàng s? h?u du?c chai ru?u vang Ý n?i ti?ng ngay t?i siêu th? BRG Mart 15-17 Ng?c Khánh.</p>
			<p style="text-align:justify">Trên các k? c?a siêu th? Intimex 175 Gi?ng Võ hi?n dang bày bán các s?n ph?m ru?u vang Ý Monterverdi n?i ti?ng du?c phân ph?i b?i Vi?t Ý Wine. Siêu th? Intimex 175 Gi?ng Võ là m?t trong s? nh?ng h? th?ng siêu th? l?n, n?i ti?ng tr?c thu?c t?p doàn BRG Group. Ðây ch?c ch?n là m?t trong nh?ng d?a ch? <strong><em><a href="http://httpsvietywine.comdia-chi-mua-ruou-vang-y-tai-quan-ba-dinh">mua ru?u vang t?i qu?n Ba Ðình </a></em></strong>uy tín, ch?t lu?ng.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article9.3.jpg" /></p>
			<p style="text-align:justify">Hy v?ng v?i bài vi?t t?ng h?p d?a ch? mua ru?u vang t?i qu?n Ba Ðình chính hãng, uy tín, quý khách hàng dã có th? tìm du?c cho mình m?t d?a ch? tin c?y nh?t. M?i th?c m?c và thông tin v? s?n ph?m vui lòng tham kh?o website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c liên h? hotline&nbsp;s? &nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>.&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 9, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (10, NULL, N'TỔNG HỢP ĐỊA CHỈ MUA RƯỢU VANG Ý TẠI QUẬN ĐỐNG ĐA', N'<p>Quý khách cần mua rượu vang tại quận Đống Đa chính hãng? Trện kệ các chuỗi siêu thị trực thuộc BRG Group h...</p>', N'/Uploads/Article/Article10.jpg', NULL, N'<p style="text-align:justify">Ru?u vang dang ngày càng tr? nên ph? bi?n t?i Vi?t Nam, d?c bi?t là ? các thành ph? l?n nhu Hà N?i. Nhung cung vì quá ph? bi?n nên d? l?a ch?n du?c d?a ch? mua ru?u vang&nbsp;t?i qu?n&nbsp;Ð?ng Ða chính hãng&nbsp;dang khi?n nhi?u ngu?i tiêu dùng g?p khó khan. Hãy cùng di?m qua nh?ng d?a ch? mua ru?u vang Ý uy tín nh?t qu?n Ð?ng Ða.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article10.1.jpg" /></p>
			<h3 style="text-align:justify">Ru?u vang Monteverdi</h3>
			<p style="text-align:justify">Monteverdi là m?t trong nh?ng nhà s?n xu?t ru?u vang lâu d?i b?c nh?t nu?c Ý, h?m ru?u c?a hãng có th? luu tr? t?i 2 tri?u lít ru?u vang chua du?c x?p trong tháp. S?n lu?ng ru?u vang Monteverdi du?c s?n xu?t lên t?i 10 tri?u chai m?i nam và dang ngày càng tang theo c?p s? nhân m?i nam. Ru?u vang Ý Monterverdi dang d?n tr? nên ph? bi?n trên th? gi?i và d?c bi?t du?c yêu thích t?i Vi?t Nam.</p>
			<p style="text-align:justify">Vi?t Ý Wine – don v? nh?p kh?u và phân ph?i ru?u vang Monteverdi d?c quy?n t?i th? tru?ng Vi?t Nam. Trong su?t hon 20 nam t? khi có m?t trên th? tru?ng, Vi?t Ý Wine và d?i ngu nhân viên luôn c? g?ng và n? l?c d? dem nh?ng chai vang Ý ch?t lu?ng cao nh?t d?n v?i ngu?i Vi?t. Ð?n v?i Vi?t Ý Wine, mua ru?u vang t?i qu?n Ð?ng Ða chính hãng, ch?t lu?ng nh?t dã không còn là khó khan.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article10.2.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u vang Ý Monteverdi t?i Ð?ng Ða</h3>
			<p style="text-align:justify">Vi?t Ý Wine v?a qua dã chính th?c h?p tác cùng các chu?i siêu th? tr?c thu?c BRG Group. Các s?n ph?m ru?u vang Ý Monteverdi n?i ti?ng hi?n dang du?c bày bán trên các siêu th? tr?c thu?c BRG Group. Quý khách hàng là ngu?i yêu vang và mu?n tìm d?a ch? <em><strong><a href="http://httpsvietywine.comtong-hop-dia-chi-mua-ruou-vang-y-tai-quan-dong-da">mua ru?u vang t?i qu?n Ð?ng Ða</a></strong></em>&nbsp;chính hãng g?n mình nh?t.</p>
			<p style="text-align:justify">H? th?ng siêu th? Fujimart và Seika Ph?m Ng?c Th?ch là m?t trong nh?ng siêu th? n?i ti?ng b?i các s?n ph?m ch?t lu?ng, phong cách ph?c v? t?n tâm theo van hóa Nh?t B?n. H? th?ng Fujimart và Seika Ph?m Ng?c Th?ch d?u là nh?ng chu?i siêu th? tr?c thu?c BRG Group. Hi?n trên các k? ru?u c?a 2 co s? Fujimart 36 Hoàng C?u và Fujimart Lê Du?n và Seika Mart co s? Ph?m Ng?c Th?ch dã bày bán các s?n ph?m ru?u vang nhà Monteverdi du?c phân ph?i b?i chính Vi?t Ý Wine – don v? nh?p kh?u d?c quy?n t?i Vi?t Nam.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article10.3.jpg" /></p>
			<p style="text-align:justify">Hy v?ng v?i bài vi?t t?ng h?p d?a ch? &nbsp;mua ru?u vang t?i qu?n Ð?ng Ða, quý khách hàng yêu vang dã tìm du?c d?a ch? mua ru?u vang Ý chính hãng g?n mình nh?t. M?i th?c m?c và thông tin v? s?n ph?m vui lòng tham kh?o website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c liên h? hotline&nbsp;s? &nbsp;<a href="tel:024.2269.6999">024.2269.6999</a></p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (11, NULL, N'VIỆT Ý WINE HỢP TÁC VỚI TẬP ĐOÀN BRG GROUP', N'<p>Việt Ý Wine chính thức hợp tác với BRG Group - tập đoàn kinh tế, dịch vụ đa ngành bậc nhất Việt Nam. </p>', N'/Uploads/Article/Article11.jpg', NULL, N'<p>Linh v?c bán l? thu?c t?p doàn BRG Group dang ngày càng l?n m?nh và phát tri?n v?i nhi?u chu?i siêu th? l?n và quen thu?c v?i ngu?i tiêu dùng t?i Vi?t Nam. Ð? nâng t?m van hóa ru?u vang Vi?t – Vi?t Ý Wine h?p tác v?i chu?i siêu th? tr?c thu?c BRG Group.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article11.1.jpg" /></p>
			<h3>Vi?t Ý Wine h?p tác BRG Group</h3>
			<p>Vi?t Ý Wine – don v? nh?p kh?u và phân ph?i ru?u vang Ý Monteverdi d?c quy?n t?i th? tru?ng Vi?t Nam. V?i hon 20 nam kinh nghi?m trong ngành ru?u vang nh?p kh?u v?i phuong châm “Uy tín song hành cùng thuong hi?u”, Vi?t Ý t? hào là d?a ch? uy tín c?a gi?i sành vang Vi?t Nam su?t nhi?u nam qua.</p>
			<p><em><strong><a href="http://httpsvietywine.comviet-y-wine-hop-tac-voi-chuoi-sieu-thi-brg-group">Vi?t Ý Wine h?p tác v?i chu?i siêu th? tr?c thu?c BRG group </a></strong></em>v?i hy v?ng dem nh?ng s?n ph?m ru?u vang ch?t lu?ng b?c nh?t nu?c Ý d?n v?i r?ng rãi hon ngu?i yêu vang t?i Vi?t Nam. Các dòng ru?u vang Ý n?i ti?ng nhà Monteverdi hi?n dang du?c bày bán trên các k? ru?u t?i các&nbsp;siêu th? tr?c thu?c BRG Group nhu: Fujimart, Seika Mart, Intimex Mart, Hapro Mart,….</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article11.2.jpg" /></p>
			<h3>Mua ru?u vang Ý t?i siêu th? tr?c thu?c BRG Group</h3>
			<p>Ý là ”cái nôi” s?n xu?t ru?u vang lâu d?i b?c nh?t th? gi?i v?i vô vàn vu?n nho tr?i dài kh?p d?t nu?c. T?i m?i vùng nho b?n d?a c?a nu?c Ý l?i có m?t dòng ru?u vang d?c trung d?i di?n cho vùng dó. Theo thông kê, nu?c Ý dã s?n xu?t kho?ng 40-50 tri?u lít ru?u vang m?i nam và chi?m kho?ng 1/3 s?n lu?ng ru?u vang trên toàn c?u. S? hi?n di?n c?a ru?u vang Ý có m?t kh?p noi trên th? gi?i và r?t du?c ua chu?ng t?i th? tru?ng Vi?t Nam.&nbsp;</p>
			<p>Ru?u vang Ý Monteverdi dã du?c Vi?t Ý Wine nh?p kh?u và phân ph?i t?i th? tru?ng Vi?t Nam. Quý khách hàng yêu ru?u vang, d?c bi?t là ru?u vang Ý có th? tìm d?n các chu?i siêu th? tr?c thu?c BRG Group và l?a ch?n cho mình chai ru?u vang Ý ch?t lu?ng và phù h?p v?i nhu c?u c?a mình nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article11.3.jpg" /></p>
			<p>Mua ru?u vang Ý ch?t lu?ng gi? dây dã không còn khó khan, s? ki?n h?p tác gi?a BRG Group và Vi?t Ý Wine&nbsp;s? giúp ngu?i tiêu dùng Vi?t d? dàng ti?p c?n v?i các dòng ru?u vang n?i ti?ng Ý. M?i th?c m?c và thông tin v? s?n ph?m vui lòng tham kh?o website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c liên h? hotline&nbsp;s? &nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>.&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 11, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (12, NULL, N'ĐỊA CHỈ MUA RƯỢU VANG TẠI ĐAK NÔNG', N'<p>Bạn đang có nhu cầu tìm mua rượu vang tại Đak Nông để sử dụng. Vậy địa chỉ mua rượu vang uy tín, chất lượng ở Đak N&ocir...</p>', N'/Uploads/Article/Article12.jpg', NULL, N'<p style="text-align:justify">B?n có nhu c?u mua ru?u vang t?i Ðak Nông d? dùng trong ti?c c?a gia dình, b?n bè hay s? d?ng làm quà bi?u t?ng s?p, d?ng nghi?p, d?i tác? B?n dang ban khoan tìm d?a ch? uy tín ch?t lu?ng d? tránh mua ph?i hàng gi? hàng nhái hàng kém ch?t lu?ng? Cùng tìm hi?u ngay bài vi?t du?i dây d? gi?i dáp th?c m?c ngay nhé!</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article12.1.jpg" /></p>
			<p style="text-align:center"><strong><em>Ð?a ch? mua ru?u vang uy tín, ch?t lu?ng t?i Ðak Nông t?i dâu ?</em></strong></p>
			<h3 style="text-align:justify">Ð?a ch? mua ru?u vang t?i Ðak Nông uy tín, ch?t lu?ng</h3>
			<p style="text-align:justify">Ru?u vang ngày càng ph? bi?n t?i các b?a ti?c t?i Vi?t Nam trong dó có Ðak Nông. Có r?t nhi?u dòng ru?u vang d?n t? các vùng khác nhau trên th? gi?i. Vì v?y vi?c ch?n <a href="https://vietywine.com/dia-chi-mua-ruou-vang-tai-dak-nong"><strong><em>mua ru?u vang t?i Ðak Nông</em></strong></a> ch?t lu?ng phù h?p v?i nhu c?u không ph?i là di?u d? dàng.</p>
			<p style="text-align:justify">T? hào v?i hon 20 nam kinh nghi?m, Vi?t Ý Wine – don v? nh?p kh?u và phân ph?i ru?u vang Ý hàng d?u t?i Vi?t Nam. V?i s? c? g?ng phát tri?n vu?t b?c, b?n có th? d? dàng tìm mua ru?u vang du?c phân ph?i b?i Vi?t Ý Wine t?i c?a hàng, siêu th? trên c? nu?c. Ho?c g?i ngay t?i s? hotline&nbsp;<a href="tel:024.2269.6999">024.2269.6999</a> d? du?c tu v?n và s? h?u ngay cho mình nh?ng chai ru?u vang ch?t lu?ng và giá thành t?t nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article12.2.jpg" /></p>
			<p style="text-align:center"><strong><em>Vi?t Ý Wine - nh?p kh?u và phân ph?i ru?u vang Ý s? 1 Vi?t Nam.</em></strong></p>
			<h3 style="text-align:justify">Mua ru?u vang hoàng d? Dolce Novella t?i Ðak Nông</h3>
			<p style="text-align:justify">Th? tru?ng Ðak Nông dã mang d?n cho Vi?t Ý h?t t? b?t ng? này t?i b?t ng? khác khi tính riêng s?n lu?ng tiêu th? c?a dòng vang ng?t hoàng d? <a href="https://vietywine.com/dolce-novella">Dolce Novella</a> là 12.000 chai và có m?c tang tru?ng vu?t b?c qua t?ng nam. Không ph?i ng?u nhiên mà vang hoàng d? du?c yêu thích d?n th?. Vang có v? m?m m?ng, ng?t ngào, tuoi mát c?a hoa qu? chín nhu cherry, dâu tây. V?i n?ng d? c?n ch? 10% Dolce Novella d? dàng làm say d?m và chinh ph?c b?t c? ai dã t?ng th? qua nó.</p>
			<p style="text-align:justify">Ngoài Dolce Novella, Amarone cung r?t du?c san dón, du?c coi là chai ru?u vang mang trong mình tinh túy c?a d?t nu?c Ý. <a href="https://vietywine.com/amarone-della-valpolicella">Amarone Della Valpollicella</a> cung là dòng ru?u vang có s?n lu?ng tiêu th? l?n nh?t <a href="https://vietywine.com/lich-su-ruou-vang-monteverdi">nhà Monteverdi</a>. Chai ru?u này có màu d? ruby mãnh li?t, v?i huong thom ?m áp c?a hoa qu? khô và chút h?nh nhân d?ng trong c? h?ng. Ðây ch?c ch?n s? là lo?i ru?u vang d? c?n có trong t? ru?u c?a nh?ng ngu?i sành vang.</p>
			<p style="text-align:justify">Ru?u vang Vi?t Ý d?u du?c nh?p kh?u nguyên chai tr?c ti?p t? Ý b?ng du?ng bi?n, tuân th? nghiêm ng?t các nguyên t?c b?o qu?n ru?u vang c?a hãng d? ra. V?i phuong châm “uy tín song hành cùng thuong hi?u” luôn mu?n dua t?i khách hàng nh?ng s?n ph?m du?c b?o ch?ng v? ch?t lu?ng và giá thành.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article12.3.jpg" /></p>
			<p style="text-align:center"><em><strong>Dolce Novella - ru?u vang s? 1 Vi?t Nam.</strong></em></p>
			<p style="text-align:justify">Hy v?ng v?i bài vi?t d?a ch? <strong><em>mua ru?u vang t?i Ðak Nông</em></strong>, b?n d?c có cho mình nh?ng thông tin h?u ích. Ð? tr? thành Ð?I LÝ CHÍNH TH?C <a href="https://vietywine.com/">VI?T Ý WINE</a>&nbsp;hay mu?n&nbsp;s? h?u cho mình nh?ng chai ru?u ch?t lu?ng hãy liên h? ngay t?i hotline&nbsp;<a href="tel:024.2269.6999">024.2269.6999</a> d? nh?n nh?ng chính sách uu dãi nh?t.</p>
			<p style="text-align:justify">&nbsp;</p>
			<p style="text-align:justify">&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 12, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (13, NULL, N'ĐỊA CHỈ MUA RƯỢU VANG TẠI ĐẮK LẮK', N'<p>Quý khách hàng là người yêu vang tại Đắk Lắk và có nhu cầu muốn mua rượu vang tại Đắk Lắk để d&ugra...</p>', N'/Uploads/Article/Article13.jpg', NULL, N'<p style="text-align:justify">Ru?u vang dang ngày càng tr? nên ph? bi?n, du?c s? d?ng trong các b?a ti?c l?n nh? t?i Vi?t Nam. Quý khách hàng là ngu?i yêu vang t?i Ð?k L?k và có nhu c?u mu?n mua ru?u vang t?i Ð?k L?k d? dùng cho b?a ti?c hay thu?ng th?c cùng ngu?i thân, b?n bè. Cùng xem ngay bài vi?t du?i dây d? tìm du?c d?a ch? mua ru?u vang chính hãng nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article13.1.jpg" /></p>
			<h3 style="text-align:justify"><br>
			Mua ru?u vang Ý t?i Ð?k L?k</h3>
			<p style="text-align:justify"><br>
			Italy chính là cái nôi s?n sinh ra nhi?u lo?i ru?u vang n?i ti?ng th? gi?i nh? vào khí h?u phân chia rõ r?t vô cùng thu?n l?i cho vi?c tr?ng và phát tri?n các gi?ng nho n?i ti?ng. T? hon 4000 nam v? tru?c, ngu?i dân noi dây dã có nh?ng bu?c thô so co b?n d? lên men ru?u. Qua nhi?u th?p niên, ru?u vang Ý ngày càng có nhi?u phát tri?n vu?t b?c và t?o du?c uy tín trên toàn c?u.</p>
			<p style="text-align:justify">Ngày nay, vang Ý dã có m?t ? nhi?u noi trên th? gi?i và tr? thành lo?i ru?u vang thu?ng h?ng mà nhi?u ngu?i mu?n s? h?u.<br>
			Th? tru?ng ru?u vang t?i dang ngày càng ph?c t?p, ru?u vang gi?, nh?p l?u du?c bán tràn lan, tinh vi và vô cùng khó ki?m soát. Tác h?i c?a vi?c s? d?ng ru?u vang gi? cung dang ngày càng có ?nh hu?ng vô cùng nghiêm tr?ng d?i d?i v?i s?c kh?e. &nbsp;Mua ru?u vang t?i Ð?k L?k nói chung và ru?u vang Ý chính hãng nói riêng dang là v?n d? gây nhi?u khó khan cho ngu?i sành vang t?i Vi?t nam.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article13.2.jpg" /></p>
			<h3 style="text-align:justify"><br>
			Mua ru?u vang t?i Ð?k L?k chính hãng</h3>
			<p style="text-align:justify">Vi?t Ý Wine – don v? có hon 20 nam kinh nghi?m trong ngành ru?u vang, uy tín, ch?t lu?ng dã du?c ki?m ch?ng nhi?u nam. Ðây cung là d?a ch? quen thu?c c?a nhi?u ngu?i sành vang trong và ngoài nu?c và c? ngu?i yêu vang Ð?k L?k. Có Vi?t Ý Wine mua ru?u vang t?i Ð?k L?k chính hãng chua bao gi? don gi?n d?n v?y.&nbsp;</p>
			<p style="text-align:justify"><br>
			Ru?u vang Dolce Novella – ru?u vang Hoàng Ð? là m?t trong nh?ng dòng ru?u vang bán ch?y nh?t Monteverdi. Là dòng ru?u vang ng?t v?i n?ng d? v?a ph?i r?t d? u?ng, ru?u vang dã và dang chi?m du?c nhi?u c?m tình t? ngu?i yêu vang kh?p c? nu?c. Ngoài ra, Vi?t Ý Wine còn phân ph?i r?t nhi?u dòng ru?u vang Ý n?i ti?ng nhu: Amarone, Chianti, Sangiovese,…</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article13.3.jpg" /></p>
			<p style="text-align:justify">Hy v?ng v?i bài vi?t mua ru?u vang t?i Ð?k L?k chính hãng, quý khách hàng dã tìm du?c cho mình d?a ch? mua ru?u vang uy tín. M?i th?c m?c và thông tin v? s?n ph?m vui lòng tham kh?o website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c liên h? hotline&nbsp;s? &nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>.&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 13, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (14, NULL, N'MUA RƯỢU VANG TẠI GIA LAI CHÍNH HÃNG', N'<p>Là người yêu vang Ý tại Gia Lai nhưng quý khách hàng vẫn chưa tìm được địa chỉ mua rượu vang tại Gi...</p>', N'/Uploads/Article/Article14.jpg', NULL, N'<p style="text-align:justify">Ngày nay, ru?u vang dã tr? thành m?t ph?n quan tr?ng làm nên thành công c?a m?i b?a ti?c. Là khách hàng sành vang t?i Gia Lai, b?n dang có nhu c?u mua ru?u vang d? thu?ng th?c hay bi?u t?ng nhung chua&nbsp;tìm du?c d?a ch? <em>mua ru?u vang t?i Gia La</em>i chính hãng, uy tín. V?y bài vi?t du?i dây s? giúp b?n tìm du?c câu tr? l?i cho th?c m?c trên.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article14.1.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u vang Ý t?i Gia Lai</h3>
			<p style="text-align:justify"><a href="http://monteverdi.vn/5-su-that-ve-ruou-vang-y">Ru?u vang Ý</a> dã không còn quá xa l? v?i nhi?u ngu?i sành vang trên th? gi?i và c? ? Vi?t Nam. Nh?c d?n Italia, ta liên tu?ng ngay d?n m?t d?t nu?c xinh d?p và tho m?ng. Nhung Italia là m?t d?t nu?c có truy?n th?ng làm ru?u vang lâu d?i là di?u không ph?i ai cung bi?t. Tr?i dài kh?p d?t nu?c Ý là r?t nhi?u khu vu?n nho, ? m?i vùng d?u có nh?ng gi?ng nho d?c trung và dây cung là lý do ru?u vang Ý m?i vùng d?u mang nh?ng huong v? r?t d?c bi?t.</p>
			<p style="text-align:justify">Mua ru?u vang t?i Gia Lai nói chung và ru?u vang Ý chính hãng nói riêng dang là v?n d? gây nhi?u khó khan cho ngu?i sành vang t?i Gia Lai. Th? tru?ng ru?u vang t?i Gia Lai dang ngày càng ph?c t?p, ru?u vang gi?, nh?p l?u du?c bán tràn lan, tinh vi và vô cùng khó ki?m soát. S? d?ng ru?u vang gi? gây ra r?t nhi?u tác h?i vô cùng l?n d?i v?i s?c kh?e, dây cung là lý do chính khi?n các v? ng? d?c ru?u x?y ra ngày càng nhi?u, gây hoang mang v?i nhi?u ngu?i tiêu dùng Vi?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article14.2.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u vang t?i Gia Lai chính hãng</h3>
			<p style="text-align:justify">Ð? d?m b?o<em> <strong><a href="https://vietywine.com/mua-ruou-vang-tai-gia-lai-chinh-hang">mua ru?u vang t?i Gia Lai</a></strong></em> chính hãng, quý khách hàng nên l?a ch?n nh?ng c?a hàng, d?i lý có uy tín lâu nam, du?c ki?m d?nh v? ch?t lu?ng. Vi?t Ý Wine – don v? nh?p kh?u và phân ph?i ru?u vang Ý Monteverdi d?c quy?n t?i th? tru?ng Vi?t Nam. V?i hon 20 nam kinh nghi?m trong ngành ru?u vang, chúng tôi t? tin là don v? cung c?p ru?u vang Ý ch?t lu?ng và chính hãng t?i th? tru?ng Vi?t Nam, trong dó có Gia Lai. M?i chai ru?u vang c?a chúng tôi luôn du?c ki?m d?nh ch?t ch? v? ch?t lu?ng tru?c khi dua d?n tay ngu?i tiêu dùng. Quý khách hàng có th? hoàn toàn yên tâm v? nguôn g?c xu?t x? cung nhu ch?t lu?ng c?a ru?u vang khi d?n v?i Vi?t Ý Wine.</p>
			<p style="text-align:justify">Ru?u vang<a href="https://vietywine.com/dolce-novella"> Dolce Novella</a> – ru?u vang Hoàng Ð? là m?t trong nh?ng dòng ru?u vang bán ch?y nh?t Monteverdi. Là dòng ru?u vang ng?t v?i n?ng d? v?a ph?i r?t d? u?ng, ru?u vang dã và dang chi?m du?c nhi?u c?m tình t? ngu?i yêu vang kh?p c? nu?c. Ngoài ra, Vi?t Ý Wine còn phân ph?i r?t nhi?u dòng ru?u vang Ý n?i ti?ng nhu: Amarone, Chianti, Sangiovese,…</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article14.3.jpg" /></p>
			<p style="text-align:justify">Hy v?ng v?i bài vi?t mua ru?u vang t?i Gia Lai chính hãng, quý khách hàng dã tìm du?c cho mình d?a ch? mua ru?u vang uy tín.&nbsp;M?i th?c m?c và thông tin v? s?n ph?m vui lòng tham kh?o website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c liên h? hotline&nbsp;s? &nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>.&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (15, NULL, N'ĐỊA CHỈ MUA RƯỢU VANG TẠI LONG AN', N'<p>Để tìm được địa chỉ mua rượu vang tại Long An chính hãng không phải là điều dễ dàng. Cùng tì...</p>', N'/Uploads/Article/Article15.jpg', NULL, N'<p style="text-align:justify">Ð? tìm du?c d?a ch? mua ru?u vang t?i Long An chính hãng không ph?i là di?u d? dàng khi hàng gi?, hàng nhái du?c bày bán tràn lan. Hãy cùng b? túi cho mình d?a ch? mua ru?u vang uy tín, ch?t lu?ng t?i Long An qua bài vi?t du?i dây ngay nhé!</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article15.1.jpg" /></p>
			<p style="text-align:center"><em><strong>Mua ru?u vang ch?t lu?ng ? Long An t?i dâu?</strong></em></p>
			<h3 style="text-align:justify">Ð?a ch? mua ru?u vang uy tín, ch?t lu?ng t?i Long An</h3>
			<p style="text-align:justify">Nhu c?u <a href="https://vietywine.com/dia-chi-mua-ruou-vang-tai-long-an"><strong><em>mua ru?u vang t?i Long An</em></strong></a> ngày càng tang cao, th? tru?ng phát tri?n d?n d?n giá ru?u vang ngày càng b?t ?n. V?y d?a ch? mua ru?u vang nào là uy tín, ch?t lu?ng v?i giá thành ph?i chang ?</p>
			<p style="text-align:justify">T? hào là don v? v?i hon 20 nam trong linh v?c nh?p kh?u và phân ph?i ru?u vang Ý – Vi?t Ý Wine luôn d?ng d?u kh?ng d?nh phuong châm uy tín song hành cùng thuong hi?u. Ch?t lu?ng luôn du?c d?m b?o t?t nh?t cho ngu?i tiêu dùng. V?i h? th?ng phân ph?i ru?u vang t?i nhi?u c?a hàng, siêu th? t?i Long An. B?n có th? d? dàng tìm mua ru?u vang Ý ? các h? th?ng trên toàn t?nh. Ho?c nh?c máy g?i ngay t?i s? hotline <a href="tel:024.2269.6999">024.2269.6999</a> b?n s? s? h?u ngay cho mình nh?ng chai vang ch?t lu?ng nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article15.2.jpg" /></p>
			<p style="text-align:center"><em>Vi?t Ý Wine - nh?p kh?u và phân ph?i ru?u vang Ý</em></p>
			<h3 style="text-align:justify">Mua ru?u vang Hoàng Ð? t?i Long An</h3>
			<p style="text-align:justify">Dolce Novella du?c m?nh danh là hoàng d? c?a các dòng vang ng?t t?i Vi?t Nam. Khi s?n lu?ng tiêu th? lên t?i 360.000 chai và tang theo c?p s? nhân m?i nam. Và Long An là m?t th? tru?ng mang d?n cho Vi?t Ý Wine r?t nhi?u b?t ng?, khi lu?ng tiêu th? tính riêng c?a vang ng?t hoàng d? là 12.000 chai.</p>
			<p style="text-align:justify">Không ph?i ng?u nhiên mà vang hoàng d? du?c yêu thích d?n v?y. Ðây là dòng vang ng?t c?a nhà Monteverdi v?i huong v? ng?t ngào, m?m m?ng cùng huong thom c?a hoa qu? chín Dolce Novella d? dàng làm say d?m và chinh ph?c trái tim c?a b?t k? ai khi thu?ng th?c.</p>
			<p style="text-align:justify">Ngoài vang hoàng d?, các dòng vang d? khác c?a Monteverdi cung r?t du?c ua chu?ng t?i Long An. Dòng ru?u vang ch? danh vùng Tuscany Chianti Monteverdi, hay vang tr?ng tuy?t h?o Pinot Grigio v?i huong v? tuoi mát c?a hoa qu? xanh.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article15.3.jpg" /></p>
			<p style="text-align:center"><strong><em>Dolce Novella - ru?u vang ng?t du?c yêu thích hàng d?u</em></strong></p>
			<p style="text-align:justify">Trên dây là thông tin g?i ý t?i b?n d?c d?a ch?&nbsp;<strong><em>mua ru?u vang t?i Long An</em></strong> uy tín, ch?t lu?ng. <a href="https://vietywine.com/">Vi?t Ý Wine</a> hy v?ng b?n có thêm nh?ng thông tin h?u ích cho mình. Ð? mua ru?u vang ho?c tr? thành m?t trong nh?ng d?i lý c?a Vi?t Ý hãy nh?c máy g?i ngay t?i s? hotline <a href="tel:024.2269.6999">024.2269.6999</a>&nbsp;d? du?c nhân viên tu v?n nhi?t tình nh?t.</p>
			<p>&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (16, NULL, N'ĐỊA CHỈ MUA RƯỢU VANG TẠI KON TUM', N'<p>Quý khách hàng là người yêu vang tại Kon Tum và đang cần tìm địa chỉ mua rượu vang tại Kon Tum uy t...</p>', N'/Uploads/Article/Article16.jpg', NULL, N'<p style="text-align:justify">Ru?u vang ngày càng tr? nên ph? bi?n trong các b?a ti?c, d?c bi?t ? Vi?t Nam hi?n nay. Quý khách hàng là ngu?i yêu vang t?i Kon Tum và c?n ru?u vang cho các b?a ti?c c?a mình cung nhu d? thu?ng th?c cùng ngu?i thân nhung v?n chua tìm du?c d?a ch?<em> mua ru?u vang t?i Kon Tum</em> uy tín, chính hãng. V?y hãy cùng tìm hi?u v? v?n d? này ngay trong bài vi?t du?i dây nhé.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article16.1.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u vang t?i Kon Tum</h3>
			<p style="text-align:justify">Ru?u vang dã tr? thành m?t ph?n không th? thi?u góp ph?n t?o nên thành công cho m?i b?a ti?c t?i Vi?t Nam. Không nh?ng v?y, ngu?i yêu vang trên kh?p c? nu?c cung dang ngày càng dông. U?ng ru?u vang không ch? là m?t cách th? hi?n b?n thân vô cùng tinh t? mà còn là th?c u?ng có c?n n?u dùng ? lu?ng v?a d? s? có tác d?ng t?t v?i s?c kh?e.</p>
			<p style="text-align:justify">Quý khách hàng là ngu?i yêu vang t?i Kon Tum và dang c?n tìm d?a ch? <a href="https://vietywine.com/dia-chi-mua-ruou-vang-tai-kon-tum-"><strong><em>mua ru?u vang t?i Kon Tum</em></strong></a> uy tín, ch?t lu?ng. Vi?t Ý Wine – don v? nh?p kh?u và phân ph?i ru?u vang Ý Monteverdi d?c quy?n t?i Vi?t Nam. V?i hon 20 nam kinh nghhi?m trong linh v?c ru?u vang, uy tín ch?t lu?ng hàng d?u, d?n v?i chúng tôi quý khách hàng không nh?ng du?c d?m chìm trong các lo?i ru?u vang Ý n?i ti?ng mà còn nh?n du?c tu v?n t? d?i ngu nhân viên giàu kinh nghi?m. Ch?c ch?n, quý khách hàng s? l?a ch?n du?c cho mình lo?i ru?u vang phù h?p v?i nhu c?u c?a mình nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article16.2.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u Monteverdi t?i Kon Tum</h3>
			<p style="text-align:justify">Monteverdi là m?t trong nh?ng nhà s?n xu?t ru?u vang n?i ti?ng ? vùng B?c Ý. Sau nhi?u nam l?ch s?, v?i ni?m dam mê ru?u vang, con cháu c?a Angelo Maria Monteverdi dã luu truy?n và b?o v? các phuong th?c s?n xu?t ru?u vang truy?n th?ng ? nhà máy Borgo San Giovanni, g?n Milan. S?n lu?ng tiêu th? c?a ru?u vang Ý Monteverdi lên d?n 10 tri?u chai m?i nam và du?c ua chu?ng nh?t ? th? tru?ng Châu M? và Ðông Nam Á.</p>
			<p style="text-align:justify">Vi?t Ý Wine – don v? nh?p kh?u ru?u vang Monteverdi d?c quy?n t?i Vi?t Nam. Các dòng ru?u vang n?i ti?ng nhà Monteverdi dã du?c chúng tôi phân ph?i d?c quy?n t?i th? tru?ng Vi?t Nam trong dó có t?nh Kon Tum. V?i Vi?t Ý Wine mua ru?u vang t?i Kon Tum uy tín, chính hãng chua bao gi? d? d?n v?y.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article16.3.jpg" /></p>
			<p style="text-align:justify">Hy v?ng v?i bài vi?t d?a ch? mua ru?u vang t?i Kon Tum, quý khách hàng dã tìm du?c cho mình don v? mua ru?u vang uy tín, chính hãng.&nbsp;M?i th?c m?c và thông tin v? s?n ph?m vui lòng tham kh?o website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c liên h? hotline&nbsp;s? &nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>.&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 16, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (17, NULL, N'ĐỊA CHỈ MUA RƯỢU VANG TẠI LAI CHÂU UY TÍN', N'<p>Nhu cầu mua rượu vang tại Lai Châu ngày càng tăng cao. Hãy cùng đọc bài viết dưới đây ngay nh&e...</p>', N'/Uploads/Article/Article17.jpg', NULL, N'<p style="text-align:justify">Nhu c?u mua ru?u vang t?i Lai Châu ngày càng tang cao. Th? nhung d? tìm mua du?c ru?u vang chính hãng l?i không ph?i là di?u d? dàng do hàng gi?, hàng nhái du?c bày bán tràn lan. Hãy cùng d?c bài vi?t du?i dây d? b? túi cho mình nh?ng d?a ch? mua ru?u vang uy tín, ch?t lu?ng t?i Lai Châu ngay nhé !</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article17.1.jpg" /></p>
			<p style="text-align:center"><strong><em>Mua ru?u vang uy tín, ch?t lu?ng ? Lai Châu t?i dâu ?</em></strong></p>
			<h3 style="text-align:justify">Ð?a ch? mua ru?u vang uy tín, ch?t lu?ng t?i Lai Châu</h3>
			<p style="text-align:justify">Là khách hàng thông minh b?n nên cân nh?c khi ch?n&nbsp;<a href="https://vietywine.com/dia-chi-mua-ruou-vang-tai-lai-chau-uy-tin">mua ru?u vang t?i Lai Châu</a> cho nhu c?u c?a mình, nh?ng chai ru?u vang du?c bán ra th? tru?ng v?i ch?ng lo?i khác nhau, nhi?u xu?t x? khác nhau, có s?c c?nh tranh khác nhau và có s?c tiêu th? khác nhau cho m?t thuong hi?u s?n ph?m.</p>
			<p style="text-align:justify">T? hào là don v? v?i hon 20 nam trong linh v?c nh?p kh?u và phân ph?i ru?u vang Ý – Vi?t Ý Wine luôn d?ng d?u kh?ng d?nh phuong châm uy tín song hành cùng thuong hi?u. Ch?t lu?ng luôn du?c d?m b?o t?t nh?t cho ngu?i tiêu dùng.</p>
			<p style="text-align:justify">Vi?t Ý là don v? nh?p kh?u và phân ph?i ru?u vang&nbsp;nhà Monteverdi d?c quy?n t?i th? tru?ng Vi?t Nam. V?i h? th?ng phân ph?i ru?u vang t?i nhi?u c?a hàng, siêu th? t?i Lai Châu. B?n có th? d? dàng tìm mua ru?u vang Ý Monteverdi ? các h? th?ng trên toàn t?nh. Ho?c nh?c máy g?i ngay t?i s? hotline <a href="tel:024.2269.6999">024.2269.6999</a> b?n s? s? h?u ngay cho mình nh?ng chai vang ch?t lu?ng nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article17.2.jpg" /></p>
			<p style="text-align:center"><strong><em>Vi?t Ý Wine - nh?p kh?u và phân ph?i ru?u vang hàng d?u t?i Vi?t Nam.</em></strong></p>
			<h3 style="text-align:justify">Mua ru?u vang Hoàng Ð? t?i Lai Châu</h3>
			<p style="text-align:justify">Lai Châu là m?t th? tru?ng mang cho Vi?t Ý r?t nhi?u b?t ng?. Khi s?n lu?ng tiêu th? tính riêng c?a chai vang ng?t <a href="https://vietywine.com/dolce-novella">Dolce Novella</a> là 15.000 chai m?i nam. Không ph?i ng?u nhiên vang hoàng d? l?i du?c yêu thích d?n v?y. V?i huong v? ng?t ngào, m?m m?ng, tuoi mát cùng huong thom c?a các lo?i qu? chín Dolce Novella làm say d?m và chinh ph?c trái tim c?a b?t c? ai khi thu?ng th?c.</p>
			<p style="text-align:justify">&nbsp;Ngoài ru?u vang Hoàng Ð? du?c yêu thích nhi?u nam, Vi?t Ý còn có r?t nhi?u các dòng n?i ti?ng c?a Ý nhu vang d? <a href="https://vietywine.com/negroamaro-puglia">Negroamaro Puglia</a>, <a href="https://vietywine.com/amarone-della-valpolicella">Amarone Della Valpollicella</a> hay vang n? d?c trung <a href="https://vietywine.com/prosecco-monteverdi">Prosecco Monteverdi</a>.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article17.3.jpg" /></p>
			<p style="text-align:center"><strong><em>Dolce Novella - ru?u vang ng?t du?c yêu thích s? 1 t?i Lai Châu.</em></strong></p>
			<p style="text-align:justify">Trên dây là thông tin g?i ý t?i b?n d?c d?a ch?&nbsp;mua ru?u vang t?i Lai Châu&nbsp;uy tín, ch?t lu?ng. Vi?t Ý Wine hy v?ng b?n có thêm nh?ng thông tin h?u ích cho mình. Ð? mua ru?u vang ho?c tr? thành nhà phân ph?i c?a <a href="https://vietywine.com/">Vi?t Ý Wine</a> t?i Lai Châu hãy nh?c máy g?i ngay t?i s? hotline <a href="tel:024.2269.6999">024.2269.6999</a>&nbsp;d? du?c nhân viên tu v?n nhi?t tình nh?t.</p>
			<p>&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 17, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (18, NULL, N'MUA RƯỢU VANG TẠI QUẢNG TRỊ', N'<p>Quý khách hàng là người sành vang tại Quảng Trị và đang cần tìm địa chỉ mua rượu vang tại Quảng Tr...</p>', N'/Uploads/Article/Article18.jpg', NULL, N'<p>Thu?ng th?c chút ru?u vang trong không gian d?m ch?t Châu Âu là m?t tr?i nghi?m vô cùng thú v? và dáng nh?. B?n là ngu?i sành vang t?i Qu?ng Tr?, b?n c?n mua ru?u vang d? bi?u t?ng ho?c cùng b?n bè và ngu?i thân thu?ng th?c, tuy nhiên b?n l?i không bi?t dâu là d?a ch? mua ru?u vang t?i Qu?ng Tr? uy tín, chính hãng. Hãy d? chúng tôi giúp b?n tìm ra d?a ch? mua ru?u vang chính hãng ngay trong bài vi?t du?i dây.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article18.1.jpg" /></p>
			<h3>Ru?u vang Ý</h3>
			<p>Italia là m?t trong nh?ng d?t nu?c có s?n lu?ng tiêu th? và xu?t kh?u ru?u vang thu?c top d?u th? gi?i. &nbsp;M?i nam có hon 230 tri?u thùng ru?u vang Ý du?c xu?t kh?u ra kh?p th? gi?i. Châu Âu và Châu M? là nh?ng th? tru?ng nh?p kh?u ru?u vang Ý l?n nh?t. Ru?u vang Ý dã tr? thành dòng vang thu?ng h?ng, du?c nhi?u ngu?i sành vang san dón và mong mu?n s? h?u.</p>
			<p>Vi?t Ý Wine không nh?ng là d?a ch? mua ru?u vang t?i Qu?ng Tr? quen thu?c c?a nhi?u ngu?i sành vang su?t hon 20 nam qua, mà còn là don v? nh?p kh?u và phân ph?i ru?u vang Ý Monteverdi d?c quy?n t?i th? tru?ng Vi?t Nam. M?i chai ru?u vang t?i Vi?t Ý Wine d?u du?c ki?m nghi?m ch?t ch? v? ch?t lu?ng tru?c khi dua ra th? thu?ng và d?n tay khách hàng.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article18.2.jpg" /></p>
			<h3>Mua ru?u vang Ý t?i Qu?ng Tr?</h3>
			<p>Trên th? tru?ng t?i Vi?t Nam ngày nay, ru?u vang nh?p kh?u dang ngày càng tr? nên ph? bi?n. Tuy vi?c mua ru?u vang dã không còn quá khó khan nhung mua du?c chai ru?u ch?t lu?ng, chính hãng t?i co s? uy tín ch?c ch?n không ph?i v?n d? d?. Ru?u vang nói chung, ru?u vang Ý nói riêng dã và dang b? làm gi? hêt s?c tinh vi và khó nh?n bi?t, dùng ru?u vang gi? d?n d?n tác h?i r?t l?n d?n s?c kh?e con ngu?i.</p>
			<p>Ngu?i tiêu dùng thông thái c?n ph?i l?a ch?n du?c d?a ch? mua ru?u vang t?i Qu?ng Tr? uy tín, chính hãng d? h?n ch? t?i da vi?c mua ph?i hàng gi?. Vi?t Ý Wine là don v? phân ph?i ru?u vang Ý trên kh?p c? nu?c, trong dó có Qu?ng Tr?. V?i hon 20 nam kinh nghi?m trong ngành ru?u vang cùng d?i ngu giàu kinh nghi?m, tu v?n t?n tình, ch?c ch?n quý khách hàng t?i Qu?ng Tr? s? l?a ch?n du?c cho mình chai ru?u vang ung ý và phù h?p v?i nhu c?u c?a mình nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article18.3.jpg" /></p>
			<p>Hy v?ng qua bài vi?t, quý d?c gi? dã tìm du?c cho mình d?a ch? mua ru?u vang t?i Qu?ng Tr? uy tín, chính hãng. &nbsp;M?i th?c m?c và thông tin v? s?n ph?m vui lòng tham kh?o website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c liên h? hotline&nbsp;s? &nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>.&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 18, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (19, NULL, N'ĐỊA CHỈ MUA RƯỢU VANG TẠI HẬU GIANG', N'<p>Nền kinh tế phát triển cùng với đó là nhu cầu mua rượu vang tại Hậu Giang tăng cao. Cùng tìm hiểu đị...</p>', N'/Uploads/Article/Article19.jpg', NULL, N'<p style="text-align:justify">N?n kinh t? phát tri?n cùng v?i dó là nhu c?u mua ru?u vang t?i H?u Giang ngày càng tang cao. Nhung d? tìm du?c d?a ch? mua uy tín không ph?i là di?u d? dàng khi các s?n ph?m hàng gi?, hàng nhái du?c bày bán tràn lan. Hãy cùng tìm hi?u d?a ch? mua ru?u vang ch?t lu?ng ? H?u Giang qua bài vi?t du?i dây ngay nhé!</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article19.1.jpg" /></p>
			<p style="text-align:center"><strong><em>Ð?a ch? mua ru?u vang Ý uy tín, ch?t lu?ng t?i H?u Giang?</em></strong></p>
			<h3 style="text-align:justify">Ð?a ch? mua ru?u vang uy tín, ch?t lu?ng t?i H?u Giang</h3>
			<p style="text-align:justify">Ru?u vang là th?c u?ng có c?n cao c?p r?t du?c yêu thích trên toàn th? gi?i. Không ch? là th?c u?ng giúp kích thích v? giác nhu các lo?i d? u?ng khác mà ru?u vang còn có r?t nhi?u h?p ch?t t?t cho s?c kh?e. Ru?u vang có r?t nhi?u lo?i, t?i t? r?t nhi?u d?t nu?c khác nhau. V?y làm th? nào d? <a href="https://vietywine.com/dia-chi-mua-ruou-vang-tai-hau-giang"><strong><em>mua ru?u vang t?i H?u Giang</em></strong></a> d? dàng, dúng m?c dích s? d?ng và h?p v?i s? thích c?a b?n nh?t ?</p>
			<p style="text-align:justify">T? hào v?i hon 20 nam kinh nghi?m, Vi?t Ý Wine là don v? hàng d?u trong linh v?c xu?t nh?p kh?u và phân ph?i ru?u vang. B?ng s? tin tu?ng c?a quý d?i tác và khách hàng, Vi?t Ý dã không ng?ng n? l?c và phát tri?n luôn c? g?ng dua các s?n ph?m ru?u vang ch?t lu?ng nh?t v?i giá thành t?t nh?t t?i tay ngu?i dùng. T?t c? ru?u vang d?u là nh?ng chai vang hàng d?u mà Vi?t Ý Wine dã ch?n l?a nh?p kh?u và phân ph?i. Ru?u vang Vi?t Ý dã có m?t h?u h?t trên các t?nh thành c? nu?c, trong dó có H?u Giang. Ch? c?n nh?c máy g?i ngay t?i s? <a href="tel:024.2269.6999">024.2269.6999</a> b?n s? s? h?u ngay cho mình nh?ng chai vang ch?t lu?ng nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article19.2.jpg" /></p>
			<p style="text-align:center"><strong><em>Vi?t Ý Wine - nh?p kh?u và phân ph?i ru?u vang Ý Monteverdi.</em></strong></p>
			<h3 style="text-align:justify">Mua ru?u vang hoàng d? t?i H?u Giang</h3>
			<p style="text-align:justify">Trong nhi?u dòng vang mà Vi?t Ý Wine phân ph?i, <a href="https://vietywine.com/dolce-novella">Dolce Novella</a> – ru?u vang hoàng d? chính là cái tên n?i b?t nh?t luôn gi? v?ng “ngôi vuong” v? s?n lu?ng tiêu th? ru?u vang ng?t t?i H?u Giang lên t?i 12.000 chai m?i nam. Không ph?i ng?u nhiên, ru?u vang hoàng d? l?i du?c yêu thích d?n th?, nó n?i ti?ng nhu v?y là c? m?t k? công trong t?ng khâu ch?n l?a nguyên li?u và ch? bi?n thành ph?m, dóng chai d?u ph?i tr?i qua m?t quy trình vô cùng kh?t khe.</p>
			<p style="text-align:justify">Không ch? các dòng vang ng?t m?i mang l?i s?c hút, ru?u vang chát cung v?y. V?i huong v? d?c trung là v? cay n?ng v?i d? chát cao, chua v?a kéo dài cùng v?i huong hoa qu? den d?m dà. <a href="https://vietywine.com/montepulciano-dabruzzo">Montepulciano D’Abruzzo</a> chính là s? cân b?ng tuy?t v?i khi thu?ng th?c.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article19.3.jpg" /></p>
			<p style="text-align:center"><strong><em>Dolce Novella - ru?u vang ng?t s? 1 Vi?t Nam</em></strong></p>
			<p style="text-align:justify">Hy v?ng v?i d?a ch? <strong><em>mua ru?u vang t?i H?u Giang</em></strong> giúp b?n d?c có thêm cho mình nh?ng thông tin b? ích. Ð? mua ru?u vang hay tr? thành nhà phân ph?i các s?n ph?m c?a <a href="https://vietywine.com/">Vi?t Ý Wine</a> hãy g?i ngay t?i s? <a href="tel:024.2269.6999">024.2269.6999</a>.</p>
			<p style="text-align:justify">&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, 1, 19, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Article] ([ArticleID], [Code], [Title], [Description], [Avatar], [Thumb], [Content], [Keyword], [ImageList], [SourcePage], [SourceLinhk], [AttachmentFile], [ViewTime], [Status], [Position], [CreateTime], [CreateBy], [ArticleCategoryID]) VALUES (20, NULL, N'MUA RƯỢU VANG TẠI QUẢNG NAM CHÍNH HÃNG', N'<p>Nền kinh tế phát triển cùng với đó là nhu cầu mua rượu vang tại Hậu Giang tăng cao. Cùng tìm hiểu đị...</p>', N'/Uploads/Article/Article20.jpg', NULL, N'<p style="text-align:justify">Qu?ng Nam là m?t t?nh thành n?m ? Duyên H?i Nam Trung B?, v?i d?a hình có c? d?ng b?ng và vùng núi tr?i dài. Quý khách hàng là ngu?i sành vang nhung vân chua tìm du?c d?a ch? <em>mua ru?u vang t?i Qu?ng Nam</em>. Hãy cùng tìm hi?u v? d?a ch? mua ru?u uy tín ngay trong bài vi?t du?i dây nhé.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article20.1.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u vang Ý t?i Qu?ng Nam</h3>
			<p style="text-align:justify">Ru?u vang Ý dang ngày càng du?c ua chu?ng trên th? gi?i trong dó có Vi?t Nam. V?i da d?ng các dòng cùng nhi?u gi?ng nho khác nhau, huong v? c?a ru?u vang Ý dã và dang chinh ph?c du?c nhi?u ngu?i sành vang khó tính nh?t. Vi?t Nam cung là m?t trong nh?ng d?t nu?c có s?n lu?ng tiêu th? ru?u l?n trong khu v?c Ðông Nam Á.</p>
			<p style="text-align:justify">Tuy nhiên, th? tru?ng t?i Vi?t Nam dang ngày càng h?n lo?n, hàng gi?, hàng kém ch?t lu?ng du?c bày bán tràn lan, du?i m?i hình th?c và khó ki?m soát. Ru?u vang cung là m?t trong nh?ng s?n ph?m b? là gi? vô cùng tinh vi và không d? d? nh?n bi?t. Ð? ch?c ch?n mua du?c ru?u vang ch?t lu?ng, quý khách hàng c?n <a href="https://vietywine.com/mua-ruou-vang-tai-quang-nam-chinh-hang"><strong><em>mua ru?u vang t?i Qu?ng Nam</em></strong></a> t?i noi có d?a ch? rõ ràng, uy tín lâu nam, nh?p kh?u chính hãng và có cam k?t d?m b?o.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article20.2.jpg" /></p>
			<h3 style="text-align:justify">Mua ru?u vang Hoàng Ð? t?i Qu?ng Nam</h3>
			<p style="text-align:justify">Vi?t Ý Wine – don v? nh?p kh?u và phân ph?i d?c quy?n ru?u vang Ý Monteverdi t?i th? tru?ng Vi?t Nam. Su?t hon 20 nam t? khi có m?t trên th? tru?ng, Vi?t Ý luôn là di?m d?n quen thu?c c?a gi?i sành vang trên m?i mi?n T? Qu?c. Mua ru?u vang t?i Qu?ng Nam chua bao gi? d? dàng và d?m b?o dên v?y.</p>
			<p style="text-align:justify">Ru?u vang Hoàng Ð? Dolce Novella, dòng vang ng?t chua bao h?t “hot” nhà Monteverdi. V?i huong v? m?m m?ng, ng?t ngào và vô cùng tuoi mát c?a gi?ng nho Blend, Dolce Novella dã chinh ph?c du?c r?t nhi?u ngu?i sành vang trên th? gi?i và d?n tr? nên quen thu?c trên th? tru?ng Vi?t Nam. Ngoài dòng ru?u vang Hoàng Ð? du?c yêu thích qua nhi?u nam, Vi?t Ý Wine còn nh?p kh?u và phân ph?i r?t nhi?u dòng ru?u vang n?i ti?ng nhu Negroamaro, Amarone, Pinot Grigio,….</p>
			<p style="text-align:justify">Chúng tôi có d?i ngu nhân viên tu v?n giàu kinh nghi?m, quý khách hàng ch?c ch?n s? l?a ch?n du?c cho mình lo?i ru?u vang phù h?p v?i nhu c?u c?a mình nh?t.</p>
			<p style="text-align:center"><img src="Uploads/Article/ArticleDetail/Article20.3.jpg" /></p>
			<p style="text-align:justify">Hy v?ng qua bài vi?t, quý d?c gi? dã tìm du?c cho mình d?a ch? mua ru?u vang t?i Qu?ng Nam uy tín, chính hãng. &nbsp;M?i th?c m?c và thông tin v? s?n ph?m vui lòng tham kh?o website chính th?c c?a công ty&nbsp;<a href="https://vietywine.com/">Vi?t Ý Wine</a>&nbsp;ho?c liên h? hotline&nbsp;s? &nbsp;<a href="tel:024.2269.6999">024.2269.6999</a>.&nbsp;</p>
			', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', NULL)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobile], [AttachmentFile], [Content], [Status], [CreateTime], [CreateBy], [ContactCategoryID]) VALUES (1, NULL, N'02422696999', NULL, NULL, NULL, NULL, N'024.2269.6999', 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobile], [AttachmentFile], [Content], [Status], [CreateTime], [CreateBy], [ContactCategoryID]) VALUES (2, NULL, N'Email', NULL, NULL, NULL, NULL, N'vietywine@vietygroup.vn', 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobile], [AttachmentFile], [Content], [Status], [CreateTime], [CreateBy], [ContactCategoryID]) VALUES (3, NULL, N'Địa chỉ', NULL, NULL, NULL, NULL, N'74 Nam Đồng, Đống Đa, Hà Nội', 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobile], [AttachmentFile], [Content], [Status], [CreateTime], [CreateBy], [ContactCategoryID]) VALUES (4, NULL, N'Facebook', NULL, NULL, NULL, NULL, N'https://www.facebook.com/VietYWine/', 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[Contact] ([ContactID], [Code], [FullName], [Email], [Address], [Mobile], [AttachmentFile], [Content], [Status], [CreateTime], [CreateBy], [ContactCategoryID]) VALUES (5, NULL, N'Youtobe', NULL, NULL, NULL, NULL, N'https://www.youtube.com/channel/UCixSUp2qEitVP2Z2LgU4GBA/featured', NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Introduce] ON 

INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (1, NULL, N'Lịch sử rượu vang', NULL, N'<p style="text-align:justify"><strong>Lịch sử&nbsp;rượu vang</strong>&nbsp;kéo dài hàng nghìn năm và gắn bó chặt chẽ với lịch sử&nbsp;nông nghiệp,&nbsp;ẩm thực,&nbsp;văn minh,&nbsp;loài người.</p>', 1, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 1, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (2, NULL, N'SỰ PHÁT TRIỂN', NULL, N'<p style="text-align:justify">Qua các giai đoạn lịch&nbsp;<strong>sử phát triển của rượu vang</strong>, đến ngày nay, vang vẫn hiện diện trong các bữa tiệc từ đơn giản cho đến thịnh soạn.</p>', 2, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 1, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (3, NULL, N'TIÊU CHUẨN', NULL, N'<p style="text-align:justify"><em><strong>Tiêu chuẩn đánh giá chất lượng rượu vang</strong></em>&nbsp;phụ thuộc vào: 95% chất lượng rượu vang phụ thuộc vào phẩm chất của trái nho, 5% phụ thuộc vào bí quyết&nbsp;làm rượu của từng nhà sản xuất.</p>', 3, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 1, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (4, NULL, N'RƯỢU VANG NHO Ý', NULL, N'<p style="text-align:justify">Ý&nbsp;là một trong số những&nbsp;quốc gia&nbsp;lâu đời nhất về sản xuất&nbsp;rượu vang&nbsp;trên thế giới, và thương hiệu&nbsp;<strong>rượu vang Ý&nbsp;</strong>như Moscato d’Asti, Chianti, Amarone và Prosecco.</p>', 4, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 1, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (5, N'/Uploads/Introduce/introduce1.jpg', N'Bảo quản rượu vang đúng cách!', NULL, N'<p>Nhà bạn có thói quen uống rượu vang hoặc thích sưu tầm rượu vang về để có dịp mang ra thưởng thức. Và cứ như vậy, rượu ngày càng nhiều và bạn muốn bảo quản chúng thật tốt để chúng không bị hỏng hóc hay mất vị ngon.</p>
		    <p>Điều bạn cần lưu ý lúc này là chọn không gian, địa điểm, điều chỉnh ánh sáng, nhiệt độ, độ ẩm để có thể tạo ra nơi lý tưởng để cất trữ rượu vang.</p>', 1, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 2, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (6, N'/Uploads/Introduce/introduce2.jpg', N'Những chai vang hấp dẫn dành cho phái đẹp', NULL, N'<p>Dường như, rượu vang và phụ nữ luôn được nhắc đến là sự đồng điệu quyến rũ làm biết bao thế hệ quý ông say mê. Nếu như rượu vang thể hiện lên khi thưởng thức bao gồm đủ cả vị chua, vị chát, vị đắng, vị ngọt thì khi người phụ nữ hờn ghen, giận dỗi, bực tức hay âu yếm, nũng nịu là những lúc chúng ta được nếm qua tất cả những ngọt bùi, chua chát, nồng nàn hay đắng ngắt của cuộc tình.</p>
			<p>Trong thời buổi năng động hiện nay không chỉ ở phương Tây mà còn ở châu Á, phụ nữ không gặp trở ngại gì trong việc thưởng thức rượu vang bên cạnh bạn bè người thân sau một ngày làm việc căng thẳng. Hình ảnh người phụ nữ bên ly rượu vang trên các kênh truyền thông đã góp phần không nhỏ vào sự phát triển của văn hóa hiện đại.</p>', 2, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 2, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (7, N'/Uploads/Introduce/history1.png', N'Khởi đầu', N'1986 - 2005', N'<p>Hợp tác xã An Dương, được thành lập từ năm 1986.<br>
               Với thế mạnh là kinh doanh bất động sản, kinh doanh vật liệu xây dựng và&nbsp;sản xuất gạch lát cho toàn bộ các công trình xây dựng tại miền Bắc.</p>
			<p>Hợp tác xã An Dương đã chính thức đổi tên thành công ty TNHH Thương Mại và Xây Dựng Việt Ý vào năm 1999.</p>	
			<p>Tham gia đầu tư và kinh doanh bất động sản từ năm 1986, đến năm 2005, Việt Ý chính thức mở sàn giao dịch bất động sản Việt Ý Land và tự hào nằm trong top 100 sàn giao dịch bất động sản uy tín nhất tại Việt Nam</p>', 1, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 3, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (8, N'/Uploads/Introduce/history2.png', N'Kinh doanh bất động sản', N'2005 - 2014', N'<p>Việt Ý tự hào là đối tác xây dựng các khu chung cư lớn như: dự án khu đô thị Mỹ Đình, dự án khu đô thị Việt Hưng, khu chung cư Đồng Phát Park View Tower Hà Nội, dự án liền kề san hô – Hạ Long tại Quảng Ninh, dự án chung cư HH1- HH4 tại Linh Đàm – Hà Nội, dự án chung cư tại CT12A – CT12C Kim Văn Kim Lũ Hà Nội, tổ hợp căn hộ cao cấp Mường Thanh Nha Trang, vv….<br>
               Đặc biệt, Việt Ý đang sở hữu rất nhiều mặt bằng cho thuê đẹp tại các vị trí trung tâm trên toàn quốc như: các ki ốt tại khu đô thị Mỹ Đình,&nbsp;khu đô thị&nbsp;Việt Hưng, các mặt sàn tầng 1, tầng 2 tại tổ hợp HH Linh Đàm, các bất động sản mặt phố tại Xã Đàn, Nguyễn Xiển, vv….</p>', 2, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 3, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (9, N'/Uploads/Introduce/history3.png', N'Chuỗi siêu thị bán lẻ Việt Ý Mart', N'2014', N'<p>Tháng 12 năm 2014, Việt Ý chính thức khai trương siêu thị bán lẻ Việt Ý Mart tại tầng 1, Tòa nhà CT12A, Q.Hoàng Mai, Hà Nội. Đây là siêu thị có quy mô lên tới hơn 700 m2, bao gồm nhiều ngành hàng đa dạng như thực phẩm, hóa mỹ phẩm, thời trang, đồ chơi, sách truyện, vv…</p>
		    <p>Chuỗi siêu thị Việt Ý Mart hiện tại đã có mặt tại Hà Nội, Nha Trang, Phú Quốc…</p>', 3, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 3, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (10, N'/Uploads/Introduce/history4.png', N'Trung tâm thương mại', N'2017', N'<p>Tháng 12 năm 2017, Việt Ý khai trương trung tâm thương mại Hòn Chồng (HON CHONG CENTER) với diện tích lên tới 1300m2, 67 gian hàng khác nhau tại tòa OC1 thuộc khu căn hộ Mường Thanh Viễn Triều, Phạm Văn Đồng, Thành phố Nha Trang. Sở hữu vị trí đẹp ngay đối diện khu du lịch Hòn Chồng và bãi biển Nha Trang thơ mộng, nơi đây hứa hẹn là điểm đến hấp dẫn với khách du lịch trong và ngoài nước.</p>', 4, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 3, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (11, N'/Uploads/Introduce/history5.png', N'Khách Sạn Paralia', N'2018', N'<p>Tháng 7 năm 2018, Việt Ý khai trương chuỗi khách sạn Paralia 4 sao Quốc Tế tại Hòn Chông, Khánh Hòa, Nha Trang.&nbsp;</p>
			<p>Tiêu Chuẩn: 4 sao Quốc Tế.</p>
			<p>Đơn Vị Vận Hành: City Smart Hotel Management Canada.</p>
			<p>Số Phòng: 120 phòng.</p>
			<p>Chủ Đầu Tư:&nbsp; Công ty TNHH Thương mại và Xây dựng Việt Ý.</p>', 5, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 3, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (12, N'/Uploads/Introduce/history5.png', N'MITOLOGIA', N'2019', N'<p>Tháng 2 năm 2019, Việt Ý chính thức ký phân phối độc quyền rượu vang nhãn hàng Mitologia thuộc tổng công ty Monteverdi Italia tại Việt Nam.</p>', 6, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 3, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (13, NULL, NULL, NULL, N'<p>Giới thiệu vang Ý!</p>
		    <p>Nhiều người Ý uống rượu vang trong suốt bữa ăn, và đưa ra mời khách ngay khi khách đến chơi nhà. Nho được trồng ở hầu hết các vùng trên đất Ý, với hơn 1 triệu vườn nho đang được canh tác. Mỗi vùng đất ở đây đều rất tự hào với những cây nho được chăm sóc cẩn thận và những loại rượu vang họ sản xuất ra.</p>', 1, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 4, N'admin')
INSERT [dbo].[Introduce] ([IntroduceID], [Avatar], [Title], [YearHistory], [Description], [Position], [Status], [CreateTime], [IntroduceCategoryID], [CreateBy]) VALUES (14, NULL, NULL, NULL, N'<p><em>Phần lớn việc sản xuất&nbsp;<strong>rượu vang ý</strong>&nbsp;được tiến hành trong những nhà máy sản xuất rượu vang nghệ thuật hiện đại, tuy nhiên cũng có những người làng tiến hành sản xuất loại rượu vang cho riêng họ uống, dùng chân đất dậm mạnh vào nho. Họ tin rằng phương pháp cổ xưa này vẫn tạo ra những loại rượu vang ngon.</em></p>', 2, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), 4, N'admin')
SET IDENTITY_INSERT [dbo].[Introduce] OFF
SET IDENTITY_INSERT [dbo].[IntroduceCategory] ON 

INSERT [dbo].[IntroduceCategory] ([IntroduceCategoryID], [Title], [Status], [CreateTime], [CreateBy]) VALUES (1, N'IntroduceTop', 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin')
INSERT [dbo].[IntroduceCategory] ([IntroduceCategoryID], [Title], [Status], [CreateTime], [CreateBy]) VALUES (2, N'IntroduceBody', 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin')
INSERT [dbo].[IntroduceCategory] ([IntroduceCategoryID], [Title], [Status], [CreateTime], [CreateBy]) VALUES (3, N'History', 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin')
INSERT [dbo].[IntroduceCategory] ([IntroduceCategoryID], [Title], [Status], [CreateTime], [CreateBy]) VALUES (4, N'IntroduceBottom', 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[IntroduceCategory] OFF
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([PictureID], [Code], [Avatar], [Title], [Description], [Thumb], [Url], [Position], [Status], [CreateTime], [CreateBy], [PictureCategoryID]) VALUES (1, NULL, N'/Uploads/MainPicture/ong-chu-tham-vuon-nho.jpg', N'Ông chủ thăm vườn nhỏ', NULL, NULL, NULL, 1, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', 1)
INSERT [dbo].[Picture] ([PictureID], [Code], [Avatar], [Title], [Description], [Thumb], [Url], [Position], [Status], [CreateTime], [CreateBy], [PictureCategoryID]) VALUES (2, NULL, N'/Uploads/MainPicture/parallax-img.jpg', N'Vườn nhỏ trên một cánh tại Anh', NULL, NULL, NULL, 1, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, 2)
SET IDENTITY_INSERT [dbo].[Picture] OFF
SET IDENTITY_INSERT [dbo].[PictureCategory] ON 

INSERT [dbo].[PictureCategory] ([PictureCategoryID], [COde], [Title], [Description], [Avatar], [Thumb], [Position], [Status], [CreateTime], [CreateBy], [PictureMainCategoryID]) VALUES (1, NULL, N'MainBanner', NULL, NULL, NULL, 1, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[PictureCategory] ([PictureCategoryID], [COde], [Title], [Description], [Avatar], [Thumb], [Position], [Status], [CreateTime], [CreateBy], [PictureMainCategoryID]) VALUES (2, NULL, N'MainBottom', NULL, NULL, NULL, 1, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
SET IDENTITY_INSERT [dbo].[PictureCategory] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (1, NULL, N'AMARONE DELLA VALPOLICELLA', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/AMA.jpg', NULL, 3500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p style="text-align:justify">Rượu vang Amarone Della Valpolicella của nhà Monteverdi với hương vị tuyệt hảo. Hương thơm mạnh mẽ của hoa quả đen, nho khô, cùng với hương gỗ sồi hòa quyện tạo ra sự cân bằng hoàn hảo đặc trưng cho Amarone Della Valpollicella. Amarone mang hương vị mạnh mẽ, đậm đà, chát cao và hậu vị kéo dài.</p>
			<p>Amarone Della Valpolicella có màu đỏ đậm, với hương vị đặc trưng của trái cây sấy khô và rất thích hợp khi kết hợp với các món ăn thịt nướng, thịt thú rừng và pho-mat lâu năm.</p>
			<p style="text-align:justify">&nbsp;</p>
			', N'RƯỢU VANG AMARONE DELLA VALPOLICELLA', N'<p style="text-align:justify">Rượu vang Amarone Della Valpolicella của nhà Monteverdi với hương vị tuyệt hảo. Hương thơm mạnh mẽ của hoa quả đen, nho khô, cùng với hương gỗ sồi hòa quyện tạo ra sự cân bằng hoàn hảo đặc trưng cho Amarone Della Valpollicella. Amarone mang hương vị mạnh mẽ, đậm đà, chát cao và hậu vị kéo dài.</p>
			<p>Amarone Della Valpolicella có màu đỏ đậm, với hương vị đặc trưng của trái cây sấy khô và rất thích hợp khi kết hợp với các món ăn thịt nướng, thịt thú rừng và pho-mat lâu năm.</p>
			<p style="text-align:justify">&nbsp;</p>
			', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (2, NULL, N'DOLCE NOVELLA', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/HOANG-DE-CU-400x400.png', NULL, 4500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p style="text-align:justify">Rượu vang Hoàng Đế&nbsp;Dolce Novella là dòng vang ngọt ngon nhất tại Việt Nam. Vang Hoàng Đế – Dolce Novella là loại rượu vang đậm đà, êm dịu với vị ngọt và hương thơm của nho chín.&nbsp;</p>
		    <p style="text-align:justify">Rượu Vang Hoàng Đế Monteverdi “Hương Vị Tình Yêu” có màu đỏ Ruby thẫm, vị mềm mỏng, ngọt ngào, tươi mát và rất dễ uống. Vang Hoàng Đế rất phù hợp với những người yêu thích vị ngọt, nồng độ rượu ở mức vừa phải đủ làm say đắm và chinh phục phái nữ. Rượu Vang Hoàng Đế có nhiều tác dụng cho sức khỏe và tim mạch đã và đang phổ biến trong những bữa ăn của gia đình.</p>
		<p style="text-align:justify">Rượu vang Hoàng Đế&nbsp;Dolce Novella là dòng vang ngọt ngon nhất tại Việt Nam. Vang Hoàng Đế – Dolce Novella là loại rượu vang đậm đà, êm dịu với vị ngọt và hương thơm của nho chín.&nbsp;</p>
		    <p style="text-align:justify">Rượu Vang Hoàng Đế Monteverdi “Hương Vị Tình Yêu” có màu đỏ Ruby thẫm, vị mềm mỏng, ngọt ngào, tươi mát và rất dễ uống. Vang Hoàng Đế rất phù hợp với những người yêu thích vị ngọt, nồng độ rượu ở mức vừa phải đủ làm say đắm và chinh phục phái nữ. Rượu Vang Hoàng Đế có nhiều tác dụng cho sức khỏe và tim mạch đã và đang phổ biến trong những bữa ăn của gia đình.</p>
				', N'VANG HOÀNG ĐẾ – DOLCE NOVELLA', N'<p>Vang Hoàng Đế - Dolce Novella được chế biến từ loại nho vùng Lombardy phía Bắc Italia,<strong> </strong>được trồng trên những khu vực có điều kiện canh tác thuận lợi nhất Italia.</p>
		    <p>Rượu vang ngọt Monteverdi được xử lý qua một quá trình khép kín ngâm ủ, đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Là một loại rượu vang ngọt của Ý nên Hoàng Đế &nbsp;dễ uống và thực sự hấp dẫn bởi hương vị cũng như hương thơm mà nó đem lại khi thưởng thức.</p>
		  ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (3, NULL, N'DOLCE NOVELLA EXCLUSIVE', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/DOLCE-NOVELLA-NEW.png', NULL, 2500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p style="text-align:justify">Rượu vang Dolce Novella Exclusive hay Vang Hoàng Đế Đặc Biệt với thiết kế hiện đại, hương vị cuốn hút.&nbsp;Vang Hoàng Đế Đặc Biệt là một bản nâng cấp từ Dolce Novella truyền thống. Là một trong những loại Vang quý được sản xuất bằng phương pháp truyền thống kết hợp công nghệ hiện đại giúp hương vị ngọt ngào, đậm đà đến từ việc lựa chọn nguyên liệu từ loại nho đặc biệt.</p>
		    <p style="text-align:justify">&nbsp;</p>
		  ', N'DOLCE NOVELLA EXCLUSIVE', N'<p style="text-align:justify">Dolce Novella Exclusive&nbsp;được chế biến từ loại nho vùng Lampuganis, phía Bắc Italia, được trồng trên vùng đất có điều kiện canh tác thuận lợi nhất Italia.</p>
		  <p>Rượu vang ngọt Monteverdi được xử lý qua một quá trình kép kín ngâm ủ đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Là một loại rượu vang ngọt của Ý nên Vang Hoàng Đế dễ uống và thực sự hấp dẫn bởi hương vị cũng như hương thơm mà nó đem lại khi thưởng thức.</p>
		  <p style="text-align:justify">&nbsp;</p>
		  <p style="text-align:justify">&nbsp;</p>
		  ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (4, NULL, N'MONTEPULCIANO D’ABRUZZO', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/MONTEPULCIANO-D''ABRUZZO.png" ', NULL, 250000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p style="text-align:justify">Rượu vang Montepulciano D’Abruzzo với hương vị gỗ sồi đậm đà và hương thơm quyến rũ. Rượu vang Montepulciano với hương vị đặc trưng là vị cay nồng kéo dài cùng với hương hoa quả đen đậm đà. Chát cao, chua vừa tạo nên sự cân bằng tuyệt vời khi thưởng thức thêm với hậu vị dài đọng lại trên khoang miệng.</p>
		    <p style="text-align:justify">Với màu đỏ đậm và vị khô khi thưởng thức. Montepulciano D’Abruzzo sẽ đem đến những cảm giác mới mẻ và hài hòa trong những bữa tiệc của thực khách. Montepulciano D’Abruzzo sẽ trở nên đặc biệt hơn khi kết hợp với nước sốt, thịt đỏ nướng, thịt cừu nướng, thịt lợn nướng.</p>
		   ', N'RƯỢU VANG MONTEPULCIANO D’ABRUZZO', N'<p>Rượu vang Montepulciano phải bao gồm tối thiểu 85% Montepulciano và tối đa 15% Sangaguese. Nho được thu hoạch với năng suất không lớn hơn 14 tấn mỗi ha. Rượu Montepulciano sản xuất từ vùng Abruzzo.</p>
		    <p>Rượu vang nhà&nbsp;Monteverdi được xử lý qua một quá trình kép kín ngâm ủ đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài.&nbsp;</p>
			<p>&nbsp;</p>
		    ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (5, NULL, N'PRIMITIVO PUGLIA', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/PRIMITIVO-PUGLIA.png', NULL, 2800000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p>Rượu vang Primitivo Puglia có màu đỏ đậm hòa cùng một chút sắc tím cùng với độ cân bằng trong hương vị của rượu.&nbsp;Rượu vang Primitivo Puglia mang hương vị hoa quả đen, mơ sấy, dâu đen, cam thảo...Primitivo Puglia có độ chát cao, chua vừa, cân bằng rất dễ thưởng thức và hậu&nbsp;vị dài.</p>
		    <p>Primitivo Puglia thích hợp sử dụng kết hợp với các món ăn chế biến từ thịt đỏ và các loại pho-mát trưởng thành.</p>
		  ', N'RƯỢU VANG PRIMITIVO PUGLIA', N'<p>Rượu vang Primitivo Puglia được xử lý qua một quá trình khép kín, ngâm ủ và đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Là loại rượu vang được sản xuất từ giống nho Primitivo đặc trưng của vùng Puglia.&nbsp;Nho Primitivo được sản xuất tại vùng Puglia.</p>
		  ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (6, NULL, N'SANGIOVESE PUGLIA', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/SANGIOVESE-PUGLIA.png', NULL, 4000000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p style="text-align:justify">Rượu Vang Ý Sangiovese Puglia Monteverdi có màu đỏ đậm. Đây được coi là loại vang thể hiện những phẩm chất tiêu biểu nhất cho rượu vang của vùng đất màu mỡ Puglia miền Đông Nam nước Ý.</p>
		    <p>Rượu vang&nbsp;Sangiovese đậm mùi hoa quả đỏ tươi, quả cherry, quả mâm xôi đỏ, quả việt quất. Xen lẫn mùi hương của mùi cây đinh hương và mùi quế.&nbsp;Sangiovese Puglia có độ chát vừa, chua cao, hậu vị dài.</p>
		    <p>Rượu vang Sangiovese trước hết vô cùng thích hợp với các món ăn của Ý. Bạn cũng có thể dùng loại&nbsp; này với các món nướng đơn giản. Hay các món không đậm gia vị như món gà tây, thịt gà hay thịt vịt. Đây là chai rượu vang ngon, có phức hợp hương thơm hấp dẫn nhưng nồng độ lại không nặng.</p>
		    <p style="text-align:justify">&nbsp;</p>', N'SANGIOVESE PUGLIA', N'<p>Rượu&nbsp;được sản xuất từ giống nho Sangiovese. Là một giống nho lai tạo giữa giống nho Ciliegiolo có lịch sử phát triển lâu đời tại Tuscany và Calabrese Montenuovo ở miền Nam nước Ý. Vào giữa thế kỷ 21, cứ mỗi 10 cây nho được trồng trên bán đảo Ý thì có một cây là Sangiovese.</p>
		    <p>Rượu Sangiovese Puglia được sản xuất tại vùng Puglia. Vùng Puglia là một vùng rượu vang dài, hẹp nằm ở góc Đông Nam nước Ý.</p>
		    <p>Rượu vang được xử lý qua một quá trình khép kín ngâm ủ và đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Sangiovese Puglia được lão hóa trong thùng gỗ sồi.</p>
		   ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (7, NULL, N'PINOT GRIGIO PROVINCIA DI PAVIA', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/PINOT-GRIGIO-PROVINCIA-DI-PAVIA.png', NULL, 4500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p>Rượu vang trắng Pinot Grigio với hương vị tươi mát, nhẹ nhàng. Trong nhiệt độ thích hợp vang Pinot Grigro sẽ đem đến hương vị rõ ràng hơn của vị chanh, lê, đào, táo. Là loại rượu vang cao cấp của Ý nên Pinot Grigio thực sự hấp dẫn bởi hương vị cũng như hương thơm mà nó đem lại.</p>
		    <p>Vang trắng Pinot Grigio Ý thường hoàn toàn không ngọt, có vị chua nổi bật cùng chút đắng của hạnh đào. Với hương vị nhẹ nhàng thanh thoát dễ dàng kết hợp với các đồ hải sản khiến Pinot Grigro được nhiều người Ý ưa chuộng.</p>
		  ', N'RƯỢU VANG PINOT GRIGIO', N'<p>Rượu vang trắng Pinot Grigio được sản xuất từ giống nho Pinot Grigio. Pinot Grigio được xử lý qua một quá trình khép kín ngâm ủ, đóng chai vô cùng kỳ công và tách biêt với môi trường bên ngoài. Pinot Grigio là giống nho sản xuất vang trắng ngon nhất Italia.</p>
		    <p>&nbsp;</p>
		  ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (8, NULL, N'NEGROAMARO PUGLIA', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/NEGROAMARO-PUGLIA.png', NULL, 4000000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p style="text-align:justify">Negroamaro Puglia là dòng rượu vang đặc biệt của nhà Monteverdi với hương vị đậm đà và hài hòa của trái cây chín, với một màu đỏ đậm bắt mắt cũng là nét tiêu biểu cho chất lượng rượu vang vùng Puglia.</p>
		    <p>Với đặc tính trái nho vỏ dày nên rượu vang Negroamaro có hương vị chát đậm, cân bằng và hậu vị lưu luyến, hòa quyện với hương thơm của hoa quả đen chín. Hương vị của Negroamaro phức tạp với cấu trúc nhiều lớp mùi khác nhau khi thưởng thức.</p>
			<p>Rượu vang Negroamaro rất phù hợp với những món thịt đỏ như thịt bò, thịt cừu,…hay phô mai nướng cũng là đồ ăn giúp hương vị rượu vang Negroamaro được thể hiện trọn vẹn nhất.</p>
		  ', N'RƯỢU VANG NEGROAMARO PUGLIA', N'<p style="text-align:justify">Rượu vang&nbsp;Negroamaro&nbsp;được sản xuất từ giống nho&nbsp;Negroamaro tại vùng Puglia, phía Đông Nam nước Ý.&nbsp;Rượu vang Negroamaro Puglia được sản xuất và xử lý qua một quá trình khép kín, quá trình ngâm ủ và đóng chai vô cùng kỳ công và tách biệt hoàn toàn với môi trường bên ngoài để có thể tạo ra được những chai vang Negroamaro với hương vị kéo dài.&nbsp;Negroamaro Puglia được lão hóa trong thùng gỗ sồi.</p>
		  ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (9, NULL, N'PROSECCO MONTEVERDI', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/PROCESSCO.png', NULL, 2500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p style="text-align:justify">Rượu&nbsp;Prosecco Monteverdi rất được ưa chuộng bởi hương thơm và mùi vị mà nó đem lại.&nbsp;Hương vị cân bằng với vị sủi bọt nhẹ.&nbsp;Prosecco Monteverdi mang mùi hương của đào trắng, táo xanh, cam tươi,...</p>
		    <p style="text-align:justify">Rượu khai vị tuyệt vời đó là hoàn hảo cho tất cả các dịp tri ân, kỉ niệm, đặc biệt là năm mới. Phù hợp với bánh ngọt, bánh tart trái cây, hải sản tươi sống. Sử dụng ở nhiệt độ khoảng 7oC.</p>
		    <p style="text-align:justify">&nbsp;</p>
		    <p style="text-align:justify">&nbsp;</p>
		  ', N'RƯỢU VANG PROSECCO MONTEVERDI', N'<p>Vang&nbsp;Prosecco Monteverdi nổi tiếng nước Ý được làm từ giống nho Glera. Prosecco được sản xuất tại vùng Veneto. Qua các công đoạn và quy trình khép kín nghiêm ngặt về chất lượng giúp Prosecco có tiêu chuẩn DOC về chất lượng.</p>
		  ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (10, NULL, N'CHIANTI MONTEVERDI', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/chianti-monteverdi.jpg', NULL, 3500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p>Rượu vang Chianti - niềm tự hào của xứ Tuscany - là một dòng vang cổ điển nổi tiếng của Ý, rượu có màu đỏ ruby đẹp mắt toát lên vẻ sang trọng và quyến rũ. Rượu vang Chianti có hương vị thơm ngon đặc trưng của các loại hoa quả đỏ như cherry, dâu rừng hòa quyện với hương vanilla mềm mại sau khi được khui khoảng 30 phút.</p>
		  ', N'RƯỢU VANG CHIANTI', N'<p>Được sản xuất tại vùng Tuscany, vùng đất nằm ở miền Trung của nước Ý. Nơi đây có lẽ là vùng sản xuất rượu vang nổi tiếng và là biểu tượng đại diện cho dòng rượu vang của Ý. Chianti - miền đất có truyền thống sản xuất rượu vang lâu đời từ thời trung cổ.</p>
		    <p>Rượu vang được xử lý qua một quá trình khép kín ngâm ủ, đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Chianti&nbsp;được thành trưởng 6 tháng&nbsp;trong thùng gỗ sồi.</p>
		  ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (11, NULL, N'BARALO MONTEVERDI', NULL, NULL, N'/Uploads/Product/RƯỢU MONTEVERDI/ruou-vang-barolo.jpg', NULL, 5000000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, N'<p>Rượu vang Primitivo Puglia có màu đỏ đậm hòa cùng một chút sắc tím cùng với độ cân bằng trong hương vị của rượu.&nbsp;Rượu vang Primitivo Puglia mang hương vị hoa quả đen, mơ sấy, dâu đen, cam thảo...Primitivo Puglia có độ chát cao, chua vừa, cân bằng rất dễ thưởng thức và hậu&nbsp;vị dài.</p>
		    <p>Primitivo Puglia thích hợp sử dụng kết hợp với các món ăn chế biến từ thịt đỏ và các loại pho-mát trưởng thành.</p>
		  ', N'RƯỢU VANG BAROLO', N'<p>Rượu&nbsp;được sản xuất từ giống nho Sangiovese. Là một giống nho lai tạo giữa giống nho Ciliegiolo có lịch sử phát triển lâu đời tại Tuscany và Calabrese Montenuovo ở miền Nam nước Ý. Vào giữa thế kỷ 21, cứ mỗi 10 cây nho được trồng trên bán đảo Ý thì có một cây là Sangiovese.</p>
		    <p>Rượu Sangiovese Puglia được sản xuất tại vùng Puglia. Vùng Puglia là một vùng rượu vang dài, hẹp nằm ở góc Đông Nam nước Ý.</p>
		    <p>Rượu vang được xử lý qua một quá trình khép kín ngâm ủ và đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Sangiovese Puglia được lão hóa trong thùng gỗ sồi.</p>
		   ', NULL, NULL, N'admin', 1)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (12, NULL, N'Vang Barton & Guestier Reserve Sauvignon Blanc', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/Barton-guestier-sauvignon-blanc-reserve-400x400.jpg', NULL, 2700000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG BARTON', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (13, NULL, N'Vang Giesen Vineyard Selection Sauvignon Blanc', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/121-Vang-Giesen-Vineyard-Selection-Sauvignon-Blanc-400x400.jpg', NULL, 5100000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG GENSEN VINEYARD', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (14, NULL, N'Vang Giesen Chardonnay', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/120-Vang-Giesen-Chardonnay-400x400.jpg', NULL, 5100000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG GENSEN CHANDONNAY', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (15, NULL, N'Vang Giesen Riesling', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/119-Vang-Giesen-Riesling-400x400.jpg', NULL, 4600000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG GENSEN RIESLING', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (16, NULL, N'Vang Giesen Pure Light Sauvvignon Blanc', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/118-Vang-Giesen-Pure-Light-Sauvignon-Blanc-400x400.jpg', NULL, 460000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG GENSEN PURE', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (17, NULL, N'Vang Salentein Barrel Selection Sauvignon Blanc', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/112-Vang-Salentein-Barrel-Selection-Sauvignon-Blanc-400x400.jpg', NULL, 5500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG SALENTEIN BARREL', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (18, NULL, N'Vang Salentein Portillo Sauvignon Blanc', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/111-Vang-Salentein-Portillo-Sauvignon-Blanc-400x400.jpg ', NULL, 3400000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG SALENTEIN PORTILLO', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (19, NULL, N'Vang Red Knot Chardonnay', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/109-Vang-Red-Knot-Chardonnay-400x400.jpg', NULL, 4300000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG RED KNOT', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (20, NULL, N'Vang Santa Carolina Reserva Chardonnay', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/104-Vang-Santa-Carolina-Reserva-Chardonnay-400x400.jpg', NULL, 3400000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG SANTA CAROLINA', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (21, NULL, N'Vang Santa Carolina Estrellas Chardonnay', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/102-Vang-Santa-Carolina-Estrellas-Chardonnay-400x400.jpg', NULL, 4500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG SANTA CAROLINA ESTRELLAS', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (22, NULL, N'Vang Santa Carolina Vistaña Chardonnay', NULL, NULL, N'Uploads/Product/RƯỢU MITOLOGIA/100-Vang-Santa-Carolina-Vistana-Chardonnay-400x400.jpg', NULL, 5500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG SANTA CAROLINA VISTANA', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (23, NULL, N'Vang Errazuriz Aconcagua Costa Chardonnay', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/90-Vang-Errazuriz-Aconcagua-Costa-Chardonnay-400x400.jpg', NULL, 5000000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG ERRAZUIR', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (24, NULL, N'Vang Errazuriz Aconcagua Costa Sauvignon Blanc', NULL, NULL, N'/Uploads/Product/RƯỢU MITOLOGIA/89-Vang-Errazuriz-Aconcagua-Costa-Sauvignon-Blanc-400x400.jpg', NULL, 4500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG ACONCAGUA', NULL, NULL, NULL, N'admin', 2)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (25, NULL, N'Rượu Jack Daniel’s No. 27 Gold Tennessee Whiskey', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/Jack-Daniels-No-27-Gold-Tennessee-Whiskey-400x400.jpg', NULL, 3590000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG JACK DANIEL NO-27', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (26, NULL, N'Rượu Jose Cuervo Especial Blue Agave Silver Tequila', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/ruou-Jose-Cuervo-Especial-Blue-Agave-Silver-Tequila-400x400.jpg', NULL, 3890000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG JOSE CUERO', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (27, NULL, N'Rượu Flirt Vodka Orange', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/flirt-vodka-orange-400x400.jpg', NULL, 2895000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG FLIRT VODKA', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (28, NULL, N'Rượu Jack Daniel’s Tennessee Fire Whisky', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/Ruou_Jack_Daniel_Tennessee_Fire_Whisky_1000ml-400x400.jpg', NULL, 5900000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG JACK DANIEL ', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (29, NULL, N'Rượu Jim Beam Black Extra Aged Bourbon', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/RUOU-Jim-Beam-Black-Extra-Aged-Bourbon-400x400.jpg', NULL, 4500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG JIM BEAM', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (30, NULL, N'Rượu Finsbury London Dry Gin', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/Finsbury-London-Dry-Gin-400x400.jpg', NULL, 4000000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG FINSBURY', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (31, NULL, N'Rượu Chivas Regal Extra Oloroso Sherry Casks', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/chivas-extra-400x400.jpg', NULL, 3700000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG CHIVAS EXTRA', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (32, NULL, N'Rượu Macallan Classic Cut', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/macallan-classic-cut-400x400.jpg', NULL, 3500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG MACALLAN', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (33, NULL, N'Rượu Martell VSOP Aged In Red Barrels', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/MARTELL-VSOP-AGE-IN-RED-BARREL-400x400.jpg', NULL, 4590000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG MARTELL', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (34, NULL, N'Rượu Chivas Regal 15 Year', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/CHIVAS-REGAL-XV-15-400x400.jpg', NULL, 2080000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG CHIVAS', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (35, NULL, N'Rượu Johnnie Walker Blue Label 200th Anniversary', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/JOHNNIE-WALKER-BLUE-LABEL-400x400.jpg', NULL, 4500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG JOHNNIE', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (36, NULL, N'Rượu Johnnie Walker Blue Legendary Eight', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/JOHNNIE-WALKER-BLUE-LEGENDARY-EIGHT-400x400.jpg', NULL, 4590000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG JOHNNIE WALKER', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (37, NULL, N'Rượu Glenmorangie Signet', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/ruou-Glenmorangie-Signet--400x400.jpg', NULL, 3780000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG GLENMORANGIE', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (38, NULL, N'Rượu Grand Marnier Liqueur', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/grand-marnier-liqueur-400x400.jpg', NULL, 6500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG GRAND', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (39, NULL, N'Rượu Alfonso XO', NULL, NULL, N'/Uploads/Product/RƯỢU SPIRITS/ruou-AlfonsoXO-400x400.jpg', NULL, 5700000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG ALFONSO XO', NULL, NULL, NULL, N'admin', 3)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (40, NULL, N'Vang Barton & Guestier Passeport Bordeaux', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/Barton-Guestier-Passeport-Bordeaux-1-400x400.jpg', NULL, 4000000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG BARTON &  GUESTIER', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (41, NULL, N'Vang Orby Pinot Noir IGP Pays d’OC', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/Orby-Pinot-Noir-IGP-1.jpg', NULL, 2500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG ORBY PINOT', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (42, NULL, N'Vang Orby Syrah-Grenache AOC Cotes du Rhone BIO', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/Vang-Orby-Syrah-Grenache-AOC-Cotes-du-Rhone-BIO.jpg', NULL, 2700000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG ORBY SYRAH-GENACHE', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (43, NULL, N'Vang Barton & Guestier Reserve Cabernet Sauvignon', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/Barton-guestier-cabernet-sauvignon-reserve-400x400.jpg', NULL, 4200000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG BARTON SAUGINON', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (44, NULL, N'Vang Barton & Guestier Reserve Sauvignon Blanc', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/Barton-guestier-sauvignon-blanc-reserve-400x400.jpg', NULL, 4200000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG BARTON BLANC', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (45, NULL, N'Vang Barton & Guestier Bordeaux Le Gascon', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/Barton-Guestier-Bordeaux-Le-Gascon-400x400.jpg', NULL, 4200000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG BARTON GASCON', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (46, NULL, N'Vang Villa Jolanda Moscato d’Asti 2018', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/moscato-villa-jolanda-dasti-400x400.jpg', NULL, 3900000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG VILLA JOLANDA', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (47, NULL, N'Vang Penfolds Rawson’s Retreat Cabernet Sauvignon', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/rawsons-retreat-cabernet-sauvignon-400x400.jpg', NULL, 3890000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG PENFOLDS', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (48, NULL, N'Vang Les Cedres De Haura', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/Les-Cedres-De-Haura-400x400.jpg', NULL, 3500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG LES CEDRES', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (49, NULL, N'Vang Salcis Roble Tempranillo', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/salcis-roble-tempranillo-400x400.jpg', NULL, 2500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG SALCIS ROBLE', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (50, NULL, N'Vang Salcis Crianza Tempranillo', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/salcis-crianza-tempranillo-400x400.jpg', NULL, 2500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG SALCIS  CRIANZA', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (51, NULL, N'Vang Agua Santa Gran Reserva Cabernet Sauvignon', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/septima-obra-reserva-malbec-400x400.jpg', NULL, 5500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG AGUA SANTA', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (52, NULL, N'Vang Agua Santa Reserva Cabernet Sauvignon', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/rawsons-retreat-cabernet-sauvignon-400x400.jpg', NULL, 5500000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG AGUA RESERVA ', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (53, NULL, N'Vang Septima Obra Reserva Malbec', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/septima-obra-reserva-malbec-400x400.jpg', NULL, 2850000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG SEPTIMA', NULL, NULL, NULL, N'admin', 4)
INSERT [dbo].[Product] ([ProductID], [Code], [Title], [Description], [Thumb], [Avatar], [Content], [Price], [OldPrice], [Keyword], [ImageList], [Quantity], [Status], [CreateTime], [Position], [Taste], [Name], [AddressProduct], [BgAvatar1], [BgAvatar2], [CreateBy], [ProductCategoryID]) VALUES (54, NULL, N'Vang Rondel Gold Cava', NULL, NULL, N'/Uploads/Product/RƯỢU WINE/Vang-Rondel-Gold-Cava-400x400.jpg', NULL, 2900000, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-31 00:00:14.000' AS DateTime), NULL, NULL, N'RƯỢU VANG RONDEL', NULL, NULL, NULL, N'admin', 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Description], [Thumb], [Avatar], [Title], [Position], [Status], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (1, NULL, NULL, NULL, N'/Uploads/ProductCategory/Mitologia-2.png', N'MONTEVERDI', NULL, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Description], [Thumb], [Avatar], [Title], [Position], [Status], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (2, NULL, NULL, NULL, N'/Uploads/ProductCategory/Monteverdi-1.png', N'MITOLOGIA', NULL, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Description], [Thumb], [Avatar], [Title], [Position], [Status], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (3, NULL, NULL, NULL, NULL, N'SPIRITS', NULL, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Code], [Description], [Thumb], [Avatar], [Title], [Position], [Status], [CreateTime], [CreateBy], [ProductMainCategoryID]) VALUES (4, NULL, NULL, NULL, NULL, N'WINE', NULL, 1, CAST(N'2021-03-31 00:00:14.000' AS DateTime), N'admin', NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[ProductInfo] ON 

INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (1, N'Giống nho và vườn nho', N'<p>Hai giống nho cao cấp được dùng để làm nên chai vang Amarone Della Valpolicella này là 80% nho Corvina Veronese và 20% nho Rondinela</p>', 1, 1, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (2, N'Sản Xuất', N'<p>Nho được thu hoạch vào tuần thứ 2 của tháng 9, sau đó được sấy khô và để trong vòng 120 ngày. Tiếp đến, những trái nho sẽ được nghiền nát và lên men chậm trong vòng 30 ngày ở nhiệt độ tối đa 18 độ.</p>', 1, 1, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (3, N'Khu vực sản xuất', N'<p>Cả 2 loại nho đều được trồng từ vườn nho Tenuta Novare ở Arbizzano di Negrar. Trung tâm khu vực Valpolicella Classica. Nho được thu hoạch vào tuần thứ 2 của tháng 9, sau đó được sấy khô và để trong vòng 120 ngày.</p>', 1, 1, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (4, N'Lão hóa', N'<p>Rượu vang Amarone lên men trong thùng gỗ sồi 12 tháng.</p>', 1, 1, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (5, N'Hương vị', N'<p>Vị hoa quả đen cùng với gỗ sồi&nbsp; hòa quyện tạo ra sự cân bằng hoàn hảo đặc trưng cho Amarone Della Valpollicella.</p>', 1, 1, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (6, N'Kết hợp với đồ ăn', N'<p>Amarone có màu đỏ đậm, với hương vị đặc trưng của trái cây sấy khô và rất thích hợp khi kết hợp với các món ăn thịt nướng, thịt om và pho-mat lâu năm.</p>', 1, 1, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (7, N'Thông tin sản phẩm', N'<ul>
				<li>Nhiệt độ sử dụng thích hợp: 18 độ</li>
				<li>Hương vị: Chát</li>
				<li>Nồng độ: 15%</li>
				<li>Màu sắc: Đỏ đậm</li>
				<li>Thể tích: 750ml</li>
			</ul>', 1, 1, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (8, N'Giống nho và vườn nho', N'<p>Blend</p>', 1, 2, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (9, N'Sản Xuất', N'<p>Rượu vang Dolce Novella của nhà Monteverdi được xử lý qua một quá trình khép kín ngâm ủ, đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Là một loại rượu vang ngọt của Ý nên vang hoàng đế dễ uống và thực sự hấp dẫn bởi hương vị cũng như hương thơm mà nó đem lại khi thưởng thức.</p>', 1, 2, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (10, N'Khu vực sản xuất', N'<p>Vang Hoàng Đế – Dolce Novella được chế biến từ loại nho vùng Lombardy phía Bắc Ý. Nho được trồng trên những khu vực có điều kiện canh tác thuận lợi nhất ở Ý.</p>', 1, 2, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (11, N'Lão hóa', N'<p>Rượu vang Dolce Novella được ủ trong thùng thép không rỉ.</p>', 1, 2, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (12, N'Hương vị', N'<p>Rượu Vang Dolce Novella “<em><strong>Hương Vị Tình Yêu</strong></em>” có màu&nbsp;đỏ Rubi thẫm, vị mềm mỏng, ngọt, tươi mát và rất dễ uống . Dolce Novella rất phù hợp với những người yêu thích vị ngọt, nồng độ rượu ở mức vừa phải đủ làm say đắm và chinh phục phái nữ. Rượu Vang Hoàng Đế có nhiều tác dụng cho sức khỏe và tim mạch đã và đang phổ biến trong những bữa ăn hàng ngày của các gia đình.</p>', 1, 2, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (13, N'Kết hợp với đồ ăn', N'<p>Hợp với đồ tráng miệng như bánh ngọt, kẹo ngọt hoặc hoa quả tươi.&nbsp;Dùng làm đồ tráng miệng trong các bữa tiệc.</p>', 1, 2, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (14, N'Thông tin sản phẩm', N'<ul>
				<li>Hương Vị: Ngọt ngào</li>
				<li>Nồng độ: 10%</li>
				<li>Màu sắc: Đỏ Ruby</li>
				<li>Thể tích: 750 ml</li>
			</ul>', 1, 2, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (15, N'Giống nho và vườn nho', N'<p>Blend</p>', 1, 3, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (16, N'Sản Xuất', N'<p>Rượu vang ngọt Monteverdi được xử lý qua một quá trình khép kín ngâm ủ,&nbsp;đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Là một loại rượu vang ngọt của Ý nên vang hoàng đế dễ uống và thực sự hấp dẫn bởi hương vị cũng như hương thơm mà nó đem lại khi thưởng thức.</p>', 1, 3, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (17, N'Khu vực sản xuất', N'<p>Là một trong những loại Vang quý được sản xuất bằng phương pháp truyền thống với hương vị ngọt ngào, đậm đà đến từ việc lựa chọn nguyên liệu từ loại nho&nbsp; đặc biệt.</p>', 1, 3, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (18, N'Lão hóa', N'<p>Rượu vang Dolce Novella Exclusive&nbsp;được ủ trong thùng thép không rỉ.</p>', 1, 3, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (19, N'Hương vị', N'<p>Hương vị của Vang Hoàng Đế Đặc Biệt đã được nâng cấp và với&nbsp; phương pháp trưng cất hiện đại hơn so với phiên bản Vang Hoàng Đế truyền thống đã lưu giữ được những tinh hoa bậc nhất của trái nho để làm ra những chai rượu Vang Hoàng Đế Đặc Biệt này.</p>', 1, 3, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (20, N'Kết hợp với đồ ăn', N'<p>Hợp với đồ tráng miệng như bánh ngọt, kẹo ngọt hoặc hoa quả tươi. Dùng làm đồ tráng miệng trong các bữa tiệc.</p>', 1, 3, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (21, N'Thông tin sản phẩm', N'<ul>
				<li>Hương Vị: Ngọt ngào</li>
				<li>Nồng độ: 10%</li>
				<li>Màu sắc: Đỏ Ruby</li>
				<li>Thể tích: 750ml và 1500 ml</li>
			</ul>', 1, 3, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (22, N'Giống nho và vườn nho', N'<p>Montepulciano là một loại nho đỏ bắt nguồn từ thung lũng Valle Peligna trong vùng Abruzzo của Ý, được đặt theo tên giáo xứ Tuscany của Montepulciano. Dù giống nho Montepulciano được trồng khắp vùng Abruzzo nhưng tại khu đồi núi Colline Teramane thuộc tỉnh Teramo, cây sinh trưởng và cho ra những trái nho tốt nhất.</p>', 1, 4, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (23, N'Sản Xuất', N'<p>Rượu vang Montepulciano phải bao gồm tối thiểu 85% Montepulciano với tối đa 15% Sangaguese được phép điền vào phần còn lại của rượu. Nho được thu hoạch với năng suất không lớn hơn 14 tấn mỗi ha.</p>', 1, 4, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (24, N'Khu vực sản xuất', N'<p>Rượu Montepulciano sản xuất từ vùng&nbsp; Abruzzo.&nbsp;Khu vực này là một trong những vùng núi cao nhất của Ý với hơn 65% tất cả Abruzzo được coi là địa hình đồi núi, đạt tới 2.750 mét (9.000 ft) trên mực nước biển. Các vườn nho trên sườn đồi, đặc biệt là ở các khu vực phía bắc, được trồng trên đất sét vôi và được hưởng lợi từ việc tiếp xúc với ánh nắng mặt trời ấm áp và đáng kể, được thông gió bằng những cơn gió khô từ biển Adriatic.</p>', 1, 4, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (25, N'Lão hóa', N'<p>Rượu vang được lão hóa 6&nbsp;tháng trong thùng gỗ sồi.</p>', 1, 4, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (26, N'Hương vị', N'<p>Chát cao, chua vừa tạo nên sự cân bằng tuyệt vời khi thưởng thức thêm với hậu vị dài đọng lại trên khoang miệng.</p>', 1, 4, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (27, N'Kết hợp với đồ ăn', N'<p>Montepulciano D’Abruzzo sẽ trở nên đặc biệt hơn khi được kết hợp với nước sốt, thịt đỏ nướng, thịt cừu nướng, thịt lợn nướng…</p>', 1, 4, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (28, N'Thông tin sản phẩm', N'<ul>
				<li>Nhiệt độ sử dụng thích hợp: 18 độ</li>
				<li>Hương Vị: chát</li>
				<li>Nồng độ 14,5%</li>
				<li>Màu sắc: đỏ đậm</li>
				<li>Thể tích: 750 ml</li>
			</ul>', 1, 4, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (29, N'Giống nho và vườn nho', N'<p>Được sản xuất từ giống nho Primitivo - giống nho đặc trưng vùng Puglia.</p>', 1, 5, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (30, N'Sản Xuất', N'<p>Rượu vang Primitivo Puglia được xử lý qua một quá trình khép kín ngâm ủ và đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Là&nbsp;loại&nbsp;rượu vang cao cấp của Ý nên Primitivo Puglia thực sự hấp dẫn bởi hương vị cũng như hương thơm mà nó đem lại khi thưởng thức.</p>', 1, 5, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (31, N'Khu vực sản xuất', N'<p>Vùng Puglia (hay Apulia) là một vùng rượu vang dài, hẹp ở góc đông nam nước Ý. Vùng này&nbsp;lại được chia ra thành hai khu vực bắc&nbsp;nam riêng biệt, với nhiều khác biệt về văn hóa, địa lí lẫn phong cách rượi vang. Khu vực phía bắc có địa hình đồi núi với nền văn hóa làm rượi vang lâu đời ngược lại khu vực phía nam lại bằng phẳng hơn và mang đậm nét văn hóa Greco-Roman cổ đại.</p>', 1, 5, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (32, N'Lão hóa', N'<p>Primitivo Puglia được lão hóa 6 tháng trong thùng gỗ sồi.</p>', 1, 5, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (33, N'Hương vị', N'<p>Primitivo Puglia mang hương vị hoa quả đen, mơ sấy, dâu đen, cam thảo…</p>', 1, 5, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (34, N'Kết hợp với đồ ăn', N'<p>Rượu vang thích hợp sử dụng với các món ăn chế biến từ thịt đỏ và các loại pho-mát trưởng thành.</p>', 1, 5, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (35, N'Thông tin sản phẩm', N'<ul>
				<li>Nhiệt độ thích hợp: 16 độ</li>
				<li>Hương Vị: Chát</li>
				<li>Nồng độ: 14,5%</li>
				<li>Màu sắc: Đỏ đậm</li>
				<li>Thể tích: 750ml và 1.500 ml</li>
			</ul>', 1, 5, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (36, N'Giống nho và vườn nho', N'<p>Được làm từ giống nho&nbsp;Glera vùng Veneto.</p>', 1, 6, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (37, N'Sản Xuất', N'<p>Rượu vang Prosecco Puglia được xử lý qua một quá trình khép kín ngâm ủ và đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài.</p>', 1, 6, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (38, N'Khu vực sản xuất', N'<p>&nbsp;Prosecco được sản xuất tại vùng Veneto. Qua các công đoạn và quy trình khép kín nghiêm ngặt về chất lượng giúp Prosecco có tiêu chuẩn DOC về chất lượng.</p>', 1, 6, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (39, N'Lão hóa', N'<p>Rượu Prosecco được lão hóa trong thùng thép không rỉ.</p>', 1, 6, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (40, N'Hương vị', N'<p>Tạo cảm giác mới mẻ, chua thanh nhẹ khiến khoang miệng sống động như thưởng thức miếng kem trái cây.</p>', 1, 6, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (41, N'Kết hợp với đồ ăn', N'<p>Rượu khai vị tuyệt vời đó là hoàn hảo cho tất cả các dịp tri ân, kỉ niệm, đặc biệt là năm mới. Phù hợp với bánh ngọt, bánh tart trái cây,&nbsp;hải sản tươi sống.</p>', 1, 6, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (42, N'Thông tin sản phẩm', N'<p>Hương vị: Extra dry</p>
			<p>Nồng độ: 11%</p>
			<p>Màu sắc: Vàng rơm</p>
			<p>Thể tích: 750 ml</p>', 1, 6, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (43, N'Giống nho và vườn nho', N'<p>Pinot Grigio - giống nho trắng sản xuất rượu vang ngon nhất Italia.</p>', 1, 7, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (44, N'Sản Xuất', N'<p>Rượu vang trắng được xử lý qua một quá trình khép kín ngâm ủ và đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài. Là&nbsp;loại&nbsp;rượu vang cao cấp của&nbsp;Ý nên Pinot Grigio thực sự hấp dẫn bởi hương vị cũng như hương thơm mà nó đem lại.</p>', 1, 7, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (45, N'Khu vực sản xuất', N'<p>Rượu vang&nbsp;được sản xuất tại khu vực Pavia. Tỉnh Pavia là một tỉnh ở vùng Lombardy của Ý.</p>', 1, 7, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (46, N'Lão hóa', N'<p>Lão hóa 6 tháng trong thùng thép không gỉ.</p>', 1, 7, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (47, N'Hương vị', N'<p>Rượu vang trắng Pinot Grigio mang hương vị chanh, lê, đào và táo. Pinot Grigio&nbsp;có thể phát triển vị mật ong cùng hương hoa cỏ như kim ngân.</p>', 1, 7, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (48, N'Kết hợp với đồ ăn', N'<p>Rượu vang trắng thích hợp sử dụng kết hợp với các món ăn hải sản.</p>', 1, 7, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (49, N'Thông tin sản phẩm', N'<p>Hương Vị: Dịu nhẹ, thanh thoát</p>
			<p>Nồng độ: 12,5%</p>
			<p>Màu sắc: Trắng</p>
			<p>Thể tích: 750 ml</p>', 1, 7, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (50, N'Giống nho và vườn nho', N'<p>Được làm từ giống nho cao cấp Negroamaro vùng Puglia.</p>', 1, 8, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (51, N'Sản Xuất', N'<p>Rượu vang&nbsp;Negroamaro Puglia&nbsp;được xử lý qua một quá trình khép kín ngâm ủ,&nbsp;đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài.</p>', 1, 8, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (52, N'Khu vực sản xuất', N'<p>Sản xuất tại vùng Puglia.</p>', 1, 8, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (53, N'Lão hóa', N'<p>Lão hóa 6 trong thùng gỗ sồi.</p>', 1, 8, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (54, N'Hương vị', N'<p>Rượu có vị khô, hài hòa và bền bỉ. các hương thơm của trái cây chín và gia vị là phức tạp và dữ dội.</p>', 1, 8, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (55, N'Kết hợp với đồ ăn', N'<p>Rượu vang đỏ Negroamaro rất phù hợp với những món thịt đỏ như thịt bò, thịt cừu,...hay phô mai nướng cũng là đồ ăn giúp hương vị rượu vang Negroamaro được thể hiện trọn vẹn nhất.</p>', 1, 8, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (56, N'Thông tin sản phẩm', N'<p>Hương Vị: Chát</p>
			<p>Nồng độ: 14,5%</p>
			<p>Màu sắc: Đỏ đậm</p>
			<p>Thể tích: 750 ml</p>', 1, 8, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (57, N'Giống nho và vườn nho', N'<p>Được làm từ giống nho&nbsp;Glera vùng Veneto.</p>', 1, 9, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (58, N'Sản Xuất', N'<p>Rượu vang Prosecco Puglia được xử lý qua một quá trình khép kín ngâm ủ và đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài.</p>', 1, 9, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (59, N'Khu vực sản xuất', N'<p>&nbsp;Prosecco được sản xuất tại vùng Veneto. Qua các công đoạn và quy trình khép kín nghiêm ngặt về chất lượng giúp Prosecco có tiêu chuẩn DOC về chất lượng.</p>', 1, 9, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (60, N'Lão hóa', N'<p>Rượu Prosecco được lão hóa trong thùng thép không rỉ.</p>', 1, 9, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (61, N'Hương vị', N'<p>Tạo cảm giác mới mẻ, chua thanh nhẹ khiến khoang miệng sống động như thưởng thức miếng kem trái cây.</p>', 1, 9, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (62, N'Kết hợp với đồ ăn', N'<p>Rượu khai vị tuyệt vời đó là hoàn hảo cho tất cả các dịp tri ân, kỉ niệm, đặc biệt là năm mới. Phù hợp với bánh ngọt, bánh tart trái cây,&nbsp;hải sản tươi sống.</p>', 1, 9, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (63, N'Thông tin sản phẩm', N'<p>Hương vị: Extra dry</p>
			<p>Nồng độ: 11%</p>
			<p>Màu sắc: Vàng rơm</p>
			<p>Thể tích: 750 ml</p>', 1, 9, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (64, N'Giống nho và vườn nho', N'<p>Được sản xuất từ giống nho Sangiovese, tỷ lệ 90% Sangiovese, 10% Canaiolo.</p>', 1, 10, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (65, N'Sản Xuất', N'<p>Sau khi thu hoạch, nho được nghiền để giải phóng nước ép nho, trải qua các công đoạn lên men nghiêm ngặt về nhiệt độ&nbsp;và khép kín so với môi trường bên ngoài.</p>', 1, 10, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (66, N'Khu vực sản xuất', N'<p>Được sản xuất tại vùng Tuscany, vùng đất nằm ở miền Trung của nước Ý. Nơi đây có lẽ là vùng sản xuất rượu vang nổi tiếng và là biểu tượng đại diện cho dòng rượu vang của Ý. Chianti - miền đất có truyền thống sản xuất rượu vang lâu đời từ thời trung cổ.</p>', 1, 10, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (67, N'Lão hóa', N'<p>Thành trưởng 6 tháng trong thùng gỗ sồi.</p>', 1, 10, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (68, N'Hương vị', N'<p>Rượu vang Chianti có hương vị hài hòa và tròn trịa. Chianti có hương vị thơm ngon kết hợp với độ acid và tannin cao.</p>', 1, 10, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (69, N'Kết hợp với đồ ăn', N'<p>Một ly Chianti với bít tết và tiêu đen là sự lựa chọn hoàn hảo hoặc pizza hải cùng với các loại thảo mốc và cà chua. Kỹ thuật này thực sự sẽ mang lại hương vị trái cây nhiều hơn trong rượu vang.</p>', 1, 10, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (70, N'Thông tin sản phẩm', N'<ul>
				<li>Hương Vị: Chát đậm</li>
				<li>Nồng độ: 13%</li>
				<li>Màu sắc: Đỏ Ruby</li>
				<li>Thể tích: 750ml</li>
			</ul>', 1, 10, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (71, N'Giống nho và vườn nho', N'<p>Nero Di Troia là một dòng vang làm từ giống nho tại vùng Apulia của Italy. Đặc&nbsp;biệt là các khu vực xung quanh Andria và Barletta, và ở tỉnh Bari.</p>', 1, 11, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (72, N'Sản Xuất', N'<p>Rượu vang Athena&nbsp;được xử lý qua một quá trình khép kín ngâm ủ và đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài.</p>', 1, 11, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (73, N'Khu vực sản xuất', N'<p>Sản xuất tại vùng Apulia.</p>', 1, 11, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (74, N'Lão hóa', N'<p>Lão hóa trong thùng gỗ sồi.</p>', 1, 11, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (75, N'Hương vị', N'<p>Rượu vang Mitologia Athena chát cao chua vừa hậu vị dài.</p>', 1, 11, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (76, N'Kết hợp với đồ ăn', N'<p>Rượu vang Mitologia Athena phù hợp với ẩm thực Ý. Là một sản phẩm của Ý, hầu như tất cả risotto và pasta đều có thể dùng kèm với dòng vang này.</p>', 1, 11, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (77, N'Thông tin sản phẩm', N'<p>Hương Vị: Chát<br>
			Nồng độ: 13%<br>
			Màu sắc: Đỏ Ruby<br>
			Thể tích: 750 ml</p>', 1, 11, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (78, N'Giống nho và vườn nho', N'<p>Nero d’Avola</p>', 1, 12, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (79, N'Sản Xuất', N'<p>Rượu vang Hera được xử lý qua một quá trình khép kín ngâm ủ,&nbsp;đóng chai vô cùng kỳ công và tách biệt với môi trường bên ngoài.</p>', 1, 12, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 2)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (80, N'Khu vực sản xuất', N'<p>Sản xuất tại vùng Sicily.</p>', 1, 12, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 3)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (81, N'Lão hóa', N'<p>Rượu vang Mitologia Hera được lão hóa trong thùng gỗ sồi.</p>', 1, 12, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 4)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (82, N'Hương vị', N'<p>Mitologia Hera có độ chát cao, chua nhẹ, tròn vị, ấm và độ đậm cao.</p>', 1, 12, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 5)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (83, N'Kết hợp với đồ ăn', N'<p>Mitologia Hera phù hợp dùng với các loại thịt đậm. Một vài cách kết hợp đồ ăn là súp đuôi bò và thịt bò hầm, Càng nhiều thịt càng ngon, vì nó sẽ khiến làm nổi bật hương vị trái cây và khiến ly rượu có vị giống như kẹo vậy.</p>', 1, 12, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 6)
INSERT [dbo].[ProductInfo] ([ProductInfoID], [Title], [Description], [Status], [ProductID], [CreateTime], [CreateBy], [Position]) VALUES (84, N'Thông tin sản phẩm', N'<p>Hương Vị: Chát<br>
			Nồng độ: 13,5%<br>
			Màu sắc: Đỏ Ruby<br>
			Thể tích: 750 ml</p>', 1, 12, CAST(N'2021-03-31 00:00:15.000' AS DateTime), N'admin', 7)
SET IDENTITY_INSERT [dbo].[ProductInfo] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([AccountCategoryID])
REFERENCES [dbo].[AccountCategory] ([AccountCategoryID])
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([ArticleCategoryID])
REFERENCES [dbo].[ArticleCategory] ([ArticleCategoryID])
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ArticleCategory]  WITH CHECK ADD FOREIGN KEY([ArticleMainCategoryID])
REFERENCES [dbo].[ArticleMainCategory] ([ArticleMainCategoryID])
GO
ALTER TABLE [dbo].[ArticleCategory]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ArticleMainCategory]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([ContactCategoryID])
REFERENCES [dbo].[ContactCategory] ([ContactCategoryID])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ContactCategory]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Introduce]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Introduce]  WITH CHECK ADD FOREIGN KEY([IntroduceCategoryID])
REFERENCES [dbo].[IntroduceCategory] ([IntroduceCategoryID])
GO
ALTER TABLE [dbo].[IntroduceCategory]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD FOREIGN KEY([PictureCategoryID])
REFERENCES [dbo].[PictureCategory] ([PictureCategoryID])
GO
ALTER TABLE [dbo].[PictureCategory]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[PictureCategory]  WITH CHECK ADD FOREIGN KEY([PictureMainCategoryID])
REFERENCES [dbo].[PictureMainCategory] ([PictureMainCategoryID])
GO
ALTER TABLE [dbo].[PictureMainCategory]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryID])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([ProductMainCategoryID])
REFERENCES [dbo].[ProductMainCategory] ([ProductMainCategoryID])
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductMainCategory]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
