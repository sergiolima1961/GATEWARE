/****** Object:  Table [dbo].[CLIENTE]    Script Date: 20/01/2021 18:08:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
Tela de cadastro de clientes contendo os campos:
• Código;
• Nome;
• Data de nascimento;
• E-mail.

*/

CREATE TABLE [dbo].[CLIENTE](
	[ID_CLIENTE] [int] IDENTITY(1,1) NOT NULL,
	[DSC_CLIENTE] [varchar](150) NULL,
	DT_NASCIMENTO_CLIENTE DATE,
	EMAIL_CLIENTE [varchar](200) NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY NONCLUSTERED 
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
