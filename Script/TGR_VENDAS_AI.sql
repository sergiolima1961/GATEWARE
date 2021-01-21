USE [GATEWARE]
GO

/****** Object:  Trigger [dbo].[TGR_VENDAS_AI]    Script Date: 21/01/2021 08:00:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create TRIGGER [dbo].[TGR_VENDAS_AI]
ON [dbo].[ITEM_PEDIDO]
FOR INSERT
AS
  BEGIN
      DECLARE @VALOR DECIMAL(10, 2),
              @ID    INT

      SELECT @ID = I.ID_PEDIDO
             ,@VALOR = I.VLR_ITEM_PEDIDO_TOTAL
      FROM   INSERTED I

      UPDATE PEDIDO
      SET    VLR_PEDIDO += @VALOR
      WHERE  ID_PEDIDO = @ID
	  
  END

GO

ALTER TABLE [dbo].[ITEM_PEDIDO] ENABLE TRIGGER [TGR_VENDAS_AI]
GO


