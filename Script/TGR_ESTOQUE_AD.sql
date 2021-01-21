USE [GATEWARE]
GO

/****** Object:  Trigger [dbo].[TGR_ESTOQUE_AD]    Script Date: 21/01/2021 07:59:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE TRIGGER [dbo].[TGR_ESTOQUE_AD]
ON [dbo].[ITEM_PEDIDO]
FOR DELETE
AS
  BEGIN
     DECLARE @QTD INT,
              @ID    INT

      SELECT @ID = D.ID_PRODUTO
             ,@QTD = D.QTD_ITEM_PEDIDO
      FROM   DELETED D

      UPDATE PRODUTO
      SET    SLD_PRODUTO += @QTD
      WHERE  ID_PRODUTO = @ID
	  
  END

GO

ALTER TABLE [dbo].[ITEM_PEDIDO] ENABLE TRIGGER [TGR_ESTOQUE_AD]
GO


