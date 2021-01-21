-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [DBO].[SP_IAEC_PEDIDO] @ACAO          CHAR(1) ='C'
                                       ,@RET          SMALLINT = -1
                                       ,@BUSCA        VARCHAR(150)=''
                                       ,@ID_PEDIDO    INT
                                       ,@ID_CLIENTE   INT
                                       ,@VLR_PEDIDO   DECIMAL(18, 2)
                                       ,@DAT_PEDIDO   DATETIME
                                       ,@COD_VENDEDOR INT
                                       ,@ID_RETORN    INT OUTPUT
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT PEDIDO
                   (ID_CLIENTE
                    ,VLR_PEDIDO
                    ,COD_VENDEDOR)
            VALUES(@ID_CLIENTE
                   ,@VLR_PEDIDO
                   ,@COD_VENDEDOR );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE PEDIDO
            SET    ID_CLIENTE = @ID_CLIENTE
                   ,COD_VENDEDOR = @COD_VENDEDOR
            WHERE  ID_PEDIDO = @ID_PEDIDO;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            -- item
            DELETE FROM ITEM_PEDIDO
            WHERE  ID_PEDIDO = @ID_PEDIDO

            -- pedido
            DELETE FROM PEDIDO
            WHERE  ID_PEDIDO = @ID_PEDIDO;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            IF @RET = 0
              BEGIN
                  SELECT PED.ID_PEDIDO                           [PEDIDO]
                         ,PED.ID_CLIENTE                         [ID_CLIENTE]
                         ,CONVERT(VARCHAR(100), CLI.DSC_CLIENTE) [NOME CLIENTE]
                         ,PED.VLR_PEDIDO                         [VALOR PEDIDO]
                         ,PED.DAT_PEDIDO                         [DATA PEDIDO]
                         ,COD_VENDEDOR                           [VENDEDOR]
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON CLI.ID_CLIENTE = PED.ID_CLIENTE
                  ORDER  BY 1 DESC
              END
            ELSE IF @RET = 1
              BEGIN
                  SET @PESQUISA = @BUSCA

                  SELECT PED.ID_PEDIDO                           [PEDIDO]
                         ,PED.ID_CLIENTE                         [ID_CLIENTE]
                         ,CONVERT(VARCHAR(100), CLI.DSC_CLIENTE) [NOME CLIENTE]
                         ,PED.VLR_PEDIDO                         [VALOR PEDIDO]
                         ,PED.DAT_PEDIDO                         [DATA PEDIDO]
                         ,COD_VENDEDOR                           [VENDEDOR]
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON CLI.ID_CLIENTE = PED.ID_CLIENTE
                  WHERE  PED.ID_PEDIDO = CONVERT(INT, @PESQUISA)
              END
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            -- - Fazer tratamento de erros necessários no sistema para melhor interação com o Usuário;
            -- Opção de Pesquisa de pedidos por Data , Cliente ou Código do PEDIDO
            IF @RET = 0
              BEGIN
                  SELECT PED.ID_PEDIDO
                         AS
                         Pedido
                         ,CONVERT(VARCHAR(10), FORMAT(PED.DAT_PEDIDO,
                                               'dd/MM/yyyy'
                                               ))
                          AS
                          [Data Pedido]
                         ,PED.VLR_PEDIDO
                          AS
                          [Valor Pedido]
                         ,CONVERT(VARCHAR(70), CLI.DSC_CLIENTE)
                          AS
                          Cliente
                         ,COD_VENDEDOR
                          [VENDEDOR]
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON PED.ID_CLIENTE = CLI.ID_CLIENTE
                  ORDER  BY PED.DAT_PEDIDO DESC
                            ,1
              END
            ELSE IF @RET = 1
              BEGIN
                  SET @PESQUISA = @BUSCA

                  SELECT PED.ID_PEDIDO
                         AS
                         Pedido
                         ,CONVERT(VARCHAR(10), FORMAT(PED.DAT_PEDIDO,
                                               'dd/MM/yyyy'
                                               ))
                          AS
                          [Data Pedido]
                         ,PED.VLR_PEDIDO
                          AS
                          [Valor Pedido]
                         ,CONVERT(VARCHAR(70), CLI.DSC_CLIENTE)
                          AS
                          Cliente
                         ,COD_VENDEDOR
                          [VENDEDOR]
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON PED.ID_CLIENTE = CLI.ID_CLIENTE
                  WHERE  PED.ID_PEDIDO = CONVERT(INT, @PESQUISA)
              END
            ELSE IF @RET = 2
              BEGIN
                  SET @PESQUISA = '%'
                  SET @PESQUISA += @BUSCA
                  SET @PESQUISA += '%'

                  SELECT PED.ID_PEDIDO
                         AS
                         Pedido
                         ,CONVERT(VARCHAR(10), FORMAT(PED.DAT_PEDIDO,
                                               'dd/MM/yyyy'
                                               ))
                          AS
                          [Data Pedido]
                         ,PED.VLR_PEDIDO
                          AS
                          [Valor Pedido]
                         ,CONVERT(VARCHAR(70), CLI.DSC_CLIENTE)
                          AS
                          Cliente
                         ,COD_VENDEDOR
                          [VENDEDOR]
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON PED.ID_CLIENTE = CLI.ID_CLIENTE
                  WHERE  CLI.DSC_CLIENTE LIKE @PESQUISA
                  ORDER  BY 2 DESC
                            ,4
              END
            ELSE IF @RET = 3
              BEGIN
                  SET @PESQUISA =''
                  SET @PESQUISA += @BUSCA
                  SET @PESQUISA +=''

                  SELECT PED.ID_PEDIDO
                         AS
                         Pedido
                         ,CONVERT(VARCHAR(10), FORMAT(PED.DAT_PEDIDO,
                                               'dd/MM/yyyy'
                                               ))
                          AS
                          [Data Pedido]
                         ,PED.VLR_PEDIDO
                          AS
                          [Valor Pedido]
                         ,CONVERT(VARCHAR(70), CLI.DSC_CLIENTE)
                          AS
                          Cliente
                         ,COD_VENDEDOR
                          [VENDEDOR]
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON PED.ID_CLIENTE = CLI.ID_CLIENTE
                  WHERE  CONVERT(DATE, PED.DAT_PEDIDO) =
                         CONVERT(DATE, @PESQUISA)
                  ORDER  BY PED.DAT_PEDIDO DESC
                            ,1
              END
        END
  END 