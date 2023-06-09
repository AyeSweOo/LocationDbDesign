USE [S3LocationDB]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 18-May-23 12:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[building_Id] [int] IDENTITY(1,1) NOT NULL,
	[building_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[building_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Level]    Script Date: 18-May-23 12:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[level_Id] [int] IDENTITY(1,1) NOT NULL,
	[building_Id] [int] NOT NULL,
	[level_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[level_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lobby]    Script Date: 18-May-23 12:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lobby](
	[lobby_Id] [int] IDENTITY(1,1) NOT NULL,
	[room_Id] [int] NOT NULL,
	[lobby_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lobby] PRIMARY KEY CLUSTERED 
(
	[lobby_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 18-May-23 12:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[location_Id] [int] NOT NULL,
	[building_Id] [int] NULL,
	[level_Id] [int] NULL,
	[room_Id] [int] NULL,
	[lobby_Id] [int] NULL,
	[pantry_Id] [int] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[location_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pantry]    Script Date: 18-May-23 12:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pantry](
	[pantry_Id] [int] IDENTITY(1,1) NOT NULL,
	[lobby_Id] [int] NOT NULL,
	[pantry_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Pantry] PRIMARY KEY CLUSTERED 
(
	[pantry_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 18-May-23 12:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_Id] [int] IDENTITY(1,1) NOT NULL,
	[level_Id] [int] NOT NULL,
	[room_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[room_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Level]  WITH CHECK ADD  CONSTRAINT [FK_Level_Building] FOREIGN KEY([building_Id])
REFERENCES [dbo].[Building] ([building_Id])
GO
ALTER TABLE [dbo].[Level] CHECK CONSTRAINT [FK_Level_Building]
GO
ALTER TABLE [dbo].[Lobby]  WITH CHECK ADD  CONSTRAINT [FK_Lobby_Room] FOREIGN KEY([room_Id])
REFERENCES [dbo].[Room] ([room_Id])
GO
ALTER TABLE [dbo].[Lobby] CHECK CONSTRAINT [FK_Lobby_Room]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Building] FOREIGN KEY([building_Id])
REFERENCES [dbo].[Building] ([building_Id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Building]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Level] FOREIGN KEY([level_Id])
REFERENCES [dbo].[Level] ([level_Id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Level]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Lobby] FOREIGN KEY([lobby_Id])
REFERENCES [dbo].[Lobby] ([lobby_Id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Lobby]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Pantry] FOREIGN KEY([pantry_Id])
REFERENCES [dbo].[Pantry] ([pantry_Id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Pantry]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Room] FOREIGN KEY([room_Id])
REFERENCES [dbo].[Room] ([room_Id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Room]
GO
ALTER TABLE [dbo].[Pantry]  WITH CHECK ADD  CONSTRAINT [FK_Pantry_Lobby] FOREIGN KEY([lobby_Id])
REFERENCES [dbo].[Lobby] ([lobby_Id])
GO
ALTER TABLE [dbo].[Pantry] CHECK CONSTRAINT [FK_Pantry_Lobby]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Level] FOREIGN KEY([level_Id])
REFERENCES [dbo].[Level] ([level_Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Level]
GO
