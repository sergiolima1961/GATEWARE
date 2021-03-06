USE [GATEWARE]
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_CLIENTE]    Script Date: 20/01/2021 19:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_CLIENTE](@ACAO           CHAR(1)='C'
                                         ,@ID_CLIENTE    INT =0
                                         ,@DSC_CLIENTE   VARCHAR(150)=''
                                         ,@DT_CLIENTE    DATETIME = NULL
                                         ,@EMAIL_CLIENTE VARCHAR(200)=''
                                         ,@ID_RETORN     INT = 0)
AS
  BEGIN
      DECLARE @PESQUISA VARCHAR(150)=''

      SET NOCOUNT ON;
      SET @ID_RETORN = @ID_CLIENTE;

      IF @ACAO = 'I'
        BEGIN
            INSERT CLIENTE
                   (DSC_CLIENTE
                    ,DT_NASCIMENTO_CLIENTE
                    ,EMAIL_CLIENTE)
            VALUES(@DSC_CLIENTE
                   ,@DT_CLIENTE
                   ,@EMAIL_CLIENTE );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE CLIENTE
            SET    DSC_CLIENTE = @DSC_CLIENTE
                   ,DT_NASCIMENTO_CLIENTE = @DT_CLIENTE
                   ,EMAIL_CLIENTE = @EMAIL_CLIENTE
            WHERE  ID_CLIENTE = @ID_CLIENTE;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM CLIENTE
            WHERE  ID_CLIENTE = @ID_CLIENTE;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ID_CLIENTE                          [Codigo]
                   ,CONVERT(VARCHAR(100), DSC_CLIENTE) [Nome]
                   ,DT_NASCIMENTO_CLIENTE              [Data Nascimemto]
                   ,CONVERT(VARCHAR(100), EMAIL_CLIENTE )                      [E MAIL]
            FROM   CLIENTE CLIENTE (NOLOCK)
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @DSC_CLIENTE
            SET @PESQUISA += '%'

            SELECT ID_CLIENTE                          [Codigo]
                   ,CONVERT(VARCHAR(100), DSC_CLIENTE) [Nome]
                   ,DT_NASCIMENTO_CLIENTE              [Data Nascimemto]
                   ,CONVERT(VARCHAR(100), EMAIL_CLIENTE )                      [E MAIL]
            FROM   CLIENTE (NOLOCK)
            WHERE  DSC_CLIENTE LIKE @PESQUISA
        END
  END 