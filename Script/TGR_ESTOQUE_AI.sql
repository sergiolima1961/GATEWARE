USE [GATEWARE]
GO

/****** Object:  Trigger [dbo].[TGR_ESTOQUE_AI]    Script Date: 21/01/2021 07:59:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create TRIGGER [dbo].[TGR_ESTOQUE_AI]
ON [dbo].[ITEM_PEDIDO]
FOR INSERT
AS
  BEGIN
      DECLARE @QTD INT,
              @ID    INT

      SELECT @ID = I.ID_PRODUTO
             ,@QTD = I.QTD_ITEM_PEDIDO
      FROM   INSERTED I

      UPDATE PRODUTO
      SET    SLD_PRODUTO -= @QTD
      WHERE  ID_PRODUTO = @ID
	  
  END

GO

ALTER TABLE [dbo].[ITEM_PEDIDO] ENABLE TRIGGER [TGR_ESTOQUE_AI]
GO


