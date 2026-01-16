USE [DW_ATACADEZ]
GO

SET IDENTITY_INSERT [dbo].[dim_cliente] ON 
GO

INSERT INTO [dbo].[dim_cliente]
           ([id_cliente]
           ,[cod_cliente]
           ,[desc_cliente]
           ,[atr_tamanho_cliente]
           ,[cod_cidade]
           ,[desc_cidade]
           ,[cod_estado]
           ,[desc_estado]
           ,[cod_regiao]
           ,[desc_regiao]
           ,[cod_segmento]
           ,[desc_segmento])
     VALUES
           (0
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND')
GO

SET IDENTITY_INSERT [dbo].[dim_cliente] OFF 
GO

SELECT * FROM [dbo].[dim_cliente];