
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [DBO].[SP_IAEC_PRODUTO] (@ACAO         CHAR(1)='C'
                                         ,@ID_PRODUTO  [INT]
                                         ,@DSC_PRODUTO [VARCHAR](150)
                                         ,@VLR_PRODUTO [DECIMAL](18, 2)
                                         ,@SLD_PRODUTO [INT]
                                         ,@STA_PRODUTO [BIT]
                                         ,@BAR_PRODUTO [VARCHAR](50)
                                         ,@ID_RETORN   INT)
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT PRODUTO
                   (DSC_PRODUTO
                    ,VLR_PRODUTO
                    ,SLD_PRODUTO
                    ,STA_PRODUTO
                    ,BAR_PRODUTO)
            VALUES(@DSC_PRODUTO
                   ,@VLR_PRODUTO
                   ,@SLD_PRODUTO
                   ,@STA_PRODUTO
                   ,@BAR_PRODUTO );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE PRODUTO
            SET    DSC_PRODUTO = @DSC_PRODUTO
                   ,VLR_PRODUTO = @VLR_PRODUTO
            WHERE  ID_PRODUTO = @ID_PRODUTO;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM PRODUTO
            WHERE  ID_PRODUTO = @ID_PRODUTO;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ID_PRODUTO                                [Codigo]
                   ,CONVERT(VARCHAR(30), DSC_PRODUTO)        [Produto]
                   ,VLR_PRODUTO                              [Valor]
                   ,SLD_PRODUTO                              [Saldo]
                   ,IIF(STA_PRODUTO = 1, 'Ativo', 'Inativo') [Status]
                   ,BAR_PRODUTO                              [CODE BAR]
            FROM   PRODUTO (NOLOCK)
            ORDER  BY 2
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @DSC_PRODUTO
            SET @PESQUISA += '%'

            SELECT ID_PRODUTO                                [Codigo]
                   ,CONVERT(VARCHAR(50), DSC_PRODUTO)        [Produto]
                   ,SLD_PRODUTO                              [Saldo]
                   ,IIF(STA_PRODUTO = 1, 'Ativo', 'Inativo') [Status]
                   ,BAR_PRODUTO                              [CODE BAR]
            FROM   PRODUTO (NOLOCK)
            WHERE  DSC_PRODUTO LIKE @PESQUISA
            ORDER  BY 2
        END
  END 