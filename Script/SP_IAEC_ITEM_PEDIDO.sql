-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_ITEM_PEDIDO] (@ACAO                      CHAR(1)='C'
                                             ,@ID_ITEM_PEDIDO           INT
                                             ,@ID_PEDIDO                INT
                                             ,@ID_PRODUTO               INT
                                             ,@QTD_ITEM_PEDIDO          INT
                                             ,@VLR_ITEM_PEDIDO_UNITARIO DECIMAL(12, 2)
                                             ,@VLR_ITEM_PEDIDO_TOTAL    DECIMAL(18, 2)
                                             ,@ID_RETORN                INT)
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT ITEM_PEDIDO
                   (ID_PEDIDO
                    ,ID_PRODUTO
                    ,QTD_ITEM_PEDIDO
                    ,VLR_ITEM_PEDIDO_UNITARIO
                    ,VLR_ITEM_PEDIDO_TOTAL)
            VALUES ( @ID_PEDIDO
                     ,@ID_PRODUTO
                     ,@QTD_ITEM_PEDIDO
                     ,@VLR_ITEM_PEDIDO_UNITARIO
                     ,( @VLR_ITEM_PEDIDO_UNITARIO * @QTD_ITEM_PEDIDO ) );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE ITEM_PEDIDO
            SET    ID_PRODUTO = @ID_PRODUTO
                   ,QTD_ITEM_PEDIDO = @QTD_ITEM_PEDIDO
                   ,VLR_ITEM_PEDIDO_UNITARIO = @VLR_ITEM_PEDIDO_UNITARIO
                   ,VLR_ITEM_PEDIDO_TOTAL = ( @VLR_ITEM_PEDIDO_UNITARIO * @QTD_ITEM_PEDIDO )
            WHERE  ID_ITEM_PEDIDO = @ID_ITEM_PEDIDO
              AND  ID_PEDIDO = @ID_PEDIDO
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM ITEM_PEDIDO
            WHERE  ID_ITEM_PEDIDO = @ID_ITEM_PEDIDO
              AND  ID_PEDIDO = @ID_PEDIDO
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT IPE.ID_ITEM_PEDIDO            [CODIGO]
                   ,IPE.ID_PEDIDO                [PEDIDO]
                   ,IPE.ID_PRODUTO               [ID_PRODUTO]
                   ,PRO.DSC_PRODUTO              [Descrição]
                   ,IPE.QTD_ITEM_PEDIDO          [Qtd]
                   ,IPE.VLR_ITEM_PEDIDO_UNITARIO [Unitario]
                   ,IPE.VLR_ITEM_PEDIDO_TOTAL    [Total]
            FROM   ITEM_PEDIDO IPE
                   INNER JOIN PRODUTO PRO
                           ON PRO.ID_PRODUTO = IPE.ID_PRODUTO
            WHERE  IPE.ID_PEDIDO = @ID_PEDIDO
            ORDER  BY 1;
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            IF EXISTS(SELECT 1
                      FROM   ITEM_PEDIDO IPE
                      WHERE  IPE.ID_PEDIDO = @ID_PEDIDO
                             AND IPE.ID_PRODUTO = @ID_PRODUTO)
              BEGIN
                  -- - Criar verificação para não deixar adicionar produto duplicado no pedido;
                  SELECT IPE.ID_ITEM_PEDIDO            [CODIGO]
                         ,IPE.ID_PRODUTO               [ID_PRODUTO]
                         ,PRO.DSC_PRODUTO              [Descrição]
                         ,IPE.QTD_ITEM_PEDIDO          [Qtd]
                         ,IPE.VLR_ITEM_PEDIDO_UNITARIO [Unitario]
                         ,IPE.VLR_ITEM_PEDIDO_TOTAL    [Total]
                  FROM   ITEM_PEDIDO IPE
                         INNER JOIN PRODUTO PRO
                                 ON PRO.ID_PRODUTO = IPE.ID_PRODUTO
                  WHERE  IPE.ID_PEDIDO = @ID_PEDIDO
                         AND IPE.ID_PRODUTO = @ID_PRODUTO;
              END
        END
  END 